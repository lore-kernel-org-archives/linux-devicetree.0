From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v4 1/2] ARM: dts: imx: Add basic dtsi file for imx6sll
Date: Mon, 12 Mar 2018 04:43:07 +0000
Message-ID: <HE1PR04MB3113DC090D0608077D396DCB87D30@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1520503424-22985-1-git-send-email-ping.bai@nxp.com>
 <20180309233931.7xujvo4eg4g5ftri@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180309233931.7xujvo4eg4g5ftri@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
> > +		spi3 = &ecspi3;
> > +		spi4 = &ecspi4;
> > +		usbphy0 = &usbphy1;
> > +		usbphy1 = &usbphy2;
> 
> Why do you need a alias for phys?

The alias of usbphy seems used by drivers/usb/phy/phy-mxs-usb.c. So we need to add alias for usbphy.

> 
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible = "arm,cortex-a9";
> > +			device_type = "cpu";
> > +			reg = <0>;
> > +			next-level-cache = <&L2>;
> > +			operating-points = <
> > +				/* kHz    uV */
> > +				996000  1225000
> > +				792000  1175000
> > +				396000  1075000
> > +				198000	975000
> > +			>;
> > +			fsl,soc-operating-points = <
> 
> This is not documented.

This is same as we used on other imx6 SOC. I don't know where to add doc for this property. Please give me some suggestion.

BR
Jacky Bai
> 
> > +				/* ARM kHz      SOC-PU uV */
> > +				996000          1225000
> > +				792000          1175000
> > +				396000          1175000
> > +				198000		1175000
> > +			>;
> > +			clock-latency = <61036>; /* two CLK32 periods */
> > +			fsl,low-power-run;
