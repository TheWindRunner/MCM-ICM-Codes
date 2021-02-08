clc;
clear all;
%%
filename='full_music_data.csv';%����ļ�

[a,b]=xlsread(filename,'A2:S98341');
%��¼explict
%%
artist_id=[];%��¼id
artist_explicit=[];%���Լ�¼����ÿ�׸�explict״̬
artist_songs=zeros(8000,1);%��ʾ�ø��ֵ�ǰ�ж����׸�
for k=1:98340
    if (~isnan(a(k,1)))%���׸�ֻ��һ������
        if(ismember(a(k,1),artist_id)==0) %û�ҵ� ����id�б�
            artist_id=[artist_id;a(k,1)];
        end
        id_inedx=find(artist_id==a(k,1));
        artist_songs(id_inedx)=artist_songs(id_inedx)+1;
        if(a(k,13)==1)
            artist_explicit(id_inedx,artist_songs(id_inedx))=2;%��2��ʾexplictΪ1
        end
        if(a(k,13)==0)
            artist_explicit(id_inedx,artist_songs(id_inedx))=1;%��1��ʾexplictΪ0
        end
    end
    if (isnan(a(k,1)))%��ʱ�ж������
        temp_b=b{k,2};
        temp_string=string(temp_b);
        temp_strings=strsplit(temp_string,', ');
        artist_length=length(temp_strings);
        for m=1:artist_length
            if(ismember(str2num(temp_strings(m)),artist_id)==0) %û�ҵ� ����id�б�
                artist_id=[artist_id;str2num(temp_strings(m))];
            end
            id_inedx=find(artist_id==str2num(temp_strings(m)));
            artist_songs(id_inedx)=artist_songs(id_inedx)+1;
            if(a(k,13)==1)
                artist_explicit(id_inedx,artist_songs(id_inedx))=2;%��2��ʾexplictΪ1
            end
            if(a(k,13)==0)
                artist_explicit(id_inedx,artist_songs(id_inedx))=1;%��1��ʾexplictΪ0
            end
        end
    end
    
end
%

reslut_explict_artist=sum(artist_explicit,2);
artist_songs=artist_songs(1:length(reslut_explict_artist));
reslut_explict_artist=reslut_explict_artist./artist_songs-1;
reslut_explict_artist=round(reslut_explict_artist);
%%
%���
year=[];%��¼year
year_explicit=[];%���Լ�¼ÿһ���״̬
year_songs=zeros(200,1);%��ʾ�ø��ֵ�ǰ�ж����׸�
for k=1:98340
    if(ismember(a(k,16),year)==0) %û�ҵ� ����year�б�
        year=[year;a(k,16)];
    end
    id_inedx=find(year==a(k,16));
    year_songs(id_inedx)=year_songs(id_inedx)+1;
    if(a(k,13)==1)
        year_explicit(id_inedx,year_songs(id_inedx))=2;%��2��ʾexplictΪ1
    end
    if(a(k,13)==0)
        year_explicit(id_inedx,year_songs(id_inedx))=1;%��1��ʾexplictΪ0
    end
end
reslut_explict_year=sum(year_explicit,2);
year_songs=year_songs(1:length(reslut_explict_year));
reslut_explict_year=reslut_explict_year./year_songs-1;
reslut_explict_year=round(reslut_explict_year);

artist_f=[artist_id reslut_explict_artist];
year_f=[year reslut_explict_year];
%%
filename='data_by_artist_2.xlsx';%����ļ�
[a_artist,b_artist]=xlsread(filename);
%xlswrite(filename,{'explicit'},1,'Q1');
artist_ff=[];
for n=1:5602

    [find_a,find_b]=find(artist_id==a_artist(n,1));
    if(~isempty(find_a))%����ǿ� �ҵ���Ӧ���
        artist_ff=[artist_ff;reslut_explict_artist(find_a)];
%         xlrange=['Q' num2str(n+1)];
%       %  writematrix(reslut_explict_artist(find_a),filename,'Sheet',1,'Range',xlrange);
%         xlswrite(filename,reslut_explict_artist(find_a),1,xlrange);
    end
    if(isempty(find_a))
         artist_ff=[artist_ff;3];
    end
end

%%
filename='data_by_year.csv';%����ļ�
[a_year,b_year]=xlsread(filename);
xlswrite(filename,{'explicit'},1,'P1');
year_ff=[];
for n=1:100
    [find_a,find_b]=find(year==a_year(n,1));
    if(~isempty(find_a))%����ǿ� �ҵ���Ӧ���
        year_ff=[year_ff;reslut_explict_year(find_a)];
%         xlrange=['Q' num2str(n+1)];
%       %  writematrix(reslut_explict_artist(find_a),filename,'Sheet',1,'Range',xlrange);
%         xlswrite(filename,reslut_explict_artist(find_a),1,xlrange);
    end
    if(isempty(find_a))
         year_ff=[year_ff;3];
    end
end

