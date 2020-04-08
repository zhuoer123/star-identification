function W = computeW(crdinf,x0,y0,f,dx,dy)
%计算像空间坐标系下的位置矢量
W = zeros(size(crdinf,1),3);
for j = 1 : size(crdinf,1)
   W(j,1) = 1/sqrt((crdinf(j,1)*dx-x0)^2 + (crdinf(j,2)*dy-y0)^2 + f^2)*(crdinf(j,1)*dx-x0);
   W(j,2) = 1/sqrt((crdinf(j,1)*dx-x0)^2 + (crdinf(j,2)*dy-y0)^2 + f^2)*(-crdinf(j,2)*dy+y0);
   W(j,3) = 1/sqrt((crdinf(j,1)*dx-x0)^2 + (crdinf(j,2)*dy-y0)^2 + f^2)*f;
end
end

