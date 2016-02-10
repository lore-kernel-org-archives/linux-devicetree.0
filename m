From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: l2x0: add three special L210 aux control flags
Date: Wed, 10 Feb 2016 21:20:18 +0100
Message-ID: <CACRpkdYFsTbPnbAcbw2FV7MmKJS7N9B8_pQvtX2fsoSHzJkdvQ@mail.gmail.com>
References: <1453933437-6666-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453933437-6666-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Argh, missed to cross-post this to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, I see my
mistake now.

Rob, care to take a quick look?

On Wed, Jan 27, 2016 at 11:23 PM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This adds support for setting the flag bits "wrap access disable",
> "write allocate override" and "exclusive abort disable" to the L210
> variant from the device tree.
>
> The "write allocate override" bit was used on the Nomadik and
> necessary to properly make use of the L210 cache on that machine
> without sporadic crashes.
>
> I took this oppportunity to add all three flags so we avoid excess
> patching for each one.
>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/l2c2x0.txt | 10 ++++++++++
>  arch/arm/mm/cache-l2x0.c                         | 18 ++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documentation/devicetree/bindings/arm/l2c2x0.txt
> index fe0398c5c77b..975d1ae304d4 100644
> --- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
> +++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
> @@ -74,6 +74,16 @@ Optional properties:
>    or "write through no write allocate" (for writes).
>    On systems where this may cause DMA buffer corruption, this property must be
>    specified to indicate that such transforms are precluded.
> +- arm,wrap-access-disable : (L210 only) if this flag is set, wrap accesses
> +  requested on slave ports are converted to linear acesses on master ports.
> +- arm,write-allocate-override : (L210 only) normally the L210 will use HPROT
> +  attributes, setting this bit overrides that behaviour and cause the cache
> +  to make all write-through and write-back accesses into read-write-allocate
> +  accesses.
> +- arm,exclusive-abort-disable : (L210 only) normally the cache controller sends
> +  an ERROR response back to exclusive access in a cacheable, shared memory
> +  region with the shared override bit set, but setting this flag disables the
> +  abort generation and the access is instead treated as cacheable, non-shared.
>  - arm,parity-enable : enable parity checking on the L2 cache (L220 or PL310).
>  - arm,parity-disable : disable parity checking on the L2 cache (L220 or PL310).
>  - arm,outer-sync-disable : disable the outer sync operation on the L2 cache.
> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index 9f9d54271aad..301c3c2dc09f 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -1076,6 +1076,24 @@ static void __init l2x0_of_parse(const struct device_node *np,
>                 val |= L2C_AUX_CTRL_SHARED_OVERRIDE;
>         }
>
> +       /* L210-specific aux control flags */
> +       if (of_device_is_compatible(np, "arm,l210-cache")) {
> +               if (of_property_read_bool(np, "arm,wrap-access-disable")) {
> +                       mask &= ~L210_AUX_CTRL_WRAP_DISABLE;
> +                       val |= L210_AUX_CTRL_WRAP_DISABLE;
> +               }
> +
> +               if (of_property_read_bool(np, "arm,write-allocate-override")) {
> +                       mask &= ~L210_AUX_CTRL_WA_OVERRIDE;
> +                       val |= L210_AUX_CTRL_WA_OVERRIDE;
> +               }
> +
> +               if (of_property_read_bool(np, "arm,exclusive-abort-disable")) {
> +                       mask &= ~L210_AUX_CTRL_EXCLUSIVE_ABORT;
> +                       val |= L210_AUX_CTRL_EXCLUSIVE_ABORT;
> +               }
> +       }
> +
>         ret = l2x0_cache_size_of_parse(np, aux_val, aux_mask, &assoc, SZ_256K);
>         if (ret)
>                 return;
> --
> 2.4.3
>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
