From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [Patch v3 08/11] driver/edac/fsl_ddr: Add support of little
 endian
Date: Mon, 8 Aug 2016 10:50:02 +0200
Message-ID: <20160808085002.GF20800@nazgul.tnic>
References: <1470351518-22404-1-git-send-email-york.sun@nxp.com>
 <1470351518-22404-9-git-send-email-york.sun@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470351518-22404-9-git-send-email-york.sun-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2016 at 03:58:33PM -0700, York Sun wrote:
> Get endianness from device tree. Both big endian and little endian
> are supported. Default to big endian for backward compatibility to
> MPC85xx.
> 
> Signed-off-by: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
> 
> ---
> Change log
>   v3: no change
>   v2: Separated from "Add support for ARM-based SoCs" patch
> 
>  .../fsl/ddr.txt}                                   |  6 ++
>  drivers/edac/fsl_ddr_edac.c                        | 83 ++++++++++++++--------
>  2 files changed, 58 insertions(+), 31 deletions(-)
>  rename Documentation/devicetree/bindings/{powerpc/fsl/mem-ctrlr.txt => memory-controllers/fsl/ddr.txt} (74%)
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
> similarity index 74%
> rename from Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> rename to Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
> index f87856f..62623f9 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/mem-ctrlr.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ddr.txt
> @@ -7,6 +7,10 @@ Properties:
>  		  "fsl,qoriq-memory-controller".
>  - reg		: Address and size of DDR controller registers
>  - interrupts	: Error interrupt of DDR controller
> +- little-endian	: Specifies little-endian access to registers
> +- big-endian	: Specifies big-endian access to registers
> +
> +If both little-endian and big-endian are omitted, big-endian will be used.
>  
>  Example 1:
>  
> @@ -14,6 +18,7 @@ Example 1:
>  		compatible = "fsl,bsc9132-memory-controller";
>  		reg = <0x2000 0x1000>;
>  		interrupts = <16 2 1 8>;
> +		big-endian;
>  	};
>  
>  
> @@ -24,4 +29,5 @@ Example 2:
>  				"fsl,qoriq-memory-controller";
>  		reg = <0x8000 0x1000>;
>  		interrupts = <16 2 1 23>;
> +		big-endian;
>  	};

This needs an ACK from DT maintainers. They're on CC.

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index 88ecf7d..b1b7924 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c

...

> @@ -470,6 +483,13 @@ int fsl_ddr_mc_err_probe(struct platform_device *op)
>  	mci->ctl_name = pdata->name;
>  	mci->dev_name = pdata->name;
>  
> +	if (of_find_property(op->dev.of_node, "little-endian", NULL))
> +		little_endian = true;
> +	else if (of_find_property(op->dev.of_node, "big-endian", NULL))
> +		little_endian = false;
> +	else
> +		little_endian = false;

What happened here?

Considering little_endian is static, this should suffice for its
initialization:

	if (of_find_property(op->dev.of_node, "little-endian", NULL))
		little_endian = true;




>  	res = of_address_to_resource(op->dev.of_node, 0, &r);
>  	if (res) {
>  		pr_err("%s: Unable to get resource for MC err regs\n",
> @@ -492,7 +512,7 @@ int fsl_ddr_mc_err_probe(struct platform_device *op)
>  		goto err;
>  	}
>  
> -	sdram_ctl = in_be32(pdata->mc_vbase + MC_DDR_SDRAM_CFG);
> +	sdram_ctl = ddr_in32(pdata->mc_vbase + MC_DDR_SDRAM_CFG);
>  	if (!(sdram_ctl & DSC_ECC_EN)) {
>  		/* no ECC */
>  		pr_warn("%s: No ECC DIMMs discovered\n", __func__);
> @@ -520,11 +540,11 @@ int fsl_ddr_mc_err_probe(struct platform_device *op)
>  
>  	/* store the original error disable bits */
>  	orig_ddr_err_disable =
> -	    in_be32(pdata->mc_vbase + MC_ERR_DISABLE);
> -	out_be32(pdata->mc_vbase + MC_ERR_DISABLE, 0);
> +	    ddr_in32(pdata->mc_vbase + MC_ERR_DISABLE);
> +	ddr_out32(pdata->mc_vbase + MC_ERR_DISABLE, 0);
>  
>  	/* clear all error bits */
> -	out_be32(pdata->mc_vbase + MC_ERR_DETECT, ~0);
> +	ddr_out32(pdata->mc_vbase + MC_ERR_DETECT, ~0);
>  
>  	if (edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups)) {
>  		edac_dbg(3, "failed edac_mc_add_mc()\n");
> @@ -532,15 +552,15 @@ int fsl_ddr_mc_err_probe(struct platform_device *op)
>  	}
>  
>  	if (edac_op_state == EDAC_OPSTATE_INT) {
> -		out_be32(pdata->mc_vbase + MC_ERR_INT_EN,
> -			 DDR_EIE_MBEE | DDR_EIE_SBEE);
> +		ddr_out32(pdata->mc_vbase + MC_ERR_INT_EN,
> +			  DDR_EIE_MBEE | DDR_EIE_SBEE);
>  
>  		/* store the original error management threshold */
> -		orig_ddr_err_sbe = in_be32(pdata->mc_vbase +
> +		orig_ddr_err_sbe = ddr_in32(pdata->mc_vbase +
>  					   MC_ERR_SBE) & 0xff0000;
>  
>  		/* set threshold to 1 error per interrupt */
> -		out_be32(pdata->mc_vbase + MC_ERR_SBE, 0x10000);
> +		ddr_out32(pdata->mc_vbase + MC_ERR_SBE, 0x10000);
>  
>  		/* register interrupts */
>  		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
> @@ -573,6 +593,7 @@ err:
>  	edac_mc_free(mci);
>  	return res;
>  }
> +EXPORT_SYMBOL_GPL(fsl_ddr_mc_err_probe);

What's that export for?

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
