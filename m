From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: mt8173: add timer node
Date: Thu, 17 Sep 2015 22:56:56 +0800
Message-ID: <1442501816.4784.3.camel@mtksdaap41>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1442369095-1094-2-git-send-email-yingjoe.chen@mediatek.com>
	 <55FAC570.8040307@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55FAC570.8040307-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-09-17 at 14:51 +0100, Sudeep Holla wrote:
> 
> On 16/09/15 03:04, Yingjoe Chen wrote:
> > From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Add device node to enable GPT timer. This timer will be
> > used as sched clock source.
> >
> 
> Interesting any known issues with or advantage over the arch timers
> to prefer it as sched clock source. I see even arch timers are present
> in DT, hence the question. Or is it just a incorrect commit log ?
> 
> How does this get selected as sched clock source ? I don't see
> sched_clock_register in mtk_timer.c
> 
> To be clear, I am not against adding this timer support, but just want
> to know is it preferred for sched clock source ? if yes why ? better
> resolution ?

Hi Sudeep,

Thanks for your review.

I hit the send too soon and missed cover letter, please see:
http://lists.infradead.org/pipermail/linux-mediatek/2015-September/002303.html

The main reason to use GPT as sched clock is it won't stop during idle.


> > Change-Id: Idc4e3f0ee80b5c36cae6f0f2328f94aafcca1253
> 
> ^ Should be dropped
> 
> > Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index d18ee42..d763803 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -238,6 +238,15 @@
> >   			reg = <0 0x10007000 0 0x100>;
> >   		};
> >
> > +		timer: timer@10008000 {
> > +			compatible = "mediatek,mt8173-timer",
> 
> Missing documentation ? I am referring upstream and it might be in some 
> patches already queued perhaps ?

This is documented in
Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt.
Do you mean I should add "mediatek,mt8173-timer" to that file?

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
