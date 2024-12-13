clear;
n=70;%指定迭代次數
n2_1=zeros(n,1);
n2=zeros(n,1);
nnnn2=zeros(n,1);
n2(1)=2;
n2_1(1)=1;
for i=2:n
    n2_1(i)=n2_1(i-1)*(i-1)/(2*i-1);
    n2(i)=n2(i-1)+2*n2_1(i);
end
for i=1:n
    nnnn2(i)=pi^(1/2)/(2*i^(1/2)*2^i);
end


pis=zeros(n,1);
for i=1:n
    pis(i)=pi;
end
n2=abs(n2-pis);
figure(1)
plot(log(1:n)/log(10),log(n2)/log(10),'r-x','LineWidth',2);
hold on
plot(log(1:n)/log(10),log(nnnn2)/log(10),'black-.','LineWidth',2);
legend({"n2","pi^(1/2)/(2*i^(1/2)*2^i)"})
xlabel('log N','FontSize',14)
ylabel('log error','FontSize',14)
grid on
hold off