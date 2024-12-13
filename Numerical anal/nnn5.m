clear;
n=8;%指定迭代次數
n5=zeros(n,1);
nnnn5=zeros(n,1);
n5(1)=4*(4*(1/5)-1/239);
for i=2:n
    n5(i)=n5(i-1)+4*(4*(-1)^(i-1)*(1/5)^(2*i-1)/(2*i-1)-(-1)^(i-1)*(1/239)^(2*i-1)/(2*i-1));
end
for i=1:n
    nnnn5(i)=(4/65)/(i*25^i);
end


pis=zeros(n,1);
for i=1:n
    pis(i)=pi;
end
n5=abs(n5-pis);
figure(1)
plot(log(1:n)/log(10),log(n5)/log(10),'r-x','LineWidth',2);
hold on
plot(log(1:n)/log(10),log(nnnn5)/log(10),'black-.','LineWidth',2);
legend({"n5","(4/65)/(n*25^n)"})
xlabel('log N','FontSize',14)
ylabel('log error','FontSize',14)
grid on
hold off