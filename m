From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: rockchip: add core rk3036 dts
Date: Thu, 17 Sep 2015 16:51:53 +0800
Message-ID: <55FA7F29.4050403@rock-chips.com>
References: <1440740808-15004-1-git-send-email-zhengxing@rock-chips.com> <1440740808-15004-2-git-send-email-zhengxing@rock-chips.com> <1871781.cSEoq02CXi@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1871781.cSEoq02CXi@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2015=E5=B9=B408=E6=9C=8828=E6=97=A5 16:59, Heiko Stuebner wrote:
> Hi,
>
> Am Freitag, 28. August 2015, 13:46:46 schrieb Xing Zheng:
>> Initial release for rk3036, node definitions rk3036 sdk board.
>>
>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
>> ---
>>
>> Changes in v1: None
>>
>>   arch/arm/boot/dts/Makefile       |    1 +
>>   arch/arm/boot/dts/rk3036-sdk.dts |  362
>> ++++++++++++++++++++++++++++++++++++++ 2 files changed, 363 insertio=
ns(+)
> as Eddie already said, please split into two files ... just look at t=
he other
> Rockchip socs for inspiration :-)
Done.
>>   create mode 100644 arch/arm/boot/dts/rk3036-sdk.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 6d7cec1..7014a3b 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -501,6 +501,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D \
>>   	rk3066a-bqcurie2.dtb \
>>   	rk3066a-marsboard.dtb \
>>   	rk3066a-rayeager.dtb \
>> +	rk3036-sdk.dtb \
>>   	rk3188-radxarock.dtb \
>>   	rk3288-evb-act8846.dtb \
>>   	rk3288-evb-rk808.dtb \
>> diff --git a/arch/arm/boot/dts/rk3036-sdk.dts
>> b/arch/arm/boot/dts/rk3036-sdk.dts new file mode 100644
>> index 0000000..0149c9a
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/rk3036-sdk.dts
>> @@ -0,0 +1,362 @@
>> +/*
>> + * This file is dual-licensed: you can use it either under the term=
s
>> + * of the GPL or the X11 license, at your option. Note that this du=
al
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License =
as
>> + *     published by the Free Software Foundation; either version 2 =
of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty =
of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentati=
on
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom t=
he
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall =
be
>> + *     included in all copies or substantial portions of the Softwa=
re.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KI=
ND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include<dt-bindings/gpio/gpio.h>
>> +#include<dt-bindings/interrupt-controller/irq.h>
>> +#include<dt-bindings/interrupt-controller/arm-gic.h>
>> +#include<dt-bindings/pinctrl/rockchip.h>
>> +#include<dt-bindings/clock/rk3036-cru.h>
>> +#include "skeleton.dtsi"
>> +
>> +/ {
>> +	compatible =3D "rockchip,rk3036";
>> +
>> +	interrupt-parent =3D<&gic>;
>> +
>> +	aliases {
>> +		serial0 =3D&uart0;
>> +		serial1 =3D&uart1;
>> +		serial2 =3D&uart2;
>> +	};
>> +
>> +	memory {
>> +		reg =3D<0x60000000 0x40000000>;
> missing
> 	device_type =3D "memory";
Done.
>
>> +	};
>> +
>> +        arm-pmu {
>> +                compatible =3D "arm,cortex-a7-pmu";
>> +                interrupts =3D<GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
>> +<GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> missing interrupt-affinity to map irq->cpu_core ?
Done.
>> +        };
>> +
>> +	cpus {
>> +		#address-cells =3D<1>;
>> +		#size-cells =3D<0>;
>> +		//enable-method =3D "rockchip,rk3066-smp";
> please don't leave commented code around
>
Done.
>> +
>> +		cpu@f00 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a7";
>> +			reg =3D<0xf00>;
>> +			operating-points =3D<
>> +				/* KHz    uV */
>> +				 816000 1000000
>> +			>;
>> +			#cooling-cells =3D<2>; /* min followed by max */
>> +			clock-latency =3D<40000>;
>> +			clocks =3D<&cru ARMCLK>;
>> +			resets =3D<&cru SRST_CORE0>;
>> +		};
>> +		cpu@f01 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a7";
>> +			reg =3D<0xf01>;
>> +			resets =3D<&cru SRST_CORE1>;
>> +		};
>> +	};
>> +
>> +	amba {
>> +		compatible =3D "arm,amba-bus";
>> +		#address-cells =3D<1>;
>> +		#size-cells =3D<1>;
>> +		ranges;
>> +
>> +                pdma: pdma@20078000 {
>> +                        compatible =3D "arm,pl330", "arm,primecell"=
;
>> +                        reg =3D<0x20078000 0x4000>;
>> +                        interrupts =3D<GIC_SPI 0 IRQ_TYPE_LEVEL_HIG=
H>,
>> +<GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
>> +                        #dma-cells =3D<1>;
>> +                        clocks =3D<&cru ACLK_DMAC2>;
>> +                        clock-names =3D "apb_pclk";
>> +                };
> indentation of the dma controller looks wrong
>
In my opnion, it seems ok, where is it wrong?
Thanks.
>> +	};
>> +
>> +	xin24m: oscillator {
>> +		compatible =3D "fixed-clock";
>> +		clock-frequency =3D<24000000>;
>> +		clock-output-names =3D "xin24m";
>> +		#clock-cells =3D<0>;
>> +	};
>> +
>> +	timer {
>> +		compatible =3D "arm,armv7-timer";
>> +		arm,cpu-registers-not-fw-configured;
>> +		interrupts =3D<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> IRQ_TYPE_LEVEL_HIGH)>,
>> +			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
> IRQ_TYPE_LEVEL_HIGH)>;
>
> please provide all 4 irqs (secure, non-secure, virtual and hypervisor=
)
Done, but I don't quite understand.
>> +		clock-frequency =3D<24000000>;
>> +		always-on;
>> +	};
>> +
>> +	cru: clock-controller@20000000 {
>> +		compatible =3D "rockchip,rk3036-cru";
>> +		reg =3D<0x20000000 0x1000>;
>> +		rockchip,grf =3D<&grf>;
>> +		#clock-cells =3D<1>;
>> +		#reset-cells =3D<1>;
>> +		assigned-clocks =3D<&cru PLL_GPLL>;
>> +		assigned-clock-rates =3D<594000000>;
>> +	};
>> +
>> +	uart0: serial@20060000 {
>> +		compatible =3D "rockchip,rk3036-uart", "snps,dw-apb-uart";
>> +		reg =3D<0x20060000 0x100>;
>> +		interrupts =3D<GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg-shift =3D<2>;
>> +		reg-io-width =3D<4>;
>> +		clock-frequency =3D<24000000>;
>> +		clocks =3D<&cru SCLK_UART0>,<&cru PCLK_UART0>;
>> +		clock-names =3D "baudclk", "apb_pclk";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&uart0_xfer&uart0_cts&uart0_rts>;
>> +	};
>> +
>> +	uart1: serial@20064000 {
>> +		compatible =3D "rockchip,rk3036-uart", "snps,dw-apb-uart";
>> +		reg =3D<0x20064000 0x100>;
>> +		interrupts =3D<GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg-shift =3D<2>;
>> +		reg-io-width =3D<4>;
>> +		clock-frequency =3D<24000000>;
>> +		clocks =3D<&cru SCLK_UART1>,<&cru PCLK_UART1>;
>> +		clock-names =3D "baudclk", "apb_pclk";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&uart1_xfer>;
>> +	};
>> +
>> +	uart2: serial@20068000 {
>> +		compatible =3D "rockchip,rk3036-uart", "snps,dw-apb-uart";
>> +		reg =3D<0x20068000 0x100>;
>> +		interrupts =3D<GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg-shift =3D<2>;
>> +		reg-io-width =3D<4>;
>> +		clock-frequency =3D<24000000>;
>> +		clocks =3D<&cru SCLK_UART2>,<&cru PCLK_UART2>;
>> +		clock-names =3D "baudclk", "apb_pclk";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&uart2_xfer>;
>> +	};
>> +
>> +	pwm0: pwm@20050000 {
>> +		compatible =3D "rockchip,rk2928-pwm";
>> +		reg =3D<0x20050000 0x10>;
>> +		#pwm-cells =3D<3>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&pwm0_pin>;
>> +		clocks =3D<&cru PCLK_PWM>;
>> +		clock-names =3D "pwm";
>> +		status =3D "disabled";
>> +	};
>> +
>> +	pwm1: pwm@20050010 {
>> +		compatible =3D "rockchip,rk2928-pwm";
>> +		reg =3D<0x20050010 0x10>;
>> +		#pwm-cells =3D<3>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&pwm1_pin>;
>> +		clocks =3D<&cru PCLK_PWM>;
>> +		clock-names =3D "pwm";
>> +		status =3D "disabled";
>> +	};
>> +
>> +	pwm2: pwm@20050020 {
>> +		compatible =3D "rockchip,rk2928-pwm";
>> +		reg =3D<0x20050020 0x10>;
>> +		#pwm-cells =3D<3>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&pwm2_pin>;
>> +		clocks =3D<&cru PCLK_PWM>;
>> +		clock-names =3D "pwm";
>> +		status =3D "disabled";
>> +	};
>> +
>> +	pwm3: pwm@20050030 {
>> +		compatible =3D "rockchip,rk2928-pwm";
>> +		reg =3D<0x20050030 0x10>;
>> +		#pwm-cells =3D<2>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D<&pwm3_pin>;
>> +		clocks =3D<&cru PCLK_PWM>;
>> +		clock-names =3D "pwm";
>> +		status =3D "disabled";
>> +	};
>> +
>> +	sram@10080000 {
>> +		compatible =3D "mmio-sram";
>> +		reg =3D<0x10080000 0x2000>;
>> +		map-exec;
>> +	};
>> +
>> +	gic: interrupt-controller@10139000 {
>> +		compatible =3D "arm,gic-400";
>> +		interrupt-controller;
>> +		#interrupt-cells =3D<3>;
>> +		#address-cells =3D<0>;
>> +
>> +		reg =3D<0x10139000 0x1000>,
>> +		<0x1013a000 0x1000>;
> please also provide the vgic registers and interrupt
Done, but I checked GIC_SPEC.pdf and I'm not sure it is correct...
>> +	};
>> +
>> +	grf: syscon@20008000 {
>> +		compatible =3D "rockchip,rk3036-grf", "syscon";
>> +		reg =3D<0x20008000 0x1000>;
>> +	};
>> +
>> +	pinctrl: pinctrl {
>> +		compatible =3D "rockchip,rk3036-pinctrl";
>> +		rockchip,grf =3D<&grf>;
>> +		#address-cells =3D<1>;
>> +		#size-cells =3D<1>;
>> +		ranges;
>> +
>> +		gpio0: gpio0@2007c000 {
>> +			compatible =3D "rockchip,gpio-bank";
>> +			reg =3D	<0x2007c000 0x100>;
> please use a space after the "=3D" in "reg =3D<..."
Done.
>> +			interrupts =3D<GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D<&cru PCLK_GPIO0>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells =3D<2>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells =3D<2>;
>> +		};
>> +
>> +		gpio1: gpio1@20080000 {
>> +			compatible =3D "rockchip,gpio-bank";
>> +			reg =3D<0x20080000 0x100>;
>> +			interrupts =3D<GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D<&cru PCLK_GPIO1>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells =3D<2>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells =3D<2>;
>> +		};
>> +
>> +		gpio2: gpio2@20084000 {
>> +			compatible =3D "rockchip,gpio-bank";
>> +			reg =3D<0x20084000 0x100>;
>> +			interrupts =3D<GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D<&cru PCLK_GPIO2>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells =3D<2>;
>> +
>> +			interrupt-controller;
>> +			#interrupt-cells =3D<2>;
>> +		};
>> +
>> +		pcfg_pull_up: pcfg-pull-up {
>> +			bias-pull-up;
>> +		};
>> +
>> +		pcfg_pull_down: pcfg-pull-down {
>> +			bias-pull-down;
>> +		};
>> +
>> +		pcfg_pull_none: pcfg-pull-none {
>> +			bias-disable;
>> +		};
>> +
>> +		pcfg_pull_none_12ma: pcfg-pull-none-12ma {
>> +			bias-disable;
>> +			drive-strength =3D<12>;
>> +		};
> The rk3036 iomux does not have a per-pin drive-strength setting it se=
ems, so
> at the moment the pinctrl driver does not support changing the drive-=
strength,
> so this node should probably be dropped. It seems unused anyway.
Done.
>> +
>> +		uart0 {
>> +			uart0_xfer: uart0-xfer {
>> +				rockchip,pins =3D<0 16 RK_FUNC_1&pcfg_pull_none>,
>> +						<0 17 RK_FUNC_1&pcfg_pull_none>;
>> +			};
>> +
>> +			uart0_cts: uart0-cts {
>> +				rockchip,pins =3D<0 18 RK_FUNC_1&pcfg_pull_none>;
>> +			};
>> +
>> +			uart0_rts: uart0-rts {
>> +				rockchip,pins =3D<0 19 RK_FUNC_1&pcfg_pull_none>;
>> +			};
>> +		};
>> +
>> +		uart1 {
>> +			uart1_xfer: uart1-xfer {
>> +				rockchip,pins =3D<2 22 RK_FUNC_1&pcfg_pull_none>,
>> +						<2 23 RK_FUNC_1&pcfg_pull_none>;
>> +			};
>> +			/* no rts / cts for uart1 */
>> +		};
>> +
>> +                uart2 {
>> +                        uart2_xfer: uart2-xfer {
>> +                                rockchip,pins =3D<1 18 RK_FUNC_2
>> &pcfg_pull_none>, +<1 19
>> RK_FUNC_2&pcfg_pull_none>; +                        };
>> +                        /* no rts / cts for uart2 */
>> +                };
>> +
>> +		pwm0 {
>> +			pwm0_pin: pwm0-pin {
>> +				rockchip,pins =3D<0 0 RK_FUNC_2&pcfg_pull_none>;
>> +			};
>> +		};
>> +
>> +		pwm1 {
>> +			pwm1_pin: pwm1-pin {
>> +				rockchip,pins =3D<0 1 RK_FUNC_2&pcfg_pull_none>;
>> +			};
>> +		};
>> +
>> +		pwm2 {
>> +			pwm2_pin: pwm2-pin {
>> +				rockchip,pins =3D<0 1 2&pcfg_pull_none>;
>> +			};
>> +		};
>> +
>> +		pwm3 {
>> +			pwm3_pin: pwm3-pin {
>> +				rockchip,pins =3D<0 27 1&pcfg_pull_none>;
>> +			};
>> +		};
>> +	};
>> +};
>
