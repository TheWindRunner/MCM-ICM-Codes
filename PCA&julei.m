%%
%���ɷ�
clc,clear
gj=xlsread('data_by_artist_2.xlsx','B2:R5602');
%load gj.txt   %��ԭʼ���ݱ����ڴ��ı��ļ�gj.txt��
gj=zscore(gj); %���ݱ�׼��
r=corrcoef(gj);  %�������ϵ������
%�����������ϵ������������ɷַ�����vec1����Ϊr�����������������ɷֵ�ϵ��
[vec1,lamda,rate]=pcacov(r) %lamdaΪr������ֵ��rateΪ�������ɷֵĹ�����
f=repmat(sign(sum(vec1)),size(vec1,1),1);%������vec1ͬά����Ԫ��Ϊ��1�ľ���
vec2=vec1.*f  %�޸����������������ţ�ʹ��ÿ�����������ķ�����Ϊ��
num=12;  %numΪѡȡ�����ɷֵĸ���
ap=sum(rate(1:num))/sum(rate);
df=gj*vec2(:,1:num);  %����������ɷֵĵ÷�
tf=df*rate(1:num)/100; %�����ۺϵ÷�
[stf,ind]=sort(tf,'descend');  %�ѵ÷ְ��մӸߵ��͵Ĵ�������
stf=stf', ind=ind'

%%
%��������
clc,clear all;
gj=xlsread('data_by_artist_2.xlsx','B2:R5602');
r=corrcoef(zscore(gj));  %�������ϵ������
d=pdist(gj','correlation'); %�������ϵ�������ľ���
z=linkage(d,'average');  %����ƽ��������
h=dendrogram(z);  %������ͼ
set(h,'Color','k','LineWidth',1.3)  %�Ѿ���ͼ�ߵ���ɫ�ĳɺ�ɫ���߿�Ӵ�
lei_num=10;%��������
T=cluster(z,'maxclust',lei_num); %�ѱ������ֳ�6��
for i=1:lei_num
    tm=find(T==i);  %���i��Ķ���
    tm=reshape(tm,1,length(tm)); %���������
    fprintf('��%d�����%s\n',i,int2str(tm)); %��ʾ������
end
xlabel('cluster graph');