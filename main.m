clear all;close all;clc;
paramater_LIF;
global parasetting;
stim_size=parasetting.Shc.array_num;
Midbrain_spike_loop{2,1}='loop';
Midbrain_spike_loop{3,1}='no-loop';
for i=2:5
    Midbrain_spike_loop{1,i+1}=strcat('RGC_FR=',num2str(floor(1000/i)));
    stim_all=zeros(stim_size(1),700);
    stim_all(1,1:i:500)=1;%stim_all(1,101:2:500)=1;
    % stim_all(2,1:1:100)=0;stim_all(2,101:1:500)=0;




    Shc_V(1:2,1)=parasetting.Shc.V_array;
    Ipc_V(1:2,1)=parasetting.Ipc.V_array;
    Imc_V(1:2,1)=parasetting.Imc.V_array;
    for t=1:size(stim_all,2)
        stim=stim_all(:,t);
        %%神经元的膜电位状态
        [current_output,last_output]=Shc(stim);%%Shc神经元状态更新
        Shc_V(:,t:t+1)=[last_output current_output];
        [current_output,last_output] = Ipc;%%Ipc神经元状态更新
        Ipc_V(:,t:t+1)=[last_output current_output];
        [current_output,last_output] = Imc;%%Imc神经元状态更新
        Imc_V(:,t:t+1)=[last_output current_output];
        %%神经元的spike
        Shc_spike(:,t)=parasetting.Shc.spike;
        Ipc_spike(:,t)=parasetting.Ipc.spike;
        Imc_spike(:,t)=parasetting.Imc.spike;

    end
    Midbrain_spike_loop{2,i+1}=[Shc_spike(1,:);Ipc_spike(1,:);Imc_spike(1,:)];
end


%%无兴奋性环路
paramater_LIF;
parasetting.Shc.Ipc_Shc_W=0;
stim_size=parasetting.Shc.array_num;

for i=1:5
    stim_all=zeros(stim_size(1),700);
    stim_all(1,1:i:500)=1;%stim_all(1,101:2:500)=1;
    % stim_all(2,1:1:100)=0;stim_all(2,101:1:500)=0;




    Shc_V(1:2,1)=parasetting.Shc.V_array;
    Ipc_V(1:2,1)=parasetting.Ipc.V_array;
    Imc_V(1:2,1)=parasetting.Imc.V_array;
    for t=1:size(stim_all,2)
        stim=stim_all(:,t);
        %%神经元的膜电位状态
        [current_output,last_output]=Shc(stim);%%Shc神经元状态更新
        Shc_V(:,t:t+1)=[last_output current_output];
        [current_output,last_output] = Ipc;%%Ipc神经元状态更新
        Ipc_V(:,t:t+1)=[last_output current_output];
        [current_output,last_output] = Imc;%%Imc神经元状态更新
        Imc_V(:,t:t+1)=[last_output current_output];
        %%神经元的spike
        Shc_spike(:,t)=parasetting.Shc.spike;
        Ipc_spike(:,t)=parasetting.Ipc.spike;
        Imc_spike(:,t)=parasetting.Imc.spike;

    end
    Midbrain_spike_loop{3,i+1}=[Shc_spike(1,:);Ipc_spike(1,:);Imc_spike(1,:)];
end
for i=2:size(Midbrain_spike_loop,2)
    loop_Imc_spike(i-1,1)=sum(Midbrain_spike_loop{2,i}(3,1:500))*2;%%刺激期间的发放率
    loop_Imc_spike(i-1,2)=sum(Midbrain_spike_loop{2,i}(3,501:end))*10;%%刺激结束后的发放率
    loop_Imc_spike(i-1,3)=max(max(find(Midbrain_spike_loop{2,i}(3,:)==1)),500)-500;%%刺激结束后响应持续时间
    
    noloop_Imc_spike(i-1,1)=sum(Midbrain_spike_loop{3,i}(3,1:500))*2;%%刺激期间的发放率
    noloop_Imc_spike(i-1,2)=sum(Midbrain_spike_loop{3,i}(3,501:end))*10;%%刺激结束后的发放率
    noloop_Imc_spike(i-1,3)=max(max(find(Midbrain_spike_loop{3,i}(3,:)==1)),500)-500;%%刺激结束后响应持续时间
end
rester_Imc_spike=[];
for i=2:size(Midbrain_spike_loop,2)
    len=length(find(Midbrain_spike_loop{2,i}(3,:)==1)');
    temp=[find(Midbrain_spike_loop{2,i}(3,:)==1)' ones(len,1).*((i-1)*2-1)-0.55+rand(len,1).*0.1 ones(len,1)];
    rester_Imc_spike=[rester_Imc_spike;temp];
    len=length(find(Midbrain_spike_loop{3,i}(3,:)==1)');
    temp=[find(Midbrain_spike_loop{3,i}(3,:)==1)' ones(len,1).*((i-1)*2)-0.55+rand(len,1).*0.1 ones(len,1).*2];
    rester_Imc_spike=[rester_Imc_spike;temp];
end








% figure,
% plot(Shc_V(1,:));hold on;
% plot(Shc_V(2,:));hold off;legend('S1','S2');title('Shc');
% 
% figure,
% plot(Ipc_V(1,:));hold on;
% plot(Ipc_V(2,:));hold off;legend('S1','S2');title('Ipc');
% 
% figure,
% plot(Imc_V(1,:));hold on;
% plot(Imc_V(2,:));hold off;legend('S1','S2');title('Imc');

