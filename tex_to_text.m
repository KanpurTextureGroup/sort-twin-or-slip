function tex_to_text(~)

%make sure your current folder is the same where your files are present
FileList = dir('*.Tex');
N = size(FileList,1);

for k = 1:N
    
    filename = FileList(k).name
    
    
    
    
    % tex_file = input('Enter your TEX file name having orientation of grains in apostrophe(''odf.tex''):-');
    fid = fopen(filename,'r') ;                  % Open source file.
    fgetl(fid) ;                                  % Read/discard line.
    fgetl(fid) ;
    fgetl(fid) ;
    fgetl(fid) ;                                    % Read/discard line.
    buffer = fread(fid, Inf) ;
    fclose(fid);
    fid = fopen([filename '.txt'], 'w')  ;   % Open destination file.
    fwrite(fid, buffer) ;                         % Save to file.
    fclose(fid) ;
    all_euler = dlmread([filename '.txt']);
    M = all_euler(:,[1 2 3]);
    dlmwrite([filename '.txt'],M,'delimiter','\t')
    
    
end
end