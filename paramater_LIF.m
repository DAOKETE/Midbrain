function paramater_LIF
global parasetting;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%神经元模型采用LIF模型
parasetting.neuro.t_step=1;%%神经元膜电位更新时间步长
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Shc神经元
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parasetting.Shc.array_num=[2,1];%%神经元阵列的行列【行 列】
parasetting.Shc.E=-55;%%静息膜电位
parasetting.Shc.G_d_t=10;%%突触电导恢复到0所用时间ms
parasetting.Shc.G_s=10;%%神经元膜电位电导,其倒数即为为神经元的阻抗
parasetting.Shc.V_tao=10;%%膜电位时间常数
parasetting.Shc.V_thr=-45;%%-40神经元发放spike阈值
parasetting.Shc.V_reset=-60;%%神经元发放spike后重置膜电位

parasetting.Shc.RGC_Shc_W=1.3;%%Shc接收来自RGC投射的权重矩阵
parasetting.Shc.Ipc_Shc_W=2.3;%%2.3Shc接收来自Ipc投射的权重矩阵
parasetting.Shc.Imc_Shc_W=-0.8;%%Shc接收来自Imc投射的权重矩阵，如果只有一个数，表示其他Imc神经元向其投射的权重，且投射的权重相同；
                             %%如果是一个矩阵，表示相邻Imc向其投射的权重，远距离Imc的投射为这个矩阵的最小值；

parasetting.Shc.V_array=parasetting.Shc.E.*ones(parasetting.Shc.array_num);%%神经元的膜电位初始化
parasetting.Shc.G_d=zeros(parasetting.Shc.array_num);%%突触电导初始值，用于计算输入电流,随着输入变化
parasetting.Shc.spike=zeros(parasetting.Shc.array_num);%%spike,1为发放，0为非发放

%%Ipc神经元
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parasetting.Ipc.array_num=[2,1];%%神经元阵列的行列【行 列】
parasetting.Ipc.E=-55;%%静息膜电位
parasetting.Ipc.G_d_t=10;%%突触电导恢复到0所用时间ms
parasetting.Ipc.G_s=10;%%神经元膜电位电导,其倒数即为为神经元的阻抗
parasetting.Ipc.V_tao=10;%%膜电位时间常数
parasetting.Ipc.V_thr=-50;%%神经元发放spike阈值
parasetting.Ipc.V_reset=-60;%%神经元发放spike后重置膜电位

parasetting.Ipc.Shc_Ipc_W=2;%%2.71Shc接收来自Ipc投射的权重矩阵
parasetting.Ipc.Imc_Ipc_W=-0.8;%%Shc接收来自Imc投射的权重矩阵，如果只有一个数，表示其他Imc神经元向其投射的权重，且投射的权重相同；
                             %%如果是一个矩阵，表示相邻Imc向其投射的权重，远距离Imc的投射为这个矩阵的最小值；

parasetting.Ipc.V_array=parasetting.Ipc.E.*ones(parasetting.Ipc.array_num);%%神经元的膜电位初始化
parasetting.Ipc.G_d=zeros(parasetting.Ipc.array_num);%%突触电导初始值，用于计算输入电流,随着输入变化
parasetting.Ipc.spike=zeros(parasetting.Ipc.array_num);%%spike,1为发放，0为非发放


%%Imc神经元
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parasetting.Imc.array_num=[2,1];%%神经元阵列的行列【行 列】
parasetting.Imc.E=-55;%%静息膜电位
parasetting.Imc.G_d_t=10;%%突触电导恢复到0所用时间ms
parasetting.Imc.G_s=10;%%神经元膜电位电导,其倒数即为为神经元的阻抗
parasetting.Imc.V_tao=10;%%膜电位时间常数
parasetting.Imc.V_thr=-50;%%神经元发放spike阈值
parasetting.Imc.V_reset=-60;%%神经元发放spike后重置膜电位

parasetting.Imc.Shc_Imc_W=2;%%Shc接收来自Ipc投射的权重矩阵
parasetting.Imc.Imc_Imc_W=-0.8;%%Shc接收来自Imc投射的权重矩阵，如果只有一个数，表示其他Imc神经元向其投射的权重，且投射的权重相同；
                             %%如果是一个矩阵，表示相邻Imc向其投射的权重，远距离Imc的投射为这个矩阵的最小值；

parasetting.Imc.V_array=parasetting.Imc.E.*ones(parasetting.Imc.array_num);%%神经元的膜电位初始化
parasetting.Imc.G_d=zeros(parasetting.Imc.array_num);%%突触电导初始值，用于计算输入电流,随着输入变化
parasetting.Imc.spike=zeros(parasetting.Imc.array_num);%%spike,1为发放，0为非发放




















end

