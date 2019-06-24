From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/4] arm64: Enable TIMER_IMX_SYS_CTR for ARCH_MXC
 platforms
Date: Mon, 24 Jun 2019 10:27:14 +0800
Message-ID: <20190624022713.GO3800@dragon>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
 <20190624022200.GN3800@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190624022200.GN3800@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: mark.rutland@arm.com, aisheng.dong@nxp.com, peng.fan@nxp.com, festevam@gmail.com, ping.bai@nxp.com, devicetree@vger.kernel.org, sboyd@kernel.org, catalin.marinas@arm.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, daniel.baluta@nxp.com, linux-clk@vger.kernel.org, robh+dt@kernel.org, Linux-imx@nxp.com, kernel@pengutronix.de, leonard.crestez@nxp.com, will@kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, abel.vesa@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 10:22:01AM +0800, Shawn Guo wrote:
> On Fri, Jun 21, 2019 at 03:07:17PM +0800, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> > 
> > ARCH_MXC platforms needs system counter as broadcast timer
> > to support cpuidle, enable it by default.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm64/Kconfig.platforms | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 4778c77..f5e623f 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -173,6 +173,7 @@ config ARCH_MXC
> >  	select PM
> >  	select PM_GENERIC_DOMAINS
> >  	select SOC_BUS
> > +	select TIMER_IMX_SYS_CTR
> 
> Where is that driver?

Okay, just found it in the mailbox.  They seem to be sent in the wrong
order.  Really, you should send this series only after the driver lands
on mainline.

Shawn
