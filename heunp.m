function [T Y]=heunp(f,a,b,ya,N,P) 
% Entradas 
% - a y b son los extremos del intervalo de integración 
% - ya es la condición inicial y(a) 
% - N es el número de pasos 
% Salida 
% - T es el vector de las abscisas e Y el 
% vector de la solución aproximada. 
h=(b-a)/N; 
T=zeros(N+1,1); 
Y=zeros(N+1,length(ya)); 
T(1)=a; 
Y(1,:)=ya; 
for j=1:N 
  T(j+1)=T(j)+h;
  K1=h*f(T(j),Y(j,:),P); 
  K2=h*f(T(j+1),Y(j,:)+K1,P); 
  Y(j+1,:)=Y(j,:)+(K1+K2)/2; 
end