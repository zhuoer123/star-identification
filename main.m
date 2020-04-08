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
%%% 计算星对角距
Q1 = dot_product(R);
Q2 = X_dot(W);

%%%% 求差
%%% 固定 A 星
    for i = 2 : size(Q2,1)
        A = Q2(1,i)*ones(size(Q1,1),size(Q1,1));
        B = abs(A - Q1);
        [r1(i-1),c1(i-1)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
        flag1 = [r1;c1];
    end  
if max(r1) - min(r1) == 0
    disp(['A星的对应星是sinf中的',num2str(r1(1)), '号星']);
else
      disp('错误！');
end
    
%%% 固定 B 星
for i = 3 : size(Q2,1)
     A = Q2(2,i)*ones(size(Q1,1),size(Q1,1));
     B = abs(A - Q1);
     [r2(i-2),c2(i-2)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
     flag2 = [r2;c2];
end 
if max(r2) - min(r2) == 0
    disp(['B星的对应星是sinf中的',num2str(r2(1)), '号星']);
else
      disp('错误！');
end

%%% 固定 C 星
for i = 4 : size(Q2,1)
     A = Q2(3,i)*ones(size(Q1,1),size(Q1,1));
     B = abs(A - Q1);
     [r3(i-3),c3(i-3)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
     flag3 = [r3;c3];
end 
if max(r3) - min(r3) == 0
    disp(['C星的对应星是sinf中的',num2str(r3(1)), '号星']);
else
      disp('错误！');
end

%%% 固定 D 星，判断 D E星 对应星
for i = 5 : size(Q2,1)
     A = Q2(4,i)*ones(size(Q1,1),size(Q1,1));
     B = abs(A - Q1);
     [r4(i-4),c4(i-4)] = find(abs(A - Q1) == min(min(abs(A - Q1))));
     flag4 = [r4;c4];
end 
if r4 - flag1(2,3) == 0  &&  r4 - flag2(2,2) == 0 && r4 - flag3(2,1) ==0
    disp(['D星的对应星是sinf中的',num2str(r4), '号星']);
else
      disp('错误！');
end

if c4 - flag1(2,4) == 0  &&  c4 - flag2(2,3) == 0 && c4 - flag3(2,2) ==0
    disp(['E星的对应星是sinf中的',num2str(c4), '号星']);
else
      disp('错误！');
end
