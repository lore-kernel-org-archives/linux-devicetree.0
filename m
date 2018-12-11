From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/3] bus: imx-weim: support multiple address ranges
 per child node
Date: Tue, 11 Dec 2018 14:02:54 +0800
Message-ID: <20181211060252.GV3987@dragon>
References: <20181206192633.25319-1-TheSven73@googlemail.com>
 <20181206192633.25319-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206192633.25319-2-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: TheSven73@googlemail.com, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2018 at 02:26:31PM -0500, Sven Van Asbroeck wrote:
> Ensure that timing values for the child node are applied to
> all chip selects in the child's address ranges.
> 
> Note that this does not support multiple timing settings per
> child; this can be added in the future if required.
> 
> Example:
> &weim {
> 	acme@0 {
> 		compatible = "acme,whatever";
> 		reg = <0 0 0x100>, <0 0x400000 0x800>,
> 				<1 0x400000 0x800>;
> 		fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
> 				0x00000000 0xa0000240 0x00000000>;
> 	};
> };
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>
> ---
>  drivers/bus/imx-weim.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index d84996a4528e..5452d22d1bd8 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -46,6 +46,7 @@ static const struct imx_weim_devtype imx51_weim_devtype = {
>  };
>  
>  #define MAX_CS_REGS_COUNT	6
> +#define OF_REG_SIZE		3
>  
>  static const struct of_device_id weim_id_table[] = {
>  	/* i.MX1/21 */
> @@ -115,27 +116,40 @@ static int __init weim_timing_setup(struct device_node *np, void __iomem *base,
>  				    const struct imx_weim_devtype *devtype)
>  {
>  	u32 cs_idx, value[MAX_CS_REGS_COUNT];
> -	int i, ret;
> +	int i, ret, reg_idx, num_regs;

As the new variables are not strictly related to the existing ones, they
can be on a new line for cleaner diff log.  And to keep the reverse-tree
order, it will look like the following.

	int reg_idx, num_regs;
	int i, ret;

>  
>  	if (WARN_ON(devtype->cs_regs_count > MAX_CS_REGS_COUNT))
>  		return -EINVAL;
>  
> -	/* get the CS index from this child node's "reg" property. */
> -	ret = of_property_read_u32(np, "reg", &cs_idx);
> +	ret = of_property_read_u32_array(np, "fsl,weim-cs-timing",
> +					 value, devtype->cs_regs_count);
>  	if (ret)
>  		return ret;
>  
> -	if (cs_idx >= devtype->cs_count)
> +	/*
> +	 * the child node's "reg" property may contain multiple address ranges,
> +	 * extract the chip select for each.
> +	 */
> +	num_regs = of_property_count_elems_of_size(np, "reg", OF_REG_SIZE);
> +	if (num_regs < 0)
> +		return num_regs;
> +	if (!num_regs)
>  		return -EINVAL;
> +	for (reg_idx = 0; reg_idx < num_regs; reg_idx++) {
> +		/* get the CS index from this child node's "reg" property. */
> +		ret = of_property_read_u32_index(np, "reg",
> +					reg_idx*OF_REG_SIZE, &cs_idx);

There should be space before and after *.

Shawn

> +		if (ret)
> +			break;
>  
> -	ret = of_property_read_u32_array(np, "fsl,weim-cs-timing",
> -					 value, devtype->cs_regs_count);
> -	if (ret)
> -		return ret;
> +		if (cs_idx >= devtype->cs_count)
> +			return -EINVAL;
>  
> -	/* set the timing for WEIM */
> -	for (i = 0; i < devtype->cs_regs_count; i++)
> -		writel(value[i], base + cs_idx * devtype->cs_stride + i * 4);
> +		/* set the timing for WEIM */
> +		for (i = 0; i < devtype->cs_regs_count; i++)
> +			writel(value[i],
> +				base + cs_idx * devtype->cs_stride + i * 4);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
