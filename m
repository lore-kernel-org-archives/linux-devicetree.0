From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 3/4] arm64: dts: imx: add imx8qxp mek support
Date: Mon, 15 Oct 2018 08:40:12 +0000
Message-ID: <AM0PR04MB421127B6AB9AE67DB938A9AF80FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
 <1539527419-23613-4-git-send-email-aisheng.dong@nxp.com>
 <20181015070143.hzmai3nrsq7jd2fz@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181015070143.hzmai3nrsq7jd2fz@pengutronix.de>
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
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> Sent: Monday, October 15, 2018 3:02 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org; dongas86@gmail.com;
> kernel@pengutronix.de; shawnguo@kernel.org; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; catalin.marinas@arm.com;
> will.deacon@arm.com; dl-linux-imx <linux-imx@nxp.com>; Mark Rutland
> <mark.rutland@arm.com>; devicetree@vger.kernel.org
> Subject: Re: [PATCH V2 3/4] arm64: dts: imx: add imx8qxp mek support
> 
> On Sun, Oct 14, 2018 at 02:34:56PM +0000, A.s. Dong wrote:
> > Add imx8qxp mek board support.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.txt |   4 +
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 134
> > ++++++++++++++++++++++++++
> >  3 files changed, 139 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> >
> > +&iomuxc {
> > +	pinctrl_fec1: fec1grp {
> > +		fsl,pins = <
> > +			SC_P_ENET0_MDC_CONN_ENET0_MDC
> 	0x06000020
> > +			SC_P_ENET0_MDIO_CONN_ENET0_MDIO
> 	0x06000020
> > +			SC_P_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL
> 	0x06000020
> > +			SC_P_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC
> 	0x06000020
> > +			SC_P_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0
> 	0x06000020
> > +			SC_P_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1
> 	0x06000020
> > +			SC_P_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2
> 	0x06000020
> > +			SC_P_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3
> 	0x06000020
> > +			SC_P_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC
> 	0x06000020
> > +			SC_P_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL
> 	0x06000020
> > +			SC_P_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0
> 	0x06000020
> > +			SC_P_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1
> 	0x06000020
> > +			SC_P_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2
> 	0x06000020
> > +			SC_P_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3
> 	0x06000020
> 
> I doubt these names will be valid for future SoCs. They should have a IMX8QP_
> prefix.
> 

I agree, will change them.
Thanks for the suggestion.

Regards
Dong Aisheng

> --
> Pengutronix e.K.                           |
> |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.
> pengutronix.de%2F&amp;data=02%7C01%7Caisheng.dong%40nxp.com%7C86
> a3443c48ed4c7cd65008d6326c13b0%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C636751837102721123&amp;sdata=GBMxEXHoTYdhOl3ir9U
> bwZDsVxDAlefbq74tkuZGalk%3D&amp;reserved=0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |
