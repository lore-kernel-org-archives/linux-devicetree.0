From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/4] arm64: add basic DTS for i.MX8MQ
Date: Mon, 26 Feb 2018 15:09:58 +0800
Message-ID: <20180226070957.GU3217@dragon>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
 <20180201183126.32384-2-l.stach@pengutronix.de>
 <AM3PR04MB306E1344C6242887F4797AC80C20@AM3PR04MB306.eurprd04.prod.outlook.com>
 <20180226031700.GS3217@dragon>
 <AM3PR04MB3063F807F42E76CD515A17480C10@AM3PR04MB306.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM3PR04MB3063F807F42E76CD515A17480C10@AM3PR04MB306.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 06:52:15AM +0000, A.s. Dong wrote:
> Hi Shawn,
> 
> > -----Original Message-----
> > From: Shawn Guo [mailto:shawnguo@kernel.org]
> > Sent: Monday, February 26, 2018 11:17 AM
> > To: A.s. Dong <aisheng.dong@nxp.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>; Mark Rutland
> > <mark.rutland@arm.com>; devicetree@vger.kernel.org; Baruch Siach
> > <baruch@tkos.co.il>; Catalin Marinas <catalin.marinas@arm.com>; Will
> > Deacon <will.deacon@arm.com>; patchwork-lst@pengutronix.de; Rob
> > Herring <robh+dt@kernel.org>; dl-linux-imx <linux-imx@nxp.com>;
> > kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>; linux-
> > arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v2 2/4] arm64: add basic DTS for i.MX8MQ
> > 
> > On Sun, Feb 25, 2018 at 10:47:11AM +0000, A.s. Dong wrote:
> > > >  Documentation/devicetree/bindings/arm/fsl.txt  |   4 +
> > > >  arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 623
> > > > +++++++++++++++++++++++++
> > >
> > > Should this belongs to pinctrl part?
> > 
> > No.  Those pinfunc defines are used by device tree rather than pinctrl driver.
> > 
> 
> I had this question because we have below info in the patch
> "dt-bindings: add binding for i.MX8MQ IOMUXC":
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> new file mode 100644
> index 0000000..5c5d2d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> @@ -0,0 +1,39 @@
> ...
> +       Refer to imx8mq-pinfunc.h in device tree source folder for all available
> +       imx8mq PIN_FUNC_ID.

This is just a cross reference in document, and should be okay on
different tree during development cycle.  If we have the pinfunc header
go via pinctrl tree, we will have a more serious dependency between DT
and pinctrl tree.

Shawn
