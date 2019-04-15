From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [EXT] Re: [PATCH V7 2/4] firmware: imx: enable imx scu general
 irq function
Date: Mon, 15 Apr 2019 17:23:54 +0800
Message-ID: <20190415092350.GC18917@X250.skyworth_vap>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-2-git-send-email-Anson.Huang@nxp.com>
 <20190411073252.GC3050@dragon>
 <DB3PR0402MB3916B67E6DA995AB70C29799F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB4211816EDBEF23F7B330CCCB80280@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39162D194A2B5B79211C1774F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190412084116.GS3578@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412084116.GS3578@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Anson Huang <anson.huang@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 10:41:16AM +0200, Alexandre Belloni wrote:
> On 12/04/2019 02:32:54+0000, Anson Huang wrote:
> > > > 	As i.MX SCU general irq function is picked up by Shawn, could you
> > > > please also pick up below i.MX SC RTC alarm support patch ?
> > > > 	https://patchwork.kernel.org/patch/10890525/
> > > >
> > > 
> > > No, it can't go through Alexandre's tree due to dependency issue.
> > > 
> > > Shawn,
> > > Do you think you can pick it up? Alexandre already gave the Ack.
> > > 
> > > AFAIK there's no other SCU RTC patches since v5.1-rc1 in Alexandre's tree.
> > 
> > Yes, need to make sure the dependency is handled, the RTC alarm patch MUST be picked up
> > ONLY when scu irq patch is ready, NOT sure how to handle this case for such scenario?
> > 
> 
> Either it goes through arm-soc or if it can wait one release, I pick it
> up for 5.3. The other solution involves immutable branch but I don't
> think this is necessary.

I send other subsystem patch through arm-soc tree only when it's
absolutely necessary. This is not anything either critical or urgent,
so I'm not going to take it.  Wait one release, I'd say.

Shawn
