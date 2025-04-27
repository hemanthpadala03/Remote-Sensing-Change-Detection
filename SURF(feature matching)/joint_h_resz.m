function h=joint_h_resz(image_1,image_2,f)
% function h=joint_h(image_1,image_2)
%
% takes a pair of images of equal size and returns the 2d joint histogram.
% used for MI calculation
% 
% written by http://www.flash.net/~strider2/matlab.htm


rows=size(image_1,1);
cols=size(image_1,2);

N=(256/f);
h=zeros(N+1,N+1);

for i=1:rows;    %  col 
  for j=1:cols;   %   rows
    h(round(image_1(i,j)/f)+1,round(image_2(i,j)/f)+1)=   h(round(image_1(i,j)/f)+1,round(image_2(i,j)/f)+1)+1;
%     h(round(image_1(i-1,j)/f)+1,round(image_2(i,j)/f)+1)=   h(round(image_1(i,j)/f)+1,round(image_2(i,j)/f)+1)+0.0665;
%     h(round(image_1(i+1,j)/f)+1,round(image_2(i,j)/f)+1)=   h(round(image_1(i,j)/f)+1,round(image_2(i,j)/f)+1)+0.0665;
%     h(round(image_1(i,j+1)/f)+1,round(image_2(i,j)/f)+1)=   h(round(image_1(i,j)/f)+1,round(image_2(i,j)/f)+1)+0.0665;
%     h(round(image_1(i,j-1)/f)+1,round(image_2(i,j)/f)+1)=   h(round(image_1(i,j)/f)+1,round(image_2(i,j)/f)+1)+0.0665;
  end
end