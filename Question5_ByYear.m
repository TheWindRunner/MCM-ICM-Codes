clc,clear;
close all;
[Years_All,characteristics]=xlsread('data_by_year_explicit.csv','A1:O101');
year=Years_All(:,1);
count=[2
0
0
15
4
13
13
412
1
105
28
16
272
37
107
160
177
173
137
89
200
295
67
109
254
182
319
312
477
398
571
527
655
852
1181
1444
1645
1499
1564
1487
1459
1605
1513
1573
1580
1614
1797
1744
1777
1775
1810
1679
1795
1741
1712
1712
1778
1681
1683
1701
1709
1669
1650
1609
1533
1592
1631
1488
1495
1418
1521
1368
1348
1385
1325
1289
1287
1212
1282
1281
1295
1330
1362
1321
1274
1335
1251
1209
1097
1058
990
1000
981
851
764
627
539
456
499
481
];
figure(1);
subplot(6,1,1)
plot(year,Years_All(:,2),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.8 0.75 0.15]); %0.47为与fig下边界的间距
legend('danceablity');
pos=axis;
ylabel('danceablity','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);
title('Parameters of Music Changes by Year','FontSize',15);

subplot(6,1,2)
plot(year,Years_All(:,3),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.65 0.75 0.15]); %0.47为与fig下边界的间距
legend('energy');
pos=axis;
ylabel('energy','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,3)
plot(year,Years_All(:,4),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.5 0.75 0.15]); %0.47为与fig下边界的间距
legend('valence');
pos=axis;
ylabel('valence','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,4)
plot(year,Years_All(:,5),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[100 125]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.35 0.75 0.15]); %0.47为与fig下边界的间距
legend('tempo');
pos=axis;
ylabel('tempo','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,5)
plot(year,Years_All(:,6),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[-20 0]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.2 0.75 0.15]); %0.47为与fig下边界的间距
legend('loudness');
pos=axis;
ylabel('loudness','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,6)
plot(year,Years_All(:,8),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[-0.8 13]);
%set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.05 0.75 0.15]); %0.47为与fig下边界的间距
legend('key');
pos=axis;
ylabel('key','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);
xlabel('Year','FontSize',15,'position',[(pos(1)+pos(2))/2 pos(3)]-1);

figure(2);
subplot(6,1,1)
plot(year,Years_All(:,9),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.8 0.75 0.15]); %0.47为与fig下边界的间距
legend('acousticness');
pos=axis;
ylabel('acousticness','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);
title('Parameters of Music Changes by Year','FontSize',15);

subplot(6,1,2)
plot(year,Years_All(:,10),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.65 0.75 0.15]); %0.47为与fig下边界的间距
legend('instrumentalness');
pos=axis;
ylabel('instrumentalness','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,3)
plot(year,Years_All(:,11),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.5 0.75 0.15]); %0.47为与fig下边界的间距
legend('liveness');
pos=axis;
ylabel('liveness','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,4)
plot(year,Years_All(:,12),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[0 1]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.35 0.75 0.15]); %0.47为与fig下边界的间距
legend('speechiness');
pos=axis;
ylabel('speechiness','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,5)
plot(year,Years_All(:,13)/1000/60,'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[2.5 4.5]);
set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.2 0.75 0.15]); %0.47为与fig下边界的间距
legend('duration/min');
pos=axis;
ylabel('duration/min','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);

subplot(6,1,6)
plot(year,Years_All(:,14),'LineWidth',2);
set(gca,'xlim',[1921 2020]);
set(gca,'ylim',[-4 75]);
%set(gca,'xticklabel',[]);%不显示x坐标轴刻度
set(gca,'box','on');
set(gca,'position',[0.15 0.05 0.75 0.15]); %0.47为与fig下边界的间距
legend('popularity');
pos=axis;
ylabel('popularity','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);
xlabel('Year','FontSize',15,'position',[(pos(1)+pos(2))/2 pos(3)]-4);

figure(3);
plot(year,count,'LineWidth',2);
title('Music Relesed Nums by Year','FontSize',15);
pos=axis;
ylabel('Music Nums','FontSize',15,'Rotation',0,'position',[1910 (pos(3)+pos(4))/2]);
xlabel('Year','FontSize',15);

