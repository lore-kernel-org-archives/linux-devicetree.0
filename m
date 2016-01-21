From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/6] clk: mediatek: Refine the makefile to support
 multiple clock drivers
Date: Thu, 21 Jan 2016 13:49:35 +0800
Message-ID: <1453355375.5384.41.camel@mtksdaap41>
References: <1452587470-61506-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1452587470-61506-2-git-send-email-jamesjj.liao@mediatek.com>
	 <1453343300.28078.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453343300.28078.6.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Yingjoe,

On Thu, 2016-01-21 at 10:28 +0800, Yingjoe Chen wrote:
> On Tue, 2016-01-12 at 16:31 +0800, James Liao wrote:
> > Add a Kconfig to define clock configuration for each SoC, and
> > modify the Makefile to build drivers that only selected in config.
> > 
> > Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/clk/Kconfig           |  1 +
> >  drivers/clk/mediatek/Kconfig  | 23 +++++++++++++++++++++++
> >  drivers/clk/mediatek/Makefile |  6 +++---
> >  3 files changed, 27 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/clk/mediatek/Kconfig
> > 
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index c3e3a02..b7a37dc 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -198,3 +198,4 @@ source "drivers/clk/mvebu/Kconfig"
> >  
> >  source "drivers/clk/samsung/Kconfig"
> >  source "drivers/clk/tegra/Kconfig"
> > +source "drivers/clk/mediatek/Kconfig"
> 
> 
> Hi James,
> 
> drivers/clk/mediatek/Kconfig add user selectable options, menuconfig
> will list them outside of "Common Clock Framework" sub-menu if you
> source the file here. Kconfig for samsung & tegra doesn't have any, so
> it is OK for them to stay here.
> 
> Please move it inside the menu, also it seems the source lines are
> sorted now, so let's keep them sorted.

OK. I'll move mediatek/Kconfig into menu section in next patch.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
