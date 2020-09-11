ax = loglog(H, GE_RK, H, GE_HE);
xlabel ("Valor H del paso");
ylabel ("Error Global Absoluto en Y(T = 5)");

% NO ENTIENDO LA SEGUNDA PARTE DE ESTE PUNTO TAMI, HELP

% B = []; C = [];
%for i=1:length(H)
%  B = [B; (log(GE_RK(i)+H(i))-log(GE_RK(i)))/H(i)];
%  C = [C; (log(GE_HE(i)+H(i))-log(GE_HE(i)))/H(i)];
% end
%
% plot(transpose(H), B, transpose(H), C)
%
%