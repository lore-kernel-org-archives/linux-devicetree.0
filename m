From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v2 04/10] arm64: dts: mediatek: add mt6797 support
Date: Mon, 6 Feb 2017 20:37:33 +0800
Message-ID: <1486384653.18811.2.camel@mtkswgap22>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
         <1486383336-16892-5-git-send-email-mars.cheng@mediatek.com>
         <e944f97a-5c4c-780a-da29-fe308f807469@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e944f97a-5c4c-780a-da29-fe308f807469@arm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-02-06 at 12:28 +0000, Marc Zyngier wrote:
> On 06/02/17 12:15, Mars Cheng wrote:
> > This adds basic chip support for MT6797 SoC.
> > 
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
> >  arch/arm64/boot/dts/mediatek/mt6797-evb.dts |   36 ++++++
> >  arch/arm64/boot/dts/mediatek/mt6797.dtsi    |  187 +++++++++++++++++++++++++++
> >  3 files changed, 224 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt6797.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index 9fbfd32..015eb07 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -1,5 +1,6 @@
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
> >  
> >  always		:= $(dtb-y)
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6797-evb.dts b/arch/arm64/boot/dts/mediatek/mt6797-evb.dts
> > new file mode 100644
> > index 0000000..c79109c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6797-evb.dts
> 
> [...]
> 
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13
> > +			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>,
> 
> That's exactly why I positively hate these GIC_CPU_MASK_SIMPLE() and co.
> They just hide all kind of sins:
> - With GICv1/v2, this field can only be 8bit wide. Good luck shoving 10
> CPUs there.
> - GICv3 *doesn't* have any affinity bitmap in the binding (it can be
> expressed in a very different way).

> So please get rid of this GIC_CPU_MASK_SIMPLE, it is just wrong.
> 

Got it. Will remove these.

> > +			     <GIC_PPI 14
> > +			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 11
> > +			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 10
> > +			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>;
> > +	};
> > +
> > +	sysirq: intpol-controller@10200620 {
> > +		compatible = "mediatek,mt6797-sysirq",
> > +			     "mediatek,mt6577-sysirq";
> > +		interrupt-controller;
> > +		#interrupt-cells = <3>;
> > +		#intpol-bases = <2>;
> > +		interrupt-parent = <&gic>;
> > +		reg = <0 0x10220620 0 0x20>,
> > +		      <0 0x10220690 0 0x10>;
> > +	};
> > +
> > +	uart0: serial@11002000 {
> > +		compatible = "mediatek,mt6797-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11002000 0 0x400>;
> > +		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&clk26m>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart1: serial@11003000 {
> > +		compatible = "mediatek,mt6797-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11003000 0 0x400>;
> > +		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&clk26m>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart2: serial@11004000 {
> > +		compatible = "mediatek,mt6797-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11004000 0 0x400>;
> > +		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&clk26m>;
> > +		status = "disabled";
> > +	};
> > +
> > +	uart3: serial@11005000 {
> > +		compatible = "mediatek,mt6797-uart",
> > +			     "mediatek,mt6577-uart";
> > +		reg = <0 0x11005000 0 0x400>;
> > +		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&clk26m>;
> > +		status = "disabled";
> > +	};
> > +
> > +	gic: interrupt-controller@19000000 {
> > +		compatible = "arm,gic-v3";
> > +		#interrupt-cells = <3>;
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-controller;
> > +		reg = <0 0x19000000 0 0x10000>,    /* GICD */
> > +		      <0 0x19200000 0 0x200000>,   /* GICR */
> > +		      <0 0x10240000 0 0x2000>;     /* GICC */
> 
> No GICH, no GICV, no ITS?

Have confirmed with our HW guys, no GICH, GICV, ITS. :-)

> 
> > +	};
> > +};
> > 
> 
> Thanks,
> 
> 	M.


