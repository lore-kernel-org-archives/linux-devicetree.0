From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [v2 1/2] arm64: dts: ls1028a: Update the clock providers for the
 Mali DP500
Date: Mon, 7 Oct 2019 21:29:04 +0000
Message-ID: <VE1PR04MB66870A436BB8DC00979693D98F9B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190920083419.5092-1-wen.he_1@nxp.com>
 <20191007123203.GL7150@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191007123203.GL7150@dragon>
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
To: Shawn Guo <shawnguo@kernel.org>, Wen He <wen.he_1@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, October 7, 2019 7:32 AM
> To: Wen He <wen.he_1@nxp.com>
> Cc: linux-devel@linux.nxdi.nxp.com; Leo Li <leoyang.li@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [v2 1/2] arm64: dts: ls1028a: Update the clock providers for the
> Mali DP500
> 
> On Fri, Sep 20, 2019 at 04:34:18PM +0800, Wen He wrote:
> > In order to maximise performance of the LCD Controller's 64-bit AXI
> > bus, for any give speed bin of the device, the AXI master interface
> > clock(ACLK) clock can be up to CPU_frequency/2, which is already
> > capable of optimal performance. In general, ACLK is always expected to
> > be equal to CPU_frequency/2. APB slave interface clock(PCLK) and Main
> > processing clock(PCLK) both are tied to the same clock as ACLK.
> >
> > This change followed the LS1028A Architecture Specification Manual.
> >
> > Signed-off-by: Wen He <wen.he_1@nxp.com>
> 
> @Leo, agree?

Yes.

Acked-by: Li Yang <leoyang.li@nxp.com>

> 
> Shawn
> 
> > ---
> > change in v2:
> >         - add details commit description for this change.
> >         - v1: Link:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .kernel.org%2Fpatchwork%2Fpatch%2F1119145%2F&amp;data=02%7C01%
> 7Cleoyan
> >
> g.li%40nxp.com%7C628134d8d86548af60ab08d74b227a54%7C686ea1d3bc2b4
> c6fa9
> >
> 2cd99c5c301635%7C0%7C0%7C637060483779667257&amp;sdata=vX2DqsXlKE
> SqesXy
> > LwTqnBFt0GftY0XNphkmx5dR7vA%3D&amp;reserved=0
> >
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 17 ++---------------
> >  1 file changed, 2 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index 72b9a75976a1..51fa8f57fdac 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -86,20 +86,6 @@
> >  		clocks = <&osc_27m>;
> >  	};
> >
> > -	aclk: clock-axi {
> > -		compatible = "fixed-clock";
> > -		#clock-cells = <0>;
> > -		clock-frequency = <650000000>;
> > -		clock-output-names= "aclk";
> > -	};
> > -
> > -	pclk: clock-apb {
> > -		compatible = "fixed-clock";
> > -		#clock-cells = <0>;
> > -		clock-frequency = <650000000>;
> > -		clock-output-names= "pclk";
> > -	};
> > -
> >  	reboot {
> >  		compatible ="syscon-reboot";
> >  		regmap = <&dcfg>;
> > @@ -679,7 +665,8 @@
> >  		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
> >  			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
> >  		interrupt-names = "DE", "SE";
> > -		clocks = <&dpclk 0>, <&aclk>, <&aclk>, <&pclk>;
> > +		clocks = <&dpclk 0>, <&clockgen 2 2>, <&clockgen 2 2>,
> > +			 <&clockgen 2 2>;
> >  		clock-names = "pxlclk", "mclk", "aclk", "pclk";
> >  		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> >  		arm,malidp-arqos-value = <0xd000d000>;
> > --
> > 2.17.1
> >
