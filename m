From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] mtd: nand: gpmi: add i.MX 7 SoC support
Date: Fri, 21 Apr 2017 04:03:09 +0200
Message-ID: <af3fe671-c5fb-d3cf-c891-e6b7c973baa1@gmail.com>
References: <20170421010755.18025-1-stefan@agner.ch>
 <20170421010755.18025-3-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170421010755.18025-3-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/21/2017 03:07 AM, Stefan Agner wrote:
> Add support for i.MX 7 SoC. The i.MX 7 has a slightly different
> clock architecture requiring only two clocks to be referenced.
> The IP is slightly different compared to i.MX 6SoloX, but currently
> none of this differences are in use so there is no detection needed
> and the driver can reuse IS_MX6SX.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index c8bbf5da2ab8..4a45d37ddc80 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -127,6 +127,18 @@ static const struct gpmi_devdata gpmi_devdata_imx6sx = {
>  	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx6),
>  };
>  
> +static const char * const gpmi_clks_for_mx7d[] = {
> +	"gpmi_io", "gpmi_bch_apb",
> +};
> +
> +static const struct gpmi_devdata gpmi_devdata_imx7d = {
> +	.type = IS_MX6SX,

Would it make sense to use IS_MX7 here already to prevent future surprises ?

> +	.bch_max_ecc_strength = 62,
> +	.max_chain_delay = 12,
> +	.clks = gpmi_clks_for_mx7d,
> +	.clks_count = ARRAY_SIZE(gpmi_clks_for_mx7d),
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>  	struct gpmi_nand_data *this = cookie;
> @@ -2071,6 +2083,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
>  	}, {
>  		.compatible = "fsl,imx6sx-gpmi-nand",
>  		.data = &gpmi_devdata_imx6sx,
> +	}, {
> +		.compatible = "fsl,imx7d-gpmi-nand",
> +		.data = &gpmi_devdata_imx7d,
>  	}, {}
>  };
>  MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
