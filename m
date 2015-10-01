From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: mt8173: add timer node
Date: Thu, 1 Oct 2015 16:32:55 +0100
Message-ID: <560D5227.8050600@arm.com>
References: <1442369095-1094-1-git-send-email-yingjoe.chen@mediatek.com>
 <1442369095-1094-2-git-send-email-yingjoe.chen@mediatek.com>
 <55FAC570.8040307@arm.com> <1442501816.4784.3.camel@mtksdaap41>
 <55FAE69C.2000906@arm.com> <1443710016.22188.10.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443710016.22188.10.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-cl>
List-Id: devicetree@vger.kernel.org



On 01/10/15 15:33, Yingjoe Chen wrote:
> On Thu, 2015-09-17 at 17:13 +0100, Sudeep Holla wrote:
>>

[...]

>>
>> I think your are confusing the system counter with arch timers. System
>> counter is always-on, but the arch timers(logic implementing timers
>> comparators) might not be off when the processor is powered down.
>>
>> I think you need this timer and are using it for low power idle states
>> in which case you will use this as a clock event and not clock source.
>> It will be used as a hardware broadcast event source.
>>
>> There's no call to sched_clock_register in mtk_timer.c, so it can't be
>> the sched clock, so you need to fix the commit log.
>
> Hi Sudeep,
>
> Sorry for late reply.
>
> For sched_clock_register, please see
> http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001547.html
> which was accepted in
> https://git.linaro.org/people/daniel.lezcano/linux.git/shortlog/refs/heads/clockevents/4.4
>

The commit message makes no sense to me. The counters should continue to
work as long as they are in always-on domain. Only timers are lost
when you enter deeper idle states. So I agree with using MTK timer as
broadcast timer/eventsource. You still didn't answer what's the need
to use MTK timer as sched clocksource ?

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
