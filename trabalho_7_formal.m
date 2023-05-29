clear; clc; close all;

%definir as variáveis das alturas
hA = [39.5 39 38.9 38.8 38.4 38.3 37.5 36.6 35.3 33 30.2 26.5 22.6 19.6];
hB = [40 40.8 40.9 41.3 41.7 41.9 42.6 43.5 44.8 47.1 49.7 53.2 56.8 59.5];

%definir a variável hm e converter de cm para m
hm = (hB-hA-0.5)/(100);

%definir variáveis das densidades dos fluidos
densidad_agua = 998.502;
densidad_anilina = 1026;

%definir a variável P
P = (hm*(densidad_anilina-densidad_agua)*9.8)

%definir a variável um (velocidade média) 

um = [0 0.0433 0.0523 0.06221 0.0801 0.0983 0.12203 0.1467 0.17 0.2111 0.2447 0.2887 0.3247 0.3381];

%definir a variável hf 
hf = (P./(densidad_agua*9.8))

%definir a variável cf experimental 
cf = (hf .* 0.014 * 2 * 9.8) ./ (4 * 0.7 * (um.^2))

%definir a variável Re (décimas) 
Re = (998.502 .*um*0.014)./(1.307*10^-3)

%definir as variáveis so cf teóricas
Cf_t_L = 16./Re(1:9)
Cf_t_T = 0.0791.*(Re(12:14)).^-0.25

%cálculo dos erros 
ErroscfL = ((Cf_t_L-cf(1:9))./cf(1:9))*100  
ErroscfT = ((Cf_t_T-cf(12:14))./cf(12:14))*100 

%definir as variáveis Hf (experimental e teóricas)
dHf_um = (hf./um)
x =0.0134;
dHf_um_T_L = repmat(x,1,8)
dHf_um_T_T = ((7*10^-5).*Re(12:14).^0.75)

%cálculo dos erros
ErrosHfL = ((dHf_um_T_L-dHf_um(1:8))./dHf_um(1:8))*100
ErrosHfT = ((dHf_um_T_T-dHf_um(12:14))./dHf_um(12:14))*100

% Gráfico cf em função de Re
%traçar as linhas que os pontos formam no gráfico
figure;
hold on;
plot(Re(1:9), cf(1:9), 'b', 'LineWidth', 2); 
plot(Re(12:13), cf(12:13), 'r', 'LineWidth', 2); 
plot(Re(1:9), Cf_t_L, 'g', 'LineWidth', 2); 
plot(Re(12:13), Cf_t_T(1:2), 'y', 'LineWidth', 2); 
plot(Re([10 11 14]), cf([10 11 14]), 'kx', 'MarkerSize', 10, 'LineWidth', 2); 

%marcar os pontos no gráfico
scatter(Re(1:9), cf(1:9), 'filled', 'MarkerFaceColor', 'b'); 
scatter(Re(12:13), cf(12:13), 'filled', 'MarkerFaceColor', 'r');
scatter(Re(1:9), Cf_t_L, 'filled', 'MarkerFaceColor', 'g'); 
scatter(Re(12:13), Cf_t_T(1:2), 'filled', 'MarkerFaceColor', 'y');
scatter(Re([10 11 14]), cf([10 11 14]), 'kx', 'LineWidth', 2); 
hold off;

% Editar o gráfico em si
grid on;
legend('cf L', 'cf T', 'cf L t', 'cf T t', 'pontos restantes');
xlabel('Re');
ylabel('cf');


% Gráfico dHf_um em função de Re
%traçar as linhas que os pontos formam no gráfico
figure;
hold on;
plot(Re(2:9), dHf_um_T_L(1:8), 'b', 'LineWidth', 2);
plot(Re(12:13), dHf_um_T_T(1:2), 'r', 'LineWidth', 2); 
plot(Re(1:9), dHf_um(1:9), 'g', 'LineWidth', 2); 
plot(Re(12:13), dHf_um(12:13), 'm', 'LineWidth', 2); 
plot(Re([10 11]), dHf_um([10 11]), 'kx', 'MarkerSize', 10, "Linewidth", 2);

%marcar os pontos no gráfico
scatter(Re(2:9), dHf_um_T_L(1:8), 'filled', 'MarkerFaceColor', 'b'); 
scatter(Re(12:13), dHf_um_T_T(1:2), 'filled', 'MarkerFaceColor', 'r'); 
scatter(Re(1:9), dHf_um(1:9), 'filled', 'MarkerFaceColor', 'g'); 
scatter(Re(12:13), dHf_um(12:13), 'filled', 'MarkerFaceColor', 'm'); 
hold off;

% Editar o gráfico em si
grid on;
legend('dHf_um_T_L', 'dHf_um_T_T', 'dHf_um (1-9)', 'dHf_um (12-13)', 'pontos restantes');
xlabel('Re');
ylabel('dHf_um');



