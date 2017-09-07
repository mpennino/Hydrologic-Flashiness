clear;
% for importing Flow Data files
files = transpose( dir( '*_realtimeAll.txt' ) );
RAIN = csvread('HydroNEXRAD_data_All_EST.csv'); % importing Precipitation Data
% This converts Rainfall units from mm/hr to inches per 15 minute interval
% Multiple 0.25 * mm/hr to get mm/15 min.1 mm = 0.0393701 inches
RAIN(:,7:126) = RAIN(:,7:126)*0.25*0.0393701;

YEAR1 = 1999; % for multiple years: = 2010 || rain(z,1) == 2011 || rain(z,1) == 2012;
YEAR2 = NaN;  % change this to a specific year if want to average mutliple years, otherwise just use year1
YEAR3 = NaN;  % Otherwise, put a NaN to ignore the YEAR2 and YEAR3


for k = 1:numel(files);  % this for-loop is for inputing data in USGS text-file format
    fid = fopen(files(k).name);
    NAME = files(k).name;

a = repmat('%s',1,25); % repmat is used to repeate copies of '%s' one row 1, 25 times, %s = Read series of characters, until find white space.
C = textscan(fid,a,'Commentstyle','#','headerlines',1);

% this code selects the USGS flow file name and then assigns the
% appropriate W (watershed area in km2) and Precipitation Site
% There is precipitation data for each USGS gage watershed and they are
% stored in separate columns of the RAIN array.  
% The below code filters out the appropriate RAIN data based on the current
% USGS flow file being run.  


if NAME == ('01574500_realtimeAll.txt');
W = 8.36;
rain = RAIN(:,[1 2 3 4 5 6 7]);
end;
if NAME == ('01575000_realtimeAll.txt'); % not included yet
W = 303.029;
rain = RAIN(:,[1 2 3 4 5 6 8]);
end;
if NAME == ('01575500_realtimeAll.txt'); % not included yet
W = 574.9774;
rain = RAIN(:,[1 2 3 4 5 6 9]);
end;
if NAME == ('01580520_realtimeAll.txt'); % not included yet
W = 424.7581;
rain = RAIN(:,[1 2 3 4 5 6 10]);
end;
if NAME == ('01580700_realtimeAll.txt'); % not included yet
W = 34.18784;
rain = RAIN(:,[1 2 3 4 5 6 11]);
end;
if NAME == ('01581500_realtimeAll.txt'); % Bynum Run, % not included yet
W = 22.0667;
rain = RAIN(:,[1 2 3 4 5 6 12]);
end;
if NAME == ('01581649_realtimeAll.txt'); % not included yet
W = 23.69839;
rain = RAIN(:,[1 2 3 4 5 6 13]);
end;
if NAME == ('01581690_realtimeAll.txt'); % not included yet, % discontinued after 2009
W = 8.236162;
rain = RAIN(:,[1 2 3 4 5 6 14]);
end;
if NAME == ('01581700_realtimeAll.txt'); % not included yet
W = 90.13159;
rain = RAIN(:,[1 2 3 4 5 6 15]);
end;
if NAME == ('01581752_realtimeAll.txt'); % Plumtree near Bel Air MD
W = 6.47497;
rain = RAIN(:,[1 2 3 4 5 6 16]);
end;
if NAME == ('01581757_realtimeAll.txt'); % not included yet
W = 144.0033;
rain = RAIN(:,[1 2 3 4 5 6 17]);
end;
if NAME == ('01581920_realtimeAll.txt'); % not included yet
W = 211.084;
rain = RAIN(:,[1 2 3 4 5 6 18]);
end;
if NAME == ('01582000_realtimeAll.txt'); % not included yet
W = 137.0104;
rain = RAIN(:,[1 2 3 4 5 6 19]);
end;
if NAME == ('01582500_realtimeAll.txt');
W = 312.021752;
rain = RAIN(:,[1 2 3 4 5 6 20]);
end;
if NAME == ('01583100_realtimeAll.txt'); % not included yet
W = 31.85685;
rain = RAIN(:,[1 2 3 4 5 6 21]);
end;
if NAME == ('01583600_realtimeAll.txt');
W = 54.111091;
rain = RAIN(:,[1 2 3 4 5 6 22]);
end;
if NAME == ('01584050_realtimeAll.txt');
W = 24.107285;
rain = RAIN(:,[1 2 3 4 5 6 23]);
end;
if NAME == ('01584500_realtimeAll.txt'); % not included yet
W = 93.49857;
rain = RAIN(:,[1 2 3 4 5 6 24]);
end;
if NAME == ('01585090_realtimeAll.txt');
W = 6.639986;
rain = RAIN(:,[1 2 3 4 5 6 25]);
end;
if NAME == ('01585095_realtimeAll.txt');  % not included yet
W = 3.470584;
rain = RAIN(:,[1 2 3 4 5 6 26]);
end;
if NAME == ('01585100_realtimeAll.txt');
W = 20.558685;
rain = RAIN(:,[1 2 3 4 5 6 27]);
end;
if NAME == ('01585104_realtimeAll.txt');
W = 6.01764;
rain = RAIN(:,[1 2 3 4 5 6 28]);
end;
if NAME == ('01585200_realtimeAll.txt');
W = 5.951165;
rain = RAIN(:,[1 2 3 4 5 6 29]);
end;
if NAME == ('01585230_realtimeAll.txt');
W = 9.016338;
rain = RAIN(:,[1 2 3 4 5 6 30]);
end;
if NAME == ('01585300_realtimeAll.txt');  % not included yet, *NOT ACTIVE
W = 11.55135;
rain = RAIN(:,[1 2 3 4 5 6 31]);
end;
if NAME == ('01585400_realtimeAll.txt');  % not included yet, *NOT ACTIVE
W = 5.102277;
rain = RAIN(:,[1 2 3 4 5 6 32]);
end;
if NAME == ('01585500_realtimeAll.txt');  % not included yet
W = 8.5210609;
rain = RAIN(:,[1 2 3 4 5 6 33]);
end;
if NAME == ('01586000_realtimeAll.txt'); % not included yet
W = 146.5933;
rain = RAIN(:,[1 2 3 4 5 6 34]);
end;
if NAME == ('01586210_realtimeAll.txt'); % not included yet
W = 36.2598;
rain = RAIN(:,[1 2 3 4 5 6 35]);
end;
if NAME == ('01587500_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 166.7952;
rain = RAIN(:,[1 2 3 4 5 6 36]);
end;
if NAME == ('01589000_realtimeAll.txt'); % not included yet
W = 738.1466;
rain = RAIN(:,[1 2 3 4 5 6 37]);
end;
if NAME == ('01589100_realtimeAll.txt');
W = 7.47383;
rain = RAIN(:,[1 2 3 4 5 6 38]);
end;
if NAME == ('01589197_realtimeAll.txt');
W = 12.533692;
rain = RAIN(:,[1 2 3 4 5 6 39]);
end;
if NAME == ('01589290_realtimeAll.txt');
W = 9.000851;
rain = RAIN(:,[1 2 3 4 5 6 40]);
end;
if NAME == ('01589300_realtimeAll.txt');  % not included yet, Villanova
W = 84.17461;
rain = RAIN(:,[1 2 3 4 5 6 41]);
end;
if NAME == ('01589305_realtimeAll.txt');
W = 9.505485;
rain = RAIN(:,[1 2 3 4 5 6 42]);
end;
if NAME == ('01589312_realtimeAll.txt');
W = 0.917875;
rain = RAIN(:,[1 2 3 4 5 6 43]);
end;
if NAME == ('01589317_realtimeAll.txt');
W = 1.115065;
rain = RAIN(:,[1 2 3 4 5 6 44]);
end;
if NAME == ('01589330_realtimeAll.txt');
W = 14.307377;
rain = RAIN(:,[1 2 3 4 5 6 45]);
end;
if NAME == ('01589352_realtimeAll.txt');  % not included yet, gfcp
W = 170.6802;
rain = RAIN(:,[1 2 3 4 5 6 46]);
end;
if NAME == ('01589440_realtimeAll.txt');
W = 66.197765;
rain = RAIN(:,[1 2 3 4 5 6 47]);
end;
if NAME == ('01589500_realtimeAll.txt');  % not included yet, sawmill creek, glen bernie
W = 12.87224;
rain = RAIN(:,[1 2 3 4 5 6 48]);
end;
if NAME == ('01589795_realtimeAll.txt'); % not included yet
W = 2.58999;
rain = RAIN(:,[1 2 3 4 5 6 49]);
end;
if NAME == ('01590000_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 22.0149;
rain = RAIN(:,[1 2 3 4 5 6 50]);
end;
if NAME == ('01591000_realtimeAll.txt');
W = 90.13;
rain = RAIN(:,[1 2 3 4 5 6 51]);
end;
if NAME == ('01591610_realtimeAll.txt');  % not included yet
W = 203.5731;
rain = RAIN(:,[1 2 3 4 5 6 52]);
end;
if NAME == ('01591700_realtimeAll.txt');
W = 69.93;
rain = RAIN(:,[1 2 3 4 5 6 53]);
end;
if NAME == ('01592500_realtimeAll.txt'); % not included yet
W = 341.8784;
rain = RAIN(:,[1 2 3 4 5 6 54]);
end;
if NAME == ('01593500_realtimeAll.txt'); % not included yet
W = 98.4195;
rain = RAIN(:,[1 2 3 4 5 6 55]);
end;
if NAME == ('01594000_realtimeAll.txt'); % not included yet
W = 254.8548;
rain = RAIN(:,[1 2 3 4 5 6 56]);
end;
if NAME == ('01594400_realtimeAll.txt'); % not included yet
W = 30.04386;
rain = RAIN(:,[1 2 3 4 5 6 57]);
end;
if NAME == ('01594440_realtimeAll.txt'); % not included yet
W = 901.3159;
rain = RAIN(:,[1 2 3 4 5 6 58]);
end;
if NAME == ('01594500_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 78.21764;
rain = RAIN(:,[1 2 3 4 5 6 59]);
end;
if NAME == ('01594526_realtimeAll.txt'); % not included yet
W = 232.3219;
rain = RAIN(:,[1 2 3 4 5 6 60]);
end;
if NAME == ('01642190_realtimeAll.txt'); % not included yet
W = 1820.762;
rain = RAIN(:,[1 2 3 4 5 6 61]);
end;
if NAME == ('01643000_realtimeAll.txt'); % not included yet
W = 2116.02;
rain = RAIN(:,[1 2 3 4 5 6 62]);
end;
if NAME == ('01644280_realtimeAll.txt'); % not included yet
W = 197.0981;
rain = RAIN(:,[1 2 3 4 5 6 63]);
end;
if NAME == ('01644375_realtimeAll.txt');
W = 3.496;
rain = RAIN(:,[1 2 3 4 5 6 64]);
end;
if NAME == ('01644600_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 131.3124;
rain = RAIN(:,[1 2 3 4 5 6 65]);
end;
if NAME == ('01645000_realtimeAll.txt');
W = 261.59;
rain = RAIN(:,[1 2 3 4 5 6 66]);
end;
if NAME == ('01645200_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 9.58296;
rain = RAIN(:,[1 2 3 4 5 6 67]);
end;
if NAME == ('01645704_realtimeAll.txt'); % not included yet, Fairfax, VA
W = 14.21903;
rain = RAIN(:,[1 2 3 4 5 6 68]);
end;
if NAME == ('01645762_realtimeAll.txt'); % not included yet, Vienna, VA
W = 7.018868;
rain = RAIN(:,[1 2 3 4 5 6 69]);
end;
if NAME == ('01646000_realtimeAll.txt'); % not included yet
W = 149.7013;
rain = RAIN(:,[1 2 3 4 5 6 70]);
end;
if NAME == ('01646305_realtimeAll.txt'); % not included yet, McClean VA
W = 5.309476;
rain = RAIN(:,[1 2 3 4 5 6 71]);
end;
if NAME == ('01646550_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 10.619;
rain = RAIN(:,[1 2 3 4 5 6 72]);
end;
if NAME == ('01647850_realtimeAll.txt');
W = 7.097;
rain = RAIN(:,[1 2 3 4 5 6 73]);
end;
if NAME == ('01648000_realtimeAll.txt');
W = 161.1;
rain = RAIN(:,[1 2 3 4 5 6 74]);
end;
if NAME == ('01649150_realtimeAll.txt');
W = 2.694;
rain = RAIN(:,[1 2 3 4 5 6 75]);
end;
if NAME == ('01649190_realtimeAll.txt');
W = 33.93;
rain = RAIN(:,[1 2 3 4 5 6 76]);
end;
if NAME == ('01649500_realtimeAll.txt');
W = 188.55;
rain = RAIN(:,[1 2 3 4 5 6 77]);
end;
if NAME == ('01650500_realtimeAll.txt');
W = 54.39;
rain = RAIN(:,[1 2 3 4 5 6 78]);
end;
if NAME == ('01650800_realtimeAll.txt');
W = 16.87;
rain = RAIN(:,[1 2 3 4 5 6 79]);
end;
if NAME == ('01651000_realtimeAll.txt');
W = 127.95;
rain = RAIN(:,[1 2 3 4 5 6 80]);
end;
if NAME == ('01651800_realtimeAll.txt');
W = 8.36;
rain = RAIN(:,[1 2 3 4 5 6 81]);
end;
if NAME == ('01652500_realtimeAll.txt'); % not included yet, Alexandria VA
W = 32.63385;
rain = RAIN(:,[1 2 3 4 5 6 82]);
end;
if NAME == ('01653000_realtimeAll.txt'); % not included yet, Alexandria VA
W = 87.8006;
rain = RAIN(:,[1 2 3 4 5 6 83]);
end;
if NAME == ('01653500_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 43.2528;
rain = RAIN(:,[1 2 3 4 5 6 84]);
end;
if NAME == ('01653600_realtimeAll.txt'); % not included yet
W = 102.3045;
rain = RAIN(:,[1 2 3 4 5 6 85]);
end;
if NAME == ('01654000_realtimeAll.txt'); % not included yet, Annandale VA
W = 61.90072;
rain = RAIN(:,[1 2 3 4 5 6 86]);
end;
if NAME == ('01656000_realtimeAll.txt'); % not included yet
W = 241.9049;
rain = RAIN(:,[1 2 3 4 5 6 87]);
end;
if NAME == ('01656903_realtimeAll.txt'); % not included yet, Chantilly VA
W = 10.878;
rain = RAIN(:,[1 2 3 4 5 6 88]);
end;
if NAME == ('01657000_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 378.1383;
rain = RAIN(:,[1 2 3 4 5 6 89]);
end;
if NAME == ('01658000_realtimeAll.txt'); % not included yet
W = 141.9313;
rain = RAIN(:,[1 2 3 4 5 6 90]);
end;
if NAME == ('01660000_realtimeAll.txt'); % not included yet, * Not active after 2011
W = 6.371371;
rain = RAIN(:,[1 2 3 4 5 6 91]);
end;
if NAME == ('01660400_realtimeAll.txt'); % not included yet
W = 90.6496;
rain = RAIN(:,[1 2 3 4 5 6 92]);
end;
if NAME == ('01660920_realtimeAll.txt'); % not included yet
W = 206.9401;
rain = RAIN(:,[1 2 3 4 5 6 93]);
end;
if NAME == ('01661500_realtimeAll.txt'); % not included yet
W = 62.1597;
rain = RAIN(:,[1 2 3 4 5 6 94]);
end;
if NAME == ('01668000_realtimeAll.txt'); % not included yet
W = 4131.031;
rain = RAIN(:,[1 2 3 4 5 6 95]);
end;
if NAME == ('01668500_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 118.1035;
rain = RAIN(:,[1 2 3 4 5 6 96]);
end;
if NAME == ('01670400_realtimeAll.txt'); % not included yet
W = 885.7759;
rain = RAIN(:,[1 2 3 4 5 6 97]);
end;
if NAME == ('01671000_realtimeAll.txt'); % not included yet, *NOT ACTIVE
W = 1139.595;
rain = RAIN(:,[1 2 3 4 5 6 98]);
end;
if NAME == ('01673800_realtimeAll.txt'); % not included yet
W = 200.9831;
rain = RAIN(:,[1 2 3 4 5 6 99]);
end;
if NAME == ('01674000_realtimeAll.txt'); % not included yet
W = 663.037;
rain = RAIN(:,[1 2 3 4 5 6 100]);
end;
if NAME == ('01494150_realtimeAll.txt'); % not included yet
W = 24.6049;
rain = RAIN(:,[1 2 3 4 5 6 101]);
end;
if NAME == ('01581810_realtimeAll.txt');
W = 70.841619;
rain = RAIN(:,[1 2 3 4 5 6 102]);
end;
if NAME == ('01581830_realtimeAll.txt');
W = 19.492905;
rain = RAIN(:,[1 2 3 4 5 6 103]);
end;
if NAME == ('01581870_realtimeAll.txt');
W = 40.973497;
rain = RAIN(:,[1 2 3 4 5 6 104]);
end;
if NAME == ('01581960_realtimeAll.txt');
W = 25.060392;
rain = RAIN(:,[1 2 3 4 5 6 105]);
end;
if NAME == ('01583500_realtimeAll.txt');
W = 155.391259;
rain = RAIN(:,[1 2 3 4 5 6 106]);
end;
if NAME == ('01583570_realtimeAll.txt');
W = 0.345392;
rain = RAIN(:,[1 2 3 4 5 6 107]);
end;
if NAME == ('01583580_realtimeAll.txt');
W = 3.825849;
rain = RAIN(:,[1 2 3 4 5 6 108]);
end;
if NAME == ('01583800_realtimeAll.txt');
W = 5.083582;
rain = RAIN(:,[1 2 3 4 5 6 109]);
end;
%if NAME == ('0158397967_realtimeAll.txt');
%W = 5.360294;
%rain = RAIN(:,[1 2 3 4 5 6 110]);
%end;
if NAME == ('01585219_realtimeAll.txt');
W = 41.49083;
rain = RAIN(:,[1 2 3 4 5 6 111]);
end;
if NAME == ('01585225_realtimeAll.txt');
W = 0.465532;
rain = RAIN(:,[1 2 3 4 5 6 112]);
end;
if NAME == ('01589180_realtimeAll.txt');
W = 0.866665;
rain = RAIN(:,[1 2 3 4 5 6 113]);
end;
if NAME == ('01589238_realtimeAll.txt');
W = 46.732449;
rain = RAIN(:,[1 2 3 4 5 6 114]);
end;
if NAME == ('01589315_realtimeAll.txt');
W = 7.189756;
rain = RAIN(:,[1 2 3 4 5 6 115]);
end;
if NAME == ('01589316_realtimeAll.txt');
W = 1.90842;
rain = RAIN(:,[1 2 3 4 5 6 116]);
end;
if NAME == ('01589320_realtimeAll.txt');
W = 5.024197;
rain = RAIN(:,[1 2 3 4 5 6 117]);
end;
if NAME == ('01589464_realtimeAll.txt');
W = 5.685063;
rain = RAIN(:,[1 2 3 4 5 6 118]);
end;
if NAME == ('01643395_realtimeAll.txt');
W = 3.03;
rain = RAIN(:,[1 2 3 4 5 6 119]);
end;
if NAME == ('01644371_realtimeAll.txt');
W = 1.1137;
rain = RAIN(:,[1 2 3 4 5 6 120]);
end;
if NAME == ('01644372_realtimeAll.txt');
W = 0.9583;
rain = RAIN(:,[1 2 3 4 5 6 121]);
end;
if NAME == ('01644380_realtimeAll.txt');
W = 2.046;
rain = RAIN(:,[1 2 3 4 5 6 122]);
end;
if NAME == ('01644388_realtimeAll.txt');
W = 8.728;
rain = RAIN(:,[1 2 3 4 5 6 123]);
end;
if NAME == ('01644390_realtimeAll.txt');
W = 11.603;
rain = RAIN(:,[1 2 3 4 5 6 124]);
end;
if NAME == ('01648010_realtimeAll.txt');
W = 164.98;
rain = RAIN(:,[1 2 3 4 5 6 125]);
end;
if NAME == ('01651770_realtimeAll.txt');
W = 3.45;
rain = RAIN(:,[1 2 3 4 5 6 126]);
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is for the precipitation data

rain(any(isnan(rain),2),:) = []; % removes rows that are blank

rain((rain(:,7))<0,:)=[];% removes rows that have negative value

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extracting out just the 2010-2012 data

for z=1:(length(rain));
    if rain(z,1) == YEAR1 || rain(z,1) == YEAR2 || rain(z,1) == YEAR3;
        rain(z,8) = 1;      
    else rain(z,8) = 0;
    end;
end;

rain(:,:) = rain(:,[1,2,3,4,5,6,7,8]);
nanRows2 = any(isnan(rain(:,8)), 2);
zeroRows2 = any(rain(:,8)==0, 2);
badRows2 = nanRows2 | zeroRows2;
rain(badRows2, :) = [];



%%%%%%%%%
% Find Start of Rain events (separating each rain_start from the next by 6 hrs)
% 21600 = number of seconds in 6 hrs
% 43200 = number of seconds in 12 hrs
rain(:,8) = [];
for z=2:(length(rain)); % This one finds start rain when time before rain event >6hrs
        if etime(rain(z,1:6),rain(z-1,1:6))>21600 && rain(z,7)>0; 
            rain(z,8)=1;
        else rain(z,8)=0;
        end;
end;

% This code only puts 1s next to start rain if there are no rain events 6hrs prior.  
for z=24:(length(rain)); % This finds start of individual rain events with at least 24 time steps(6hrs)with no rain prior
    if rain(z,7)>0 && rain(z-1,7)==0 && rain(z-2,7)==0 && rain(z-3,7)==0 && rain(z-4,7)==0 ...
            && rain(z-5,7)==0 && rain(z-6,7)==0 && rain(z-7,7)==0 && rain(z-8,7)==0 ...
            && rain(z-9,7)==0 && rain(z-10,7)==0 && rain(z-11,7)==0 && rain(z-12,7)==0 ...
            && rain(z-13,7)==0 && rain(z-14,7)==0 && rain(z-15,7)==0 && rain(z-16,7)==0 ...
            && rain(z-17,7)==0 && rain(z-18,7)==0 && rain(z-19,7)==0 && rain(z-20,7)==0 ...
            && rain(z-21,7)==0 && rain(z-22,7)==0 && rain(z-23,7)==0 && rain(z-24,7)==0 ...; 
            rain(z,8)=1;
    else rain(z,8)=0;
    end;
end;

for z=8:24; % this finds start of individual rain events for first 6 hrs, not caught by above code
    if rain(z,7)>0 && rain(z-1,7)==0 && rain(z-2,7)==0 && rain(z-3,7)==0 && rain(z-4,7)==0 ...
            && rain(z-5,7)==0 && rain(z-6,7)==0 && rain(z-7,7)==0; %&& rain(z-8,7)==0;
        rain(z,8)=1;
    else rain(z,8)=0;
    end;
end;


% Removing any start rain events if no other periods with rain >0 after
% start rain, and before next start rain within 6 hrs
for z=1:(length(rain)-24); % This finds start of individual rain events with at least 24 time steps(6hrs)with no rain prior
    if rain(z,7)>0 && rain(z,8)>0 && rain(z+1,7)==0 && rain(z+2,7)==0 && rain(z+3,7)==0 && rain(z+4,7)==0 ...
            && rain(z+5,7)==0 && rain(z+6,7)==0 && rain(z+7,7)==0 && rain(z+8,7)==0 ...
            && rain(z+9,7)==0 && rain(z+10,7)==0 && rain(z+11,7)==0 && rain(z+12,7)==0 ...
            && rain(z+13,7)==0 && rain(z+14,7)==0 && rain(z+15,7)==0 && rain(z+16,7)==0 ...
            && rain(z+17,7)==0 && rain(z+18,7)==0 && rain(z+19,7)==0 && rain(z+20,7)==0 ...
            && rain(z+21,7)==0 && rain(z+22,7)==0 && rain(z+23,7)==0 && rain(z+24,7)==0 ...; 
            rain(z,9)=1;
    else rain(z,9)=0;
    end;
end;

for z=1:(length(rain)); % this removes those rain events from column 8 
    if rain(z,9)==1;
        rain(z,8)=0;
    end;
end;
rain(:,9) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find End of Rain Event
% this code finds the last period with > 0 rain between start_rain and next
% start rain, and puts 1s in column 9 to indicate location of stop rain events. 

start_rain =find(rain(:,8)); % this finds row index of all official Start of Rain Events
for z=2:(length(rain));
    for d=1:(size(start_rain,1)-1);
    s = find(rain(start_rain(d)+1:start_rain(d+1)-1,7)>0, 1, 'last' ); %this looks within the range between each start_rain rows
    rain(start_rain(d)+s,9)=1; %%%% This puts 1 in rows for stop rain events
    end;
end;

% this code finds any missed stop rains due to the next row after start
% rain being > 6hrs later. (***Not using this code since it doesn't seem
% necessary for NEXRAD data and it slows it down a lot 5/30/15).  
% 21600 = number of seconds in 6 hrs
% 43200 = number of seconds in 12 hrs
% for z=1:(length(rain)-1); 
%     for f=1:(size(start_rain,1)-1);
%     if etime(rain(start_rain(f+1),1:6),rain(start_rain(f),1:6))>21600 ...
%             && start_rain(f+1)-start_rain(f)==1;
%         rain(start_rain(f),10) = 1;
%     else rain(start_rain(f),10) = 0;
%     if rain(z,10)==1;
%         rain(z,9)=1;
%     end;
%     end;
%     end;
% end;
%rain(:,10) = [];

e = max(find(rain(:,7)>0)); % this is for finding the last stop_rain
rain(e,9) = 1;

stop_rain = find(rain(:,9));


% Code to find the total inches of rain for each rain event (column 2 of
% start_rain)
for e=1:size(start_rain,1);
    start_rain(e,2)=sum(rain(start_rain(e):stop_rain(e),7));
end;

% Code to find centroid:
% Code to find half of rain event volume

start_rain(:,3)=start_rain(:,2)/2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code to find row # when half rain event volume occurred

% code to create cumulative sum for each rain event
for z=1:(size(start_rain,1));
    rain(start_rain(z):stop_rain(z),10) = cumsum(rain(start_rain(z):stop_rain(z),7));
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code to find the row number for the centroid

% each code below is a separate attempt at indexing the row # of each
% centroid


start_rain(:,4)=stop_rain(:,1); % putting stop_rain row values in start_rain column 4
rain(:,11)=zeros;

for b=1:size(start_rain,1);
    [~,I]=min(abs(start_rain(b,3)-(rain(start_rain(b,1):start_rain(b,4),10)))); % finding this equals zero, when the value on the left of minus sign (centroid value) equals value on right)
    rain(I+start_rain(b,1)-1,11)=1; % [~,I] = specifies row number that corresponds to abs(min(, but it will only spit out the row number from 1 to the length of that specific record, so need to add in the start row #-1 (check with b=2)
end;


% adding centroid value and total rainfall values 

for z=1:length(rain); % this puts centroid precip amount in column 12
    if rain(z,11)>0;
    rain(z,12)=(rain(z,10)); % Centroid Amount
    else rain(z,12)=0;
    end;
end;

for z=1:length(rain); %this puts total rainfall amount in column 13
    if rain(z,9)>0;
    rain(z,13)=(rain(z,10)); % Total Rain Amount
    else rain(z,13)=0;
    end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%    This is the Start of the Flow Script       %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% This is for the Flow Data

for i=1:length(C); % length C = 25
    if strcmp(C{i}(1), 'datetime');            %Look for date code
        time = datevec(C{i}(3:length(C{i})),'yyyy-mm-dd');   
    end;
    if strcmp(C{i}(1), 'tz_cd');            %Look for date code
        dummy = datevec(C{i}(3:length(C{i})),'HH:MM');       
    end;
    if strcmp(C{i}(1), '01_00060_cd') || strcmp(C{i}(1), '02_00060_cd');  %Look for date code DRFR = 01_00060_cd, MB5&PMw2 = 02_00060_cd
        Q = (C{i}(3:length(C{i}))); 
    end;
    
end;
time(:,4:5)=dummy(:,4:5); % change to all data
time(:,6)=str2double(Q); 

%######################################################################
%######################################################################

% Code to extract out the date or year range for the dataset

for z=1:(length(time));
    if time(z,1) == YEAR1 || time(z,1) == YEAR2 || time(z,1) == YEAR3; 
        time(z,7) = 1;      % this puts 1's in rows next to desired years
    else time(z,7) = 0;
    end;
end;

% this code removes any row with a zero and keeps the rows with 1s
time(:,:) = time(:,[1,2,3,4,5,6,7]); 
nanRows2 = any(isnan(time(:,7)), 2);
zeroRows2 = any(time(:,7)==0, 2);
badRows2 = nanRows2 | zeroRows2;
time(badRows2, :) = [];


%######################################################################
%######################################################################

% 1 row = 15 minutes
% 12 hrs = 48 rows
% 6 hrs = 24 rows

% Code for finding maximum in 12-hour window
 
for z=48:(length(time)-48);
    time(z,7)=max(time((z-24):(z+24),6)); % max 12-hr window
    if time(z,7)>time(z,6);     % keeping only max values in adjacent to row with the max value.  
    time(z,7)=0;
    else time(z,7)=time(z,6);
    end;
    if time(z,7)<=5;   % Threshold to remove peak Q below 1 cfs (to remove any baseflow peaks)
       time(z,7)=0;
    end;     
end; 

% code to find the start of peak if multiple maximum flows make up peak
for z=48:(length(time)-48);
if time(z,7)>0 && time(z-1,7)>0;
    time(z+1,8)=0;
else time(z,8)=time(z,7);
end
end; 

% code to separate each peak by at least 6 hours 
% 24 = number of rows that equals 6 hours at 15 minutes per row
% 48 = number of rows that equals 12 hours at 15 minutes per row
% 96 = number of rows that equals 24 hours at 15 minutes per row
for z=1:(length(time)-24); % 24 = number of rows that equals 6 hours at 5 minutes per row
  if time(z,8)>0;
  if time(z:z+24,8)<=time(z,8);
     time(z+1:z+24,8)=0;
  end;
  if time(z:z+24,8)>=time(z,8);
     time(z,8)=0;
  end;
  end;
end;

% code for determining the time and value for the start of the rising limb 
% by finding the minimum value prior to the peak within a 12 hour window.
%this code doesn't leave out the extra min values if they exist
for z=49:(length(time));
    if time(z,8)>0;
    a=min(time(z-48:z,6));
    for q=z-48:z
    if time(q,6)==a;
    time(q,9)=a;
    end;
    end;
    end;
end;

% code for locating the start of peak flow event (the mimimum value within  
% 12 hours prior to peak event) - this code removes the extra min values
peak_rows =find(time(:,8));
start=find(peak_rows>48,1);
start_rows=[];
for b=start:size(peak_rows,1); % b is a row number within the peak_rows vector
    tempmin=min(time(peak_rows(b)-48:peak_rows(b),6)); % finds the row value in peak_rows goes 48 rows before this in column 6 of time array
    c=find(time(peak_rows(b)-48:peak_rows(b),6)==tempmin); % because 'c' is just a number between 1 and 48 that refers to that specific event: the peak minus 48 time steps
    c=c-1+(peak_rows(b)-48);
    start_rows(b,1)=peak_rows(b)-max(c);    % max(c) is the largest row number that has a min value for a particular peak
end
start_rows=peak_rows-start_rows;
time(start_rows,10)=time(start_rows,6);

% Code to remove any peaks where the start of the peak = min before peak (happens when "peak" found on falling limb).

for z=1:length(time);
    if time(z,8)==time(z,10);
        time(z,8)=0;
        time(z,10)=0;
    end;
end;

% refinding start rows
peak_rows =find(time(:,8));
start=find(peak_rows>48,1);
start_rows=[];
for b=start:size(peak_rows,1); % b is a row number within the peak_rows vector
    tempmin=min(time(peak_rows(b)-48:peak_rows(b),6)); % finds the row value in peak_rows goes 48 rows before this in column 6 of time array
    c=find(time(peak_rows(b)-48:peak_rows(b),6)==tempmin); % because 'c' is just a number between 1 and 48 that refers to that specific event: the peak minus 48 time steps
    c=c-1+(peak_rows(b)-48);
    start_rows(b,1)=peak_rows(b)-max(c);    % max(c) is the largest row number that has a min value for a particular peak
end
start_rows=peak_rows-start_rows;
time(start_rows,10)=time(start_rows,6);


% code to separate each start_row by at least 6 hours 

% for z=1:(length(time)-24); % 24 = number of rows that equals 6 hours at 5 minutes per row
%   if time(z,10)>0;
%   if time(z:z+24,10)<=time(z,10);
%      time(z+1:z+24,10)=0;
%   end
%   if time(z:z+24,10)>=time(z,10);
%      time(z,10)=0;
%   end;
%   end;
% end;

% Code for finding the mimimum after the peak
for z=1:(length(time));
    if time(z,8)>0;
    a=min(time(z:z+48,6));
    for q=z:z+48
    if time(q,6)==a;
    time(q,11)=a;
    end;
    end;
    end;
end;

% code to find the minimum value after the peak (peak_finish)
% 384 rows = 96 hrs(4days), 288 rows=  72hrs(3days), 192 rows=48hrs(2days), 96 rows=  24hrs
finish_rows=[];
for f=1:size(peak_rows,1); % f is a row number within the peak_rows vector
    if peak_rows(f)+288 > size(time(:,1),1); % this code was added in b/c sometimes the last peak may be less than 1+ days from the end of the dataset
    tempmin2=min(time(peak_rows(f):size(time(:,1),1),6));
    else tempmin2=min(time(peak_rows(f):peak_rows(f)+288,6));% 1152 corresponds 96hrs or 4 days for the potential length of falling limb %%%finds the row value in peak_rows, goes 1152 rows before this in column 6 of time array
    g=find(time(peak_rows(f):peak_rows(f)+288,6)==tempmin2); 
    finish_rows(f,1)=peak_rows(f)+min(g)-1;    
    end;
end;
time(finish_rows,12)=time(finish_rows,6);

% code to test if size of range is big enough for falling limb
%falling_limb = (finish_rows - peak_rows(:,1))/12;


%******
%%%Finding Threshold for Peakflow value
%%% First find Median/Mean Baseflow

for g=1:length(time); % Puts 1's in all rows before the first start_row
   for h=1:size(finish_rows,1);
       if g<start_rows(1);
           time(g,13)=1;
       end;
   end;
end;

for g=1:length(time);  % puts 1s in all rows associated with the hydrograph
   for h=1:size(finish_rows,1);
       if g<=finish_rows(h)&g>=start_rows(h);
           time(g,13)=1;
       end;
   end;
end;

for g=1:length(time); % puts the flow value for all baseflow rows
    if time(g,13)==0;
        time(g,14)=time(g,6);
    else time(g,14)=0;
    end;
end;

Baseflow=time(:,[1,2,14]); % creates an array for only baseflow rows. 
nanRows = any(isnan(Baseflow), 2);
zeroRows = any(Baseflow==0, 2);
badRows = nanRows | zeroRows;
Baseflow(badRows, :) = [];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% MONTHLY METRICS
year_month=unique(time(:,1:2),'rows'); %Create a matrix that consists of all unique year-month combinations

% Monthly Baseflow Metrics

[Q3,subs3]=ismember(Baseflow(:,1:2),year_month(:,1:2),'rows'); %Establish logical that links 'year_month' to 'Baseflow' (Q3 is just column of 1s, Subs3 is column of 1-12 filling number of rows equal to number of rows in baseflow)
year_month(:,3)=((0.3048^3)/W)*accumarray(subs3,Baseflow(:,3),[size(year_month,1) 1],@mean); %(m^3/s/km2)
year_month(:,4)=accumarray(subs3,Baseflow(:,3),[size(year_month,1) 1],@median); %(cfs) - leaving as cfs b/c used later in comparisons with time(:,6) which is in cfs

[Q2,subs2]=ismember(time(:,1:2),year_month(:,1:2),'rows');
time(Q2,15)=year_month(subs2(Q2),4); % time column 15 is median montly baseflow - repeats the monthly baseflow for each timestep of the month

%%%%
% Buffam et al. 2001 - Stormflow defined as increase in baseflow about of
% about 5-fold. 
for z=2:(length(time)-1); 
if time(z,8)>5*time(z,15); % Removing any peakflows less than 5 X monthly median baseflow 
    time(z,8) =  time(z,8);
else time(z,8)=0;
end;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%****************************************************% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%I'm re-running the start_rows & finish_rows code now that peak threshold has
%been found


% code for locating the start of peak flow event (the mimimum value within  
% 12 hours prior to peak event) - this code removes the extra min values
peak_rows =find(time(:,8));
start=find(peak_rows>48,1);
start_rows=[];
for b=start:size(peak_rows,1); % b is a row number within the peak_rows vector
    tempmin=min(time(peak_rows(b)-48:peak_rows(b),6)); % finds the row value in peak_rows goes 48 rows before this in column 6 of time array
    c=find(time(peak_rows(b)-48:peak_rows(b),6)==tempmin); % because 'c' is just a number between 1 and 48 that refers to that specific event: the peak minus 48 time steps
    c=c-1+(peak_rows(b)-48);
    start_rows(b,1)=peak_rows(b)-max(c);    % max(c) is the largest row number that has a min value for a particular peak
end
start_rows=peak_rows-start_rows;
time(start_rows,10)=time(start_rows,6);


% code to find the minimum value after the peak (peak_finish)
% 384 rows = 96 hrs(4days), 288 rows=  72hrs(3days), 192 rows=48hrs(2days), 96 rows=  24hrs
finish_rows=[];
for f=1:size(peak_rows,1); % f is a row number within the peak_rows vector
    if peak_rows(f)+288 > size(time(:,1),1); % this code was added in b/c sometimes the last peak may be less than 1+ days from the end of the dataset
    tempmin2=min(time(peak_rows(f):size(time(:,1),1),6));
    else tempmin2=min(time(peak_rows(f):peak_rows(f)+288,6));%  %%%finds the row value in peak_rows, goes 1152 rows before this in column 6 of time array
    g=find(time(peak_rows(f):peak_rows(f)+288,6)==tempmin2); 
    finish_rows(f,1)=peak_rows(f)+min(g)-1;    
    end;
end;
time(finish_rows,12)=time(finish_rows,6);

%checking falling limb length
%falling_limb = (finish_rows - peak_rows(:,1))/12;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code is used to find any peaks that overlap a gap in the time series
% data, where > 6 hrs of data is missing.  

for z=1:(length(time)-1);
    if etime(time(z+1,1:6),time(z,1:6))>21600; % 6 hrs (21600 sec)
    time(z+1,16) = 1;
    else time(z+1,16) = 0;
    end;
    if time(z,16)>0;
        gap_6hr = find(time(z,16) == 1); % creates vector with row #s for location of gaps
    else gap_6hr(1,1) = 0; % this is to deal with cases where there are no gaps, so put in zero, else won't work
    end;
end;
time(:,16)=[];

% this finds if the gap row number is between the start and finish rows and
% for the cases where this is true it puts a 1 next to that row, else zero. 
for z=1:length(start_rows);
    for b=1:size(gap_6hr,1);
        if gap_6hr(b,1) > start_rows(z,1) && gap_6hr(b,1) < finish_rows(z,1);
            gap_6hr(b,2) = 1; 
        else gap_6hr(b,2) = 0;
        end;
        
        if gap_6hr(b,1) > start_rows(z,1) && gap_6hr(b,1) < finish_rows(z,1);
            start_rows(z,2)=1;
        else start_rows(z,2)=0;
        end;
    
        if gap_6hr(b,1) > start_rows(z,1) && gap_6hr(b,1) < finish_rows(z,1);
            finish_rows(z,2)=1;
        else finish_rows(z,2)=0;
        end;
        
        if gap_6hr(b,1) > start_rows(z,1) && gap_6hr(b,1) < finish_rows(z,1);
            peak_rows(z,2)=1;
        else peak_rows(z,2)=0;
        end;
    end;
end;

% This deletes any of the start and finish rows that for hydrographs that
% overlaps a gap.  
toDelete = start_rows(:,2)>0;
start_rows(toDelete,:) = [];

toDelete2 = finish_rows(:,2)>0;
finish_rows(toDelete2,:) = [];

toDelete3 = peak_rows(:,2)>0;
peak_rows(toDelete3,:) = [];

% This updates time column 8 where the peak rows are located

time(:,8)=0; % clearing out existing peaks
for z=1:length(peak_rows); % refinding peaks based on revised peak_rows
    time(peak_rows(z,1),8) = time(peak_rows(z,1),6);
end;


% this removes column 2 of the 3 row vectors
start_rows(:,2) = [];
finish_rows(:,2) = [];
peak_rows(:,2) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&
%****************************************************%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&

% Monthly peakflow metrics

peakflows=time(:,[1,2,8]);
nanRows = any(isnan(peakflows), 2);
zeroRows = any(peakflows==0, 2);
badRows = nanRows | zeroRows;
peakflows(badRows, :) = [];

%%% for only peak flows
[Q,subs]=ismember(peakflows(:,1:2),year_month(:,1:2),'rows'); %Establish logical that links 'year_month' to 'peakflows'
year_month(:,5)=(0.3048^3)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@mean); % Mean monthly Peak Q (m3/s)   
year_month(:,6)=(0.3048^3)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@median); % Median monthly Peak Q (m3/s) 
year_month(:,7)=((0.3048^3)/W)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@mean); % Mean monthly Peak Q (m3/s/km2)   
year_month(:,8)=((0.3048^3)/W)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@median); % Median monthly Peak Q (m3/s/km2) 
year_month(:,9)= ((0.3048^3)/W)*(28800/1000)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@mean); % mean monthly runoff (mm/day)
year_month(:,10)= ((0.3048^3)/W)*(28800/1000)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@median); % median monthly runoff (mm/day)

year_month(:,11)=((0.3048^3)/W)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@std); % stdev of monthly peak Q (m3/s/km2)
year_month(:,13)=((0.3048^3)/W)*(28800/1000)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@std); % stdev of monthly peak runoff (mm/day)

% Frequency of Peak Events (# peaks per month)
peakflows(:,4)= 1;
year_month(:,21)=accumarray(subs,peakflows(:,4),[size(year_month,1) 1],@sum);

% Calculate standard error
year_month(:,12) = year_month(:,11)./sqrt(year_month(:,21)); % std/sqrt count: std error of mean monthly peak / basin area
year_month(:,14) = year_month(:,13)./sqrt(year_month(:,21)); % std/sqrt count: std error of mean monthly peak Runoff

% Coefficient of Variation
year_month(:,15)= year_month(:,11)./(year_month(:,7)); % std/mean: Monthly Coefficient of variation Normalized by Basin Area(std / mean)
year_month(:,16)= year_month(:,13)./(year_month(:,9)); % std/mean: Monthly Coefficient of variation Runoff (std / mean)

% Monthly Min & Max (m3/s/km2)
year_month(:,17)=((0.3048^3)/W)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@min); % min.monthly.peak.basin
year_month(:,18)=((0.3048^3)/W)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@max);

year_month(:,19)=((0.3048^3)/W)*(28800/1000)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@min); % min.monthly.peak.runoff
year_month(:,20)=((0.3048^3)/W)*(28800/1000)*accumarray(subs,peakflows(:,3),[size(year_month,1) 1],@max);


%freq peak flow events above 3* median monthly flow

[Q2,subs2]=ismember(time(:,1:2),year_month(:,1:2),'rows'); %Establish logical that links 'year_month' to 'time'
year_month(:,22)=accumarray(subs2,time(:,6),[size(year_month,1) 1],@median); % column 22 is median monthly overall flow

time(Q2,16)=year_month(subs2(Q2),22); % time column 16 is median montly flow - repeats the monthly flow for each timestep of the month

for z=2:(length(time)-1);
if time(z,8)>3*time(z,16); 
    time(z,17)=  time(z,8);
else time(z,17)=0;
end;
end;

for z=2:(length(time)-1);
if time(z,17)~=0 
    time(z,18)= 1;
else time(z,18)=0;
end;
end;

% Frequency of Peak Events > 3 * monthly median (# peaks per month)
year_month(:,23)=accumarray(subs2,time(:,18),[size(year_month,1) 1],@sum);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Checking time between start_rows and peak_rows
for z=1:(size(start_rows,1)-1);
    start_rows(z,2) =  start_rows(z+1,1)-start_rows(z,1); % Finding diff btwn start rows
end;
start_rows(:,3)= (5/60)*start_rows(:,2);

for z=1:(size(peak_rows,1)-1);
    peak_rows(z,3) =  peak_rows(z+1,1)-peak_rows(z,1); % row # diff between peakflows
end;
peak_rows(:,4)= (5/60)*peak_rows(:,3); % diff (in hours) between peakflow rows

for z=1:(size(peak_rows,1));
    if peak_rows(z,4) <48; % finding number of peak pairs less than 24 or 48hrs appart
        peak_rows(z,5) =1;
    else peak_rows(z,5) = 0;
    end;
end;
peak_number = sum(peak_rows(:,5)); % finding number of peak pairs less than 24hrs appart
peak_percent = peak_number/24;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Refinding finish_rows - so that they are always before the next peak
%288=  24hrs(3days), 576 rows = 2 days; 288 rows = 1 day
%%** This code finds the finish row within 3 days after peak or before the
%%next peak, which ever comes first
finish_rows=[];
for z=1:(size(peak_rows,1)-1);
    if peak_rows(z+1)<peak_rows(z)+288; % finding finish_row as min between peak1 & peak1&3days, unless peak2 is less than 3 days away.   
    tempmin2=min(time(peak_rows(z):peak_rows(z+1),6));
    else tempmin2=min(time(peak_rows(z):peak_rows(z)+288,6));
    end;
    g=find(time(peak_rows(z):peak_rows(z+1),6)==tempmin2); 
    finish_rows(z,1)=peak_rows(z)+min(g)-1;    
end;
time(finish_rows,12)=time(finish_rows,6); 

% This code finds the finish_row after the last peak
    if peak_rows(end,1)+288<size(time(:,1),1); % finding finish_row as min between peak1 & peak1&3days, unless peak2 is less than 3 days away.   
    tempmin2=min(time(peak_rows(end,1):peak_rows(end,1)+288,6));
    else tempmin2=min(time(peak_rows(end,1):size(time(:,1),1),6));
    end;
    g=find(time(peak_rows(end,1):size(time(:,1),1),6)==tempmin2); 
    finish_rows(size(finish_rows,1)+1,1)=peak_rows(end,1)+min(g); 
  
time(finish_rows,12)=time(finish_rows,6); 


% find whether minimum for finish is < 2* median monthly baseflow 
for z=1:(size(finish_rows,1));
    finish_rows(z,2)=time(finish_rows(z,1),6); %finding flow value of finish_row
end;

% putting median monthly baseflow value in colume 3
for z=1:(size(finish_rows,1));
    finish_rows(z,3)=time(finish_rows(z,1),15); 
end;
    
for z=1:(size(finish_rows,1)-1);
    if finish_rows(z,2)<=2*finish_rows(z,3); % finding finish_row values < 2* median monthly baseflow
        finish_rows(z,4)=1;
    else finish_rows(z,4)=0;
    end;
end;
finish_sum = size(finish_rows(:,1),1)-sum(finish_rows(:,4));
finish_sum_percent = finish_sum./size(finish_rows(:,1),1);% percent of sites to remove based on finish row

% 
% for z=1:(length(peak_rows)-1);
%     if peak_rows(z+1,1)<finish_rows(z,1); % finding when next peak_row 2 is less than finish_row of peak 1
%         finish_rows(z,5)=1;
%     else finish_rows(z,5)=0;
%     end;
% end;
% finish_number = sum(finish_rows(:,5));
% finish_num_percent = finish_number./size(finish_rows(:,1),1);

% Finding if start_rows value is < 2* median monthly flow
for z=1:(size(start_rows,1));
    start_rows(z,4)=time(start_rows(z,1),6); %finding flow value of start_row
end;

% putting median monthly baseflow value in column 3
for z=1:(size(start_rows,1));
    start_rows(z,5)=time(start_rows(z,1),15); 
end;
    
for z=1:(size(start_rows,1)-1);
    if start_rows(z,4)<=2*start_rows(z,5); % finding start_rows values < 2* median monthly baseflow
        start_rows(z,6)=1;
    else start_rows(z,6)=0;
    end;
end;
start_sum = size(start_rows(:,1),1)-sum(start_rows(:,6));
start_sum_percent = start_sum./size(start_rows(:,1),1); % percent of sites to remove based on start_row

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Removing peakflows and associated start_rows, peak_rows, and finish_rows
% that have a finish row that is > 2* median baseflow (indicating that it
% overlaps with the start of the next peak).  

finish_rows(:,5) = start_rows(:,1);
finish_rows(:,6) = peak_rows(:,1);
finish_rows(:,7) = start_rows(:,6);

finish_rows_new=finish_rows(:,[1,4,5,6,7]);
nanRows = any(isnan(finish_rows_new), 2);
zeroRows = any(finish_rows_new==0, 2);
badRows = nanRows | zeroRows;
finish_rows_new(badRows, :) = [];


for i=1:1;
    if isempty(finish_rows_new);  % isemty function checks if array is empty - due to no peaks)
        finish_rows_new = zeros(1,5);
    end;
end;

start_rows_new = finish_rows_new(:,3);
peak_rows_new = finish_rows_new(:,4);

hydro_sum = size(peak_rows_new,1);
hydro_percent = size(peak_rows_new,1)./size(peak_rows,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VOLUME under Hydrograph (Units = ft^3 or cubic feet)
for e=1:size(peak_rows_new,1);
    if start_rows_new(e)>0 && finish_rows_new(e)>0;
    peak_rows_new(e,2)=900*trapz(time(start_rows_new(e):finish_rows_new(e),6)); % *900sec/row
    else peak_rows_new(e,2)=0;
    end;
end;

Hydro_Volume=(0.3048^3)*peak_rows_new(:,2); %(Units = m^3)

% length of rising limb (in hours)
rising_limb = (peak_rows_new(:,1) - start_rows_new)/4; % if 15min/row then divide by 4rows per hour

%length of falling limb (in hours)
falling_limb = (finish_rows_new(:,1) - peak_rows_new(:,1))/4;

% length of hydrograph (in hours)
Hydrograph_length = (finish_rows_new(:,1) - start_rows_new)/4;

% volume-to-peak ratio
for i=1:size(Hydro_Volume,1);
    if peak_rows_new(i,1)>0 && Hydro_Volume(i,1)>0;
        Hydro_Volume(i,2)= (Hydro_Volume(i,1)./time(peak_rows_new(i,1),6));
    else Hydro_Volume(i,2) = 0;
    end;
end;
% Hydrograph Recession Ratio: 
% (duration of the falling limb to the rising limb). (USGS Report)

Recession_Ratio = (falling_limb ./ rising_limb);


%%%% Compiling all hydrograph data into one array

%%%% ALL METRICS
%for i=1:size(peak_rows_new,1)
%    if peak_rows_new(:,1)>0;
Hydrograph_metrics = time(peak_rows_new(:,1),[1,2,8]); %
Hydrograph_metrics(:,4) = ((0.3048^3)/W)*Hydrograph_metrics(:,3); % Peak flow value (m3/s/km2)
Hydrograph_metrics(:,5) = Hydro_Volume(:,1); % volume under hydrograph (Units = m^3)
Hydrograph_metrics(:,6) = Hydro_Volume(:,2); % Volume-to-peak Ratio
Hydrograph_metrics(:,7) = rising_limb; % Length of rising limb
Hydrograph_metrics(:,8) = falling_limb; % Length of falling limb
Hydrograph_metrics(:,9) = Hydrograph_length; % Duration of Hydrograph
Hydrograph_metrics(:,10) = Recession_Ratio; % Hydrograph Recession Ratio
%    else Hydrograph_metrics = zeros(1,10);
%     end;
% end;

%****************************
peakflows(:,5)= (0.3048^3)*(peakflows(:,3)); % peakflow (m3/s)
peakflows(:,6)= ((0.3048^3)/W)*peakflows(:,3); % peakflow (m3/s/km2)
peakflows(:,7)= ((0.3048^3)/W)*(28800/1000)*peakflows(:,3); % peakflow runoff (mm/day)

% Adding hyrograph Metrics to peakflows Matrix with zeros for all
% hydrograph metric rows where hydrographs overlap. 

% Putting 1s in column 8 corresponding with all rows with peak flows to
% keep (the are not part of paired peak flows).   
for z=1:(size(finish_rows,1));
    if finish_rows(z,4) && finish_rows(z,7) ==1; 
    finish_rows(z,8)=1;
    else finish_rows(z,8) = 0;
    end;
end;

% Refinding Hydrograph_metrics and adding them to finish_rows array
for e=1:size(finish_rows,1);
    finish_rows(e,9)=900*trapz(time(start_rows(e):finish_rows(e),6)); % *900sec/row
end;

% length of rising limb (in hours)
finish_rows(:,10) = (peak_rows(:,1) - start_rows(:,1))/4; % if 15min/row then divide by 4rows per hour

%length of falling limb (in hours)
finish_rows(:,11) = (finish_rows(:,1) - peak_rows(:,1))/4;

% length of hydrograph (in hours)
finish_rows(:,12) = (finish_rows(:,1) - start_rows(:,1))/4;

% volume-to-peak ratio (??? ft^3 ./ ft^3/s)
finish_rows(:,13) = (finish_rows(:,9)./time(peak_rows(:,1),6));

% Hydrograph Recession Ratio: 
% (duration of the falling limb to the rising limb). (USGS Report)
finish_rows(:,14) = (finish_rows(:,11) ./ finish_rows(:,10));


% Filling out peakflows with hydrograph metrics (but only with single
% hydgrographs, the rest of the rows are given zeros)
for z=1:size(peakflows,1);
    if finish_rows(z,8)==1;
peakflows(z,8)=finish_rows(z,9); % volume under hydrograph (ft^3)
    else peakflows(z,8)=0;
    end;
    if finish_rows(z,8)==1;
peakflows(z,9)=finish_rows(z,10); % Length of rising limb (hours)
    else peakflows(z,9)=0;
    end;
    if finish_rows(z,8)==1;
peakflows(z,10)=finish_rows(z,11); % Length of falling limb (hours)
    else peakflows(z,10)=0;
    end;
    if finish_rows(z,8)==1;
peakflows(z,11)=finish_rows(z,12);  % Duration of Hydrograph (hours)
    else peakflows(z,11)=0;
    end;
    if finish_rows(z,8)==1;
peakflows(z,12)=finish_rows(z,13); % Volume-to-peak Ratio (m^3/m^3)
    else peakflows(z,12)=0;
    end;
    if finish_rows(z,8)==1;
peakflows(z,13)=finish_rows(z,14); % Hydrograph Recession Ratio (hours/hours)
    else peakflows(z,13)=0;
    end;
end;
   
for z=1:(size(peakflows,1));
    if peakflows(z,13)>1; % counts number of hydrograph metrics
    peakflows(z,14)=1;
    else peakflows(z,14)=0;
    end;
end;

peakflows_new_sum = sum(peakflows(:,14));
peakflows_new_percent = sum(peakflows(:,14))/size(peakflows(:,1),1);

%Mean Monthly Hydrograph_metrics:
[Q4,subs4]=ismember(Hydrograph_metrics(:,1:2),year_month(:,1:2),'rows'); %Establish logical that links 'year_month' to 'time'

year_month(:,24)=accumarray(subs4,Hydrograph_metrics(:,5),[size(year_month,1) 1],@mean); % mean monthly volume under hydrograph (m^3) * Specifying ,1 after year_month means rows 
year_month(:,25)=accumarray(subs4,Hydrograph_metrics(:,6),[size(year_month,1) 1],@mean); % mean monthly Volume-to-peak Ratio
year_month(:,26)=accumarray(subs4,Hydrograph_metrics(:,7),[size(year_month,1) 1],@mean); % mean monthly Length of rising limb
year_month(:,27)=accumarray(subs4,Hydrograph_metrics(:,8),[size(year_month,1) 1],@mean); % mean monthly Length of falling limb
year_month(:,28)=accumarray(subs4,Hydrograph_metrics(:,9),[size(year_month,1) 1],@mean); % mean monthly Duration of Hydrograph
year_month(:,29)=accumarray(subs4,Hydrograph_metrics(:,10),[size(year_month,1) 1],@mean); % mean monthly Hydrograph Recession Ratio



%%%% OVERALL METRICS (FOR ALL Flows)

time(:,19) = 1;
    % Overal Metrics (Units = m3/s)
    Overall_Metrics(:,1)=sum(time(:,19)); % sum of all flows in record
    Overall_Metrics(:,2)=((0.3048^3)/W)*mean(time(:,6)); % peakflow (m3/s)
    Overall_Metrics(:,3)=((0.3048^3)/W)*median(time(:,6)); % peakflow (m3/s)
    Overall_Metrics(:,4)=((0.3048^3)/W)*std(time(:,6));
    Overall_Metrics(:,5)=Overall_Metrics(:,4)./sqrt(Overall_Metrics(:,1)); % Standad Error
    Overall_Metrics(:,6)=Overall_Metrics(:,4)./Overall_Metrics(:,2); % Coefficient of variation(std/mean)
    Overall_Metrics(:,7)=((0.3048^3)/W)*min(time(:,6));
    Overall_Metrics(:,8)=((0.3048^3)/W)*max(time(:,6));
    Overall_Metrics(:,9)=((0.3048^3)/W)*mean(Baseflow(:,3)); % mean overall Baseflow
    Overall_Metrics(:,10)=((0.3048^3)/W)*median(Baseflow(:,3)); % median overall Baseflow
    
    % Overal Metrics (Units = Runoff = mm/day)
    Overall_Metrics(:,11)=((0.3048^3)/W)*(28800/1000)*mean(time(:,6)); % peakflow (Runoff mm/day)
    Overall_Metrics(:,12)=((0.3048^3)/W)*(28800/1000)*median(time(:,6)); % peakflow (Runoff mm/day)
    Overall_Metrics(:,13)=((0.3048^3)/W)*(28800/1000)*std(time(:,6));
    Overall_Metrics(:,14)=Overall_Metrics(:,13)./sqrt(Overall_Metrics(:,1)); % Standad Error
    Overall_Metrics(:,15)=Overall_Metrics(:,13)./Overall_Metrics(:,11); % Coefficient of variation(std/mean)
    Overall_Metrics(:,16)=((0.3048^3)/W)*(28800/1000)*min(time(:,6));
    Overall_Metrics(:,17)=((0.3048^3)/W)*(28800/1000)*max(time(:,6));
    Overall_Metrics(:,18)=((0.3048^3)/W)*(28800/1000)*mean(Baseflow(:,3)); % mean overall Baseflow
    Overall_Metrics(:,19)=((0.3048^3)/W)*(28800/1000)*median(Baseflow(:,3)); % median overall Baseflow
    
    
%%%% OVERALL METRICS (FOR PEAK FLOWS ONLY)

Overall_Peak_Metrics(:,1)=mean(peakflows(:,6)); % mean overall peakflow (m3/s/km2)
Overall_Peak_Metrics(:,2)=median(peakflows(:,6));
Overall_Peak_Metrics(:,3)=std(peakflows(:,6));
Overall_Peak_Metrics(:,8)=sum(peakflows(:,4)); % sum of all flows in record (Overall Frequency or # of Peak Flows)
Overall_Peak_Metrics(:,4)=Overall_Peak_Metrics(:,3)./sqrt(Overall_Peak_Metrics(:,8)); % Standad Error
Overall_Peak_Metrics(:,5)=Overall_Peak_Metrics(:,3)./Overall_Peak_Metrics(:,1); % Coefficient of variation(std/mean)
Overall_Peak_Metrics(:,6)=min(peakflows(:,6));
Overall_Peak_Metrics(:,7)=max(peakflows(:,6));

Overall_Peak_Metrics(:,9)=mean(peakflows(:,7)); % mean overall peak runoff (mm/day)
Overall_Peak_Metrics(:,10)=median(peakflows(:,7));
Overall_Peak_Metrics(:,11)=std(peakflows(:,7));
Overall_Peak_Metrics(:,12)=Overall_Peak_Metrics(:,11)./sqrt(Overall_Peak_Metrics(:,8)); % Standad Error
Overall_Peak_Metrics(:,13)=Overall_Peak_Metrics(:,11)./Overall_Peak_Metrics(:,9); % Coefficient of variation(std/mean)
Overall_Peak_Metrics(:,14)=min(peakflows(:,7));
Overall_Peak_Metrics(:,15)=max(peakflows(:,7));


%Overall Frequency of High Flow Events ( > 3* monthly median)
Overall_Peak_Metrics(:,16)=sum(time(:,18));

Overall_Peak_Metrics(:,17)=mean(Hydrograph_metrics(:,5)); % mean overall volume under hydrograph (ft^3)
Overall_Peak_Metrics(:,18)=mean(Hydrograph_metrics(:,6)); % mean overall Volume-to-peak Ratio)
Overall_Peak_Metrics(:,19)=mean(Hydrograph_metrics(:,7)); % mean overall Length of rising limb
Overall_Peak_Metrics(:,20)=mean(Hydrograph_metrics(:,8)); % mean overall Length of falling limb
Overall_Peak_Metrics(:,21)=mean(Hydrograph_metrics(:,9)); % mean overall Duration of Hydrograph
Overall_Peak_Metrics(:,22)=mean(Hydrograph_metrics(:,10)); % mean overall Hydrograph Recession Ratio


% Rise Rate & Fall Rate (Richter et al. 1996 (for daily streamflow data), Shuster et al. 2008). 
% D(t)=(Dmin+0.01)+exp(a+bt)

% Olden & Poff 2003 - Rise & Fall Rate for Daily Flow
% Rise Rate = Mean rate of positive changes in flow from one day to the next
% Fall Rate = Mean rate of negative changes in flow from one day to the next
% Sandborn & Bledso 2006 (using daily stream flow data)
% Rise Rate - mean of all positive differences
% Fall Rate - mean of all negative differences 


%%% Inserting two new columns "site (name)" and "Condition" at beginning of
%%% each output array.

year_month(year_month == 0) = NaN; % Converting all zero's to NaNs
peakflows(peakflows == 0) = NaN;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%% HERE IS THE START OF THE COMBINED RAIN & FOW SCRIPT %%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The following script is used to combine the flow and rainfall data: 
% 1) find the Lag-time time between Rainfall Centroid and peakflow
% 2) Runoff Ratio: Hydrograph volume/rainfall volume (or max 12-hr rainfall (mm) to max 12-hr Q (mm)). 


% this code associates the time with each associated peakflow
% columns 1-6 are the units of time (year, month, day, min, sec)
% column 7 is the peak flow value (cfs)
% Column 8 = hydrograph volume
timepeakflows=time(:,[1,2,3,4,5,6,8]);
nanRows2 = any(isnan(timepeakflows(:,7)), 2);
zeroRows2 = any(timepeakflows(:,7)==0, 2);
badRows2 = nanRows2 | zeroRows2;
timepeakflows(badRows2, :) = [];
timepeakflows(:,6)=0;  % need column 6 to be zeros for etime function to work
%timepeakflows(:,8)=Hydrograph_metrics(:,2); % Hydrograph volume
timepeakflows(:,8)=(0.3048^3)*peakflows(:,8); % Hydrograph volume (m^3)- peakflows (:,8) is in ft^3

% this code associates the time with each associated centroid
% columns 1-6 are the units of time (year, month, day, min, sec)
% column 7 is the centroid value (in) and column 8 is the total rain value
% for that rain event
timecentroid=rain(:,[1,2,3,4,5,6,12]);
nanRows3 = any(isnan(timecentroid(:,7)), 2);
zeroRows3 = any(timecentroid(:,7)==0, 2);
badRows3 = nanRows3 | zeroRows3;
timecentroid(badRows3, :) = [];
temp = rain(:,13);
temp(temp==0) = []; % this removes the zeros from and leaves non-zeros
timecentroid(:,8)= temp(:,1); % This is Total Rain amount

% Time Start Rain
timestartrain=rain(:,[1,2,3,4,5,6,8]); % the resulting time(:,7) has just 1s as place holder for start row
nanRows4 = any(isnan(timestartrain(:,7)), 2);
zeroRows4 = any(timestartrain(:,7)==0, 2);
badRows4 = nanRows4 | zeroRows4;
timestartrain(badRows4, :) = [];



% removing small rain events <= 0.04
%zeroRows4 = any(timecentroid(:,8)<=0.04, 2);
%timecentroid(zeroRows4, :) = [];

% Date number out of the dates
% Column 9 in each array gives the date number associated with each row. 
timepeakflows(:,9)=datenum(timepeakflows(:,[1:6]));
timecentroid(:,9)=datenum(timecentroid(:,[1:6]));

% finding time of centroid directy prior to peak event 
% Column 10 gives the dates for the centroid
for z=1:size(timepeakflows,1);
   temp=(timepeakflows(z,9)-timecentroid(:,9))>0; % gives you a vector of 1s and 0s, with the ones representing those cases where the peak flow date is greater than the centroid date, 0s correspond to the centroid dates occuring after the flow date
   temp=temp.*timecentroid(:,9); %gives a vector of centroid times > 0 and puts zeros for all other centroids 
   [~,K]=min(abs(timepeakflows(z,9)-temp)); % this indexes the row# for the time centroid directly before peak rain event
   timepeakflows(z,10)=timecentroid(K,9); % this gives the date-time value for the centroid
   timepeakflows(z,11)=K; % Column 11 gives row value for each centroid
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Removing the duplicate centroids associated with peakflows
% Only keep the nearest/closest centroid prior to 1 peakflow
% if another peakflow occurs without rain event will remove the peakflow
% Remove peakflow if it's centroid is more than 24hrs appart.  

%Finds the lag-time (response time) 
% column 12 = days
% Column 13 = hrs
timepeakflows(:,12)=timepeakflows(:,9)-timepeakflows(:,10); % lagtime (days)
timepeakflows(:,13)= 24*timepeakflows(:,12); % lagtime (hrs)

% This code puts zeros next to lag-times >12 hrs and 1s if <12hrs
for z=1:size(timepeakflows,1);
    if timepeakflows(z,13)<12 && timepeakflows(z,13)>0;
        timepeakflows(z,14)=1; % puts 1 next to peaks with lag-time < 12hrs
    else timepeakflows(z,14)=0;
    end;
end;

% puts lag time ammount in column 15 for rows where lag-time < 12hrs
for z=1:size(timepeakflows,1);
    if timepeakflows(z,14)>0;
        timepeakflows(z,15)=timepeakflows(z,13); % extracts the lag-time amount 
    else timepeakflows(z,15)=0;
    end;
end;


% Adding in total rainfall to column 16 of timepeakflows
% This takes total rainfall from column 8 of timecentroid based on the row
% values listed in column 11 of timepeakflow(from indexing with K above)
timepeakflows(:,16) = timecentroid(timepeakflows(:,11),8);


% finding total basin rainfall volume (m^3) (column 17)
% 1 in = 25.4 mm or 0.0254 m

timepeakflows(:,17) = W*1000*1000*0.0254*timepeakflows(:,16); % This is total basin rainfall volume (units of m^3)
%timecentroid(:,10) = W*1000*1000*0.0254*timecentroid(:,8); % This is just a double check


% Runoff Ratio Calculation: 
% 1) Hydrograph volume over rainfall amount (total rainfall*basin area)
% 2) runoff / total rainfall*basin area)

for z=1:size(timepeakflows,1);  %
    if timepeakflows(z,17)>0;
    timepeakflows(z,18)=timepeakflows(z,8)./timepeakflows(z,17); % Hydro_Vol (m^3)/ Total rainfal (m^3)
    else timepeakflows(z,18)=0; % zero values result because hydrographs with 2 peaks were removed.  
    end;
end;

% Removing events with runoff ratio greater than 1 (similar to Smith et
% al. 2013). 

for z=1:size(timepeakflows,1);
    if timepeakflows(z,18)<1;
    timepeakflows(z,19)= timepeakflows(z,18);
    else timepeakflows(z,19)=0;
    end;
end;

% Converting zeros to NaNs
timepeakflows(timepeakflows == 0) = NaN;

% making it so that will export 'NaN' and not just blank cells
%timepeakflows1 = num2cell(timepeakflows);
%timepeakflows1(isnan(timepeakflows1)) ={'NaN'};


%Putting the good lag-time and Runoff Ratio data into the peakflows array
peakflows(:,15)=timepeakflows(:,15); % Lag time 
peakflows(:,16)=timepeakflows(:,19); % Runoff Ratio
% Note there are more lag-time values than runoff ratio values b/c
% lag-times are calculated from centroid to peak, while runoff ratio
% involves the hydrograph volume and only isolated hydrographs (not
% overlaping hydgraphs) could be used for calculating hydgraph value.  Thus
% some hydrographs are missing from the runoff ratio.  While lag-time also
% has some missing rows due to lag-times > 12 hrs having to be removed sinc
% these are likely peaks not from the same rain event. 


% Extract Lag-time Output
Lag_Time=timepeakflows(:,[1,2,3,4,5,7,15,16]); %15 = lag time, 16 = total rainfal (in)
nanRows5 = any(isnan(Lag_Time(:,7)), 2);
zeroRows5 = any(Lag_Time(:,7)==0, 2);
badRows5 = nanRows5 | zeroRows5;
Lag_Time(badRows5, :) = [];
Lag_Time(:,9)=1;

% Extract Runoff Ratio Output
Runoff_Ratio=timepeakflows(:,[1,2,3,4,5,7,19]);
nanRows6 = any(isnan(Runoff_Ratio(:,7)), 2);
zeroRows6 = any(Runoff_Ratio(:,7)==0, 2);
badRows6 = nanRows6 | zeroRows6;
Runoff_Ratio(badRows6, :) = [];
Runoff_Ratio(:,8)=1;

%Other Precipitation Metrics:
% You'll have two types of precip events: ones that do trigger flows, and ones that don't

% Mean precip event that triggers a response
Mean_Precip = mean(Lag_Time(:,8));

% Min precip needed to induce a response
Min_Precip = min(Lag_Time(:,8));

% Monthly Metrics
[Q4,subs4]=ismember(Lag_Time(:,1:2),year_month(:,1:2),'rows'); %Establish logical that links 'year_month' to 'peakflows'
year_month(:,30)=accumarray(subs4,Lag_Time(:,7),[size(year_month,1) 1],@mean);

[Q5,subs5]=ismember(Runoff_Ratio(:,1:2),year_month(:,1:2),'rows'); %Establish logical that links 'year_month' to 'peakflows'
year_month(:,31)=accumarray(subs5,Runoff_Ratio(:,7),[size(year_month,1) 1],@mean);

% Overall_Precip_Metrics
Overall_Precip_Metrics(:,1)=mean(Lag_Time(:,7)); % Mean lagtime (hrs)
Overall_Precip_Metrics(:,2)=median(Lag_Time(:,7)); % median lagtime (hrs)
Overall_Precip_Metrics(:,3)=std(Lag_Time(:,7)); % stdev lagtime (hrs)
Overall_Precip_Metrics(:,4)=std(Lag_Time(:,7))./sqrt(sum(Lag_Time(:,9))); % stderror lagtime (hrs)
Overall_Precip_Metrics(:,5)=std(Lag_Time(:,7))./mean(Lag_Time(:,7)); % CV lagtime (hrs)
Overall_Precip_Metrics(:,6)=min(Lag_Time(:,7)); % Min lagtime (hrs)
Overall_Precip_Metrics(:,7)=max(Lag_Time(:,7)); % Max lagtime (hrs)


Overall_Precip_Metrics(:,8)=mean(Runoff_Ratio(:,7)); % Mean Runoff Ratio 
Overall_Precip_Metrics(:,9)=median(Runoff_Ratio(:,7)); % median Runoff Ratio  
Overall_Precip_Metrics(:,10)=std(Runoff_Ratio(:,7)); % stdev Runoff Ratio  
Overall_Precip_Metrics(:,11)=std(Runoff_Ratio(:,7))./sqrt(sum(Runoff_Ratio(:,8))); % stderror Runoff Ratio  
Overall_Precip_Metrics(:,12)=std(Runoff_Ratio(:,7))./mean(Runoff_Ratio(:,7)); % CV Runoff Ratio 
Overall_Precip_Metrics(:,13)=min(Runoff_Ratio(:,7)); % Min Runoff Ratio 
Overall_Precip_Metrics(:,14)=max(Runoff_Ratio(:,7)); % Max Runoff Ratio 

Overall_Precip_Metrics(:,15)=Mean_Precip; %  Mean precip needed to induce a response 
Overall_Precip_Metrics(:,16)=Min_Precip; % Min precip needed to induce a response

% converting all zeros to NaNs
year_month(year_month == 0) = NaN;
peakflows(peakflows == 0) = NaN;
Overall_Metrics(Overall_Metrics == 0) = NaN;
Overall_Peak_Metrics(Overall_Peak_Metrics == 0) = NaN;
Overall_Precip_Metrics(Overall_Precip_Metrics == 0) = NaN;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%create new array for year_month
site = repmat(NAME,size(year_month,1),1);
site = cellstr(site); % converts char array to cell array
year = repmat(YEAR1,size(year_month,1),1);
year = num2cell(year); % use cellstr if char array, use num2cell if double array (with numbers)
year_month_temp = num2cell(year_month);
year_month_temp(isnan(year_month)) ={'NaN'};
year_month1 = [site year year_month_temp];  % concatenate two matrices vertically

%create new array for peakflows
site2 = repmat(NAME,size(peakflows,1),1);
site2 = cellstr(site2); % converts char array to cell array
year2 = repmat(YEAR1,size(peakflows,1),1);
year2 = num2cell(year2); % converts char array to cell array
peak_temp = num2cell(peakflows);
peak_temp(isnan(peakflows)) ={'NaN'};
peakflows1 = [site2 year2 peak_temp];  % concatenate two matrices vertically

%%%create new array for timepeakflows
site6 = repmat(NAME,size(timepeakflows,1),1);
site6 = cellstr(site6); % converts char array to cell array
year6 = repmat(YEAR1,size(timepeakflows,1),1);
year6 = num2cell(year6); % converts char array to cell array
timepeak_temp = num2cell(timepeakflows);
timepeak_temp(isnan(timepeakflows)) ={'NaN'};
timepeakflows1 = [site6 year6 timepeak_temp];  % concatenate two matrices vertically

%%%create new array for Overall_Metrics
site3 = repmat(NAME,1,1);
site3 = cellstr(site3); % converts char array to cell array
year3 = repmat(YEAR1,1,1);
year3 = num2cell(year3); % converts char array to cell array
Overall_Metrics_temp = num2cell(Overall_Metrics);
Overall_Metrics1 = [site3 year3 Overall_Metrics_temp];  % concatenate two matrices vertically

%%%create new array for Overall_Peak_Metrics
site4 = repmat(NAME,1,1);
site4 = cellstr(site4); % converts char array to cell array
year4 = repmat(YEAR1,1,1);
year4 = num2cell(year4); % converts char array to cell array
Overall_Peak_Metrics_temp = num2cell(Overall_Peak_Metrics);
Overall_Peak_Metrics1 = [site4 year4 Overall_Peak_Metrics_temp];  % concatenate two matrices vertically

%%%create new array for Overall_Precip_Metrics
site5 = repmat(NAME,1,1);
site5 = cellstr(site5); % converts char array to cell array
year5 = repmat(YEAR1,1,1);
year5 = num2cell(year5); % converts char array to cell array
Overall_Precip_Metrics_temp = num2cell(Overall_Precip_Metrics);
Overall_Precip_Metrics1 = [site5 year5 Overall_Precip_Metrics_temp];  % concatenate two matrices vertically


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Exporting all Monthly Data
% headers = {'site','year','year','month','mean.monthly.baseflow.basin','median.monthly.baseflow.basin',... % 1-4
%     'mean.monthly.peak','median.monthly.peak','mean.monthly.peak.basin',... %5-7      
%     'median.monthly.peak.basin','mean.monthly.peak.runoff','median.monthly.peak.runoff',... %8-10
%     'std.monthly.peak.basin','stderror.monthly.peak.basin','std.monthly.peak.runoff',...%11-13
%     'stderror.monthly.peak.runoff','cv.monthly.peak.basin','cv.monthly.peak.runoff',...%14-16
%     'min.monthly.peak.basin','max.monthly.peak.basin','min.monthly.peak.runoff',...%17-19
%     'max.monthly.peak.runoff','freq.monthly.peaks','median.monthly.realtime',...%20-22
%     'freq.monthly.peak.3.median','mean.monthly.volume','mean.monthly.vol2peak',...%23-25
%     'mean.monthly.length.rise','mean.monthly.length.fall','mean.monthly.length.hydro',...%26-28
%     'mean.monthly.recession.ratio','mean.monthly.lagtime','mean.monthly.Runoff.Ratio'};%29-31
% 
% % *****For Windows Users need to switch this from xlwrite to xlswrite
% xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),headers,'MonthlyPeakflow','A1');
% xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),year_month1,'MonthlyPeakflow',(strcat('A', num2str(k)+1)));

%%%%% Export All Peak Flow & Associated Precip Data ('peakflows')
% headers4 = {'site','year','year','month','peakflows.cfs','ones','peakflows.m3.s',... %1-5
%     'peakflows.m3.s.km2','peakflows.runoff','hydro.vol','length.rise',... %6-9
%     'length.fall','length.hydro','vol2peak.ratio','recession.ratio','ones','lagtime.hrs','Runoff.Ratio'};  %10-14
% 
% xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),headers4,'Peakflow','A1');
% xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),peakflows1,'Peakflow',(strcat('A', num2str(k)+1)));

%%% Export timepeakflows
% headers = {'site','year','year','month','day','hour','min','sec',...
%     'peakflow','hydro.volume','datenumber','timecentroid','centroid.row',...
%     'lagtime.days','lagtime.hrs.old','ones','lagtime.hrs','total.rainfal.in',...
%     'total.rainfall.m3','runoff.ratio.old','runoff.ratio'};
% 
% xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),headers,'Rain_Peakflow','A1');
% xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),timepeakflows1,'Rain_Peakflow',(strcat('A', num2str(k)+1)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Export Overall_Metrics (including all flow)
headers2 = {'site','year','sum.flow.events','mean.flow.basin','median.flow.basin','std.flow.basin',...
    'stderr.flow.basin','cv.flow.basin','min.flow.basin','max.flow.basin','mean.baseflow.basin',...
    'median.baseflow.basin','mean.runoff','median.runoff','std.runoff','stderror.runoff'...
    'cv.runoff','min.runoff','max.runoff','mean.baserunoff','median.baserunoff'};

xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),headers2,'OverallFlow','A1');
xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),Overall_Metrics1,'OverallFlow',(strcat('A', num2str(k)+1)));

%%%%% Export Overall_Peak_Metrics (including just peak flows)
headers3 = {'site','year','mean.peak.basin','median.peak.basin','std.peak.basin',...
    'stderr.peak.basin','cv.peak.basin','min.peak.basin','max.peak.basin','number.peaks',...
    'mean.peak.runoff','median.peak.runoff','std.peak.runoff','stderr.peak.runoff',...
    'cv.peak.runoff','min.peak.runoff','max.peak.runoff','freq.peaks.3.median','mean.vol',...
    'mean.vol2peak.ratio','mean.length.rise','mean.length.fall','mean.length.hydro',...
    'mean.recession.ratio'};

xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),headers3,'OverallPeakFlow','A1');
xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),Overall_Peak_Metrics1,'OverallPeakFlow',(strcat('A', num2str(k)+1)));
 
%%%%% Export Overall_Precip_Metrics
headers = {'site','year','mean.lagtime.hrs','median.lagtime.hrs','std.lagtime.hrs',...
    'stderr.lagtime.hrs','cv.lagtime.hrs','min.lagtime.hrs','max.lagtime.hrs',...
    'mean.runoff.ratio','median.runoff.ratio','std.runoff.ratio','stderr.runoff.ratio'...
    'cv.runoff.ratio','min.runoff.ratio','max.runoff.ratio','mean.precip.before','min.precip.before'};

xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),headers,'OverallPrecipMetrics','A1');
xlswrite(strcat('Flashiness_15m', num2str(YEAR1)),Overall_Precip_Metrics1,'OverallPrecipMetrics',(strcat('A', num2str(k)+1)));

end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Export Main Output Metrics
% headers = {'site','sum.flow.events','mean.flow.basin','median.flow.basin',...
%     'stderr.flow.basin','cv.flow.basin','min.flow.basin','max.flow.basin','mean.baseflow.basin',...
%     'median.baseflow.basin','mean.runoff','median.runoff','std.runoff','stderror.runoff'...
%     'cv.runoff','min.runoff','max.runoff','mean.baserunoff','median.baserunoff'...
%     'mean.peak.basin','median.peak.basin','std.peak.basin'...
%     
%     'stderr.peak.basin','cv.peak.basin','min.peak.basin','max.peak.basin','number.peaks',...
%     'mean.peak.runoff','median.peak.runoff','std.peak.runoff','stderr.peak.runoff',...
%     'cv.peak.runoff','min.peak.runoff','max.peak.runoff','freq.peaks.3.median','mean.vol',...
%     'mean.vol2peak.ratio','mean.length.rise','mean.length.fall','mean.length.hydro',...
%     'mean.recession.ratio'...
%     
%     'mean.lagtime.hrs','median.lagtime.hrs','std.lagtime.hrs',...
%     'stderr.lagtime.hrs','cv.lagtime.hrs','min.lagtime.hrs','max.lagtime.hrs',...
%     'mean.runoff.ratio','median.runoff.ratio','std.runoff.ratio','stderr.runoff.ratio'...
%     'cv.runoff.ratio','min.runoff.ratio','max.runoff.ratio','mean.precip.before','min.precip.before'};
% 



