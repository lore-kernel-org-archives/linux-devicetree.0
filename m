From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: chosen: Add clocksource and clockevent selection
Date: Wed, 13 Dec 2017 16:57:50 -0600
Message-ID: <CAL_JsqLm5n6s=cr2hBZp4H9pDPKHUOPWs94JMWYFYJ3hsMMxZQ@mail.gmail.com>
References: <20171213185313.20017-1-alexandre.belloni@free-electrons.com> <20171213185313.20017-2-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213185313.20017-2-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 13, 2017 at 12:53 PM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The clocksource and clockevent timer are probed early in the boot process.
> At that time it is difficult for linux to know whether a particular timer
> can be used as the clocksource or the clockevent or by another driver,
> especially when they are all identical or have similar features.

If all identical, then it shouldn't matter. "similar" means some
difference. Describe those differences.

> Until now, multiple strategies have been used to solve that:
>  - use Kconfig option as MXC_USE_EPIT or ATMEL_TCB_CLKSRC_BLOCK

Compile time probably means only one option is really used.

>  - use a kernel parameter as the "clocksource" early_param in mach-omap2

Yeah, OMAP was one of the previous times this came up and also
attempted something like this. This parameter predates selecting
timers based on features described in DT. Look at commit
2eb03937df3ebc (ARM: OMAP3: Update clocksource timer selection).

>  - registering the first seen timer as a clockevent and the second one as
>  a clocksource as in rk_timer_init or dw_apb_timer_init
>
> Add a linux,clocksource and a linux,clockevent node in chosen with a timer
> property pointing to the timer to use. Other properties, like the targeted
> precision may be added later.

Open ended expansion of this does not help convince me it is needed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
