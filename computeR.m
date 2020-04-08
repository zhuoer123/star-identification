function R = computeR(sinf)
% 计算地心惯性坐标系下的星矢量
 R = zeros(size(sinf,1),3);
for i = 1 : size(sinf,1)
   R(i,1) = cos(sinf(i,1)*pi/180)*cos(sinf(i,2)*pi/180); 
   R(i,2) = sin(sinf(i,1)*pi/180)*cos(sinf(i,2)*pi/180); 
   R(i,3) = sin(sinf(i,2)*pi/180);  
end
end

