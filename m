From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 0/4] This suspend patch is only support cut off the power of cpu and some external
Date: Wed, 03 Dec 2014 11:23:26 -0800
Message-ID: <7hiohszgep.fsf@deeprootsystems.com>
References: <1417423940-1669-1-git-send-email-zyw@rock-chips.com>
	<7htx1f409k.fsf@deeprootsystems.com>
	<CAD=FV=V2go5BMFbiFKu73_aVz5ck949W-kJQ6WLkAQRPJbjPVA@mail.gmail.com>
	<CAD=FV=XuQk17CTNKJY++J+w9Ab9_OUX0ca0A99m7yKPAWSs2=w@mail.gmail.com>
	<7hmw763kql.fsf@deeprootsystems.com> <547F1639.3030102@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547F1639.3030102-TNX95d0MmH7DzftRWevZcw@public.gmane.org> (Chris Zhong's message of "Wed,
	03 Dec 2014 21:55:05 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:

[...]

> I have test these patches on evb board base on next-20141128 with a
> defconfig[0], and with u-boot[1].
> As Doug said, we need below 3 patches for resume.
>
> 1.https://patchwork.kernel.org/patch/5051881/  - clocksource:
>    arch_timer: Allow the device tree to specify uninitialized timer
>    registers
>
> 2.https://patchwork.kernel.org/patch/5363671/  - clocksource:
>    arch_timer: Fix code to use physical timers when requested
>
> 3.https://patchwork.kernel.org/patch/5382141/  - ARM: dts: rk3288: add
>    arm,cpu-registers-not-fw-configured
>
>
> And it will auto wakeup, as Heiko said in v8.  

OK, with your series plus those 3 patches on top of next-20141128, I'm
now seeing it auto-wakeup, either with multi_v7_defconfig or Heiko's
rk3288_defconfig.

> But I have never notice before, since the u-boot never enable edp, and
> I use the coreboot with edp display.  Actually it is a bug in rk3288,
> the rk3288 have not 27Mhz clock source, but the edp initially set to
> this non-existent clock. At this time, edp is working on a unknown
> state, and it always bring a interrupt, this interrupt avoid system
> enter suspend. 

I see, good find!

> So if we want to enter suspend normally, the
> edp_24m_sel(bit 15) of CRU_CLKSEL28_CON(0xff7600d0) must be set to 1.

I didn't try your u-boot fix, but it sounds like there should be a kernel
fix for this.  Why doesn't the disabling of unused clocks put the EDP
into a safe/disabled state?

Kevin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
