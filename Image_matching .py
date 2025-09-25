import cv2

# Load images from local paths
img1 = cv2.imread(r'F:\DataSets\Change in Images\Dump\cropped_image.TIF')
img2 = cv2.imread(r'F:\DataSets\Change in Images\Dump\cropped_image1 (1).TIF')

# Crop region (example: 100,100 start and 200x200 size)
x, y, w, h = 100, 100, 200, 200
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

# Draw matches
matched = cv2.drawMatches(crop1, kp1, crop2, kp2, matches[:10], None, flags=2)

cv2.imshow("Matches", matched)
cv2.waitKey(0)
cv2.destroyAllWindows()
