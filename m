From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
Date: Sat, 10 Dec 2016 05:03:05 +0100
Message-ID: <076683ea-fa94-2284-f269-2fcebd793940@gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-3-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481302167-28044-3-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/09/2016 05:49 PM, Cédric Le Goater wrote:
> This driver adds mtd support for the Aspeed AST2400 SoC static memory
> controllers:
> 
>  * New Static Memory Controller (referred as FMC)
>    . BMC firmware
>    . AST2500 compatible register set
>    . 5 chip select pins (CE0 ∼ CE4)
>    . supports NOR flash, NAND flash and SPI flash memory.
> 
>  * SPI Flash Controller (SPI)
>    . host Firmware
>    . slightly different register set, between AST2500 and the legacy
>      controller
>    . supports SPI flash memory
>    . 1 chip select pin (CE0)
> 
> The legacy static memory controller (referred as SMC) is not
> supported, as well as types other than SPI.
> 
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Well this is a nice split :-)

> ---
>  drivers/mtd/spi-nor/Kconfig      |  2 +-
>  drivers/mtd/spi-nor/aspeed-smc.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 5c0efbd9dd89..22bea563f9bc 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -35,7 +35,7 @@ config SPI_ASPEED
>  	depends on HAS_IOMEM && OF
>  	help
>  	  This enables support for the Firmware Memory controller (FMC)
> -	  in the Aspeed AST2500 SoC when attached to SPI NOR chips,
> +	  in the Aspeed AST2500/AST2400 SoCs when attached to SPI NOR chips,
>  	  and support for the SPI flash memory controller (SPI) for
>  	  the host firmware. The implementation only supports SPI NOR.
>  
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 6f9244f07aef..99302b0d7786 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -119,8 +119,27 @@ struct aspeed_smc_info {
>  	void (*set_4b)(struct aspeed_smc_chip *chip);
>  };
>  
> +static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>  
> +static const struct aspeed_smc_info fmc_2400_info = {
> +	.maxsize = 64 * 1024 * 1024,
> +	.nce = 5,
> +	.hastype = true,
> +	.we0 = 16,
> +	.ctl0 = 0x10,
> +	.set_4b = aspeed_smc_chip_set_4b,
> +};
> +
> +static const struct aspeed_smc_info spi_2400_info = {
> +	.maxsize = 64 * 1024 * 1024,
> +	.nce = 1,
> +	.hastype = false,
> +	.we0 = 0,
> +	.ctl0 = 0x04,
> +	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
> +};
> +
>  static const struct aspeed_smc_info fmc_2500_info = {
>  	.maxsize = 256 * 1024 * 1024,
>  	.nce = 3,
> @@ -210,6 +229,7 @@ struct aspeed_smc_controller {
>  #define CONTROL_IO_DUMMY_HI		BIT(14)
>  #define CONTROL_IO_DUMMY_HI_SHIFT	14
>  #define CONTROL_CLK_DIV4		BIT(13) /* others */
> +#define CONTROL_IO_ADDRESS_4B		BIT(13) /* AST2400 SPI */
>  #define CONTROL_RW_MERGE		BIT(12)
>  #define CONTROL_IO_DUMMY_LO_SHIFT	6
>  #define CONTROL_IO_DUMMY_LO		GENMASK(7, \
> @@ -406,6 +426,8 @@ static int aspeed_smc_remove(struct platform_device *dev)
>  }
>  
>  static const struct of_device_id aspeed_smc_matches[] = {
> +	{ .compatible = "aspeed,ast2400-fmc", .data = &fmc_2400_info },
> +	{ .compatible = "aspeed,ast2400-spi", .data = &spi_2400_info },
>  	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
>  	{ .compatible = "aspeed,ast2500-spi", .data = &spi_2500_info },
>  	{ }
> @@ -479,6 +501,17 @@ static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
>  	}
>  }
>  
> +/*
> + * The AST2400 SPI flash controller does not have a CE Control
> + * register. It uses the CE0 control register to set 4Byte mode at the
> + * controller level.
> + */
> +static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip)
> +{
> +	chip->ctl_val[smc_base] |= CONTROL_IO_ADDRESS_4B;
> +	chip->ctl_val[smc_read] |= CONTROL_IO_ADDRESS_4B;

How do you know the SPI NOR is in 4B mode ?

> +}
> +
>  static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>  				      struct resource *res)
>  {
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
