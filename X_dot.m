function Q2 = X_dot(W)
%UNTITLED4 此处显示有关此函数的摘要
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

