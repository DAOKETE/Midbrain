function [current_output,last_output] = Ipc
global parasetting;
Shc_spike=parasetting.Shc.spike;
Imc_spike=parasetting.Imc.spike;
Shc_Ipc_W=parasetting.Ipc.Shc_Ipc_W;
Imc_Ipc_W=parasetting.Ipc.Imc_Ipc_W;
G_d=parasetting.Ipc.G_d;
G_d_t=parasetting.Ipc.G_d_t;
t_step=parasetting.neuro.t_step;
V_array=parasetting.Ipc.V_array;
E=parasetting.Ipc.E;
G_s=parasetting.Ipc.G_s;
V_tao=parasetting.Ipc.V_tao;
V_thr=parasetting.Ipc.V_thr;
V_reset=parasetting.Ipc.V_reset;
last_output=V_array;

Shc_input=conv2(Shc_spike,Shc_Ipc_W,'same');%%Shc神经元接收来自Ipc的输入
if sum(size(Imc_Ipc_W))<3
    Imc_input=(sum(Imc_spike,'all')-Imc_spike).*Imc_Ipc_W;
else
    Imc_input=sum(Imc_spike,'all').*min(Imc_Ipc_W,[],'all')-conv2(Imc_spike,ones(size(Imc_Ipc_W)).*min(Imc_Ipc_W,[],'all'),'same')...
        +conv2(Imc_spike,Imc_Ipc_W,'same');
end

input=Shc_input+Imc_input;

G_d=G_d-G_d./G_d_t*t_step+input;
I=-G_d.*V_array;


dv=(-1.*(V_array-E)+I./G_s)./V_tao.*t_step;
V_array=V_array+dv;

parasetting.Ipc.spike=double(V_array>V_thr);
current_output=V_array;
current_output(V_array>V_thr)=V_reset;
last_output(V_array>V_thr)=V_thr;
V_array(V_array>V_thr)=V_reset;




parasetting.Ipc.G_d=G_d;
parasetting.Ipc.V_array=V_array;
end

