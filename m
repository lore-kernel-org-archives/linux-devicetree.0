From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6795 support
Date: Thu, 9 Jul 2015 13:47:36 +0800
Message-ID: <1436420856.16651.11.camel@mtkswgap22>
References: <1436350480-17276-1-git-send-email-mars.cheng@mediatek.com>
	 <1436350480-17276-3-git-send-email-mars.cheng@mediatek.com>
	 <20150708102343.GC7025@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150708102343.GC7025@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, MY Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +	chosen {
> > +		bootargs = "console=ttyS0,921600n8 earlyprintk";
> 
> PLease get rid of bootargs here; earlyprintk doesn't do anything on
> arm64 (it's earlycon these days), and you can specify the serial
> configuration in stdout-path, so please use that instead.
> 
Got it. Will remove bootargs & use stdout-path only.
> > +		stdout-path = &uart0;
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> > new file mode 100644
> > index 0000000..832be20
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> > @@ -0,0 +1,164 @@
> > +/*
> > + * Copyright (c) 2015 MediaTek Inc.
> > + * Author: Mars.C <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	compatible = "mediatek,mt6795";
> > +	interrupt-parent = <&sysirq>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x000>;
> > +		};
> > +
> > +		cpu1: cpu@1 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x001>;
> > +		};
> 
> No enable-method? Does your FW patch that in?
This patch only provides single core to boot.The proper enable-method
for SMP boot is under discussion in our site. Will complete
enable-method when providing our solution to SMP boot in the other patch
set.
> 
> > +
> > +		cpu2: cpu@2 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x002>;
> > +		};
> > +
> > +		cpu3: cpu@3 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x003>;
> > +		};
> > +
> > +		cpu4: cpu@4 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x100>;
> > +		};
> 
> The unit-address should match the reg (e.g. this should be cpu@100).
Got it. Will fix this.
> 
> > +
> > +		cpu5: cpu@5 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x101>;
> > +		};
> > +
> > +		cpu6: cpu@6 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x102>;
> > +		};
> > +
> > +		cpu7: cpu@7 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x103>;
> > +		};
> > +	};
> > +
> > +	clocks {
> > +		system_clk: dummy13m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <13000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		rtc_clk: dummy32k {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <32000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		uart_clk: dummy26m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <26000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> 
> Get rid of the clocks node and place these directly under the root node.
Got it. Will fix it.
> 
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13
> > +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 14
> > +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 11
> > +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 10
> > +			     (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> > +	};
> 
> The mask is wrong.
They should be GIC_CPU_MASK_SIMPLE(8). Will fix these.

Thanks for your suggestions.
> 
> Thanks,
> Mark.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
