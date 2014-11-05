From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Wed, 5 Nov 2014 00:18:04 -0800
Message-ID: <20141105081804.GD22361@norris-Latitude-E6410>
References: <2135487545.481347.1409098562105.JavaMail.zimbra@xes-inc.com>
 <716589480.189636.1409161543701.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <716589480.189636.1409161543701.JavaMail.zimbra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 12:45:43PM -0500, Aaron Sierra wrote:
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 4d203e8..1fea897 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c
> @@ -160,6 +160,12 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	int ret;
>  	struct device_node *flash_np;
>  	struct mtd_part_parser_data ppdata;
> +	const char *mode;
> +	u32 strength;
> +
> +	flash_np = of_get_next_child(upm_np, NULL);
> +	if (!flash_np)
> +		return -ENODEV;
>  
>  	fun->chip.IO_ADDR_R = fun->io_base;
>  	fun->chip.IO_ADDR_W = fun->io_base;
> @@ -168,7 +174,28 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	fun->chip.read_byte = fun_read_byte;
>  	fun->chip.read_buf = fun_read_buf;
>  	fun->chip.write_buf = fun_write_buf;
> -	fun->chip.ecc.mode = NAND_ECC_SOFT;
> +
> +	if (of_property_read_string(flash_np, "nand-ecc-mode", &mode) ||
> +	    !strcmp(mode, "soft")) {
> +		fun->chip.ecc.mode = NAND_ECC_SOFT;
> +	} else if (!strcmp(mode, "soft_bch")) {
> +		fun->chip.ecc.mode = NAND_ECC_SOFT_BCH;

Please use of_get_nand_ecc_mode() for the above.

> +	} else {
> +		dev_err(fun->dev, "ECC mode '%s' unsupported", mode);
> +		goto err;
> +	}
> +
> +	if (of_property_read_u32(flash_np, "nand-ecc-strength", &strength)) {

of_get_nand_ecc_strength()

> +		if (fun->chip.ecc.mode == NAND_ECC_SOFT_BCH) {
> +			dev_err(fun->dev, "BCH ECC strength unspecified\n");
> +			goto err;
> +		}
> +	} else if (fun->chip.ecc.mode == NAND_ECC_SOFT) {
> +		dev_warn(fun->dev, "Ignoring %d-bit software ECC\n", strength);
> +	} else if (fun->chip.ecc.mode == NAND_ECC_SOFT_BCH) {
> +		fun->chip.ecc.strength = strength;
> +	}
> +
>  	if (fun->mchip_count > 1)
>  		fun->chip.select_chip = fun_select_chip;
>  
> @@ -178,10 +205,6 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	fun->mtd.priv = &fun->chip;
>  	fun->mtd.owner = THIS_MODULE;
>  
> -	flash_np = of_get_next_child(upm_np, NULL);
> -	if (!flash_np)
> -		return -ENODEV;
> -
>  	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
>  				  flash_np->name);
>  	if (!fun->mtd.name) {

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
