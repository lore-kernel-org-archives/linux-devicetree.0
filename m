From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] arm64: dts: add dts files for Hisilicon Hip05-D02
 Development Board
Date: Wed, 02 Sep 2015 08:58:00 +0100
Message-ID: <55E6AC08.4000302@arm.com>
References: <1440838361-1468-1-git-send-email-dingtianhong@huawei.com>	<1440838361-1468-3-git-send-email-dingtianhong@huawei.com>	<20150831131244.GB6194@leoy-linaro> <55E45A46.7040805@huawei.com> <55E67AD1.2010405@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55E67AD1.2010405@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ding Tianhong <dingtianhong@huawei.com>, Leo Yan <leo.yan@linaro.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, linuxarm@huawei.com, robh+dt@kernel.org, haojian.zhuang@linaro.org, galak@codeaurora.org, zhangfei.gao@linaro.org, rob.herring@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

[Don't top-post, this is very annoying]

On 02/09/15 05:28, Ding Tianhong wrote:
> Hi=EF=BC=8CMarc=EF=BC=9A
>=20
> Can you check this, I am not sure whether the GIC_CPU_MASK_SIMPLE(xx)
> is used for gic-v3, maybe we should remove it, thanks.

The binding documentation
(Documentation/devicetree/bindings/arm/gic-v3.txt) is very clear:

  The 3rd cell is the flags, encoded as follows:
        bits[3:0] trigger type and level flags.
                1 =3D edge triggered
                4 =3D level triggered

There is no mask whatsoever, because that would restrict the interrupt
to only 32 CPUs at most.

So please remove this, this is just wrong.

Thanks,

	M.

> Ding
>=20
> On 2015/8/31 21:44, Ding Tianhong wrote:
>> On 2015/8/31 21:12, Leo Yan wrote:
>>> On Sat, Aug 29, 2015 at 04:52:41PM +0800, Ding Tianhong wrote:
>>>> Add initial dtsi file to support Hisilicon Hip05-D02 Board with
>>>> support of CPUs in four clusters and each cluster has quard Cortex=
-A57.
>>>>
>>>> Also add dts file to support Hip05-D02 development board.
>>>>
>>>> Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
>>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>>> ---
>>>>  arch/arm64/boot/dts/hisilicon/Makefile      |   2 +-
>>>>  arch/arm64/boot/dts/hisilicon/hip05-d02.dts |  36 ++++
>>>>  arch/arm64/boot/dts/hisilicon/hip05.dtsi    | 271 +++++++++++++++=
+++++++++++++
>>>>  3 files changed, 308 insertions(+), 1 deletion(-)
>>>>  create mode 100644 arch/arm64/boot/dts/hisilicon/hip05-d02.dts
>>>>  create mode 100644 arch/arm64/boot/dts/hisilicon/hip05.dtsi
>>>>
>>>> diff --git a/arch/arm64/boot/dts/hisilicon/Makefile b/arch/arm64/b=
oot/dts/hisilicon/Makefile
>>>> index fa81a6e..cd158b8 100644
>>>> --- a/arch/arm64/boot/dts/hisilicon/Makefile
>>>> +++ b/arch/arm64/boot/dts/hisilicon/Makefile
>>>> @@ -1,4 +1,4 @@
>>>> -dtb-$(CONFIG_ARCH_HISI) +=3D hi6220-hikey.dtb
>>>> +dtb-$(CONFIG_ARCH_HISI) +=3D hi6220-hikey.dtb hip05-d02.dtb
>>>> =20
>>>>  always		:=3D $(dtb-y)
>>>>  subdir-y	:=3D $(dts-dirs)
>>>> diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/ar=
m64/boot/dts/hisilicon/hip05-d02.dts
>>>> new file mode 100644
>>>> index 0000000..ae34e25
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
>>>> @@ -0,0 +1,36 @@
>>>> +/**
>>>> + * dts file for Hisilicon D02 Development Board
>>>> + *
>>>> + * Copyright (C) 2014,2015 Hisilicon Ltd.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or =
modify
>>>> + * it under the terms of the GNU General Public License version 2=
 as
>>>> + * publishhed by the Free Software Foundation.
>>>> + *
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include "hip05.dtsi"
>>>> +
>>>> +/ {
>>>> +	model =3D "Hisilicon Hip05 D02 Development Board";
>>>> +	compatible =3D "hisilicon,hip05-d02";
>>>> +
>>>> +	memory@00000000 {
>>>> +		device_type =3D "memory";
>>>> +		reg =3D <0x0 0x00000000 0x0 0x80000000>;
>>>> +	};
>>>> +
>>>> +	aliases {
>>>> +		serial0 =3D &uart0;
>>>> +	};
>>>> +
>>>> +	chosen {
>>>> +		stdout-path =3D "serial0:115200n8";
>>>> +	};
>>>> +};
>>>> +
>>>> +&uart0 {
>>>> +	status =3D "ok";
>>>> +};
>>>> diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64=
/boot/dts/hisilicon/hip05.dtsi
>>>> new file mode 100644
>>>> index 0000000..da12d94
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
>>>> @@ -0,0 +1,271 @@
>>>> +/**
>>>> + * dts file for Hisilicon D02 Development Board
>>>> + *
>>>> + * Copyright (C) 2014,2015 Hisilicon Ltd.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or =
modify
>>>> + * it under the terms of the GNU General Public License version 2=
 as
>>>> + * publishhed by the Free Software Foundation.
>>>> + *
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +/ {
>>>> +	compatible =3D "hisilicon,hip05-d02";
>>>> +	interrupt-parent =3D <&gic>;
>>>> +	#address-cells =3D <2>;
>>>> +	#size-cells =3D <2>;
>>>> +
>>>> +	psci {
>>>> +		compatible =3D "arm,psci-0.2";
>>>> +		method =3D "smc";
>>>> +	};
>>>> +
>>>> +	cpus {
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <0>;
>>>> +
>>>> +		cpu-map {
>>>> +			cluster0 {
>>>> +				core0 {
>>>> +					cpu =3D <&cpu0>;
>>>> +				};
>>>> +				core1 {
>>>> +					cpu =3D <&cpu1>;
>>>> +				};
>>>> +				core2 {
>>>> +					cpu =3D <&cpu2>;
>>>> +				};
>>>> +				core3 {
>>>> +					cpu =3D <&cpu3>;
>>>> +				};
>>>> +			};
>>>> +			cluster1 {
>>>> +				core0 {
>>>> +					cpu =3D <&cpu4>;
>>>> +				};
>>>> +				core1 {
>>>> +					cpu =3D <&cpu5>;
>>>> +				};
>>>> +				core2 {
>>>> +					cpu =3D <&cpu6>;
>>>> +				};
>>>> +				core3 {
>>>> +					cpu =3D <&cpu7>;
>>>> +				};
>>>> +			};
>>>> +			cluster2 {
>>>> +				core0 {
>>>> +					cpu =3D <&cpu8>;
>>>> +				};
>>>> +				core1 {
>>>> +					cpu =3D <&cpu9>;
>>>> +				};
>>>> +				core2 {
>>>> +					cpu =3D <&cpu10>;
>>>> +				};
>>>> +				core3 {
>>>> +					cpu =3D <&cpu11>;
>>>> +				};
>>>> +			};
>>>> +			cluster3 {
>>>> +				core0 {
>>>> +					cpu =3D <&cpu12>;
>>>> +				};
>>>> +				core1 {
>>>> +					cpu =3D <&cpu13>;
>>>> +				};
>>>> +				core2 {
>>>> +					cpu =3D <&cpu14>;
>>>> +				};
>>>> +				core3 {
>>>> +					cpu =3D <&cpu15>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>> +		cpu0: cpu@20000 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>
>>> Change to "arm,cortex-a57","arm,armv8"?
>>>
>>
>> Ok=EF=BC=8Cbut I think should be "hisilicon,hip05","arm,armv8".
>>
>>>> +			reg =3D <0x20000>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu1: cpu@20001 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20001>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu2: cpu@20002 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20002>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu3: cpu@20003 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20003>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu4: cpu@20100 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20100>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu5: cpu@20101 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20101>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu6: cpu@20102 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20102>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu7: cpu@20103 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20103>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu8: cpu@20200 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20200>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu9: cpu@20201 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20201>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu10: cpu@20202 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20202>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu11: cpu@20203 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20203>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu12: cpu@20300 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20300>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu13: cpu@20301 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20301>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu14: cpu@20302 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20302>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +
>>>> +		cpu15: cpu@20303 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,armv8";
>>>> +			reg =3D <0x20303>;
>>>> +			enable-method =3D "psci";
>>>> +		};
>>>> +	};
>>>> +
>>>> +	gic: interrupt-controller@8d000000 {
>>>> +		compatible =3D "arm,gic-v3";
>>>> +                #interrupt-cells =3D <3>;
>>>> +                #address-cells =3D <2>;
>>>> +                #size-cells =3D <2>;
>>>> +                ranges;
>>>> +                interrupt-controller;
>>>> +                #redistributor-regions =3D <1>;
>>>> +                redistributor-stride =3D <0x0 0x30000>;
>>>> +		reg =3D <0x0 0x8d000000 0 0x10000>,	/* GICD */
>>>> +		      <0x0 0x8d100000 0 0x300000>,	/* GICR */
>>>> +		      <0x0 0xfe000000 0 0x10000>,	/* GICC */
>>>> +		      <0x0 0xfe010000 0 0x10000>,       /* GICH */
>>>> +		      <0x0 0xfe020000 0 0x10000>;       /* GICV */
>>>> +		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LE=
VEL_HIGH)>;
>>>> +
>>>> +		its_totems: interrupt-controller@8c000000 {
>>>> +			compatible =3D "arm,gic-v3-its";
>>>> +			msi-controller;
>>>> +			reg =3D <0x0 0x8c000000 0x0 0x1000000>;
>>>> +		};
>>>> +	};
>>>> +
>>>> +	timer {
>>>> +		compatible =3D "arm,armv8-timer";
>>>> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_L=
EVEL_LOW)>,
>>>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)=
>,
>>>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)=
>,
>>>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)=
>;
>>>
>>> Here have a question:
>>> In devcie tree binding file: Documentation/devicetree/bindings/arm/=
gic.txt,
>>> it only considers for maximum 8 cpus. So will we need change the
>>> binding file and also use GIC_CPU_MASK_SIMPLE(16) for 16 cores?
>>>
>>
>> Looks like should updtate gic.txt and use the GIC_CPU_MASK_SIMPLE(16=
) for 16 cores.
>>
>> Ding
>>
>>>> +	};
>>>> +
>>>> +	pmu {
>>>> +		compatible =3D "arm,armv8-pmuv3";
>>>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>>>> +	};
>>>> +
>>>> +	soc {
>>>> +		compatible =3D "simple-bus";
>>>> +		#address-cells =3D <2>;
>>>> +		#size-cells =3D <2>;
>>>> +		ranges;
>>>> +
>>>> +		refclk200mhz: refclk200mhz {
>>>> +			compatible =3D "fixed-clock";
>>>> +			#clock-cells =3D <0>;
>>>> +			clock-frequency =3D <200000000>;
>>>> +		};
>>>> +
>>>> +		uart0: uart@80300000 {
>>>> +			compatible =3D "snps,dw-apb-uart";
>>>> +			reg =3D <0x0 0x80300000 0x0 0x10000>;
>>>> +			interrupts =3D <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			clocks =3D <&refclk200mhz>;
>>>> +			clock-names =3D "apb_pclk";
>>>> +			reg-shift =3D <2>;
>>>> +			reg-io-width =3D <4>;
>>>> +			status =3D "disabled";
>>>> +		};
>>>> +
>>>> +		uart1: uart@80310000 {
>>>> +			compatible =3D "snps,dw-apb-uart";
>>>> +			reg =3D <0x0 0x80310000 0x0 0x10000>;
>>>> +			interrupts =3D <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			clocks =3D <&refclk200mhz>;
>>>> +			clock-names =3D "apb_pclk";
>>>> +			reg-shift =3D <2>;
>>>> +			reg-io-width =3D <4>;
>>>> +			status =3D "disabled";
>>>> +		};
>>>> +	};
>>>> +};
>>>> --=20
>>>> 1.9.0
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>
>>> .
>>>
>>
>>
>> _______________________________________________
>> linuxarm mailing list
>> linuxarm@huawei.com
>> http://rnd-openeuler.huawei.com/mailman/listinfo/linuxarm
>>
>=20
>=20


--=20
Jazz is not dead. It just smells funny...
