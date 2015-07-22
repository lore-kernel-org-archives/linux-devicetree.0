From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/5] clocksource: mediatek: do not enable GPT_CLK_EVT
 when setup
Date: Wed, 22 Jul 2015 16:24:49 +0800
Message-ID: <1437553489.22203.6.camel@mtksdaap41>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1436779969-18610-2-git-send-email-yingjoe.chen@mediatek.com>
	 <CAGS+omD8k_Cfxv3bYyjmjtLbiavo-WmJPn0Z-CBhN_nnv65Tag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omD8k_Cfxv3bYyjmjtLbiavo-WmJPn0Z-CBhN_nnv65Tag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-07-14 at 15:39 +0800, Daniel Kurtz wrote:
> Hi Yingjoe,
> 
> On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > Spurious mtk timer interrupt is noticed at boot and cause kernel
> > crash. It seems if GPT is enabled, it will latch irq status even
> > when its IRQ is disabled. When irq is enabled afterward, we see
> > spurious interrupt.
> > Change init flow to only enable GPT_CLK_SRC at mtk_timer_init.
> >
> > Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/clocksource/mtk_timer.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> > index 68ab423..237c20b 100644
> > --- a/drivers/clocksource/mtk_timer.c
> > +++ b/drivers/clocksource/mtk_timer.c
> > @@ -156,9 +156,11 @@ static void mtk_timer_global_reset(struct mtk_clock_event_device *evt)
> >         writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
> >  }
> >
> > -static void
> > -mtk_timer_setup(struct mtk_clock_event_device *evt, u8 timer, u8 option)
> > +static void mtk_timer_setup(struct mtk_clock_event_device *evt, u8 timer,
> > +                           u8 option, bool enable)
> 
> This function can be: __init
> 
> Other than this tiny nit, and the small potential conflict in patch 4,
> this whole series is:
> 
> Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> (I do think it is a bit strange that the mediatek,mt6577-timer binding
> does not use "clock-names", but that is independent of this patch
> set).
> 


Hi Daniel,

Thanks for your review.

I added __init as you suggested, and Pi-Cheng already sent an updated
version of his patch to resolve the conflict[1].

Joe.C

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001592.html



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
