function changeTag(handles)
% fm = load('pool_z');
tag = load('Com');

for i=1:length(tag.Com)
    if str2double(handles.Target_Box.String) == tag.Com(i)
        tag.Com(i) = str2double(handles.Ideal_Box.String);
    end
end

Com = tag.Com;
save('Com.mat','Com');


global filename;
tag = load(filename);
tag = struct2cell(tag);

for i=1:length(tag{1})
    if str2double(handles.Target_Box.String) == tag{1}(i)
        tag{1}(i) = str2double(handles.Ideal_Box.String);
    end
end
save(filename,'-mat');


