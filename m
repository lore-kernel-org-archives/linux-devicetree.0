From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH] arm64: dts: imx8mm: Move gic node into soc node
Date: Thu, 6 Jun 2019 02:38:38 +0000
Message-ID: <DB3PR0402MB3916D9019F65E901DC4E6BDAF5170@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190603015020.41410-1-Anson.Huang@nxp.com>
 <20190606021803.GW29853@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190606021803.GW29853@dragon>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Thursday, June 6, 2019 10:18 AM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; Leonard Crestez
> <leonard.crestez@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> viresh.kumar@linaro.org; Jacky Bai <ping.bai@nxp.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH] arm64: dts: imx8mm: Move gic node into soc node
> 
> On Mon, Jun 03, 2019 at 09:50:20AM +0800, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > GIC is inside of SoC from architecture perspective, it should be
> > located inside of soc node in DT.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> 
> It doesn't apply to my imx/dt64 branch.  Please generate it against that
> branch for my for-next.

OK, just resent the patch based on the correct branch.

Thanks,
Anson.

> 
> Shawn
> 
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > index dc99f45..429312e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -169,15 +169,6 @@
> >  		clock-output-names = "clk_ext4";
> >  	};
> >
> > -	gic: interrupt-controller@38800000 {
> > -		compatible = "arm,gic-v3";
> > -		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> > -		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base +
> SGI_base) */
> > -		#interrupt-cells = <3>;
> > -		interrupt-controller;
> > -		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > -	};
> > -
> >  	psci {
> >  		compatible = "arm,psci-1.0";
> >  		method = "smc";
> > @@ -739,6 +730,15 @@
> >  			dma-names = "rx-tx";
> >  			status = "disabled";
> >  		};
> > +
> > +		gic: interrupt-controller@38800000 {
> > +			compatible = "arm,gic-v3";
> > +			reg = <0x38800000 0x10000>, /* GIC Dist */
> > +			      <0x38880000 0xc0000>; /* GICR (RD_base +
> SGI_base) */
> > +			#interrupt-cells = <3>;
> > +			interrupt-controller;
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> >  	};
> >
> >  	usbphynop1: usbphynop1 {
> > --
> > 2.7.4
> >
