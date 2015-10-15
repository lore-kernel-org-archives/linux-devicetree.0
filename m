From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 01/13] ARM: add some L220 DT settings
Date: Thu, 15 Oct 2015 14:57:30 +0100
Message-ID: <20151015135730.GC32532@n2100.arm.linux.org.uk>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
 <1444916813-31024-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444916813-31024-2-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 03:46:41PM +0200, Linus Walleij wrote:
> The RealView ARM11MPCore enables parity, eventmon and shared
> override in the cache controller through its current boardfile,
> but the code and DT bindings for the ARM L220 is currently
> lacking the ability to set this up from DT. Add the required
> bool parameters.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> I know this patch mixes code and DT changes but it is silly to
> split such a small patch. Will submit this to Russell's patch
> tracker if it looks OK to the DT people. (Or if they are quiet.)
> ---
>  Documentation/devicetree/bindings/arm/l2cc.txt | 10 ++++++----
>  arch/arm/mm/cache-l2x0.c                       | 15 +++++++++++++++
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> index 06c88a4d28ac..4d262e9b3464 100644
> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> @@ -67,12 +67,14 @@ Optional properties:
>    disable if zero.
>  - arm,prefetch-offset : Override prefetch offset value. Valid values are
>    0-7, 15, 23, and 31.
> -- arm,shared-override : The default behavior of the pl310 cache controller with
> -  respect to the shareable attribute is to transform "normal memory
> -  non-cacheable transactions" into "cacheable no allocate" (for reads) or
> -  "write through no write allocate" (for writes).
> +- arm,shared-override : The default behavior of the PL220 or PL310 cache
> +  controllers with respect to the shareable attribute is to transform "normal
> +  memory non-cacheable transactions" into "cacheable no allocate" (for reads)
> +  or "write through no write allocate" (for writes).
>    On systems where this may cause DMA buffer corruption, this property must be
>    specified to indicate that such transforms are precluded.
> +- arm,parity-enable : enable parity checking on the L2 cache (PL220 only).
> +- arm,eventmon-enable : enable the event monitor on the L2 cache (PL220 only).

I don't think we should introduce a DT property for this: if we support
the event monitor, then the event monitor support code should be
controlling this bit.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
