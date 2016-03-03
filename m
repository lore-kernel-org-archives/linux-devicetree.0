From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: realview: add EB syscon variants to bindings
Date: Thu, 3 Mar 2016 17:40:52 -0600
Message-ID: <20160303234052.GA15598@rob-hp-laptop>
References: <1456218606-3749-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456218606-3749-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 10:10:06AM +0100, Linus Walleij wrote:
> There are two distinct RealView EB system controller that we need
> to detect and handle because their register layout differ
> slightly.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/arm/arm-boards | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
> index 2daeabc519de..7b05fc936d23 100644
> --- a/Documentation/devicetree/bindings/arm/arm-boards
> +++ b/Documentation/devicetree/bindings/arm/arm-boards
> @@ -131,7 +131,9 @@ Required nodes:
>  
>  - syscon: some subnode of the RealView SoC node must be a
>    system controller node pointing to the control registers,
> -  with the compatible string set to one of these tuples:
> +  with the compatible string set to one of these:
> +   "arm,realview-eb11mp-revb-syscon", "arm,realview-eb-syscon", "syscon"
> +   "arm,realview-eb11mp-revc-syscon", "arm,realview-eb-syscon", "syscon"
>     "arm,realview-eb-syscon", "syscon"
>     "arm,realview-pb1176-syscon", "syscon"
>     "arm,realview-pb11mp-syscon", "syscon"
> -- 
> 2.4.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
