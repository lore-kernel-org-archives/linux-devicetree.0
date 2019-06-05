From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Date: Wed, 5 Jun 2019 14:12:40 +0800
Message-ID: <20190605061238.GC29853@dragon>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
 <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190605060000.GA29853@dragon>
 <DB3PR0402MB39161D679A11B05ADCA8A28BF5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39161D679A11B05ADCA8A28BF5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>dl-linux-imx <li>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 06:09:12AM +0000, Anson Huang wrote:
> Hi, Shawn
> 
> > -----Original Message-----
> > From: Shawn Guo <shawnguo@kernel.org>
> > Sent: Wednesday, June 5, 2019 2:00 PM
> > To: Anson Huang <anson.huang@nxp.com>
> > Cc: robh+dt@kernel.org; mark.rutland@arm.com; wim@linux-watchdog.org;
> > linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; Aisheng Dong <aisheng.dong@nxp.com>;
> > ulf.hansson@linaro.org; Daniel Baluta <daniel.baluta@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog
> > node into scu node
> > 
> > On Tue, Jun 04, 2019 at 09:06:28AM +0000, Anson Huang wrote:
> > > Hi, Shawn
> > > 	The driver and binding doc are already reviewed and waiting for DT
> > patch, will you help review this DT patch?
> > 
> > I'm fine with it.  Should I just pick this patch up, or is there any dependency
> > we need to handle?
> 
> No dependency, it just makes more sense to move the node into SCU node as it is NOW depending on SCU
> driver. Once you pick up this patch

Just applied.

> (and maybe the dt-binding patch as well?),

It makes more sense to have it go through watchdog tree.

Shawn

> I will notify the watchdog
> maintainer to pick up the watchdog patch in this series.
