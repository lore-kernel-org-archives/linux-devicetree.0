From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2 v3 RESEND] mtd: fsl_upm: Support NAND ECC DTS
 properties
Date: Thu, 22 Jan 2015 23:43:10 -0800
Message-ID: <20150123074310.GD3268@brian-ubuntu>
References: <1136776275.110939.1421109367310.JavaMail.zimbra@xes-inc.com>
 <447095612.147126.1421278909058.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <447095612.147126.1421278909058.JavaMail.zimbra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jordan,

On Wed, Jan 14, 2015 at 05:41:49PM -0600, Aaron Sierra wrote:
> From: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
> 
> Support the generic nand-ecc-mode, nand-ecc-strength, and
> nand-ecc-step-size device-tree properties with the Freescale UPM NAND
> driver.
> 
> This patch preserves the default software ECC mode while adding the
> ability to use BCH ECC for larger NAND devices.
> 
> Signed-off-by: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
> ---
> v2:
>     * Now using ECC mode and strength helpers from of_mtd.h
>     * ECC mode and strength checking is more robust
> v3 (resent due to [PATCH 1/2] v2 update):
>     * Require nand-ecc-step-size for soft_bch.
>     * Simplify mode/strength/step parameter checking.

This mostly looks pretty good.

>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       | 32 +++++++++++
>  drivers/mtd/nand/Kconfig                           |  1 +
>  drivers/mtd/nand/fsl_upm.c                         | 66 ++++++++++++++++++++--
>  3 files changed, 94 insertions(+), 5 deletions(-)
> 

...

> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index e5e3343..4c85daf 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -444,6 +444,7 @@ config MTD_NAND_FSL_UPM
>  	tristate "Support for NAND on Freescale UPM"
>  	depends on PPC_83xx || PPC_85xx
>  	select FSL_LBC
> +	select MTD_NAND_ECC_BCH

Hmm, do you really need to 'select' here? I think your driver compiles
just fine without it, and nand_base gives you a BUG() if you try to use
its soft BCH without building in the driver. It's normally bad form to
'select' an option that is normally user-configurable, unless you
absolutely require it.

>  	help
>  	  Enables support for NAND Flash chips wired onto Freescale PowerPC
>  	  processor localbus with User-Programmable Machine support.
> diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
> index 72755d7..053d8bf 100644
> --- a/drivers/mtd/nand/fsl_upm.c
> +++ b/drivers/mtd/nand/fsl_upm.c

...

> @@ -168,7 +174,61 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
>  	fun->chip.read_byte = fun_read_byte;
>  	fun->chip.read_buf = fun_read_buf;
>  	fun->chip.write_buf = fun_write_buf;
> -	fun->chip.ecc.mode = NAND_ECC_SOFT;
> +
> +	/*
> +	 * Support NAND_ECC_SOFT and NAND_ECC_SOFT_BCH, error otherwise.
> +	 */
> +	mode = of_get_nand_ecc_mode(flash_np);
> +	strength = of_get_nand_ecc_strength(flash_np);
> +	step_size = of_get_nand_ecc_step_size(flash_np);
> +	if (mode < 0) {
> +		dev_info(fun->dev, "ECC mode defaulting to 'soft'");
> +		mode = NAND_ECC_SOFT;
> +	} else if (mode != NAND_ECC_SOFT && mode != NAND_ECC_SOFT_BCH) {
> +		dev_err(fun->dev, "ECC mode in device tree is unsupported");
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	/*
> +	 * In NAND_ECC_SOFT_BCH, require strength >= 1 and step >= 1.
> +	 * In NAND_ECC_SOFT:
> +	 *     a. ignore strength (1 implied)
> +	 *     b. step < 0, step = 256, or step = 512.

(I'm getting nitpicky here, but if you're going to change the Kconfig
above, you might as well address this.)

This comment is nice, but it's still slightly confusing, as it doesn't
have very good parallel structure. There needs to be a verb in bullet
point (b). Perhaps the following?

	 *     b. require step < 0 (default to 256), step = 256, or step = 512.

> +	 */
> +	if (mode == NAND_ECC_SOFT_BCH) {
> +		if (strength < 1)
> +			dev_err(fun->dev, "invalid nand-ecc-strength for BCH");
> +
> +		if (step_size < 1)
> +			dev_err(fun->dev, "invalid nand-ecc-step-size for BCH");
> +
> +		if (strength < 1 || step_size < 1) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		fun->chip.ecc.mode = mode;
> +		fun->chip.ecc.strength = strength;
> +		fun->chip.ecc.size = step_size;
> +	} else {
> +		if (strength >= 0)

I don't see why we should complain about strength == 1. It's a perfectly
descriptive value from DT. Maybe:

		if (strength != 1 && strength >= 0)

> +			dev_warn(fun->dev, "soft ECC implies 1-bit strength");
> +
> +		if (step_size < 0) {
> +			step_size = 256;
> +		} else if (step_size != 256 && step_size != 512) {
> +			dev_err(fun->dev,
> +				"soft ECC needs 256 or 512 byte step");
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		fun->chip.ecc.mode = mode;
> +		fun->chip.ecc.strength = 1;
> +		fun->chip.ecc.size = step_size;
> +	}
> +
>  	if (fun->mchip_count > 1)
>  		fun->chip.select_chip = fun_select_chip;
>  

...

Now that I think about it, I can just apply all these changes and apply
the patch myself, if you agree. Or send a new version yourself. Either
way.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
