function [current_output,last_output] = Imc
global parasetting;
Shc_spike=parasetting.Shc.spike;
Imc_spike=parasetting.Imc.spike;
Shc_Imc_W=parasetting.Imc.Shc_Imc_W;
Imc_Imc_W=parasetting.Imc.Imc_Imc_W;
G_d=parasetting.Imc.G_d;
G_d_t=parasetting.Imc.G_d_t;
t_step=parasetting.neuro.t_step;
V_array=parasetting.Imc.V_array;
E=parasetting.Imc.E;
G_s=parasetting.Imc.G_s;
V_tao=parasetting.Imc.V_tao;
V_thr=parasetting.Imc.V_thr;
V_reset=parasetting.Imc.V_reset;
last_output=V_array;

Shc_input=conv2(Shc_spike,Shc_Imc_W,'same');%%Shc��Ԫ��������Ipc������
if sum(size(Imc_Imc_W))<3
    Imc_input=(sum(Imc_spike,'all')-Imc_spike).*Imc_Imc_W;
else
    Imc_input=sum(Imc_spike,'all').*min(Imc_Imc_W,[],'all')-conv2(Imc_spike,ones(size(Imc_Imc_W)).*min(Imc_Imc_W,[],'all'),'same')...
        +conv2(Imc_spike,Imc_Imc_W,'same');
end

input=Shc_input+Imc_input;

G_d=G_d-G_d./G_d_t*t_step+input;
I=-G_d.*V_array;


dv=(-1.*(V_array-E)+I./G_s)./V_tao.*t_step;
V_array=V_array+dv;

parasetting.Imc.spike=double(V_array>V_thr);
current_output=V_array;
current_output(V_array>V_thr)=V_reset;
last_output(V_array>V_thr)=V_thr;
V_array(V_array>V_thr)=V_reset;




parasetting.Imc.G_d=G_d;
parasetting.Imc.V_array=V_array;
end

