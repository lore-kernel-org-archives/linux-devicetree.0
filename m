From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] irqchip: gic/realview: support more RealView DCC variants
Date: Thu, 18 Feb 2016 15:16:36 +0100
Message-ID: <2593223.OY9PIVzfdv@wuerfel>
References: <1455803172-22747-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455803172-22747-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 18 February 2016 14:46:12 Linus Walleij wrote:
> In the add-on file for the GIC dealing with the RealView family
> we currently only handle the PB11MPCore, let's extend this to
> manage the RealView EB ARM11MPCore as well. The Revision B of the
> ARM11MPCore core tile is a bit special and needs special handling
> as it moves a system control register around at random.
> 
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This can be applied in isolation from the other patches so Marc
> one you're happy with it, please take it into the IRQchip tree.
> 
> There are two compatible strings getting added to the device tree
> bindings so CC to the DT list. No biggie though, just figures out
> exactly what ARM custom GIC flavor it is.
> 

Looks good to me.

All three patches:

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
