From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] reset: uniphier: add PXs3 reset data
Date: Thu, 05 Oct 2017 10:30:01 +0200
Message-ID: <1507192201.8473.2.camel@pengutronix.de>
References: <1507170657-26432-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507170657-26432-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-10-05 at 11:30 +0900, Masahiro Yamada wrote:
> Add basic reset data for Socionext's new SoC PXs3.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Thanks, applied to the reset/next branch.

regards
Philipp

> ---
> 
>  .../devicetree/bindings/reset/uniphier-reset.txt   |  3 +++
>  drivers/reset/reset-uniphier.c                     | 26
> ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/uniphier-
> reset.txt b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> index 68a6f48..93efed6 100644
> --- a/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/uniphier-reset.txt
> @@ -13,6 +13,7 @@ Required properties:
>      "socionext,uniphier-pxs2-reset" - for PXs2/LD6b SoC
>      "socionext,uniphier-ld11-reset" - for LD11 SoC
>      "socionext,uniphier-ld20-reset" - for LD20 SoC
> +    "socionext,uniphier-pxs3-reset" - for PXs3 SoC
>  - #reset-cells: should be 1.
>  
>  Example:
> @@ -44,6 +45,7 @@ Required properties:
>      "socionext,uniphier-ld11-mio-reset" - for LD11 SoC (MIO)
>      "socionext,uniphier-ld11-sd-reset"  - for LD11 SoC (SD)
>      "socionext,uniphier-ld20-sd-reset"  - for LD20 SoC
> +    "socionext,uniphier-pxs3-sd-reset"  - for PXs3 SoC
>  - #reset-cells: should be 1.
>  
>  Example:
> @@ -74,6 +76,7 @@ Required properties:
>      "socionext,uniphier-pxs2-peri-reset" - for PXs2/LD6b SoC
>      "socionext,uniphier-ld11-peri-reset" - for LD11 SoC
>      "socionext,uniphier-ld20-peri-reset" - for LD20 SoC
> +    "socionext,uniphier-pxs3-peri-reset" - for PXs3 SoC
>  - #reset-cells: should be 1.
>  
>  Example:
> diff --git a/drivers/reset/reset-uniphier.c b/drivers/reset/reset-
> uniphier.c
> index bda2dd1..6ed808d 100644
> --- a/drivers/reset/reset-uniphier.c
> +++ b/drivers/reset/reset-uniphier.c
> @@ -114,6 +114,20 @@ static const struct uniphier_reset_data
> uniphier_ld20_sys_reset_data[] = {
>  	UNIPHIER_RESET_END,
>  };
>  
> +static const struct uniphier_reset_data
> uniphier_pxs3_sys_reset_data[] = {
> +	UNIPHIER_RESETX(2, 0x200c, 0),		/* NAND */
> +	UNIPHIER_RESETX(4, 0x200c, 2),		/* eMMC */
> +	UNIPHIER_RESETX(8, 0x200c, 12),		/* STDMAC */
> +	UNIPHIER_RESETX(12, 0x200c, 4),		/* USB30 link
> (GIO0) */
> +	UNIPHIER_RESETX(13, 0x200c, 5),		/* USB31 link
> (GIO1) */
> +	UNIPHIER_RESETX(16, 0x200c, 16),	/* USB30-PHY0 */
> +	UNIPHIER_RESETX(17, 0x200c, 18),	/* USB30-PHY1 */
> +	UNIPHIER_RESETX(18, 0x200c, 20),	/* USB30-PHY2 */
> +	UNIPHIER_RESETX(20, 0x200c, 17),	/* USB31-PHY0 */
> +	UNIPHIER_RESETX(21, 0x200c, 19),	/* USB31-PHY1 */
> +	UNIPHIER_RESET_END,
> +};
> +
>  /* Media I/O reset data */
>  #define UNIPHIER_MIO_RESET_SD(id, ch)			\
>  	UNIPHIER_RESETX((id), 0x110 + 0x200 * (ch), 0)
> @@ -359,6 +373,10 @@ static const struct of_device_id
> uniphier_reset_match[] = {
>  		.compatible = "socionext,uniphier-ld20-reset",
>  		.data = uniphier_ld20_sys_reset_data,
>  	},
> +	{
> +		.compatible = "socionext,uniphier-pxs3-reset",
> +		.data = uniphier_pxs3_sys_reset_data,
> +	},
>  	/* Media I/O reset, SD reset */
>  	{
>  		.compatible = "socionext,uniphier-ld4-mio-reset",
> @@ -392,6 +410,10 @@ static const struct of_device_id
> uniphier_reset_match[] = {
>  		.compatible = "socionext,uniphier-ld20-sd-reset",
>  		.data = uniphier_pro5_sd_reset_data,
>  	},
> +	{
> +		.compatible = "socionext,uniphier-pxs3-sd-reset",
> +		.data = uniphier_pro5_sd_reset_data,
> +	},
>  	/* Peripheral reset */
>  	{
>  		.compatible = "socionext,uniphier-ld4-peri-reset",
> @@ -421,6 +443,10 @@ static const struct of_device_id
> uniphier_reset_match[] = {
>  		.compatible = "socionext,uniphier-ld20-peri-reset",
>  		.data = uniphier_pro4_peri_reset_data,
>  	},
> +	{
> +		.compatible = "socionext,uniphier-pxs3-peri-reset",
> +		.data = uniphier_pro4_peri_reset_data,
> +	},
>  	/* Analog signal amplifiers reset */
>  	{
>  		.compatible = "socionext,uniphier-ld11-adamv-reset",
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
