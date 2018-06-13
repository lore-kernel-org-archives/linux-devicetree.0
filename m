From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v1 0/4] add mailbox support for i.MX7D
Date: Wed, 13 Jun 2018 09:36:39 +0000
Message-ID: <AM0PR04MB4211ABBDBEE2982312E15F6F807E0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601083411.s35c2floqdas6qni@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601083411.s35c2floqdas6qni@pengutronix.de>
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
To: Robert Schwebel <r.schwebel@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Robert,

Thanks for the forwarding.

> -----Original Message-----
> From: Robert Schwebel [mailto:r.schwebel@pengutronix.de]
> Sent: Friday, June 1, 2018 4:34 PM
> To: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; linux-clk@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; kernel@pengutronix.de;
> devicetree@vger.kernel.org; A.s. Dong <aisheng.dong@nxp.com>; dl-linux-
> imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v1 0/4] add mailbox support for i.MX7D
> 
> On Fri, Jun 01, 2018 at 08:58:17AM +0200, Oleksij Rempel wrote:
> > This patches are providing support for mailbox (Messaging Unit) for
> > i.MX7D. Functionality was tested on PHYTEC phyBOARD-Zeta i.MX7D with
> > Linux running on all cores: ARM Cortex-A7 and ARM Cortex-M4.
> >

Thanks for the patch.

> > Both parts of i.MX messaging Unit are visible for all CPUs available
> > on i.MX7D. Communication worked independent of MU side in
> combination
> > with CPU. For example MU-A used on ARM Cortex-A7 and MU-B used on
> ARM
> > Cortex-M4 or other ways around.
> >
> > The question to NXP developers: are there are limitations or
> > recommendations about MU vs CPU combination? The i.MX7D
> documentation
> > talks about "Processor A" and "Processor B". It is not quite clear
> > what processor it actually is (A7 or M4).

The MU vs CPU combination usually are defined by HW design.
It, MU Side A/B,  can either be used by both CPU (A core and M core)
or fixed to one side.
For MX7D case, both side memory map can be accessed by both CPU
Including Interrupt signals. But the recommendation is A core using
MU side A and M core using MU side B.

Regards
Dong Aisheng

> 
> Adding Dong Aisheng and NXP linux team to Cc:.
> 
> rsc
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fww
> w.pengutronix.de%2F&data=02%7C01%7Caisheng.dong%40nxp.com%7Cf53
> d9c9cdd744878740f08d5c79a7a1e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
> C0%7C0%7C636634388645464924&sdata=2ehh92tNbfwf3fJTp%2Fx7IUOgGSU
> h6pyrc2XsdRJkTw4%3D&reserved=0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
