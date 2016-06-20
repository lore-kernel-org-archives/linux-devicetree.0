From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6755 support
Date: Mon, 20 Jun 2016 17:19:10 +0800
Message-ID: <1466414350.3378.9.camel@mtkswgap22>
References: <1465870805-10451-1-git-send-email-mars.cheng@mediatek.com>
 <1465870805-10451-3-git-send-email-mars.cheng@mediatek.com>
 <5767A9FB.3010007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5767A9FB.3010007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2016-06-20 at 10:31 +0200, Matthias Brugger wrote:
> 
> On 14/06/16 04:20, Mars Cheng wrote:
> > This adds basic chip support for MT6755 SoC.
> >
> > Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |    1 +
> >   arch/arm64/boot/dts/mediatek/mt6755-phone.dts |   39 +++++++
> >   arch/arm64/boot/dts/mediatek/mt6755.dtsi      |  143 +++++++++++++++++++++++++
> >   3 files changed, 183 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-phone.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index e0a4bff..9abdb01 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -1,3 +1,4 @@
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-phone.dtb
> 
> I suppose this is a evaluation platform? Is this different to the EVB 
> for this SoC? Or will the only phone build with this SoC be this one?
> 

Yes, this is an evaluation platform which is an internal demo phone.
No difference to EVB. Would you suggest I change the name? If so, I will
change it to mt6755-evb.dtb. So will the compatible string in it.
 
> Thanks,
> Matthias
> 
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6755-phone.dts b/arch/arm64/boot/dts/mediatek/mt6755-phone.dts
> > new file mode 100644
> > index 0000000..f551666
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6755-phone.dts
> > @@ -0,0 +1,39 @@
> > +/*
> > + * Copyright (c) 2016 MediaTek Inc.
> > + * Author: Mars.C <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt6755.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT6755 phone";
> > +	compatible = "mediatek,mt6755-phone", "mediatek,mt6755";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> 
> we don't enable uart1, so we don't need the alias.

OK, will fix this.

> 
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x1e800000>;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:921600n8";
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> > new file mode 100644
> > index 0000000..36c3384
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
> > @@ -0,0 +1,143 @@
> > +/*
> > + * Copyright (c) 2016 MediaTek Inc.
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
> > +	compatible = "mediatek,mt6755";
> > +	interrupt-parent = <&sysirq>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	psci {
> > +		compatible = "arm,psci-0.2";
> > +		method = "smc";
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x000>;
> > +		};
> > +
> > +		cpu1: cpu@1 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x001>;
> > +		};
> > +
> > +		cpu2: cpu@2 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x002>;
> > +		};
> > +
> > +		cpu3: cpu@3 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x003>;
> > +		};
> > +
> > +		cpu4: cpu@100 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x100>;
> > +		};
> > +
> > +		cpu5: cpu@101 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x101>;
> > +		};
> > +
> > +		cpu6: cpu@102 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x102>;
> > +		};
> > +
> > +		cpu7: cpu@103 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x103>;
> > +		};
> > +	};
> > +
> > +	uart_clk: dummy26m {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <26000000>;
> > +		#clock-cells = <0>;
> > +	};
> > +
> 
> We can do that, but I would prefer to see the clock driver early. So 
> that the DTS we carry around as complete as possible.
> 

OK, I will merge the clk later. However, the clk driver would be
submmited later, is that OK? Or would you prefer sunmmit clk driver
together?

> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13
> > +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 14
> > +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 11
> > +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 10
> > +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> > +	};
> > +
> > +	sysirq: intpol-controller@10200620 {
> > +		compatible = "mediatek,mt6755-sysirq",
> > +			     "mediatek,mt6577-sysirq";
> > +		interrupt-controller;
> > +		#interrupt-cells = <3>;
> > +		interrupt-parent = <&gic>;
> > +		reg = <0 0x10200620 0 0x20>;
> > +	};
> > +
> > +	gic: interrupt-controller@10231000 {
> > +		compatible = "arm,gic-400";
> > +		#interrupt-cells = <3>;
> > +		interrupt-parent = <&gic>;
> > +		interrupt-controller;
> > +		reg = <0 0x10231000 0 0x1000>,
> > +		      <0 0x10232000 0 0x2000>,
> > +		      <0 0x10234000 0 0x2000>,
> > +		      <0 0x10236000 0 0x2000>;
> > +	};
> > +
> > +	uart0: serial@11002000 {
> > +		compatible = "mediatek,mt6755-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11002000 0 0x400>;
> > +		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&uart_clk>;
> 
> status = "disabled";

OK, will fix this.
> 
> > +	};
> > +
> > +	uart1: serial@11003000 {
> > +		compatible = "mediatek,mt6755-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11003000 0 0x400>;
> > +		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&uart_clk>;
> 
> same here.

OK, will fix this.

Thanks.
> 
> Regards,
> Matthias
