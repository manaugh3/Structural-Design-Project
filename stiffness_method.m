%Truss Analysis for the bridge

%First let's determine the reaction forces at 1 and 5
syms r1 r5 
P = 12
L = 30

%We are going to solve the reaction forces at node 1 and 5 respectively
eqn1 = r1 + r5 - 3*P == 0  %sigma Fy is 0
eqn2 = -L*P - 2*L*P - 3*L*P + 4*L*r5 == 0 %Sigma M at node 1 is 0

sol = solve([eqn1,eqn2],[r1,r5]); %Solve the equation

R1 = double(sol.r1) %Store the reaction force at node 1
R5 = double(sol.r5) %Store the reaction force at node 5


%Now we are going to solve for Joint 1

%Memeber 37 is a zero force member so F37 is 0 k
theta = 45 %because width is L and height is also L

%Joint 1 
F16 = -R1/sin(theta) %compression
F12 = -F16*cos(theta) %Tension

%Joint 2
syms f12 f23 
P = 12
L = 30

%We are going to solve the reaction forces at node 1 and 5 respectively
F23 = F12 %Tension
F26 = 12 %Tension


%Joint 5
F58 = -R5/sin(theta) %Compression
F54 = -F58*cos(theta) %Tension

%Joint 4
F48 = 12
F34 = F54

%Joint 3
F37 = 0
syms F36 F38
eqn1 = F23+F36*cos(theta) == F38*cos(theta) + F34
eqn2 = F36*sin(theta) + F37 + F38*sin(theta) == 12
sol = solve([eqn1,eqn2],[F36,F38]); %Solve the equation

F36 = double(sol.F36) %Store as F36
F38 = double(sol.F38) %Store as F38


%Joint 6
F67 = F16*cos(theta)- F36*cos(theta) 

%Joint 7
F78 = F67 %because member 37 is zero force member

%Joint 8
F48 = -sin(theta) * (F38+F58)








