From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 08/10] dmaengine: sun6i: Add support for Allwinner A64 and
 compatibles
Date: Mon, 4 Sep 2017 00:37:58 +0100
Message-ID: <1526a6b4-1962-256d-1ada-ef9c7d95e6b1@arm.com>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-9-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170903224100.17893-9-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Stefan_Br=c3=bcns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03/09/17 23:40, Stefan Brüns wrote:
> The A64 SoC has the same dma engine as the H3 (sun8i), with a
> reduced amount of physical channels. To allow future reuse of the
> compatible, leave the channel count etc. in the config data blank
> and retrieve it from the devicetree.
> 
> Signed-off-by: Stefan Brüns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> ---
>  drivers/dma/sun6i-dma.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index bd4c2e4a759b..4fae7ffad549 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -1076,6 +1076,16 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
>  	.nr_max_vchans   = 34,
>  	.dmac_variant    = DMAC_VARIANT_H3,
>  };
> +
> +/*
> + * The A64 binding uses the number of dma channels from the
> + * device tree node.
> + */
> +static struct sun6i_dma_config sun50i_a64_dma_cfg = {
> +	.nr_max_channels = 0,
> +	.nr_max_requests = 0,

But this does not work with the "dma-requests" property being optional
according to the binding spec? Either we put the value for the A64 in
here (and thus force the R40 and others to specify this in the DT) or we
map the "0" from struct config to DMA_CHAN_MAX_DRQ in the probe function.

> +	.nr_max_vchans   = 0,
> +	.dmac_variant    = DMAC_VARIANT_H3,
>  };
>  
>  static const struct of_device_id sun6i_dma_match[] = {
> @@ -1083,6 +1093,7 @@ static const struct of_device_id sun6i_dma_match[] = {
>  	{ .compatible = "allwinner,sun8i-a23-dma", .data = &sun8i_a23_dma_cfg },
>  	{ .compatible = "allwinner,sun8i-a83t-dma", .data = &sun8i_a83t_dma_cfg },
>  	{ .compatible = "allwinner,sun8i-h3-dma", .data = &sun8i_h3_dma_cfg },
> +	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_dma_match);
> @@ -1090,6 +1101,7 @@ MODULE_DEVICE_TABLE(of, sun6i_dma_match);
>  static int sun6i_dma_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *device;
> +	struct device_node *np = pdev->dev.of_node;

Is this some rebase/split artefact?

Cheers,
Andre.

>  	struct sun6i_dma_dev *sdc;
>  	struct resource *res;
>  	int ret, i;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
