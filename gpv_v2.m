%Gonzalo Ballestero Septiembre-2020
%Universidad de San Andr�s
%Examen de Empirical IO

%Atenci�n: Cargar la base de datos para ejecutar el c�digo
%% Inferir las valuaciones privadas por el m�todo GPV
% Definici�n de variables
a = [Bidder1; Bidder2];
a = sort(a) ;
b = sort(a);
r = [];

% Calcula el cociente entre la distribuci�n y la densidad de las ofertas observadas
for i = 1:length(b)
     r(end+1) = ksdensity(b,b(i),'Support','positive','Function','cdf')/ksdensity(b, b(i));
end

%Recupera las pseudo-valuaciones privadas
v = [];
for i = 1:length(b)
    v(end+1) = b(i)+r(i);
end
%% Graficar densidad de las pseudo-valuaciones privadas
[F,vi] = ksdensity(v);
plot(vi,F, 'LineWidth',2); 
xlabel('Valuaci�n privada');
ylabel('Funci�n de densidad de probabilidad');
legend('Distribuci�n de las valuaciones privadas','Location','northwest');
