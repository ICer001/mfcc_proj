module data_delay #
(
    parameter               M = 1,  // �������ݿ��
    parameter               N = 255 // �����ӳ�ʱ������
)
(
    input                       clk,

    input        [M-1:00]       data_in,
    output       [M-1:00]       data_out
);

reg     [M*N-1:00]             data_r;
always @ (posedge clk)
begin

    data_r <= {data_r[M*(N-1)-1:0],data_in};
end

assign                  data_out = data_r[M*N-1:M*N-M];

endmodule

