function [Q1,Q2] = dot_product(R,W)
%¼计算星对点积
Q1 = zeros(size(R,1),size(R,1));
for i = 1 : size(R,1)
  for j = 1 : size(R,1)
   Q1(i,j) = dot(R(i,:),R(j,:));   
  end
end
for i = 1 : size(Q1,1)
    for j = 1 : i
     Q1(i,j) = 1e10;     
    end
end

Q2 = zeros(size(W,1),size(W,1));
for i = 1 : size(W,1)
   for j = 2: size(W,1)
    Q2(i,j) = dot(W(i,:),W(j,:));
   end
end
%保留上三角元素
for i = 1 : size(Q2,1)
    for j = 1 : i
        Q2(i,j) = 1e10;
    end
end
end
end

