From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: DT imx27 & I2C cannot detect
Date: Wed, 27 Nov 2013 17:26:43 +0800
Message-ID: <5295BAD3.4030202@gtsys.com.hk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

sorry for the noise, but I stuck in a problem and not see whats the reason.
(old 2.6.22 kernel works)

I have a ov2640 patched for dt-support run on 0x30 at i2c1 with a power-enable gpio.

Pinctrl setup:
pinctrl_i2c1: i2c1-1 {
                         fsl,pins = <
                                 MX27_PAD_I2C_DATA__I2C_DATA  0x0
                                 MX27_PAD_I2C_CLK__I2C_CLK 0x0
                                 /* POWER ENABLE */
                                 MX27_PAD_LD7__GPIO1_13 0x0
                         >;
                 };
..
&i2c1 {
         status = "okay";
         clock-frequency = <100000>;
         pinctrl-names = "default";
         pinctrl-0 = <&pinctrl_i2c1>;

         ov2640@30 {
                 compatible = "omnivision,ov2640";
                 reg = <0x30>;
                 pw-gpios = <&gpio1 13 0>;
                 clocks = <&clks 75>;
                 clock-names = "mclk";
         };

};

All looking good so far but I get no response back from the but.. what did I missed?

[    0.267027] imx27-pinctrl 10015000.iomuxc: found group selector 6 for i2c1-1
[    0.267416] imx27-pinctrl 10015000.iomuxc: request pin 113 
(MX27_PAD_I2C_DATA) for 10012000.i2c
[    0.267484] imx27-pinctrl 10015000.iomuxc: request pin 114 (MX27_PAD_I2C_CLK) 
for 10012000.i2c
[    0.267543] imx27-pinctrl 10015000.iomuxc: request pin 13 (MX27_PAD_LD7) for 
10012000.i2c
[    0.267598] imx27-pinctrl 10015000.iomuxc: enable function i2c group i2c1-1
[    0.267667] imx27-pinctrl 10015000.iomuxc: imx1_pmx_enable, pin 0x71, 
function 0, gpio 0, direction 1, oconf 0, iconfa 0, iconfb 0
[    0.267737] imx27-pinctrl 10015000.iomuxc: imx1_pmx_enable, pin 0x72, 
function 0, gpio 0, direction 1, oconf 0, iconfa 0, iconfb 0
[    0.267806] imx27-pinctrl 10015000.iomuxc: imx1_pmx_enable, pin 0xd, function 
0, gpio 1, direction 1, oconf 3, iconfa 0, iconfb 0
[    0.267953] imx27-pinctrl 10015000.iomuxc: write: register 0xf4415004 offset 
26 value 0x3
[    0.268022] imx27-pinctrl 10015000.iomuxc: write: register 0xf441500c offset 
26 value 0x0
[    0.268079] imx27-pinctrl 10015000.iomuxc: write: register 0xf4415010 offset 
26 value 0x0
[    0.268131] imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin 
MX27_PAD_I2C_DATA
[    0.268181] imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin 
MX27_PAD_I2C_CLK
[    0.268230] imx27-pinctrl 10015000.iomuxc: pinconf set pullup pin MX27_PAD_LD7
[    0.268446] imx-i2c 10012000.i2c: <i2c_imx_probe>
[    0.268669]  (null): <i2c_imx_set_clk> I2C_CLK=66500000, REQ DIV=665
[    0.268723]  (null): <i2c_imx_set_clk> IFDR[IC]=0x39, REAL DIV=768
[    0.269703] i2c i2c-0: adapter [10012000.i2c] registered
[    0.269820] i2c i2c-0: of_i2c: walking child nodes
[    0.269886] i2c i2c-0: of_i2c: register /soc/aipi@10000000/i2c@10012000/ov2640@30
[    0.270966] i2c 0-0030: uevent
[    0.271611] i2c i2c-0: client [ov2640] registered with bus id 0-0030
[    0.271703] i2c i2c-0: claimed irq 28
[    0.271757] i2c i2c-0: device resources from 0x10012000 to 0x10012fff
[    0.271806] i2c i2c-0: allocated 4096 bytes at 0x10012000
[    0.271848] i2c i2c-0: adapter name: "10012000.i2c"
[    0.271887] i2c i2c-0: IMX I2C adapter registered


[    1.406499] i2c i2c-0: master_xfer[0] W, addr=0x30, len=2
[    1.406562] i2c i2c-0: <i2c_imx_xfer>
[    1.406608] i2c i2c-0: <i2c_imx_start>
[    1.406715] i2c i2c-0: <i2c_imx_bus_busy>
[    1.406764] i2c i2c-0: <i2c_imx_xfer> transfer message: 0
[    1.406824] i2c i2c-0: <i2c_imx_xfer> CONTROL: IEN=1, IIEN=1, MSTA=1, MTX=1, 
TXAK=1, RSTA=0
[    1.406885] i2c i2c-0: <i2c_imx_xfer> STATUS: ICF=1, IAAS=0, IBB=1, IAL=0, 
SRW=0, IIF=0, RXAK=1
[    1.406932] i2c i2c-0: <i2c_imx_write> write slave address: addr=0x60
[    1.407172] i2c i2c-0: <i2c_imx_trx_complete> TRX complete
[    1.407230] i2c i2c-0: <i2c_imx_acked> No ACK
[    1.407274] i2c i2c-0: <i2c_imx_stop>
[    1.407314] i2c i2c-0: <i2c_imx_bus_busy>
[    1.407373] i2c i2c-0: <i2c_imx_xfer> exit with: error: -5



root@gtsir-nand:~# i2cdetect -l
i2c-0	i2c       	10012000.i2c                    	I2C adapter
root@gtsir-nand:~# i2cdetect -y 0
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
