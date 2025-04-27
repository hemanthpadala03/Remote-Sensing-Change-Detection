function [cor1,cor2]= match(im1, im2,des1,loc1,des2,loc2,change_form)

distRatio = 0.9;   
des2t = des2';   

M_des1=size(des1,1);
M_des2=size(des2,1);
ED_distance=zeros(M_des1,M_des2);
for i=1:1:M_des1
    temp_des1=des1(i,:);
    temp_des1=repmat(temp_des1,M_des2,1);
    diff_des1=temp_des1-des2;
    diff_des1=sqrt(sum(diff_des1.^2,2));
    ED_distance(i,:)=diff_des1';
end

for i = 1 : size(des1,1)
  dotprods = des1(i,:) * des2t;        
   [vals,indx] = sort(acos(dotprods));  
  %[vals,indx]=sort(ED_distance(i,:));
  if (vals(1) < distRatio * vals(2))
     match(i) = indx(1);
  else
      match(i) = 0;
  end
end
num = sum(match > 0);
fprintf('NNDR found %d matchs.\n', num);
[~,point1,point2]=find(match);

cor11=loc1(point1,[1 2]);cor22=loc2(point2,[1 2]);
cor11=[cor11 point2'];cor22=[cor22 point2'];

% Remove duplicate points
uni1=[cor11(:,[1 2]),cor22(:,[1 2])];
[~,i,~]=unique(uni1,'rows','first');
cor11=cor11(sort(i)',:);
cor22=cor22(sort(i)',:);

%% FSC

%% 
cor1=cor11(:,1:2);
cor2=cor22(:,1:2);

end