From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH V3 1/2] dt-bindings: reset: imx7: Add support for i.MX8MM
Date: Fri, 05 Jul 2019 10:02:28 +0200
Message-ID: <1562313748.4291.3.camel@pengutronix.de>
References: <20190704094416.4757-1-Anson.Huang@nxp.com>
         <1562235363.6641.10.camel@pengutronix.de>
         <DB3PR0402MB39167B9A3CFAE6D8798B3CAEF5F50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39167B9A3CFAE6D8798B3CAEF5F50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Fri, 2019-07-05 at 00:26 +0000, Anson Huang wrote:
> Hi, Philipp
> 
> > On Thu, 2019-07-04 at 17:44 +0800, Anson.Huang@nxp.com wrote:
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > > 
> > > i.MX8MM can reuse i.MX8MQ's reset driver, update the compatible
> > > property and related info to support i.MX8MM.
> > > 
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > > Changes since V2:
> > > 	- Add separate line for i.MX8MM in case anything different later for
> > 
> > i.MX8MM.
> > > ---
> > >  Documentation/devicetree/bindings/reset/fsl,imx7-src.txt | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > index 13e0951..c2489e4 100644
> > > --- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > +++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> > > @@ -8,6 +8,7 @@ Required properties:
> > >  - compatible:
> > >  	- For i.MX7 SoCs should be "fsl,imx7d-src", "syscon"
> > >  	- For i.MX8MQ SoCs should be "fsl,imx8mq-src", "syscon"
> > > +	- For i.MX8MM SoCs should be "fsl,imx8mm-src", "fsl,imx8mq-src",
> > 
> > "syscon"
> > >  - reg: should be register base and length as documented in the
> > >    datasheet
> > >  - interrupts: Should contain SRC interrupt @@ -46,5 +47,6 @@ Example:
> > > 
> > > 
> > >  For list of all valid reset indices see
> > > -<dt-bindings/reset/imx7-reset.h> for i.MX7 and
> > > -<dt-bindings/reset/imx8mq-reset.h> for i.MX8MQ
> > > +<dt-bindings/reset/imx7-reset.h> for i.MX7,
> > > +<dt-bindings/reset/imx8mq-reset.h> for i.MX8MQ and
> > > +<dt-bindings/reset/imx8mq-reset.h> for i.MX8MM
> > 
> > The last line is misleading, as that file contains reset indices that are invalid
> > for i.MX8MM.
> 
> What is your suggestion about this line?

I would prefer to add an imx8mm-reset.h with only the existing reset
bits, using the IMX8MM_RESET_ prefix. That would make it easy to spot
errors in the dtsi (anything starting with IMX8MQ_ is potentially
wrong).

> Just NOT change it?

The change is good in principle. It just should point to an imx8mm-
reset.h with only the existing resets on i.MX8MM, or imx8mq-reset.h
should be modified to actually make clear which resets are valid on
i.MX8MM.

> Or adding a new file imx8mm-reset.h but still use the IMX8MQ_RESET_ as
> prefix ?

I don't think you should redefine the same macros in imx8mm-reset.h. In
this case using IMX8MM_RESET_ would be better.

> Or keep what I changed, but adding some comments in those macros that
> i.MX8MM does NOT support?

That would be acceptable as well.

regards
Philipp
