% This is the main file which should be run to produce the outputs. If this
% is your first time with MATLAB, either press F5 or click on the green
% triangular button (RUN).
%
% You should not change the content of this file. Your main task is to edit 
% the subroutine "PathGeneration.m" and the function "ImpResp_interpolator"
% located in "S&S MATLAB Project/Functions_and_Subroutines". Please 
% avoid modifying other files.


%%
% This part is to clear the command window, remove all the pre-defined
% parameters and close all open figures
clc
clear all
close all


% Adding the folder that contains our written functions to the list of 
% paths that MATLAB checks
addpath('Functions_and_Subroutines')



%%


%%%%%%%%%%%%%
% reading the input Audio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Input_Audio_samples , f_sampling_input]    = audioread('./InputData/MonoChannelAudio.wav');

% playing the audio
sound(Input_Audio_samples , f_sampling_input);



%%


%%%%%%%%%%%%%
% moving-source location
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PathGeneration



%%


%%%%%%%%%%%%%
% loading the recordings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('./Recordings/Impulse_Responses.mat');


%%%%%%%%%%%%%
% generating stereo output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% defining the output audio samples for the left and right ears
Output_Audio_Left       = zeros(length(Input_Audio_samples) + far.ImpResp_Length , 1);
Output_Audio_Right      = zeros(length(Input_Audio_samples) + far.ImpResp_Length , 1);

% time varying convolution for generating the output
TimeVaryingConv



%%


%%%%%%%%%%%%%
% playing and saving the output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% playing the audio
sound([Output_Audio_Left , Output_Audio_Right] , f_sampling_input);

% saving the audio file
audiowrite('./Results/StereoAudio.wav' , [Output_Audio_Left , Output_Audio_Right] , f_sampling_input);


