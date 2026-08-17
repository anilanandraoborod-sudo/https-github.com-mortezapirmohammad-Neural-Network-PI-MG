%%  in the name of god
%-- Morteza pirmohammad

clc;


 global C  L R  Ts Kvdp Kvqp Kvdi Kvqi Kidp1 Kidi1 Kiqp1 Kiqi1 Kidp2 Kidi2 Kiqp2 Kiqi2  Vd_ref Vq_ref
 global   Rf Lf  RL  Ll   Rl Cf Lt Rt Kvdd Kidd1 Kvqd Kiqd1 Kidd2 Kiqd2


 %% parameters
R=4.33;
Cf=22e-6;
Rf= 40e-3;% filter resistance
Lf = 4e-3;% filter inductance
RL=0.1; %%Transmission line resistance
Ll= 31e-6; %%Transmission line inductance
L= 100e-3;
C= 1e-12;
Rl = 0.1;
Rt= Rf +RL; 
Lt = Lf + Ll;
%controller parameters
Ts= 0.50e-5;

Kvdp =10;%10
Kvdi = 40;%40
Kvdd = 0;
Kidp1 =  5 ;%5
Kidi1 = 20 ;%20
Kidd1 = 0;

Kvqp =10;%10
Kvqi = 40;%40
Kvqd= 0;
Kiqp1 = 5;%2%5
Kiqi1 =20 ;%5%20
Kiqd1 = 0;

 
Kidp2 = 5; %2%5
Kidi2 =20; %5%20
Kidd2 = 0;
Kiqp2 =5; %2%5
Kiqi2 =20; %5%20
Kiqd2 = 0;

 Vd_ref=311.1;
 Vq_ref=0;
%% NN codes
% 

%---controller 1 (Vd---Id)

% input1=[vd';Id';intd1';intd2'];
% ed=Vd_ref-vd';
% u1=(Kvdp*ed)+(Kvdi*intd1');
% ed1=u1-Id';
% ud=(Kidp1*ed1)+(Kidi1*intd2');

%---controller 2 (Vq---Iq)

% input2=[vq';Iq';intq1';intq2'];
% eq=Vq_ref-vq';
% uq1=(Kvqp*eq)+(Kvqi*intq1');
% eq1=uq1-Iq';
% uq=(Kiqp1*eq1)+(Kiqi1*intq2');

%-----------controller 1 (Vd---Id) type2
% input1=[vd';Id'];
% ed=Vd_ref-vd';
% u1=(Kvdp*ed)+(Kvdi*integrator(ed));
% ed1=u1-Id';
% ud=(Kidp1*ed1)+(Kidi1*integrator(ed1));

%----------- controller 2 (Vq---Iq) type2
% input2=[vq';Iq'];
% eq=Vq_ref-vq';
% uq1=(Kvqp*eq)+(Kvqi*integrator(eq));
% eq1=uq1-Iq';
% uq=(Kiqp1*eq1)+(Kiqi1*integrator(eq1));
% output1=ud;
% output2=uq;


%--------
input1=[ed';vd';Id'];
output1=Ud';

input2=[eq';vq';Iq'];
output2=Uq';



%-------
% input1=[ed';vd';Id'];
% u1=(Kvdp.*ed')+(Kvdi.*integrator(ed'));
% ed1=u1-Id';
% ud=(Kidp1.*ed1)+(Kidi1.*integrator(ed1));
% output1=ud;
% 
% input2=[eq';vq';Iq'];
% uq1=(Kvqp.*eq')+(Kvqi.*integrator(eq'));
% eq1=uq1-Iq';
% uq=(Kiqp1.*eq1)+(Kiqi1.*integrator(eq1));
% output2=uq;

%  set_param(0,'GlobalUseClassicAccelMode','on');
%  set_param('Battery_SC_PI_NN','AccelVerboseBuild','on');
