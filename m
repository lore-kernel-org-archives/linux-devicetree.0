From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Date: Mon, 26 Aug 2019 03:24:45 +0000
Message-ID: <AM0PR04MB42117031C494202F24A7439980A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
 <20190824191957.GF16308@X250.getinternet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190824191957.GF16308@X250.getinternet.no>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Sunday, August 25, 2019 3:20 AM
> Subject: Re: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
> parse clocks from device tree
> 
> On Tue, Aug 20, 2019 at 07:13:15AM -0400, Dong Aisheng wrote:
> > There's a few limitations on the original one cell clock binding
> > (#clock-cells = <1>) that we have to define some SW clock IDs for
> > device tree to reference. This may cause troubles if we want to use
> > common clock IDs for multi platforms support when the clock of those
> > platforms are mostly the same.
> > e.g. Current clock IDs name are defined with SS prefix.
> >
> > However the device may reside in different SS across CPUs, that means
> > the SS prefix may not valid anymore for a new SoC. Furthermore, the
> > device availability of those clocks may also vary a bit.
> >
> > For such situation, we want to eliminate the using of SW Clock IDs and
> > change to use a more close to HW one instead.
> > For SCU clocks usage, only two params required: Resource id + Clock Type.
> > Both parameters are platform independent. So we could use two cells
> > binding to pass those parameters,
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> I'm fine with it.
> 
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> 

And this one.

Stephen & Rob,
Do you have change to look at it?

We need this to be finalized early for the following work.

Regards
Aisheng


> Shawn
> 
> > ---
> > ChangeLog:
> > v3->v4:
> >  * add some comments for various clock types
> > v2->v3:
> >  * Changed to two cells binding and register all clocks in driver
> >    instead of parse from device tree.
> > v1->v2:
> >  * changed to one cell binding inspired by arm,scpi.txt
> >    Documentation/devicetree/bindings/arm/arm,scpi.txt
> >    Resource ID is encoded in 'reg' property.
> >    Clock type is encoded in generic clock-indices property.
> >    Then we don't have to search all the DT nodes to fetch
> >    those two value to construct clocks which is relatively
> >    low efficiency.
> >  * Add required power-domain property as well.
> > ---
> >  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 12 ++++++-----
> >  include/dt-bindings/firmware/imx/rsrc.h            | 23
> ++++++++++++++++++++++
> >  2 files changed, 30 insertions(+), 5 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > index a575e42..8cee5bf 100644
> > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > @@ -89,7 +89,10 @@ Required properties:
> >  			  "fsl,imx8qm-clock"
> >  			  "fsl,imx8qxp-clock"
> >  			followed by "fsl,scu-clk"
> > -- #clock-cells:		Should be 1. Contains the Clock ID value.
> > +- #clock-cells:		Should be either
> > +			2: Contains the Resource and Clock ID value.
> > +			or
> > +			1: Contains the Clock ID value. (DEPRECATED)
> >  - clocks:		List of clock specifiers, must contain an entry for
> >  			each required entry in clock-names
> >  - clock-names:		Should include entries "xtal_32KHz", "xtal_24MHz"
> > @@ -184,7 +187,7 @@ firmware {
> >
> >  		clk: clk {
> >  			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> > -			#clock-cells = <1>;
> > +			#clock-cells = <2>;
> >  		};
> >
> >  		iomuxc {
> > @@ -229,8 +232,7 @@ serial@5a060000 {
> >  	...
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_lpuart0>;
> > -	clocks = <&clk IMX8QXP_UART0_CLK>,
> > -		 <&clk IMX8QXP_UART0_IPG_CLK>;
> > -	clock-names = "per", "ipg";
> > +	clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
> > +	clock-names = "ipg";
> >  	power-domains = <&pd IMX_SC_R_UART_0>;  }; diff --git
> > a/include/dt-bindings/firmware/imx/rsrc.h
> > b/include/dt-bindings/firmware/imx/rsrc.h
> > index 4e61f64..24c153d 100644
> > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > @@ -547,4 +547,27 @@
> >  #define IMX_SC_R_ATTESTATION		545
> >  #define IMX_SC_R_LAST			546
> >
> > +/*
> > + * Defines for SC PM CLK
> > + */
> > +
> > +/* Normal device resource clock */
> > +#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
> > +#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
> > +#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
> > +#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
> > +#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
> > +
> > +/* Special clock types which do not belong to above normal clock types */
> > +#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
> > +#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
> > +#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
> > +#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
> > +#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
> > +
> > +/* Special clock types for CPU/PLL/BYPASS only */
> > +#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
> > +#define IMX_SC_PM_CLK_PLL		4	/* PLL */
> > +#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
> > +
> >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > --
> > 2.7.4
> >
