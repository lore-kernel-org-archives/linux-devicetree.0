From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/5] add GPT timer support for mt8173
Date: Wed, 26 Aug 2015 22:10:08 +0800
Message-ID: <1440598208.30139.3.camel@mtksdaap41>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
	 <55DD6CC4.6010708@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DD6CC4.6010708-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-08-26 at 09:37 +0200, Daniel Lezcano wrote:
> On 07/13/2015 11:32 AM, Yingjoe Chen wrote:
> > This series add GPT timer support for mt8173. This is based on v4.2-rc1
> > and Matthias' next branch (for dts parts).
> >
> > The first 2 patches comes from 'Add SMP bringup support for mt65xx socs'
> > series [1]. I decide to move these 2 patches to this series, since it
> > is more relevent here. They are changed based on Matthias' and Daniel's
> > comments.
> >
> > [1] http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000714.html
> >
> > Daniel Kurtz (1):
> >    arm64: dts: mt8173: add timer node
> >
> > Yingjoe Chen (4):
> >    clocksource: mediatek: do not enable GPT_CLK_EVT when setup
> >    clocksource: mediatek: Use GPT as sched clock source
> >    arm64: mediatek: enable MTK_TIMER
> >    clk: mediatek: add 13mhz clock for MT8173
> >
> >   arch/arm64/Kconfig                       |  1 +
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi |  9 +++++++++
> >   drivers/clk/mediatek/clk-mt8173.c        |  5 +++++
> >   drivers/clocksource/mtk_timer.c          | 26 ++++++++++++++++++++------
> >   include/dt-bindings/clock/mt8173-clk.h   |  3 ++-
> >   5 files changed, 37 insertions(+), 7 deletions(-)
> 
> Who will take this patchset ? I can take the patch 2 if needed.
> 
> 

Hi Daniel,

Please take patch 2 with your fix. Thanks.

I think patch 3(enable MTK_TIMER in Kconfig) and 5 (add timer node)
should go through Matthias' tree to arm-soc and patch 4(add 13mhz clock)
should go through James' mtk-clk tree to clk maintainer.

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
