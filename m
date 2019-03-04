From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 1/3] arm64: dts: imx: Add i.mx8mm dtsi support
Date: Mon, 4 Mar 2019 09:46:27 +0000
Message-ID: <VI1PR0402MB35194795B82674A5E4AFEFEC87710@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1551691021-31505-1-git-send-email-ping.bai@nxp.com>
 <64515f6b211b15f54a66fd7619193c66c2822224.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <64515f6b211b15f54a66fd7619193c66c2822224.camel@nxp.com>
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
To: Daniel Baluta <daniel.baluta@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH 1/3] arm64: dts: imx: Add i.mx8mm dtsi support
> 
> Hi Ping,
> 
> Thanks a lot for the patch. Few comments inline:
> 

OK, I will fix these V2.

BR
Jacky Bai
> On Mon, 2019-03-04 at 09:12 +0000, Jacky Bai wrote:
> > +
> > +	soc@0 {
> > +		compatible = "simple-bus";
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> 
> This should be  #address-cells = <1>; Look at the patches for 8MQ.
> 
> >
> > +			sdma2: dma-controller@302c0000 {
> > +				compatible = "fsl,imx8mq-sdma",
> > "fsl,imx7d-sdma";
> > +				reg = <0x0 0x302c0000 0x0 0x10000>;
> > +				interrupts = <GIC_SPI 103
> > IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_SDMA2_ROOT>,
> > +					 <&clk IMX8MM_CLK_SDMA2_ROOT>;
> > +				clock-names = "ipg", "ahb";
> > +				#dma-cells = <3>;
> > +				fsl,sdma-ram-script-name =
> > "imx/sdma/sdma-imx7d.bin";
> > +				fsl,ratio-1-1;
> 
> This property is not in the upstream kernel. Please remove it.
> 
> > +				status = "okay";
> 
> No need to add status okay here. It is the default option.
> 
> > +			};
> > +
> > +			sdma3: dma-controller@302b0000 {
> > +				compatible = "fsl,imx8mq-sdma",
> > "fsl,imx7d-sdma";
> > +				reg = <0x0 0x302b0000 0x0 0x10000>;
> > +				interrupts = <GIC_SPI 34
> > IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MM_CLK_SDMA3_ROOT>,
> > +				 <&clk IMX8MM_CLK_SDMA3_ROOT>;
> > +				clock-names = "ipg", "ahb";
> > +				#dma-cells = <3>;
> > +				fsl,sdma-ram-script-name =
> > "imx/sdma/sdma-imx7d.bin";
> > +				fsl,ratio-1-1;
> > +				status = "okay";
> 
> Ditto.
> 
> thanks,
> Daniel.
