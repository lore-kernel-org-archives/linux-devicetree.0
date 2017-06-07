From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Add bcm2835aux interrupt controller
Date: Wed, 7 Jun 2017 13:58:25 -0700
Message-ID: <b3d5b3c1-a9ab-99bf-a1b2-3a1e4579c0ff@gmail.com>
References: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6dc301c8-e5a2-1334-c476-1ce7e303787f-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/07/2017 04:11 AM, Phil Elwell wrote:
> Devices in the AUX block share a common interrupt line, with a register
> indicating which devices have active IRQs. Expose this as a nested
> interrupt controller to avoid IRQ sharing problems (easily observed if
> UART1 and SPI1/2 are enabled simultaneously).
> 
> The interrupt functionality could arguably be forked off as a separate
> irqchip driver, but the clock driver has already claimed the AUX_IRQ
> register so some driver and DT surgery would still be required.
> Eric Anholt thought that including it here is reasonable, but I'm
> prepared to split it out if this is considered too hacky.

You probably remember your fix to the irqchip drive being flamed because
the irqchip driver was re-purposed as an ARM SMP secondary core bringup
method, maybe we can avoid doing the same mistake and having this a
separate interrupt controller be under drivers/irqchip/*?

Even if the clock driver already claims the AUX_IRQ register space, we
can still have an irqchip ioremap() the two register offsets that it
cares about (AUXIRQ, AUXENB) and just manage that 8 bytes worth of
register space. We just need to make sure that the clock driver really
does not touch those (why would it) and that there won't be any
conflicting request_mem_region() against the same register range.

Thanks!

> 
> Phil Elwell (2):
>   clk: bcm2835: Add AUX interrupt controller
>   ARM: dts: bcm283x: Enable AUX interrupt controller
> 
>  arch/arm/boot/dts/bcm283x.dtsi    |  12 +++-
>  drivers/clk/bcm/clk-bcm2835-aux.c | 120 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+), 3 deletions(-)
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
