%Three bus example for DC Optimal Power Flow (DC OPF)
clear all;
clc;

% Network Y-bus matrix
Y = [1/0.5i+1/0.2i -1/0.5i -1/0.2i;
    -1/0.5i 1/0.5i+1/0.4i -1/0.4i;
    -1/0.2i -1/0.4i 1/0.2i+1/0.4i];

% Generation constraints in per-unit
PGl = [0; 0; 0];
PGu = [1; 1; 0];

% Bounds on voltage angle
thetal = -ones(3,1);
thetau = ones(3,1);

% Quadatric generation cost coefficients
CQ = [1; 1; 0];
CL = [1; 1; 0];

%Line constraints
PF = [1 1 1];

% Slack bus
slack=1;

% Load
PD = [0;0.3;0.4];

%Optimize
dcopf=DCOPF_2(Y,PGl,PGu,PD,thetal,thetau,CQ,CL,PF,slack);

%Parse results
dcopf.PF_opt
dcopf.Cost
dcopf.P_opt
dcopf.theta_opt
dcopf.LMP_opt

