clc;clear;
close all

%%%% 星图识别过程
%%% 相机参数
f = 107.46496182529; % 焦距 mm
dx = 5.5*1e-3; % 像元 mm
dy = 5.5*1e-3; % 像元 mm
x0 = 2048/2*dx;
y0 = 2048/2*dy;

%% 读入数据 
% 星库文件：sinf ; 星敏感器拍摄：crdinf
sinf = load('sinf.txt');  %% 赤经、赤纬（度）
crdinf = load('60.txt');  %% X（像素） Y（像素）

%%% 计算两个坐标系下的位置矢量
R = computeR(sinf);
W = computeW(crdinf,x0,y0,f,dx,dy);

%% 星图识别
%%% 计算星对点积 星表计算结果在Q1 , 观测计算结果在Q2
[Q1,Q2] = dot_product(R,W);

%%%% 求差
k = 1;
for i = 1 : size(Q2,1)
      for j = i+1 : size(Q2,1)
          A = Q2(i,j)*ones(size(Q1,1),size(Q1,1));
          [r(k),c(k)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
          k = k+1;
      end  
end

%%%判别结果存储在y中
y = unique([r;c]);
%%% 输出
disp(['A星的对应星是sinf中的',num2str(y(1)), '号星'])
disp(['B星的对应星是sinf中的',num2str(y(2)), '号星']);
disp(['C星的对应星是sinf中的',num2str(y(3)), '号星']); 
disp(['D星的对应星是sinf中的',num2str(y(4)), '号星']); 
disp(['E星的对应星是sinf中的',num2str(y(5)), '号星']); 

%%% 识别结果矩阵
result1 = zeros(size(crdinf,1),2);
result2 = zeros(size(crdinf,1),2);
for ii = 1 : size(crdinf,1)
   result1(ii,:) = crdinf(ii,:);  
   result2(ii,:) = sinf(y(ii),:);
end
result = [result1 result2];
