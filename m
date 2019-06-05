From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v3 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Date: Wed, 5 Jun 2019 07:07:30 +0000
Message-ID: <VI1PR04MB53274359CFCA91AE6A3681678B160@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <20190527030616.44397-1-peter.chen@nxp.com>
 <20190527030616.44397-7-peter.chen@nxp.com> <20190605062517.GF29853@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190605062517.GF29853@dragon>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

 
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  arch/arm/boot/dts/imx7ulp.dtsi | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/imx7ulp.dtsi
> > b/arch/arm/boot/dts/imx7ulp.dtsi index fca6e50f37c8..37b058119505
> > 100644
> > --- a/arch/arm/boot/dts/imx7ulp.dtsi
> > +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> > @@ -30,6 +30,7 @@
> >  		serial1 = &lpuart5;
> >  		serial2 = &lpuart6;
> >  		serial3 = &lpuart7;
> > +		usbphy0 = &usbphy1;
> >  	};
> >
> >  	cpus {
> > @@ -133,6 +134,36 @@
> >  			clock-names = "ipg", "per";
> >  		};
> >
> > +		usbotg1: usb@40330000 {
> > +			compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> > +				"fsl,imx27-usb";
> 
> If "fsl,imx6ul-usb" is the one that imx7ulp device is compatible with and will match in
> driver, "fsl,imx27-usb" can just be dropped.  Same comment on usbmisc and
> usbphy below.
> 

Ok, will change, thanks.

Peter

> Shawn
> 
> > +			reg = <0x40330000 0x200>;
> > +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&pcc2 IMX7ULP_CLK_USB0>;
> > +			phys = <&usbphy1>;
> > +			fsl,usbmisc = <&usbmisc1 0>;
> > +			ahb-burst-config = <0x0>;
> > +			tx-burst-size-dword = <0x8>;
> > +			rx-burst-size-dword = <0x8>;
> > +			status = "disabled";
> > +		};
> > +
> > +		usbmisc1: usbmisc@40330200 {
> > +			compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> > +				"fsl,imx6q-usbmisc";
> > +			#index-cells = <1>;
> > +			reg = <0x40330200 0x200>;
> > +		};
> > +
> > +		usbphy1: usbphy@0x40350000 {
> > +			compatible = "fsl,imx7ulp-usbphy",
> > +				"fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> > +			reg = <0x40350000 0x1000>;
> > +			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> > +			#phy-cells = <0>;
> > +		};
> > +
> >  		usdhc0: mmc@40370000 {
> >  			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
> >  			reg = <0x40370000 0x10000>;
> > --
> > 2.14.1
> >
