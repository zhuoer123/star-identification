function Q1 = dot_product(R)
%计算ECEI下星对点积
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
end

