function paramater_LIF
global parasetting;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%��Ԫģ�Ͳ���LIFģ��
parasetting.neuro.t_step=1;%%��ԪĤ��λ����ʱ�䲽��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Shc��Ԫ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parasetting.Shc.array_num=[2,1];%%��Ԫ���е����С��� �С�
parasetting.Shc.E=-55;%%��ϢĤ��λ
parasetting.Shc.G_d_t=10;%%ͻ���絼�ָ���0����ʱ��ms
parasetting.Shc.G_s=10;%%��ԪĤ��λ�絼,�䵹����ΪΪ��Ԫ���迹
parasetting.Shc.V_tao=10;%%Ĥ��λʱ�䳣��
parasetting.Shc.V_thr=-45;%%-40��Ԫ����spike��ֵ
parasetting.Shc.V_reset=-60;%%��Ԫ����spike������Ĥ��λ

parasetting.Shc.RGC_Shc_W=1.3;%%Shc��������RGCͶ���Ȩ�ؾ���
parasetting.Shc.Ipc_Shc_W=2.3;%%2.3Shc��������IpcͶ���Ȩ�ؾ���
parasetting.Shc.Imc_Shc_W=-0.8;%%Shc��������ImcͶ���Ȩ�ؾ������ֻ��һ��������ʾ����Imc��Ԫ����Ͷ���Ȩ�أ���Ͷ���Ȩ����ͬ��
                             %%�����һ�����󣬱�ʾ����Imc����Ͷ���Ȩ�أ�Զ����Imc��Ͷ��Ϊ����������Сֵ��

parasetting.Shc.V_array=parasetting.Shc.E.*ones(parasetting.Shc.array_num);%%��Ԫ��Ĥ��λ��ʼ��
parasetting.Shc.G_d=zeros(parasetting.Shc.array_num);%%ͻ���絼��ʼֵ�����ڼ����������,��������仯
parasetting.Shc.spike=zeros(parasetting.Shc.array_num);%%spike,1Ϊ���ţ�0Ϊ�Ƿ���

%%Ipc��Ԫ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parasetting.Ipc.array_num=[2,1];%%��Ԫ���е����С��� �С�
parasetting.Ipc.E=-55;%%��ϢĤ��λ
parasetting.Ipc.G_d_t=10;%%ͻ���絼�ָ���0����ʱ��ms
parasetting.Ipc.G_s=10;%%��ԪĤ��λ�絼,�䵹����ΪΪ��Ԫ���迹
parasetting.Ipc.V_tao=10;%%Ĥ��λʱ�䳣��
parasetting.Ipc.V_thr=-50;%%��Ԫ����spike��ֵ
parasetting.Ipc.V_reset=-60;%%��Ԫ����spike������Ĥ��λ

parasetting.Ipc.Shc_Ipc_W=2;%%2.71Shc��������IpcͶ���Ȩ�ؾ���
parasetting.Ipc.Imc_Ipc_W=-0.8;%%Shc��������ImcͶ���Ȩ�ؾ������ֻ��һ��������ʾ����Imc��Ԫ����Ͷ���Ȩ�أ���Ͷ���Ȩ����ͬ��
                             %%�����һ�����󣬱�ʾ����Imc����Ͷ���Ȩ�أ�Զ����Imc��Ͷ��Ϊ����������Сֵ��

parasetting.Ipc.V_array=parasetting.Ipc.E.*ones(parasetting.Ipc.array_num);%%��Ԫ��Ĥ��λ��ʼ��
parasetting.Ipc.G_d=zeros(parasetting.Ipc.array_num);%%ͻ���絼��ʼֵ�����ڼ����������,��������仯
parasetting.Ipc.spike=zeros(parasetting.Ipc.array_num);%%spike,1Ϊ���ţ�0Ϊ�Ƿ���


%%Imc��Ԫ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parasetting.Imc.array_num=[2,1];%%��Ԫ���е����С��� �С�
parasetting.Imc.E=-55;%%��ϢĤ��λ
parasetting.Imc.G_d_t=10;%%ͻ���絼�ָ���0����ʱ��ms
parasetting.Imc.G_s=10;%%��ԪĤ��λ�絼,�䵹����ΪΪ��Ԫ���迹
parasetting.Imc.V_tao=10;%%Ĥ��λʱ�䳣��
parasetting.Imc.V_thr=-50;%%��Ԫ����spike��ֵ
parasetting.Imc.V_reset=-60;%%��Ԫ����spike������Ĥ��λ

parasetting.Imc.Shc_Imc_W=2;%%Shc��������IpcͶ���Ȩ�ؾ���
parasetting.Imc.Imc_Imc_W=-0.8;%%Shc��������ImcͶ���Ȩ�ؾ������ֻ��һ��������ʾ����Imc��Ԫ����Ͷ���Ȩ�أ���Ͷ���Ȩ����ͬ��
                             %%�����һ�����󣬱�ʾ����Imc����Ͷ���Ȩ�أ�Զ����Imc��Ͷ��Ϊ����������Сֵ��

parasetting.Imc.V_array=parasetting.Imc.E.*ones(parasetting.Imc.array_num);%%��Ԫ��Ĥ��λ��ʼ��
parasetting.Imc.G_d=zeros(parasetting.Imc.array_num);%%ͻ���絼��ʼֵ�����ڼ����������,��������仯
parasetting.Imc.spike=zeros(parasetting.Imc.array_num);%%spike,1Ϊ���ţ�0Ϊ�Ƿ���




















end

