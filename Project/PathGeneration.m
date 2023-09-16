% This file is to create the desired angle vectors (azimuth and elevation) 
% in addition to the range vector for creating a 3D audio file. 
%
% The specifications are as follows:
%
%   time (s)    elevation (degree)      azimuth (degree)        range (cm)
%    < 14               20                      0                   120
%      14               20                      0                   120
%      22                0                     90                    70
%      30              -20            (+ or -)180                   120
%      38                0                    -90                    70
%      45                0                      0                    70
%    > 45                0                      0                    70
%
% For instance, before t=14s, the elevation is fixed at 20deg and then, it 
% linearly deccreases to 0deg at t=22s, and the decrease continues until
% t=30s which reaches -20deg. This linear change applies to azimuth and
% range as well.


% finding the time stamp of each sample according to the sampling rate
samp_time           = [0 : length(Input_Audio_samples)-1] / f_sampling_input;

% initializing the desired angle/range vectors
elevation_desired   = 20 * ones(length(samp_time) , 1);
azimuth_desired     = zeros(length(samp_time) , 1);
range_desired       = 120 * ones(length(samp_time) , 1);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%                            You should modify here                                               %%%%%%%
%%%%%%%                                          ||                                                     %%%%%%%
%%%%%%%                                         _||_                                                    %%%%%%%
%%%%%%%                                         \  /                                                    %%%%%%%
%%%%%%%                                          \/                                                     %%%%%%%
%%%%%%%                                                                                                 %%%%%%%                                                                                                   
t_ind0           = (samp_time > 14)&(samp_time <= 22);                % time interval (14 22]           %%%%%%%
t_ind1           = (samp_time > 22)&(samp_time <= 30);                % time interval [22 30)           %%%%%%%
t_ind2           = (samp_time > 30)&(samp_time <= 38);                % time interval [30 38)           %%%%%%%
t_ind3           = (samp_time > 38)&(samp_time <= 45);                % time interval [38 45)           %%%%%%%
t_ind4           = (samp_time > 45);                                  % time interval >= 45             %%%%%%%
for i=1:2400000                                                                                         %%%%%%%
    if (t_ind0(1,i) == 1)                                                                               %%%%%%%
        elevation_desired(i,1)   = 20 - 20/8 * (samp_time(1,i)-14);                                     %%%%%%%
        azimuth_desired(i,1)     = 90/8 * (samp_time(1,i)-14)  ;                                        %%%%%%%
        range_desired(i,1)       = 120 -50/8 * (samp_time(1,i)-14) ;                                    %%%%%%%
    end                                                                                                 %%%%%%%
    if (t_ind1(1,i) == 1)                                                                               %%%%%%%
        elevation_desired(i,1)   = -20/8 * (samp_time(1,i)-22) ;                                        %%%%%%%
        azimuth_desired(i,1)     = 90 + 90/8 * (samp_time(1,i)-22) ;                                    %%%%%%%
        range_desired(i,1)       = 70 + 50/8 * (samp_time(1,i)-22);                                     %%%%%%%
    end                                                                                                 %%%%%%%
    if (t_ind2(1,i) == 1)                                                                               %%%%%%%
        elevation_desired(i,1)   = -20 + 20/8 * (samp_time(1,i)-30) ;                                   %%%%%%%
        azimuth_desired(i,1)     = -180 + 90/8 * (samp_time(1,i)-30) ;                                  %%%%%%%
        range_desired(i,1)       = 120 - 50/8 * (samp_time(1,i)-30) ;                                   %%%%%%%
    end                                                                                                 %%%%%%%
    if (t_ind3(1,i) == 1)                                                                               %%%%%%%
        elevation_desired(i,1)   = 0;                                                                   %%%%%%%
        azimuth_desired(i,1)     = -90 + 90/7 * (samp_time(1,i)-38) ;                                   %%%%%%%
        range_desired(i,1)       =  70;                                                                 %%%%%%%
    end                                                                                                 %%%%%%%
    if (t_ind4(1,i) == 1)                                                                               %%%%%%%
        elevation_desired(i,1)   = 0;                                                                   %%%%%%%
        azimuth_desired(i,1)     = 0;                                                                   %%%%%%%
        range_desired(i,1)       = 70 ;                                                                 %%%%%%%
    end                                                                                                 %%%%%%%
end                                                                                                     %%%%%%%
%%%%%%%                                         /\                                                      %%%%%%%
%%%%%%%                                        /  \                                                     %%%%%%%
%%%%%%%                                         ||                                                      %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



save(['./Results/Coordinates.mat'] , 'elevation_desired' , 'azimuth_desired' , 'range_desired');