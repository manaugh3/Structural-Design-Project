%Truss Analysis for the bridge

%First let's determine the reaction forces at 1 and 5
syms r1 r5 
P = 1
L = 30

%We are going to solve the reaction forces at node 1 and 5 respectively
eqn1 = r1 + r5 - P == 0  %sigma Fy is 0
eqn2 = - 2*L*P + 4*L*r5 == 0 %Sigma M at node 1 is 0

sol = solve([eqn1,eqn2],[r1,r5]); %Solve the equation

R1 = double(sol.r1) %Store the reaction force at node 1
R5 = double(sol.r5) %Store the reaction force at node 5


%Now we are going to solve for Joint 1

%Memeber 37 is a zero force member so F37 is 0 k
theta = 45 %because width is L and height is also L

syms f12 f16 f26 f23 f63 f67 f34 f38 f37 f78 f48 f45 f85
eqn1 = f12 + f16*cos(theta) == 0
eqn2 = f16*sin(theta)+R1 == 0
eqn3 = -f12+f23 ==0
eqn4 = f26 == 0
eqn5 = -f16*cos(theta)+f67+f63*cos(theta) == 0
eqn6 = -f16*sin(theta)-f26-f63*sin(theta) == 0
eqn7 = -f67+f78 == 0
eqn8 = f37 == 0
eqn9 = -f23-f63*cos(theta)+f38*cos(theta)+f34 == 0
eqn10 = f63*sin(theta) + f37 + f38*sin(theta) == P
eqn11 = -f45-f85*cos(theta) == 0
eqn12 = f85*sin(theta) == -R5
eqn13 = f48 == 0

sol = solve([eqn1,eqn2,eqn3,eqn4,eqn5,eqn6,eqn7,eqn8,eqn9,eqn10,eqn11,eqn12,eqn13],[f12, f16, f26, f23, f63, f67, f34, f38, f37, f78, f48, f45, f85]); %Solve the equation

F12 = double(sol.f12)
F16 = double(sol.f16)
F26 = double(sol.f26)
F23 = double(sol.f23)
F63 = double(sol.f63)
F67 = double(sol.f67)
F34 = double(sol.f34)
F38 = double(sol.f38)
F37 = double(sol.f37)
F78 = double(sol.f78)
F48 = double(sol.f48)
F45 = double(sol.f45)
F85 = double(sol.f85)
