import cv2
import numpy as np

# Load images from local paths
img1 = cv2.imread(r'F:\DataSets\Change in Images\Dump\cropped_image.TIF')
img2 = cv2.imread(r'F:\DataSets\Change in Images\Dump\cropped_image1 (1).TIF')

# Crop region (example: 100,100 start and 200x200 size)
x, y, w, h = 0, 0, 400, 400
crop1 = img1[y:y+h, x:x+w]
crop2 = img2[y:y+h, x:x+w]

# Convert to grayscale
gray1 = cv2.cvtColor(crop1, cv2.COLOR_BGR2GRAY)
gray2 = cv2.cvtColor(crop2, cv2.COLOR_BGR2GRAY)

# ORB detector and matcher
orb = cv2.ORB_create()
kp1, des1 = orb.detectAndCompute(gray1, None)
kp2, des2 = orb.detectAndCompute(gray2, None)
bf = cv2.BFMatcher(cv2.NORM_HAMMING, crossCheck=True)
matches = bf.match(des1, des2)

# Sort matches by distance (best matches first)
matches = sorted(matches, key=lambda x: x.distance)

# Extract matched keypoints
if len(matches) > 4:  # Need at least 4 points for homography
    src_pts = np.float32([kp1[m.queryIdx].pt for m in matches]).reshape(-1, 1, 2)
    dst_pts = np.float32([kp2[m.trainIdx].pt for m in matches]).reshape(-1, 1, 2)
    
    # Find homography matrix
    H, mask = cv2.findHomography(src_pts, dst_pts, cv2.RANSAC, 5.0)
    
    # Align image1 to image2
    aligned_img1 = cv2.warpPerspective(crop1, H, (crop2.shape[1], crop2.shape[0]))
    
    # Display results
    cv2.imshow("Original Image 1", crop1)
    cv2.imshow("Original Image 2", crop2)
    cv2.imshow("Aligned Image 1", aligned_img1)
    
    # Optional: Show matches
    matched = cv2.drawMatches(crop1, kp1, crop2, kp2, matches[:10], None, flags=2)
    cv2.imshow("Matches", matched)
    
else:
    print("Not enough matches found for alignment")

cv2.waitKey(0)
cv2.destroyAllWindows()
