
function [cor_r1,cor_r2]=poly_trans(cor1,cor2,T)

[M,N]=size(cor1);
n=6;
cor_r1=[];
cor_r2=[];
%T=5;
for k=1:800 %%% Number of iterations
    
        a=floor(1+(M-1)*rand(1,n));
        cor11=cor1(a,1:2);
        cor22=cor2(a,1:2);
    
        if((a(1)~=a(2) && a(1)~=a(3) && a(1)~=a(4) && a(1)~=a(5) && a(1)~=a(6) && a(2)~=a(3) && a(2)~=a(4) && a(2)~=a(5) && a(2)~=a(6)&& a(3)~=a(4)) && a(3)~=a(5) && ...
        a(3)~=a(6) && a(4)~=a(5) && a(4)~=a(6) && a(5)~=a(6)&& sum(cor11(1,1:2)~=cor11(2,1:2)) && sum(cor11(1,1:2)~=cor11(3,1:2)) && sum(cor11(1,1:2)~=cor11(4,1:2)) && sum(cor11(1,1:2)~=cor11(5,1:2)) && sum(cor11(1,1:2)~=cor11(6,1:2))&&... 
        sum(cor11(2,1:2)~=cor11(3,1:2)) && sum(cor11(2,1:2)~=cor11(4,1:2)) &&  sum(cor11(2,1:2)~=cor11(5,1:2)) && sum(cor11(2,1:2)~=cor11(6,1:2)) &&sum(cor11(3,1:2)~=cor11(4,1:2))&&sum(cor11(3,1:2)~=cor11(5,1:2))&& sum(cor11(3,1:2)~=cor11(6,1:2))...
        && sum(cor11(4,1:2)~=cor11(5,1:2))&& sum(cor11(4,1:2)~=cor11(6,1:2))&& sum(cor11(5,1:2)~=cor11(6,1:2))...
        && sum(cor22(1,1:2)~=cor22(2,1:2)) && sum(cor22(1,1:2)~=cor22(3,1:2)) && sum(cor22(1,1:2)~=cor22(4,1:2))&& sum(cor22(1,1:2)~=cor22(5,1:2)) && sum(cor22(1,1:2)~=cor22(6,1:2))&&...
        sum(cor22(2,1:2)~=cor22(3,1:2)) && sum(cor22(2,1:2)~=cor22(4,1:2)) && sum(cor22(2,1:2)~=cor22(5,1:2)) && sum(cor22(2,1:2)~=cor22(6,1:2)) && sum(cor22(3,1:2)~=cor22(4,1:2)) && sum(cor22(3,1:2)~=cor22(5,1:2)) && sum(cor22(3,1:2)~=cor22(6,1:2))...
        && sum(cor22(4,1:2)~=cor22(5,1:2)) && sum(cor22(4,1:2)~=cor22(6,1:2)) &&  sum(cor22(5,1:2)~=cor22(6,1:2)))

x1=cor22(1,2);
x2=cor22(2,2);
x3=cor22(3,2);
x4=cor22(4,2);
x5=cor22(5,2);
x6=cor22(6,2);

y1=cor22(1,1);
y2=cor22(2,1);
y3=cor22(3,1);
y4=cor22(4,1);
y5=cor22(5,1);
y6=cor22(6,1);

        
D_M=[1 x1 y1 x1*y1 x1^2 y1^2; 1 x2 y2 x2*y2 x2^2 y2^2;1 x3 y3 x3*y3 x3^2 y3^2;...
    1 x4 y4 x4*y4 x4^2 y4^2;1 x5 y5 x5*y5 x5^2 y5^2;1 x6 y6 x6*y6 x6^2 y6^2];

R1=cor11(:,2);
R2=cor11(:,1);

D1=[R1 D_M(1:6,2:end)];
D2=[D_M(1:6,1) R1 D_M(1:6,3:end)];
D3=[D_M(1:6,1:2) R1 D_M(1:6,4:end)];
D4=[D_M(1:6,1:3) R1 D_M(1:6,5:end)];
D5=[D_M(1:6,1:4) R1 D_M(1:6,6:end)];
D6=[D_M(1:6,1:5) R1];


D7=[R2 D_M(1:6,2:end)];
D8=[D_M(1:6,1) R2 D_M(1:6,3:end)];
D9=[D_M(1:6,1:2) R2 D_M(1:6,4:end)];
D10=[D_M(1:6,1:3) R2 D_M(1:6,5:end)];
D11=[D_M(1:6,1:4) R2 D_M(1:6,6:end)];
D12=[D_M(1:6,1:5) R2];


a1=det(D1)/det(D_M);
a2=det(D2)/det(D_M);
a3=det(D3)/det(D_M);
a4=det(D4)/det(D_M);
a5=det(D5)/det(D_M);
a6=det(D6)/det(D_M);


b1=det(D7)/det(D_M);
b2=det(D8)/det(D_M);
b3=det(D9)/det(D_M);
b4=det(D10)/det(D_M);
b5=det(D11)/det(D_M);
b6=det(D12)/det(D_M);

   cnt=1;
for i=1:size(cor1,1)
    
    x=cor2(i,2);
    y=cor2(i,1);
    XX1=cor1(i,2);
    YY1=cor1(i,1);   
    
XX2=  a1 + a2*x+ a3*y + a4*x*y +a5*x^2 +a6*y^2;
YY2=  b1 + b2*x+ b3*y + b4*x*y +b5*x^2 +b6*y^2;

dist_1=((XX2-XX1)^2+(YY2-YY1)^2)^0.5;


if dist_1<=T
    set_r1(cnt,:)=cor1(i,:);
    set_r2(cnt,:)=cor2(i,:);
    cnt=cnt+1;
end;
end;
      if size(cor_r1,1)<cnt-1
       cor_r1= set_r1;
       cor_r2= set_r2;
       end;
     set_r1=[];
     set_r2=[];
   
  end;
end;

