source='/Users/dong/Desktop/video/MP11-jan13-TV-vid9.mp4';
vidobj=VideoReader(source);
frames=vidobj.Numberofframes;
for f=1:frames
  thisframe=read(vidobj,f);
  figure(1);imagesc(thisframe);
  thisfile=sprintf('/Users/dong/Desktop/video_frames/frame_%04d.jpg',f);
  imwrite(thisframe,thisfile);
end