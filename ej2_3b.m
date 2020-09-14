brus = @(t,X,P) [ 1-(P(2)+1)*X(1)+P(1)*(X(1)^2)*X(2) , P(2)*X(1) - P(1)*(X(1)^2).*X(2)  ];

curr = [0,0];
step = 1; a = 1; b = 2.5;
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