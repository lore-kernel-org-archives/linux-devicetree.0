From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/4] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC
 platforms
Date: Mon, 22 Jul 2019 10:00:27 +0800
Message-ID: <20190722020026.GQ3738@dragon>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
 <20190624022200.GN3800@dragon>
 <20190624022713.GO3800@dragon>
 <DB3PR0402MB39162662C69B45BDB948D002F5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39162662C69B45BDB948D002F5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "will@kernel.org" <will@kernel.org>, mturqu
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 02:35:10AM +0000, Anson Huang wrote:
> Hi, Shawn
> 
> > -----Original Message-----
> > From: Shawn Guo <shawnguo@kernel.org>
> > Sent: Monday, June 24, 2019 10:27 AM
> > To: Anson Huang <anson.huang@nxp.com>
> > Cc: mark.rutland@arm.com; Aisheng Dong <aisheng.dong@nxp.com>; Peng
> > Fan <peng.fan@nxp.com>; festevam@gmail.com; Jacky Bai
> > <ping.bai@nxp.com>; devicetree@vger.kernel.org; sboyd@kernel.org;
> > catalin.marinas@arm.com; s.hauer@pengutronix.de; linux-
> > kernel@vger.kernel.org; Daniel Baluta <daniel.baluta@nxp.com>; linux-
> > clk@vger.kernel.org; robh+dt@kernel.org; dl-linux-imx <linux-
> > imx@nxp.com>; kernel@pengutronix.de; Leonard Crestez
> > <leonard.crestez@nxp.com>; will@kernel.org; mturquette@baylibre.com;
> > linux-arm-kernel@lists.infradead.org; Abel Vesa <abel.vesa@nxp.com>
> > Subject: Re: [PATCH 1/4] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC
> > platforms
> > 
> > On Mon, Jun 24, 2019 at 10:22:01AM +0800, Shawn Guo wrote:
> > > On Fri, Jun 21, 2019 at 03:07:17PM +0800, Anson.Huang@nxp.com wrote:
> > > > From: Anson Huang <Anson.Huang@nxp.com>
> > > >
> > > > ARCH_MXC platforms needs system counter as broadcast timer to
> > > > support cpuidle, enable it by default.
> > > >
> > > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > > ---
> > > >  arch/arm64/Kconfig.platforms | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/arm64/Kconfig.platforms
> > > > b/arch/arm64/Kconfig.platforms index 4778c77..f5e623f 100644
> > > > --- a/arch/arm64/Kconfig.platforms
> > > > +++ b/arch/arm64/Kconfig.platforms
> > > > @@ -173,6 +173,7 @@ config ARCH_MXC
> > > >  	select PM
> > > >  	select PM_GENERIC_DOMAINS
> > > >  	select SOC_BUS
> > > > +	select TIMER_IMX_SYS_CTR
> > >
> > > Where is that driver?
> > 
> > Okay, just found it in the mailbox.  They seem to be sent in the wrong order.
> > Really, you should send this series only after the driver lands on mainline.
> 
> OK, just noticed that mainline does NOT have it, since I did it based on next tree.
> I will resend the patch series after the system counter driver landing on mainline.

I just picked the series up, so no need to resend.

Shawn
