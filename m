From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH] ARM: dts: imx6ull: correct machine model name
Date: Thu, 23 Aug 2018 06:55:11 +0000
Message-ID: <DB3PR0402MB3916A1EF40BBFE0B52E8F059F5370@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1535005849-14046-1-git-send-email-Anson.Huang@nxp.com>
 <69b53468-ce73-9eeb-e11a-b6fa012a7ea6@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <69b53468-ce73-9eeb-e11a-b6fa012a7ea6@i2se.com>
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
To: Stefan Wahren <stefan.wahren@i2se.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Stefan

Anson Huang
Best Regards!


> -----Original Message-----
> From: Stefan Wahren <stefan.wahren@i2se.com>
> Sent: Thursday, August 23, 2018 2:53 PM
> To: Anson Huang <anson.huang@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Cc: dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH] ARM: dts: imx6ull: correct machine model name
> 
> Hi Anson,
> 
> 
> Am 23.08.2018 um 08:30 schrieb Anson Huang:
> > i.MX6ULL is a lite version of i.MX6UL, its full name is i.MX6
> > UltraLiteLite, NOT UlltraLite.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm/boot/dts/imx6ull-14x14-evk.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> > b/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> > index 30ef603..0ba6454 100644
> > --- a/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> > +++ b/arch/arm/boot/dts/imx6ull-14x14-evk.dts
> > @@ -45,7 +45,7 @@
> >  #include "imx6ul-14x14-evk.dtsi"
> >
> >  / {
> > -	model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
> > +	model = "Freescale i.MX6 UltraLiteLite 14x14 EVK Board";
> >  	compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";  };
> >
> 
> looks good, but this compatible should be documented in
> Documentation/devicetree/bindings/arm/fsl.txt (should be a separate patch).

Thanks for reminder, I will update the documentation as well in V2 patch. And looks
like we missed many i.MX6 platforms there, I will update them in separate patch as well.

Anson.

> 
> Regards
> Stefan
