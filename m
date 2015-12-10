From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: l2x0: make it possible to disable outer sync
 from DT
Date: Thu, 10 Dec 2015 14:32:26 +0000
Message-ID: <20151210142942.GB495@leverpostej>
References: <1449756855-19473-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449756855-19473-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 03:14:15PM +0100, Linus Walleij wrote:
> Some RealView platforms have broken outer_sync, see:
> http://marc.info/?l=linux-kernel&m=144846940516899&w=2
> 
> We got rid of the custom barriers from the machine by disabling
> outer sync, but that was just for the boardfile case. We have
> to be able to do the same in the device tree case.
> 
> Since __l2c_init() is cloning and copying the L2C vtable,
> we pass an argument to this function to optionally numb
> the outer sync operation if desired, before initializing
> the cache.
> 
> After this we can set up the cache correctly on the RealView
> PB11MPCore, and it boots rock solid with the cache enabled.
> Before this, spurious crashes would occur if we try to set
> up the cache properly.
> 
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/l2cc.txt |  1 +
>  arch/arm/mm/cache-l2x0.c                       | 13 ++++++++++---
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> index d181b7c4c522..aae7387acbdb 100644
> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> @@ -75,6 +75,7 @@ Optional properties:
>    specified to indicate that such transforms are precluded.
>  - arm,parity-enable : enable parity checking on the L2 cache (L220 or PL310).
>  - arm,parity-disable : disable parity checking on the L2 cache (L220 or PL310).
> +- arm,outer-sync-disable : disable the outer sync operation on the L2 cache.

I'm not sure what this means from a HW perspective. The "outer sync"
operation is Linux terminology and doesn't show up in the TRM for L220.

What is the (integration? HW?) bug that we're trying to avoid the effect
of? It sounds like we should be describing that.

We should at least have a better definition of what this means we must
avoid.

Thanks
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
