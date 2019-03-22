From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 1/3] arm64: dts: imx: Add i.mx8mm dtsi support
Date: Fri, 22 Mar 2019 01:55:45 +0000
Message-ID: <VI1PR0402MB351954C0C30D3AD28C77A77187430@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1552369779-7614-1-git-send-email-ping.bai@nxp.com>
 <20190321082253.GD12513@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190321082253.GD12513@dragon>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH v2 1/3] arm64: dts: imx: Add i.mx8mm dtsi support
> 
> On Tue, Mar 12, 2019 at 05:44:53AM +0000, Jacky Bai wrote:
> > The i.MX8M Mini is new SOC of the i.MX8M family. it is focused on
> > delivering the latest and greatest video and audio experience
> > combining state-of-the-art media-specific features with
> > high-performance processing while optimized for lowest power
> > consumption. The i.MX 8M Mini Media Applications Processor is  14nm
> > FinFET product of the growing i.MX8M family targeting the consumer &
> > industrial market. It is built in 14LPP to achieve both high
> > performance and low power consumption and relies on a powerful fully
> > coherent core complex based on a quad Cortex-A53 cluster with video
> > and graphics accelerators
> >
> > This patch adds the basic dtsi support for i.MX8MM.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  change v1->v2:
> >  - removed unnecessary 'okay' status
> >  - change AIPS's address-cells and size-cells to '1'
> >  - remove sdma's undocumented property
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 717
> > ++++++++++++++++++++++++++++++
> >  1 file changed, 717 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mm.dtsi

...

> > +	};
> > +
> > +	soc@0 {
> 
> The unit-address 0 makes no sense here, right?

Yes, I will remove this in V3.

> > +			gpio5: gpio@30240000 {
> > +				compatible = "fsl,imx8mm-gpio", "fsl,imx35-gpio";
> > +				reg = <0x30240000 0x10000>;
> > +				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > +				gpio-controller;
> > +				#gpio-cells = <2>;
> > +				interrupt-controller;
> > +				#interrupt-cells = <2>;
> > +			};
> > +
> > +			wdog1: wdog@30280000 {
> 
> watchdog for node name.

ok, will fix it.

> 
> > +				compatible = "fsl,imx21-wdt";
> 
> Don't you need a "fsl,imx8mm-wdt"?
> 

ok, I will add it.

> > +
> > +			sdma2: dma-controller@302c0000 {
> > +				compatible = "fsl,imx8mq-sdma", "fsl,imx7d-sdma";
> 
> Should be fsl,imx8mm-sdma?

OK, will fix it.

> 
> > +				reg = <0x302c0000 0x10000>;
> > +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_SDMA2_ROOT>,
> > +					 <&clk IMX8MM_CLK_SDMA2_ROOT>;
> > +				clock-names = "ipg", "ahb";
> > +				#dma-cells = <3>;
> > +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> 
> i.mx8mm reuses the exactly same SDMA RAM script as imx7d?
> 

Yes, imx8mm reuse the same firmware at present.

> > +
> > +			ocotp: ocotp-ctrl@30350000 {
> > +				compatible = "fsl,imx8mq-ocotp", "fsl,imx7d-ocotp",
> "syscon";
> 
> Should be fsl,imx8mm-ocotp?

Ok, will fix it.

> 
> > +				reg = <0x30350000 0x10000>;
> > +				clocks = <&clk IMX8MM_CLK_OCOTP_ROOT>;
> > +				/* For nvmem subnodes */
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +			};
> > +
> > +			anatop: anatop@30360000 {
> > +				compatible = "fsl,imx8mm-anatop", "syscon",
> "simple-bus";
> > +				reg = <0x30360000 0x10000>;
> > +			};
> > +
> > +			snvs: snvs@30370000 {
> > +				compatible = "fsl,sec-v4.0-mon","syscon", "simple-mfd";
> > +				reg = <0x30370000 0x10000>;
> > +
> > +				snvs_rtc: snvs-rtc-lp{
> 
> Miss one space before {.

Ok, will fix it.

> 
> > +					compatible = "fsl,sec-v4.0-mon-rtc-lp";
> > +					regmap =<&snvs>;
> 
> Miss one space after =.
> 

Thanks, will fix it

> > +					offset = <0x34>;
> > +					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> > +						     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > +				};
> > +
> > +				snvs_pwrkey: snvs-powerkey {
> > +					compatible = "fsl,sec-v4.0-pwrkey";
> > +					regmap = <&snvs>;
> > +					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > +					linux,keycode = <KEY_POWER>;
> > +					wakeup-source;
> > +				};
> > +			};
> > +
> > +			clk: clock-controller@30380000 {
> > +				compatible = "fsl,imx8mm-ccm";
> > +				reg = <0x30380000 0x10000>;
> > +				#clock-cells = <1>;
> > +				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>,
> <&clk_ext2>,
> > +					 <&clk_ext3>, <&clk_ext4>;
> > +				clock-names = "osc_32k", "osc_24m", "clk_ext1",
> "clk_ext2",
> > +					      "clk_ext3", "clk_ext4";
> > +			};
> > +
> > +			src: src@30390000 {
> 
> reset-controller for node name?
> 

Ok, will fix it.

> > +				compatible = "fsl,imx8mm-src", "syscon";
> > +				reg = <0x30390000 0x10000>;
> > +				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +				#reset-cells = <1>;
> > +			};
> > +
> > +			gpc: gpc@303a0000 {
> 
> interrupt-controller for node name?
>

For the i.MX8MM and future i.MX8M serious, it is not very necessary to use GPC as a interrupt controller
in linux kernel side. For system suspend, ATF can config the GPC IMRs based on IRQ enable status in GICv3.
For cpuidle support, GICv3 has per-CPU core wakeup signals connected to the GPC logic, so GICv3 has the ability
to wake up the corresponding CPU core if the IRQ is routed to that CPU core. Additionally, I am thinking to
config the GPC as a secure resource in the future.

Maybe, we can remove the GPC node for now. If necessary, we can add it back again?

BTW, i.MX8MQ is a special case due to some HW issue, GPC still need to be used as a interrupt controller in kernel.

> > +				compatible = "fsl,imx8mm-gpc", "syscon";
> > +				reg = <0x303a0000 0x10000>;
> > +				interrupt-controller;
> > +				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> > +				#interrupt-cells = <3>;
> > +			};
> > +		};

...

> > +		aips3: bus@30800000 {
> > +			compatible = "fsl,aips-bus", "simple-bus";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges;
> > +
> > +			ecspi1: ecspi@30820000 {
> 
> spi for node name?
> 

OK, will fix it.

> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> 
> We usually start properties with compatible.  Can these be moved
> somewhere after compatible?
> 

Ok, will fix it

> > +				compatible = "fsl,imx8mm-ecspi", "fsl,imx51-ecspi";
> > +				reg = <0x30820000 0x10000>;
> > +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_ECSPI1_ROOT>,
> > +					 <&clk IMX8MM_CLK_ECSPI1_ROOT>;
> > +				clock-names = "ipg", "per";
> > +				dmas = <&sdma1 0 7 1>, <&sdma1 1 7 2>;
> > +				dma-names = "rx", "tx";
> > +				status = "disabled";
> > +			};

....

> > +
> > +			uart1: serial@30860000 {
> > +				compatible = "fsl,imx8mm-uart",
> > +					     "fsl,imx6q-uart", "fsl,imx21-uart";
> 
> I think "fsl,imx21-uart" can be dropped in this case?
> 

Ok, I will remove this.

> > +				reg = <0x30860000 0x10000>;
> > +				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_UART1_ROOT>,
> > +					 <&clk IMX8MM_CLK_UART1_ROOT>;
> > +				clock-names = "ipg", "per";
> > +				dmas = <&sdma1 22 4 0>, <&sdma1 23 4 0>;
> > +				dma-names = "rx", "tx";
> > +				status = "disabled";
> > +			};
> > +

...

> > +
> > +			usdhc1: mmc@30b40000 {
> > +				compatible = "fsl,imx8mq-usdhc", "fsl,imx7d-usdhc";
> 
> Should be fsl,imx8mm-usdhc?
> 

Ok, will fix it.

> > +				reg = <0x30b40000 0x10000>;
> > +				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_DUMMY>,
> > +					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
> > +					 <&clk IMX8MM_CLK_USDHC1_ROOT>;
> > +				clock-names = "ipg", "ahb", "per";
> > +				assigned-clocks = <&clk IMX8MM_CLK_USDHC1>;
> > +				assigned-clock-rates = <400000000>;
> > +				fsl,tuning-start-tap = <20>;
> > +				fsl,tuning-step= <2>;
> > +				bus-width = <4>;
> > +				status = "disabled";
> > +			};
> > +

...

> > +
> > +			sdma1: dma-controller@30bd0000 {
> > +				compatible = "fsl,imx8mq-sdma", "fsl,imx7d-sdma";
> 
> Should be fsl,imx8mm-sdma?
> 

Ok, will update it.

> > +				reg = <0x30bd0000 0x10000>;
> > +				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_SDMA1_ROOT>,
> > +					 <&clk IMX8MM_CLK_SDMA1_ROOT>;
> > +				clock-names = "ipg", "ahb";
> > +				#dma-cells = <3>;
> > +				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> > +			};
> > +
> > +			fec1: ethernet@30be0000 {
> > +				compatible = "fsl,imx8mq-fec", "fsl,imx6sx-fec";
> 
> Should be fsl,imx8mm-fec?
> 

Ok, will update it

> > +				reg = <0x30be0000 0x10000>;
> > +				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_ENET1_ROOT>,
> > +					 <&clk IMX8MM_CLK_ENET1_ROOT>,
> > +					 <&clk IMX8MM_CLK_ENET_TIMER>,
> > +					 <&clk IMX8MM_CLK_ENET_REF>,
> > +					 <&clk IMX8MM_CLK_ENET_PHY_REF>;
> > +				clock-names = "ipg", "ahb", "ptp",
> > +					      "enet_clk_ref", "enet_out";
> > +				assigned-clocks = <&clk IMX8MM_CLK_ENET_AXI>,
> > +						  <&clk IMX8MM_CLK_ENET_TIMER>,
> > +						  <&clk IMX8MM_CLK_ENET_REF>,
> > +						  <&clk IMX8MM_CLK_ENET_TIMER>;
> > +				assigned-clock-parents = <&clk
> IMX8MM_SYS_PLL1_266M>,
> > +							 <&clk IMX8MM_SYS_PLL2_100M>,
> > +							 <&clk IMX8MM_SYS_PLL2_125M>;
> > +				assigned-clock-rates = <0>, <0>, <125000000>,
> <100000000>;
> > +				stop-mode = <&gpr 0x10 3>;
> 
> vendor property?
> 

Yes, will remove it.

> > +				fsl,num-tx-queues=<3>;
> > +				fsl,num-rx-queues=<3>;
> 
> Miss space before and after =.
>

Thanks, will fix it.

> > +				fsl,wakeup_irq = <2>;
> 
> vendor property?
> 

Yes, will remove it

> > +				status = "disabled";
> > +			};
> > +
> > +		};
> > +
> > +		aips4: bus@32c00000 {
> > +			compatible = "fsl,aips-bus", "simple-bus";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges;
> > +
> > +			usbotg1: usb@32e40000 {
> > +				compatible = "fsl,imx8mm-usb", "fsl,imx7d-usb",
> "fsl,imx27-usb";
> 
> fsl,imx27-usb can be saved?

ok, will remove it.

> 
> > +				reg = <0x32e40000 0x200>;
> > +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
> > +				clock-names = "usb1_ctrl_root_clk";
> > +				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>,
> > +						  <&clk IMX8MM_CLK_USB_CORE_REF>;
> > +				assigned-clock-parents = <&clk
> IMX8MM_SYS_PLL2_500M>,
> > +							 <&clk IMX8MM_SYS_PLL1_100M>;
> > +				fsl,usbphy = <&usbphynop1>;
> > +				fsl,usbmisc = <&usbmisc1 0>;
> > +				status = "disabled";
> > +			};
> > +
> > +			usbphynop1: usbphynop1 {
> > +				compatible = "usb-nop-xceiv";
> > +				clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
> > +				assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
> > +				assigned-clock-parents = <&clk
> IMX8MM_SYS_PLL1_100M>;
> > +				clock-names = "main_clk";
> > +			};
> > +
> > +			usbmisc1: usbmisc@32e40200 {
> > +				#index-cells = <1>;
> 
> Move it afterwards?
> 

OK, thanks.

> > +				compatible = "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
> 
> Should be compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc"?
> 

Ok, will fix it.

> > +				reg = <0x32e40200 0x200>;
> > +			};
> > +
> > +			usbotg2: usb@32e50000 {
> > +				compatible = "fsl,imx8mm-usb", "fsl,imx7d-usb",
> "fsl,imx27-usb";
> > +				reg = <0x32e50000 0x200>;
> > +				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
> > +				clock-names = "usb1_ctrl_root_clk";
> > +				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>,
> > +						  <&clk IMX8MM_CLK_USB_CORE_REF>;
> > +				assigned-clock-parents = <&clk
> IMX8MM_SYS_PLL2_500M>,
> > +							 <&clk IMX8MM_SYS_PLL1_100M>;
> > +				fsl,usbphy = <&usbphynop2>;
> > +				fsl,usbmisc = <&usbmisc2 0>;
> > +				status = "disabled";
> > +			};
> > +
> > +			usbphynop2: usbphynop2 {
> > +				compatible = "usb-nop-xceiv";
> > +				clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
> > +				assigned-clocks = <&clk IMX8MM_CLK_USB_PHY_REF>;
> > +				assigned-clock-parents = <&clk
> IMX8MM_SYS_PLL1_100M>;
> > +				clock-names = "main_clk";
> > +			};
> > +
> > +			usbmisc2: usbmisc@32e50200 {
> > +				#index-cells = <1>;
> > +				compatible = "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
> > +				reg = <0x32e50200 0x200>;
> > +			};
> > +
> > +		};
> > +
> > +		dma_apbh: dma-apbh@33000000 {
> 
> dma-controller for node name.
> 
Ok. Thanks

> > +			compatible = "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
> > +			reg = <0x33000000 0x2000>;
> > +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "gpmi0", "gpmi1", "gpmi2", "gpmi3";
> > +			#dma-cells = <1>;
> > +			dma-channels = <4>;
> > +			clocks = <&clk
> IMX8MM_CLK_NAND_USDHC_BUS_RAWNAND_CLK>;
> > +		};
> > +
> > +		gpmi: gpmi-nand@33002000{
> 
> nand-controller for node name.
> 

Ok, will fix it.

> > +			compatible = "fsl,imx7d-gpmi-nand";
> 
> fsl,imx8mm-gpmi-nand before it?
>
Ok, thanks.
 
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
> > +			reg-names = "gpmi-nand", "bch";
> > +			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "bch";
> > +			clocks = <&clk IMX8MM_CLK_NAND_ROOT>,
> > +			<&clk IMX8MM_CLK_NAND_USDHC_BUS_RAWNAND_CLK>;
> 
> Miss indentation.
> 

Thanks for review, will fix this.

BR

> Shawn
> 
> > +			clock-names = "gpmi_io", "gpmi_bch_apb";
> > +			dmas = <&dma_apbh 0>;
> > +			dma-names = "rx-tx";
> > +			status = "disabled";
> > +		};
> > +	};
> > +};
> > --
> > 1.9.1
> >
