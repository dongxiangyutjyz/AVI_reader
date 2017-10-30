source='/Users/dong/Desktop/video.avi';
vidobj=VideoReader(source);
frames=vidobj.Numberofframes;
for f=1:frames
  thisframe=read(vidobj,f);
  figure(1);imagesc(thisframe);
  thisfile=sprintf('/Users/dong/Desktop/frames/frame_%04d.jpg',f);
  imwrite(thisframe,thisfile);
end