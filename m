From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dmaengine: imx-sdma: Add DMA event remapping for
 imx6sx-sdma
Date: Mon, 20 Apr 2015 11:45:41 +0200
Message-ID: <20150420094541.GL6325@pengutronix.de>
References: <1429076351-4429-1-git-send-email-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429076351-4429-1-git-send-email-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 10:39:11PM -0700, Nicolin Chen wrote:
> The SDMA on imx6sx has a few DMA event remapping configurations
> inside the GPR (General Purpose Register) of that SoC. When users
> want to use a non-default DMA event, they need to configure the
> GPR register. So this patch gives an interface of the GPR and
> implements it in the SDMA driver so as to finish the DMA event
> remapping.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/fsl-imx-sdma.txt       |  9 ++++
>  drivers/dma/imx-sdma.c                             | 58 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> index dc8d3aa..03315a6 100644
> --- a/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> +++ b/Documentation/devicetree/bindings/dma/fsl-imx-sdma.txt
> @@ -8,6 +8,7 @@ Required properties:
>        "fsl,imx51-sdma"
>        "fsl,imx53-sdma"
>        "fsl,imx6q-sdma"
> +      "fsl,imx6sx-sdma"
>    The -to variants should be preferred since they allow to determine the
>    correct ROM script addresses needed for the driver to work without additional
>    firmware.
> @@ -19,6 +20,14 @@ Required properties:
>  - fsl,sdma-ram-script-name : Should contain the full path of SDMA RAM
>    scripts firmware
>  
> +Optional properties:
> +- fsl, sdma-event-remap : List of one or more DMA event remapping
> +  configurations. Its format: <&gpr addr shift val>
> +	gpr : the gpr phandle
> +	addr : the register address of the GPR
> +	shift : the bit shift of the GPR register
> +	val : the value of that bit

This binding allows arbitrary register writes to the GPR register space.
I don't think we want to allow that. A binding for this if necessary at
all must be higher level.

> +static int sdma_event_remap(struct sdma_engine *sdma)
> +{
> +	struct device_node *np = sdma->dev->of_node;
> +	char propname[] = "fsl,sdma-event-remap";
> +	struct of_phandle_args gpr_spec;
> +	struct regmap *gpr;
> +	int i = 0, ret = 0;
> +
> +	/* Only support DT */
> +	if (IS_ERR(np))
> +		return ret;
> +
> +	/* Only apply to imx6sx platform */
> +	if (!of_device_is_compatible(np, "fsl,imx6sx-sdma"))
> +		return ret;

We already have struct sdma_driver_data. Please add a have_remap field
or similar there.

> +
> +	/* Bypass if no need to remap */
> +	if (!of_find_property(np, propname, NULL))
> +		return ret;
> +
> +	/* Fetch the remap configurations of GPR */
> +	ret = of_parse_phandle_with_args(np, propname, "#gpr-cells", i++,
> +					 &gpr_spec);
> +	if (ret) {
> +		dev_err(sdma->dev, "failed to get a correct %s property: %d\n",
> +				propname, ret);
> +		return ret;
> +	}
> +
> +next:
> +	gpr = syscon_node_to_regmap(gpr_spec.np);
> +	if (IS_ERR(gpr)) {
> +		ret = PTR_ERR(gpr);
> +		dev_err(sdma->dev, "failed to get gpr regmap: %d\n", reg);
> +		return ret;
> +	}
> +
> +	/* 0 : Register address, 1 : Bit shift, 2 : Bit value */
> +	regmap_update_bits(gpr, gpr_spec.args[0], BIT(gpr_spec.args[1]),
> +			   gpr_spec.args[2] << gpr_spec.args[1]);
> +
> +	if (!of_parse_phandle_with_args(np, propname, "#gpr-cells", i++,
> +					&gpr_spec))
> +		goto next;

C has native support for loops. Please use it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
