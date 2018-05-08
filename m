From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PACTCH v5 1/2] ARM: dts: imx: Add basic dtsi file for imx6sll
Date: Tue, 8 May 2018 07:52:59 +0000
Message-ID: <HE1PR04MB311367AB4A74750B42DD9F19879A0@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1523606464-21561-1-git-send-email-ping.bai@nxp.com>
 <20180502065513.GA3443@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180502065513.GA3443@dragon>
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
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PACTCH v5 1/2] ARM: dts: imx: Add basic dtsi file for imx6sll
> 
> On Fri, Apr 13, 2018 at 04:01:03PM +0800, Bai Ping wrote:
> > Add dtsi file for imx6sll.
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  change v3->v4
> >  - update the license indentifier
> >  - remove leading zeros of node
> >  - move pin header to this patch
> >  change v4->v5
> >  - use generic name for device node
> > ---
> >  arch/arm/boot/dts/imx6sll-pinfunc.h | 880
> ++++++++++++++++++++++++++++++++++++
> >  arch/arm/boot/dts/imx6sll.dtsi      | 802
> ++++++++++++++++++++++++++++++++
> >  2 files changed, 1682 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/imx6sll-pinfunc.h
> >  create mode 100644 arch/arm/boot/dts/imx6sll.dtsi
> 
> <snip>
> 
> > +
> > +			epit1: epit@20d0000 {
> > +				reg = <0x020d0000 0x4000>;
> > +				interrupts = <GIC_SPI 56
> IRQ_TYPE_LEVEL_HIGH>;
> > +			};
> > +
> > +			epit2: epit@20d4000 {
> > +				reg = <0x020d4000 0x4000>;
> > +				interrupts = <GIC_SPI 57
> IRQ_TYPE_LEVEL_HIGH>;
> > +			};
> 
> 'timer' for node name.  If these devices are not used, I would even suggest
> to drop them.
> 

ok, will drop these node.

> > +
> > +			src: reset-controller@20d8000 {
> > +				compatible = "fsl,imx6sll-src";
> > +				reg = <0x020d8000 0x4000>;
> > +				interrupts = <GIC_SPI 91
> IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 96
> IRQ_TYPE_LEVEL_HIGH>;
> > +				#reset-cells = <1>;
> > +			};
> > +
> > +			gpc: interrupt-controller@20dc000 {
> > +				compatible = "fsl,imx6sll-gpc", "fsl,imx6q-
> gpc";
> > +				reg = <0x020dc000 0x4000>;
> > +				interrupt-controller;
> > +				#interrupt-cells = <3>;
> > +				interrupts = <GIC_SPI 89
> IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-parent = <&intc>;
> > +				fsl,mf-mix-wakeup-irq = <0x7c00000 0x7d00
> 0x0 0x1400640>;
> > +			};
> > +
> > +			iomuxc: pinctrl@20e0000 {
> > +				compatible = "fsl,imx6sll-iomuxc";
> > +				reg = <0x020e0000 0x4000>;
> > +			};
> > +
> > +			gpr: iomuxc-gpr@20e4000 {
> > +				compatible = "fsl,imx6sll-iomuxc-gpr",
> > +					     "fsl,imx6q-iomuxc-gpr", "syscon";
> > +				reg = <0x020e4000 0x4000>;
> > +			};
> > +
> > +			csi: csi@20e8000 {
> > +				compatible = "fsl,imx6sll-csi", "fsl,imx6s-csi";
> > +				reg = <0x020e8000 0x4000>;
> > +				interrupts = <GIC_SPI 7
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_DUMMY>,
> > +					 <&clks IMX6SLL_CLK_CSI>,
> > +					 <&clks IMX6SLL_CLK_DUMMY>;
> > +				clock-names = "disp-axi", "csi_mclk",
> "disp_dcic";
> > +				status = "disabled";
> > +			};
> > +
> > +			sdma: dma-controller@20ec000 {
> > +				compatible = "fsl,imx6sll-sdma", "fsl,imx35-
> sdma";
> > +				reg = <0x020ec000 0x4000>;
> > +				interrupts = <GIC_SPI 2
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_SDMA>,
> > +					 <&clks IMX6SLL_CLK_SDMA>;
> > +				clock-names = "ipg", "ahb";
> > +				#dma-cells = <3>;
> > +				iram = <&ocram>;
> > +				fsl,sdma-ram-script-name =
> "imx/sdma/sdma-imx6q.bin";
> > +			};
> > +
> > +			lcdif: lcd-controller@20f8000 {
> > +				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-
> lcdif";
> > +				reg = <0x020f8000 0x4000>;
> > +				interrupts = <GIC_SPI 39
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
> > +					 <&clks IMX6SLL_CLK_LCDIF_APB>,
> > +					 <&clks IMX6SLL_CLK_DUMMY>;
> > +				clock-names = "pix", "axi", "disp_axi";
> > +				status = "disabled";
> > +			};
> > +
> > +			dcp: dcp@20fc000 {
> > +				compatible = "fsl,imx6sl-dcp";
> 
> Is the compatible supported/documented?

It is compatible with imx28, I will change this compatible to " fsl,imx28-dcp "
> 
> > +				reg = <0x020fc000 0x4000>;
> > +				interrupts = <GIC_SPI 99
> IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 100
> IRQ_TYPE_LEVEL_HIGH>,
> > +					     <GIC_SPI 101
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_DCP>;
> > +				clock-names = "dcp";
> > +			};
> > +		};
> > +
> > +		aips2: aips-bus@2100000 {
> > +			compatible = "fsl,aips-bus", "simple-bus";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			reg = <0x02100000 0x100000>;
> > +			ranges;
> > +
> > +			usbotg1: usb@2184000 {
> > +				compatible = "fsl,imx6sll-usb", "fsl,imx6ul-
> usb",
> > +						"fsl,imx27-usb";
> > +				reg = <0x02184000 0x200>;
> > +				interrupts = <GIC_SPI 43
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_USBOH3>;
> > +				fsl,usbphy = <&usbphy1>;
> > +				fsl,usbmisc = <&usbmisc 0>;
> > +				fsl,anatop = <&anatop>;
> > +				ahb-burst-config = <0x0>;
> > +				tx-burst-size-dword = <0x10>;
> > +				rx-burst-size-dword = <0x10>;
> > +				status = "disabled";
> > +			};
> > +
> > +			usbotg2: usb@2184200 {
> > +				compatible = "fsl,imx6sll-usb", "fsl,imx6ul-
> usb",
> > +						"fsl,imx27-usb";
> > +				reg = <0x02184200 0x200>;
> > +				interrupts = <GIC_SPI 42
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_USBOH3>;
> > +				fsl,usbphy = <&usbphy2>;
> > +				fsl,usbmisc = <&usbmisc 1>;
> > +				ahb-burst-config = <0x0>;
> > +				tx-burst-size-dword = <0x10>;
> > +				rx-burst-size-dword = <0x10>;
> > +				status = "disabled";
> > +			};
> > +
> > +			usbmisc: usbmisc@2184800 {
> > +				#index-cells = <1>;
> > +				compatible = "fsl,imx6sll-usbmisc",
> "fsl,imx6ul-usbmisc",
> > +						"fsl,imx6q-usbmisc";
> > +				reg = <0x02184800 0x200>;
> > +			};
> > +
> > +			usdhc1: mmc@2190000 {
> > +				compatible = "fsl,imx6sll-usdhc", "fsl,imx6sx-
> usdhc";
> > +				reg = <0x02190000 0x4000>;
> > +				interrupts = <GIC_SPI 22
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_USDHC1>,
> > +					 <&clks IMX6SLL_CLK_USDHC1>,
> > +					 <&clks IMX6SLL_CLK_USDHC1>;
> > +				clock-names = "ipg", "ahb", "per";
> > +				bus-width = <4>;
> > +				fsl,tuning-step = <2>;
> > +				fsl,tuning-start-tap = <20>;
> > +				status = "disabled";
> > +			};
> > +
> > +			usdhc2: mmc@2194000 {
> > +				compatible = "fsl,imx6sll-usdhc", "fsl,imx6sx-
> usdhc";
> > +				reg = <0x02194000 0x4000>;
> > +				interrupts = <GIC_SPI 23
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_USDHC2>,
> > +					 <&clks IMX6SLL_CLK_USDHC2>,
> > +					 <&clks IMX6SLL_CLK_USDHC2>;
> > +				clock-names = "ipg", "ahb", "per";
> > +				bus-width = <4>;
> > +				fsl,tuning-step = <2>;
> > +				fsl,tuning-start-tap = <20>;
> > +				status = "disabled";
> > +			};
> > +
> > +			usdhc3: mmc@2198000 {
> > +				compatible = "fsl,imx6sll-usdhc", "fsl,imx6sx-
> usdhc";
> > +				reg = <0x02198000 0x4000>;
> > +				interrupts = <GIC_SPI 24
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_USDHC3>,
> > +					 <&clks IMX6SLL_CLK_USDHC3>,
> > +					 <&clks IMX6SLL_CLK_USDHC3>;
> > +				clock-names = "ipg", "ahb", "per";
> > +				bus-width = <4>;
> > +				fsl,tuning-step = <2>;
> > +				fsl,tuning-start-tap = <20>;
> > +				status = "disabled";
> > +			};
> > +
> > +			i2c1: i2c@21a0000 {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				compatible = "fs,imx6sll-i2c", "fsl,imx21-i2c";
> > +				reg = <0x021a0000 0x4000>;
> > +				interrupts = <GIC_SPI 36
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_I2C1>;
> > +				status = "disabled";
> > +			};
> > +
> > +			i2c2: i2c@21a4000 {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				compatible = "fsl,imx6sll-i2c", "fsl,imx21-i2c";
> > +				reg = <0x021a4000 0x4000>;
> > +				interrupts = <GIC_SPI 37
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_I2C2>;
> > +				status = "disabled";
> > +			};
> > +
> > +			i2c3: i2c@21a8000 {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				compatible = "fsl,imx6sll-i2c", "fsl,imx21-i2c";
> > +				reg = <0x021a8000 0x4000>;
> > +				interrupts = <GIC_SPI 38
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clks IMX6SLL_CLK_I2C3>;
> > +				status = "disabled";
> > +			};
> > +
> > +			romcp@21ac000 {
> > +				compatible = "fsl,imx6sll-romcp", "syscon";
> 
> The compatible "fsl,imx6sll-romcp" is undocumented.  If the device is not
> used by upstream kernel, I would even suggest to drop it.

Ok, will drop it. 

> 
> > +				reg = <0x021ac000 0x4000>;
> > +			};
> > +
> > +			mmdc: memory-controller@21b0000 {
> > +				compatible = "fsl,imx6sll-mmdc", "fsl,imx6q-
> mmdc";
> > +				reg = <0x021b0000 0x4000>;
> > +			};
> > +
> > +			rngb: rngb@21b4000 {
> 
> Is the device used at all?

will drop it.

> 
> > +				reg = <0x021b4000 0x4000>;
> > +				interrupts = <GIC_SPI 5
> IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =  <&clks IMX6SLL_CLK_DUMMY>;
> > +			};
> > +
> > +			ocotp: ocotp-ctrl@21bc000 {
> > +				compatible = "fsl,imx6sll-ocotp", "syscon";
> > +				reg = <0x021bc000 0x4000>;
> > +				clocks = <&clks IMX6SLL_CLK_OCOTP>;
> > +			};
> > +
> > +			snvs_gpr: snvs-gpr@21c4000 {
> > +				reg = <0x021c4000 0x10000>;
> > +			};
> 
> Ditto
> 
> > +
> > +			iomuxc_snvs: iomuxc-snvs@21c8000 {
> > +				reg = <0x021c8000 0x10000>;
> > +			};
> 
> Ditto
> 

Ok. Will drop these two.

> Shawn
> 
> > +
> > +			audmux: audmux@21d8000 {
> > +				compatible = "fsl,imx6sll-audmux",
> "fsl,imx31-audmux";
> > +				reg = <0x021d8000 0x4000>;
> > +				status = "disabled";
> > +			};
> > +
> > +			uart5: serial@21f4000 {
> > +				compatible = "fsl,imx6sll-uart", "fsl,imx6q-
> uart",
> > +					     "fsl,imx21-uart";
> > +				reg = <0x021f4000 0x4000>;
> > +				interrupts =<GIC_SPI 30
> IRQ_TYPE_LEVEL_HIGH>;
> > +				dmas = <&sdma 33 4 0>, <&sdma 34 4 0>;
> > +				dma-names = "rx", "tx";
> > +				clocks = <&clks IMX6SLL_CLK_UART5_IPG>,
> > +					 <&clks
> IMX6SLL_CLK_UART5_SERIAL>;
> > +				clock-names = "ipg", "per";
> > +				status = "disabled";
> > +			};
> > +		};
> > +	};
> > +};
> > --
> > 1.9.1
> >
