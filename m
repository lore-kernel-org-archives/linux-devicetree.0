From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource: mediatek: Use GPT as sched clock
 source
Date: Sat, 11 Jul 2015 18:32:37 +0800
Message-ID: <1436610757.17661.1.camel@mtksdaap41>
References: <1431763110-443-1-git-send-email-yingjoe.chen@mediatek.com>
	 <CABuKBeJhdRBBw1v1kj8J0YFVWZ27vzx5W=XU8jiwePVgL_7g_g@mail.gmail.com>
	 <CAGS+omDa4X7daAYD6SDuEM6bMQwojNUCnGMGiUwnJ6M_yBTRLg@mail.gmail.com>
	 <1551938.VHQvCCENeg@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1551938.VHQvCCENeg@ubix>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-07-03 at 17:51 +0200, Matthias Brugger wrote:
> On Friday, July 03, 2015 09:48:42 PM Daniel Kurtz wrote:

<...>

> > >> @@ -243,6 +251,8 @@ static void __init mtk_timer_init(struct device_node
> > >> *node)>> 
> > >>         mtk_timer_setup(evt, GPT_CLK_SRC, TIMER_CTRL_OP_FREERUN, 1);
> > >>         clocksource_mmio_init(evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC),
> > >>         
> > >>                         node->name, rate, 300, 32,
> > >>                         clocksource_mmio_readl_up);
> > >> 
> > >> +       gpt_base = evt->gpt_base;
> > > 
> > > This is really hacky. We should clean up the code and provide
> > > mtk_clock_event_device globally.
> > > Please add the patch below, which does exactly this.
> > 
> > I don't think this is so hacky.
> > In light of Stephen's comment about the benefit of using
> > container_of() to extract gpt_base from the passed in struct
> > clock_event_device in the other routines, what is the benefit of
> > making more of mtk_clock_event_device global?
> > I think what Yingjoe has implemented is short and sweet.
> > 
> 
> Huh, this patch got somehow forgotten.
> Ok, just one comment. I would prefer to rename the global gpt_base to 
> gpt_sched_base or something similar and set the pointer + offset directly 
> mtk_timer_init.


In next version, I will it change to:

static void __iomem *gpt_sched_reg __read_mostly;

and in mtk_timer_init:

+       gpt_sched_reg = evt->gpt_base + TIMER_CNT_REG(GPT_CLK_SRC);

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
