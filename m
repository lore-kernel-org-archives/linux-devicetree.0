From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: add mt6755 support
Date: Tue, 21 Jun 2016 08:50:18 +0800
Message-ID: <1466470218.863.4.camel@mtkswgap22>
References: <1465870805-10451-1-git-send-email-mars.cheng@mediatek.com>
	 <1465870805-10451-3-git-send-email-mars.cheng@mediatek.com>
	 <5767A9FB.3010007@gmail.com> <1466414350.3378.9.camel@mtkswgap22>
	 <5768233B.8080109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5768233B.8080109@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-06-20 at 19:09 +0200, Matthias Brugger wrote:

> >>> +	uart_clk: dummy26m {
> >>> +		compatible = "fixed-clock";
> >>> +		clock-frequency = <26000000>;
> >>> +		#clock-cells = <0>;
> >>> +	};
> >>> +
> >>
> >> We can do that, but I would prefer to see the clock driver early. So
> >> that the DTS we carry around as complete as possible.
> >>
> >
> > OK, I will merge the clk later. However, the clk driver would be
> > submmited later, is that OK? Or would you prefer sunmmit clk driver
> > together?
> >
> 
> The uart won't work without any clock node. It is OK like this. I just 
> wanted to emphasis that we should try to get the clock driver accpeted 
> early in the effort.
> 
> Thanks,
> Matthias

Got it. I will not include the clk dts & driver in basic chip patch
v2.We will submmit clk driver soon after this basic chip support patch.

Thanks.

> 
> >>> +	timer {
> >>> +		compatible = "arm,armv8-timer";
> >>> +		interrupt-parent = <&gic>;
> >>> +		interrupts = <GIC_PPI 13
> >>> +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> >>> +			     <GIC_PPI 14
> >>> +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> >>> +			     <GIC_PPI 11
> >>> +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> >>> +			     <GIC_PPI 10
> >>> +			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> >>> +	};
> >>> +
> >>> +	sysirq: intpol-controller@10200620 {
> >>> +		compatible = "mediatek,mt6755-sysirq",
> >>> +			     "mediatek,mt6577-sysirq";
> >>> +		interrupt-controller;
> >>> +		#interrupt-cells = <3>;
> >>> +		interrupt-parent = <&gic>;
> >>> +		reg = <0 0x10200620 0 0x20>;
> >>> +	};
> >>> +
> >>> +	gic: interrupt-controller@10231000 {
> >>> +		compatible = "arm,gic-400";
> >>> +		#interrupt-cells = <3>;
> >>> +		interrupt-parent = <&gic>;
> >>> +		interrupt-controller;
> >>> +		reg = <0 0x10231000 0 0x1000>,
> >>> +		      <0 0x10232000 0 0x2000>,
> >>> +		      <0 0x10234000 0 0x2000>,
> >>> +		      <0 0x10236000 0 0x2000>;
> >>> +	};
> >>> +
> >>> +	uart0: serial@11002000 {
> >>> +		compatible = "mediatek,mt6755-uart",
> >>> +			     "mediatek,mt6577-uart";
> >>> +		reg = <0 0x11002000 0 0x400>;
> >>> +		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
> >>> +		clocks = <&uart_clk>;
> >>
> >> status = "disabled";
> >
> > OK, will fix this.
> >>
> >>> +	};
> >>> +
> >>> +	uart1: serial@11003000 {
> >>> +		compatible = "mediatek,mt6755-uart",
> >>> +			     "mediatek,mt6577-uart";
> >>> +		reg = <0 0x11003000 0 0x400>;
> >>> +		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
> >>> +		clocks = <&uart_clk>;
> >>
> >> same here.
> >
> > OK, will fix this.
> >
> > Thanks.
> >>
> >> Regards,
> >> Matthias
> >
> >
