%Truss analysis by matrix analysis

%Identify given variables
P = 12 %k
L = 30 %feet
A = 31.1 %inch
E = 29000 %ksi
theta = 45 %degrees
%Member lengths

L_hv = L %horizontal/vertical member

L_d = L/sind(theta) %diagonal member


%Assemble truss element K - matrices
%member number followed by near end (y,x) and far end (y,x)

%member 12 N: 16  15  F: 2  1
lam_x=L/L_hv
lam_y=0
k12 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 16 N: 16  15  F: 8  7
lam_x= L/L_d
lam_y = L/L_d
k16 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 26 N: 2  1  F: 8  7
lam_x = 0
lam_y = L/L_hv
k26 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 23 N: 2  1  F: 4  3
lam_x = L/L_hv
lam_y = 0
k23 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 36 N: 8  7  F: 4  3
lam_x = L/L_d
lam_y = -L/L_d
k36 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 37 N: 4  3  F: 10  9
lam_x = 0
lam_y = L/L_hv
k37 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 38 N: 4  3  F: 12  11
lam_x = L/L_d
lam_y = L/L_d
k38 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 34 N: 4  3  F: 6  5
lam_x = L/L_hv
lam_y = 0
k34 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 48 N: 6  5  F: 12  11
lam_x = 0
lam_y = L/L_hv
k48 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 45 N: 6  5  F: 14  13
lam_x = L/L_hv
lam_y = 0
k45 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 58 N: 12  11  F: 14  13
lam_x= L/L_d
lam_y= -L/L_d
k58 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 67 N: 8  7  F: 10  9
lam_x = L/L_hv
lam_y = 0
k67 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]

%member 78 N: 10  9  F: 12  11
lam_x = L/L_hv
lam_y = 0
k78 = [lam_x^2,lam_x*lam_y,-lam_x^2,-lam_x*lam_y;lam_x*lam_y,lam_y^2,-lam_x*lam_y,-lam_y^2;-lam_x^2,-lam_x*lam_y,lam_x^2,lam_x*lam_y;-lam_x*lam_y,-lam_y^2,lam_x*lam_y,lam_y^2]


%Assemble global stiffness matrix

%initialize global matrix
N=16; %degrees of freedom
K=zeros(N,N); %initialization

%Add k-matrix into the 16 x 16 matrix

%member 12 N: 16  15  F: 2  1
K([16 15 2 1],[16 15 2 1]) = K([16 15 2 1],[16 15 2 1])+k12;

%member 16 N: 16  15  F: 8  7
K([16 15 8 7],[16 15 8 7]) = K([16 15 8 7],[16 15 8 7])+k16;

%member 26 N: 2  1  F: 8  7
K([2 1 8 7],[2 1 8 7]) = K([2 1 8 7],[2 1 8 7])+k26;

%member 23 N: 2  1  F: 4  3
K([2 1 4 3],[2 1 4 3]) = K([2 1 4 3],[2 1 4 3])+k23;

%member 36 N: 8  7  F: 4  3
K([8 7 4 3],[8 7 4 3]) = K([8 7 4 3],[8 7 4 3])+k36;

%member 37 N: 4  3  F: 10  9
K([4 3 10 9],[4 3 10 9]) = K([4 3 10 9],[4 3 10 9])+k37;

%member 38 N: 4  3  F: 12  11
K([4 3 12 11],[4 3 12 11]) = K([4 3 12 11],[4 3 12 11])+k38;

%member 34 N: 4  3  F: 6  5
K([4 3 6 5],[4 3 6 5]) = K([4 3 6 5],[4 3 6 5])+k34;

%member 48 N: 6  5  F: 12  11
K([6 5 12 11],[6 5 12 11]) = K([6 5 12 11],[6 5 12 11])+k48;

%member 45 N: 6  5  F: 14  13
K([6 5 14 13],[6 5 14 13]) = K([6 5 14 13],[6 5 14 13])+k45;

%member 58 N: 12  11  F: 14  13
K([12 11 14 13],[12 11 14 13]) = K([12 11 14 13],[12 11 14 13])+k58;

%member 67 N: 8  7  F: 10  9
K([8 7 10 9],[8 7 10 9]) = K([8 7 10 9],[8 7 10 9])+k67;

%member 78 N: 10  9  F: 12  11
K([10 9 12 11],[10 9 12 11]) = K([10 9 12 11],[10 9 12 11])+k78;

%Assemble the known and unknown external load and displacement vectors

%known external force vector (1 through 13)
Qk = [0;-12;0;-12;0;-12;0;0;0;0;0;0;0]

%solve for unknown displacements
Du = (1/(A*E))*K([1:13],[1:13])^-1*Qk

%known displacements
Dk = [0;0;0]

%unknown forces
Qu = A*E*K([14:16],[1:13])*Du

%member forces
%member 12
%lam_x=L/L1
%lam_y=0
%q=A*E/L1*[1 -1;-1 1]*[lam_x lam_y 0 0;0 0 lam_x lam_y]*[0;0;Du([1],[1]);Du([2],[1])]
%q
