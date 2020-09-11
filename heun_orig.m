function [T Y]=heun_orig(f,a,b,ya,N) 
% Entradas 
% - a y b son los extremos del intervalo de integraci�n 
% - ya es la condici�n inicial y(a) 
% - N es el n�mero de pasos 
% Salida 
% - T es el vector de las abscisas e Y el 
% vector de la soluci�n aproximada. 
h=(b-a)/N; 
T=zeros(N+1,1); 
Y=zeros(N+1,1); 
T(1)=a; 
Y(1)=ya; 
for j=1:N 
  T(j+1)=T(j)+h;
  K1=h*f(T(j),Y(j)); 
  K2=h*f(T(j+1),Y(j)+K1); 
  Y(j+1)=Y(j)+(K1+K2)/2; 
end 