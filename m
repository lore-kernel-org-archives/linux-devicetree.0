From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 1/4 v5] drm/bridge: Add bindings for TI THS8134
Date: Mon, 18 Dec 2017 10:46:49 +0200
Message-ID: <1661312.kCzA9cG53b@avalon>
References: <20171215121047.3650-1-linus.walleij@linaro.org> <20171215121047.3650-2-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215121047.3650-2-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Linus,

Thank you for the patch.

On Friday, 15 December 2017 14:10:44 EET Linus Walleij wrote:
> This adds device tree bindings for the Texas Instruments
> THS8134, THS8134A and THS8134B VGA DACs by extending and
> renaming the existing bindings for THS8135.
> 
> These DACs are used for the VGA outputs on the ARM reference
> designs such as Integrator, Versatile and RealView.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v2->v5:
> - Dropped the "ti,ths813x" as it turns out we need precise info
>   about the sub-variant anyways as they all very in timings.
> - Refine the THS8134 variants, it turns out ths8134, ths8134a
>   and ths8134b are three different variants of ths8134.
> ChangeLog v1->v2:
> - Introduce specific-to-general compatible string:
>   compatible = "ti,ths8134a", "ti,ths813x";
>   so drivers can handle the whole family the same way.
> - Collected Rob's ACK.
> ---
>  .../display/bridge/{ti,ths8135.txt => ti,ths813x.txt}       | 13 +++++++--
>  1 file changed, 9 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/display/bridge/{ti,ths8135.txt =>
> ti,ths813x.txt} (69%)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
> b/Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
> similarity index 69%
> rename from Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
> rename to Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
> index 6ec1a880ac18..49f155467f00 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,ths8135.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
> @@ -1,11 +1,16 @@
> -THS8135 Video DAC
> ------------------
> +THS8134 and THS8135 Video DAC
> +-----------------------------
> 
> -This is the binding for Texas Instruments THS8135 Video DAC bridge.
> +This is the binding for Texas Instruments THS8134, THS8134A, THS8134B and
> +THS8135 Video DAC bridge.

There's more than one no, so s/bridge/bridges/. Or just s/DAC bridge/DACs/ as 
bridge refers to the software implementation.

With this and Rob's comment about the compatible string ordering 
("ti,ths8134[ab]", "ti,ths8134" instead of "ti,ths8134[ab]", "ti,ths8134"),

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

>  Required properties:
> 
> -- compatible: Must be "ti,ths8135"
> +- compatible: Must be one of
> +  "ti,ths8134"
> +  "ti,ths8134", "ti,ths8134a"
> +  "ti,ths8134", "ti,ths8134b"
> +  "ti,ths8135"
> 
>  Required nodes:


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
