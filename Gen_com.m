function Gen_com(handles)
load('Com');
load('pool_z');
load('pool');
newCom=Com;
for zind=1:1000
    indexresults=zeros(449,1920);
    listlist=find(pool_z==zind);
    for p=1:length(listlist)
        index=cell2mat(pool(listlist(p),1));
        znumb=pool_z(listlist(p));
        indexresults(index)=newCom(listlist(p));
    end
    
    colorslice=zeros(size(indexresults,1),size(indexresults,2),3);
    list=unique(indexresults(:,:));
    temp=indexresults(:,:);
    
    path=['/Users/dong/Desktop/frames/frame_',num2str(zind,'%04d'),'.jpg'];
    imim=(((imread(path))));
    
    for q=1:length(list)
        if list(q)~=0
            %colorslice(find(temp==list(q)))=colorpool(1,list(q));
            %colorslice(find(temp==list(q))+1080*1920)=colorpool(2,list(q));
            %colorslice(find(temp==list(q))+1080*1920*2)=colorpool(3,list(q));
            indexindex=find(temp==list(q));
            [xd,yd]=ind2sub([449,1920],indexindex);
            
            xd=mean(xd);
            yd=mean(yd);
            %if ((noants_b_full(round(xd),round(yd)))==0)
            imim = insertText(uint8(imim),[yd,xd],num2str(list(q)),'FontSize',18,'BoxColor',...
                'Black','BoxOpacity',0.4,'TextColor','white');
        end
        %end
    end
    path=['/Users/dong/Desktop/frames/frame_',num2str(zind,'%04d'),'.jpg'];
    %imim_new(354:802,:,:)=imim_new(354:802,:,:)+255*colorslice(354:802,:,:);
    imshow(uint8(imim(354:802,:,:)),path);
end