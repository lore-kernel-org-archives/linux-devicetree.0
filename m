From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/2] Add bcm2835aux interrupt controller
Date: Wed, 7 Jun 2017 22:37:38 +0200 (CEST)
Message-ID: <1357388068.219504.1496867858076@email.1und1.de>
References: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6dc301c8-e5a2-1334-c476-1ce7e303787f-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: alexanders83-S0/GAf8tV78@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> hat am 7. Juni 2017 um 13:11 geschrieben:
> 
> 
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

in order to give the maintainers (e.g. irqchip) a chance, they should be included into CC.

> 
> Phil Elwell (2):
>   clk: bcm2835: Add AUX interrupt controller

Either way the dt-binding must be updated as a separate patch. So Rob can review it.

Thanks for submitting this upstream.

Stefan

>   ARM: dts: bcm283x: Enable AUX interrupt controller
> 
>  arch/arm/boot/dts/bcm283x.dtsi    |  12 +++-
>  drivers/clk/bcm/clk-bcm2835-aux.c | 120 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 129 insertions(+), 3 deletions(-)
> 
> -- 
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
