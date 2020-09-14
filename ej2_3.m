brus = @(t,X,P) [ 1-(P(2)+1)*X(1)+P(1)*(X(1)^2)*X(2) , P(2)*X(1) - P(1)*(X(1)^2).*X(2)  ];

x_0 = 0;
x_f = 100;
step = 0.01;
M = x_f/step;
C = [ 1.001,1.001; 2,2; 5,4; 3,4; 0.5,0.6; 5,1.5];

a = 1; b = 2.5;

%[T0 Y0] = rk4p(brus, x_0, x_f,C(1,:), M, [a,b]);
%[T1 Y1] = rk4p(brus, x_0, x_f,C(2,:), M, [a,b]);
%[T2 Y2] = rk4p(brus, x_0, x_f,C(3,:), M, [a,b]);
%[T3 Y3] = rk4p(brus, x_0, x_f,C(4,:), M, [a,b]);
%[T4 Y4] = rk4p(brus, x_0, x_f,C(5,:), M, [a,b]);
%[T5 Y5] = rk4p(brus, x_0, x_f,C(6,:), M, [a,b]);

% ploteo de la solución a lo largo del tiempo
% plot(T0, Y0, 'g');

% ploteo de las 6 superposiciones
%plot( Y0(:,1), Y0(:,2), "--g;Y0;",
%      Y1(:,1), Y1(:,2), "--b;Y1;",
%      Y2(:,1), Y2(:,2), "--r;Y2;",
%      Y3(:,1), Y3(:,2), "--k;Y3;",
%      Y4(:,1), Y4(:,2), "--m;Y4;",
%      Y5(:,1), Y5(:,2), "--c;Y5;")

curr = [0,0];
step = 1;
a = 1; b = 2.5;
finished = false;
while (finished == false) 

M = x_f/step;

[T Y] = rk4p(brus, x_0, x_f,[ 2.001,2.001], M, [a,b]);

if abs(Y(end, :) - curr(1, :) ) < [0.001, 0.001]
  finished = true;
  printf("El valor de H anterior fue: %d, y el de H/2: %d\n", 2*step,step);
end  
curr = Y(end, :);
step = step/2;  
endwhile
