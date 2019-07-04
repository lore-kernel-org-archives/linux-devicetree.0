From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH V2 1/2] dt-bindings: reset: imx7: Add support for i.MX8MM
Date: Thu, 04 Jul 2019 11:47:51 +0200
Message-ID: <1562233671.6641.9.camel@pengutronix.de>
References: <20190704092600.38015-1-Anson.Huang@nxp.com>
         <1562233305.6641.8.camel@pengutronix.de>
         <DB3PR0402MB39167FBAA2A3867148063F83F5FA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39167FBAA2A3867148063F83F5FA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-07-04 at 09:46 +0000, Anson Huang wrote:
> Hi, Philipp
> 
> > On Thu, 2019-07-04 at 17:25 +0800, Anson.Huang@nxp.com wrote:
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > > 
> > > i.MX8MM can reuse i.MX8MQ's reset driver, update the compatible
> > > property and related info to support i.MX8MM.
> > > 
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > > New patch.
> > > ---
> > >  Documentation/devicetree/bindings/reset/fsl,imx7-src.txt | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > index 13e0951..bc24c45 100644
> > > --- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > +++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > @@ -7,7 +7,7 @@ controller binding usage.
> > >  Required properties:
> > >  - compatible:
> > >  	- For i.MX7 SoCs should be "fsl,imx7d-src", "syscon"
> > > -	- For i.MX8MQ SoCs should be "fsl,imx8mq-src", "syscon"
> > > +	- For i.MX8MQ/i.MX8MM SoCs should be "fsl,imx8mq-src", "syscon"
> > 
> > Please still add the "fsl,imx8mm-src" for i.MX8MM, just in case a significant
> > difference is discovered later.
> 
> OK, then I will add a new line as below:
> 
> For i.MX8MM SoCs should be "fsl,imx8mm-src", "fsl,imx8mq-src", "syscon"

Yes, that looks good, thanks.

regards
Philipp
