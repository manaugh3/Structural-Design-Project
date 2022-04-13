%Truss Analysis for the bridge
%%%%%%%%%%%%%%%%%%%%%%%REAL METHOD%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%First let's determine the reaction forces at 1 and 5
syms Rr1 Rr5 
RP = 12
RL = 30

%We are going to solve the reaction forces at node 1 and 5 respectively
eqn1 = Rr1 + Rr5 - 3*RP == 0  %sigma Fy is 0
eqn2 = -RL*RP - 2*RL*RP - 3*RL*RP + 4*RL*Rr5 == 0 %Sigma M at node 1 is 0

sol = solve([eqn1,eqn2],[Rr1,Rr5]); %Solve the equation

RR1 = double(sol.Rr1) %Store the reaction force at node 1
RR5 = double(sol.Rr5) %Store the reaction force at node 5


%Now we are going to solve for Joint 1

%Memeber 37 is a zero force member so F37 is 0 k
Rtheta = 45 %because width is L and height is also L

syms Rf12 Rf16 Rf26 Rf23 Rf63 Rf67 Rf34 Rf38 Rf37 Rf78 Rf48 Rf45 Rf85
eqn1 = Rf12 + Rf16*cos(Rtheta) == 0
eqn2 = Rf16*sin(Rtheta)+RR1 == 0
eqn3 = -Rf12+Rf23 ==0
eqn4 = Rf26 == RP
eqn5 = -Rf16*cos(Rtheta)+Rf67+Rf63*cos(Rtheta) == 0
eqn6 = -Rf16*sin(Rtheta)-Rf26-Rf63*sin(Rtheta) == 0
eqn7 = -Rf67+Rf78 == 0
eqn8 = Rf37 == 0
eqn9 = -Rf23-Rf63*cos(Rtheta)+Rf38*cos(Rtheta)+Rf34 == 0
eqn10 = Rf63*sin(Rtheta) + Rf37 + Rf38*sin(Rtheta) == RP
eqn11 = -Rf45-Rf85*cos(Rtheta) == 0
eqn12 = Rf85*sin(Rtheta) == -RR5
eqn13 = Rf48-RP == 0

sol = solve([eqn1,eqn2,eqn3,eqn4,eqn5,eqn6,eqn7,eqn8,eqn9,eqn10,eqn11,eqn12,eqn13],[Rf12, Rf16, Rf26, Rf23, Rf63, Rf67, Rf34, Rf38, Rf37, Rf78, Rf48, Rf45, Rf85]); %Solve the equation

RF12 = double(sol.Rf12)
RF16 = double(sol.Rf16)
RF26 = double(sol.Rf26)
RF23 = double(sol.Rf23)
RF63 = double(sol.Rf63)
RF67 = double(sol.Rf67)
RF34 = double(sol.Rf34)
RF38 = double(sol.Rf38)
RF37 = double(sol.Rf37)
RF78 = double(sol.Rf78)
RF48 = double(sol.Rf48)
RF45 = double(sol.Rf45)
RF85 = double(sol.Rf85)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%VIRTUAL METHOD%%%%%%%%%%%%%%%%%%%%%%
%Truss Analysis for the bridge

%First let's determine the reaction forces at 1 and 5
syms Vr1 Vr5 
VP = 1
VL = 30

%We are going to solve the reaction forces at node 1 and 5 respectively
eqn1 = Vr1 + Vr5 - VP == 0  %sigma Fy is 0
eqn2 = - 2*VL*VP + 4*VL*Vr5 == 0 %Sigma M at node 1 is 0

sol = solve([eqn1,eqn2],[Vr1,Vr5]); %Solve the equation

VR1 = double(sol.Vr1) %Store the reaction force at node 1
VR5 = double(sol.Vr5) %Store the reaction force at node 5


%Now we are going to solve for Joint 1

%Memeber 37 is a zero force member so F37 is 0 k
theta = 45 %because width is L and height is also L

syms Vf12 Vf16 Vf26 Vf23 Vf63 Vf67 Vf34 Vf38 Vf37 Vf78 Vf48 Vf45 Vf85
eqn1 = Vf12 + Vf16*cos(theta) == 0
eqn2 = Vf16*sin(theta)+VR1 == 0
eqn3 = -Vf12+Vf23 ==0
eqn4 = Vf26 == 0
eqn5 = -Vf16*cos(theta)+Vf67+Vf63*cos(theta) == 0
eqn6 = -Vf16*sin(theta)-Vf26-Vf63*sin(theta) == 0
eqn7 = -Vf67+Vf78 == 0
eqn8 = Vf37 == 0
eqn9 = -Vf23-Vf63*cos(theta)+Vf38*cos(theta)+Vf34 == 0
eqn10 = Vf63*sin(theta) + Vf37 + Vf38*sin(theta) == VP
eqn11 = -Vf45-Vf85*cos(theta) == 0
eqn12 = Vf85*sin(theta) == -VR5
eqn13 = Vf48 == 0

sol = solve([eqn1,eqn2,eqn3,eqn4,eqn5,eqn6,eqn7,eqn8,eqn9,eqn10,eqn11,eqn12,eqn13],[Vf12, Vf16, Vf26, Vf23, Vf63, Vf67, Vf34, Vf38, Vf37, Vf78, Vf48, Vf45, Vf85]); %Solve the equation

VF12 = double(sol.Vf12)
VF16 = double(sol.Vf16)
VF26 = double(sol.Vf26)
VF23 = double(sol.Vf23)
VF63 = double(sol.Vf63)
VF67 = double(sol.Vf67)
VF34 = double(sol.Vf34)
VF38 = double(sol.Vf38)
VF37 = double(sol.Vf37)
VF78 = double(sol.Vf78)
VF48 = double(sol.Vf48)
VF45 = double(sol.Vf45)
VF85 = double(sol.Vf85)

L = VL*12
mem12 = VF12*RF12*L
mem16 = VF16*RF16*(L/sin(theta))
mem26 = VF26*RF26*L
mem23 = VF23*RF23*L
mem63 = VF63*RF63*(L/sin(theta))
mem37 = VF37*RF37*L
mem38 = VF38*RF38*(L/sin(theta))
mem34 = VF34*RF34*L
mem48 = VF48*RF48*L
mem45 = VF45*RF45*L
mem85 = VF85*RF85*(L/sin(theta))
mem67 = VF67*RF67*L
mem78 = VF78*RF78*L

sum = mem12 + mem16 + mem26 + mem23 + mem63 
+ mem37 + + mem38 + + mem34 + + mem48 + + mem45
+ + mem85 + + mem67 + + mem78

E = 29000 %ksi
Area = 31.1 %inch squared

deflection = (sum/(E*Area))
deflection %inches 


