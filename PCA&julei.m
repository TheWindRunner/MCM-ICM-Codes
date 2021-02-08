%%
%主成分
clc,clear
gj=xlsread('data_by_artist_2.xlsx','B2:R5602');
%load gj.txt   %把原始数据保存在纯文本文件gj.txt中
gj=zscore(gj); %数据标准化
r=corrcoef(gj);  %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分分析，vec1的列为r的特征向量，即主成分的系数
[vec1,lamda,rate]=pcacov(r) %lamda为r的特征值，rate为各个主成分的贡献率
f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
vec2=vec1.*f  %修改特征向量的正负号，使得每个特征向量的分量和为正
num=12;  %num为选取的主成分的个数
ap=sum(rate(1:num))/sum(rate);
df=gj*vec2(:,1:num);  %计算各个主成分的得分
tf=df*rate(1:num)/100; %计算综合得分
[stf,ind]=sort(tf,'descend');  %把得分按照从高到低的次序排列
stf=stf', ind=ind'

%%
%变量聚类
clc,clear all;
gj=xlsread('data_by_artist_2.xlsx','B2:R5602');
r=corrcoef(zscore(gj));  %计算相关系数矩阵
d=pdist(gj','correlation'); %计算相关系数导出的距离
z=linkage(d,'average');  %按类平均法聚类
h=dendrogram(z);  %画聚类图
set(h,'Color','k','LineWidth',1.3)  %把聚类图线的颜色改成黑色，线宽加粗
lei_num=10;%分类总数
T=cluster(z,'maxclust',lei_num); %把变量划分成6类
for i=1:lei_num
    tm=find(T==i);  %求第i类的对象
    tm=reshape(tm,1,length(tm)); %变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm)); %显示分类结果
end
xlabel('cluster graph');