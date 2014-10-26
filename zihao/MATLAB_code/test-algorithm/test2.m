clear                             %   ��ձ����ռ�
g=100;                          %   ͳ�Ʒ������Ϊg
N=1024;                        %   �����źų�������N
k=128;                          %   ʱ���ͷLMS�㷨�˲�������
pp=zeros(g,N-k);                 %   ��ÿ�ζ���ѭ������������ھ���pp�У��Ա��
                               %   �����ƽ��
u=0.001;                        %   ��������
for q=1:g                
t=1:N;
    a=1;
    s=a*sin(0.5*pi*t);            %   ���뵥Ƶ�ź�s
    figure(1);
    plot(t,real(s));                %   �ź�sʱ����
    title('�ź�sʱ����');
    xlabel('n');
    ylabel('s');
    axis([0,N,-a-1,a+1]);
    xn=awgn(s,3);               %   �����ֵΪ��ĸ�˹�������������Ϊ3dB   
    % ���ó�ֵ
    y=zeros(1,N);                %    ����ź�y
    y(1:k)=xn(1:k);              %   �������ź�xn��ǰk��ֵ��Ϊ���y��ǰk��ֵ
    w=zeros(1,k);                %    ���ó�ͷ��Ȩ��ֵ
    e=zeros(1,N);                %    ����ź�
    % ��LMS�㷨�����˲�
    for i=(k+1):N
               XN=xn((i-k+1):(i)); 
               y(i)=w*XN';
               e(i)=s(i)-y(i);
               w=w+u*e(i)*XN;   
     end
     pp(q,:)=(e(k+1:N)).^2;  
  end
  for b=1:N-k
         bi(b)=sum(pp(:,b))/g;     %   ������ͳ��ƽ��
  end
  figure(2);                    %   �㷨��������
  t=1:N-k;
  plot(t,bi);
  hold off                     %   ��ÿ��ѭ����ͼ����ʾ�����������