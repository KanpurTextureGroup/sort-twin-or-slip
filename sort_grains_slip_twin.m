clear all;
clc;

%% This program is meant to sort the grain whether slip and twin will take place
% Starting the program

grain_slip = [];
grain_twin = [];


imported_grains = dlmread(input('Enter the Text file in apostrophe e.g. ''example.txt'' :-')); % Read all grains
imported_grains = imported_grains(:,1:3); % Deleting extra column of 1.0

%% Finding Schmid factor

% For slip

for i = 1:size(imported_grains,1)
    
    grain = imported_grains(i,:);
    
    if cal_schmid_factor_slip(grain)>= cal_schmid_factor_twin(grain)
        grain_slip = [grain_slip;grain];
    else
        grain_twin = [grain_twin;grain];
    end
    
end
mat_to_TEX(grain_slip,'Grains_corresponding_slip');
mat_to_TEX(grain_twin,'Grains_corresponding_twin');

    
    
    
    
    
    
    
    
    
    
    
