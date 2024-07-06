function [current_output,last_output] = Shc(spike_input)
global parasetting;
RGC_Shc_W=parasetting.Shc.RGC_Shc_W;
Ipc_spike=parasetting.Ipc.spike;
Ipc_Shc_W=parasetting.Shc.Ipc_Shc_W;
Imc_Shc_W=parasetting.Shc.Imc_Shc_W;
Imc_spike=parasetting.Imc.spike;
G_d=parasetting.Shc.G_d;
G_d_t=parasetting.Shc.G_d_t;
t_step=parasetting.neuro.t_step;
V_array=parasetting.Shc.V_array;
E=parasetting.Shc.E;
G_s=parasetting.Shc.G_s;
V_tao=parasetting.Shc.V_tao;
V_thr=parasetting.Shc.V_thr;
V_reset=parasetting.Shc.V_reset;
last_output=V_array;

RGC_input=conv2(spike_input,RGC_Shc_W,'same');%%Shc神经元接收来自RGC的外部输入
Ipc_input=conv2(Ipc_spike,Ipc_Shc_W,'same');%%Shc神经元接收来自Ipc的输入
if sum(size(Imc_Shc_W))<3
    Imc_input=(sum(Imc_spike,'all')-Imc_spike).*Imc_Shc_W;
else
    Imc_input=sum(Imc_spike,'all').*min(Imc_Shc_W,[],'all')-conv2(Imc_spike,ones(size(Imc_Shc_W)).*min(Imc_Shc_W,[],'all'),'same')...
        +conv2(Imc_spike,Imc_Shc_W,'same');
end

input=RGC_input+Ipc_input+Imc_input;

G_d=G_d-G_d./G_d_t*t_step+input;
I=-G_d.*V_array;


dv=(-1.*(V_array-E)+I./G_s)./V_tao.*t_step;
V_array=V_array+dv;

parasetting.Shc.spike=double(V_array>V_thr);
current_output=V_array;
current_output(V_array>V_thr)=V_reset;
last_output(V_array>V_thr)=V_thr;
V_array(V_array>V_thr)=V_reset;





parasetting.Shc.G_d=G_d;
parasetting.Shc.V_array=V_array;






















end

