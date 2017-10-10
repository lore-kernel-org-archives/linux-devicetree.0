From: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: add flag for reading dummy cycles
 from nv cfg reg
Date: Tue, 10 Oct 2017 21:23:25 +0200
Message-ID: <28c32a9c-1fd8-3af4-abc6-f4938e138daa@wedev4u.fr>
References: <1505932139-2905-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1505932139-2905-4-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505932139-2905-4-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthew

NAK for this patch

Le 20/09/2017 à 20:28, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org a écrit :
> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> This patch is a work around for some non-standard behavior
> of EPCQ flash parts:
> 
> https://www.altera.com/documentation/wtw1396921531042.html#wtw1396921651224
>

>From the above documentation:
"""
Write Non-Volatile Configuration Register Operation

You need to write the non-volatile configuration registers for EPCQ-L
devices for different configuration schemes. If you are using the .jic
file, the Quartus® Prime programmer sets the number of dummy clock
cycles and address bytes. If you are using an external programmer tools
(3rd party programmer tools), you must set the non-volatile
configuration registers.

To set the non-volatile configuration register, follow these steps:

    Execute the write enable operation.
    Execute the write non-volatile configuration register operation.
    Set the 16-bit register value.

Set the 16-bit register value as b'1110 1110 xxxx 1111 where xxxx is the
dummy clock value. When the xxxx value is from 0001 to 1110, the dummy
clock value is from 1 to 14. When xxxx is 0000 or 1111, the dummy clock
value is at the default value, which is 8 for standard fast read (AS x1)
mode and 10 for extended quad input fast read (AS x4) mode.
"""

AFAIU, it is stated that you can set the number of dummy cycle to either
0000b or 1111b, the default value. There is no valid reason to use any
other value, like there is no valid reason to tune the number of dummy
clock cycles. Just keep the default settings, please!

If we start to play changing the number of dummy cycles it would be real
mess to maintain.

First, should we read the value to be used from some register or should
we force this value instead by writing that register ?
Some would prefer reading whereas other would prefer updating...

Moreover, the method to read or write the number of dummy cycles is not
standard and is manufacturer specific:

- Micron uses 2 registers: the Volatile Configuration Register and the
Non-Volatile configuration Register.

- Macronix uses another register but doesn't store the number of dummy
cycles directly: instead this manufacturer uses codes. So we would have
to store tables mapping codes <-> number dummy clock cycles

- Spansion/Cypress also uses code tables and I already know that
depending on the memory part number the code is either 2bit or 4bit and
stored in different registers. Damned!

If I allow you to tune the number of dummy clock cycles for Micron
memory it would be fair that I allow other people to tune this number
for other memory manufacturers. However it would be a real pain to
maintain because there is no standard for that hence manufacturers just
do what they want and change things when they want. Far too
unpredictable, IMHO.

So to avoid a messy situation, the rule is simple: SPI-NOR memory MUST
be configured in their default factory settings when spi_nor_scan() is
called. Your memory has the very same JEDEC ID as some Micron memory,
then it should behave the exact same way: in this case the value for the
number of dummy clock cycles should be set to 0000b or 1111b in the NVCR
(and VCR too).


> These flash parts are generally used to configure Intel/Altera FPGAs
> on power up.  These parts report a JEDEC id of the Micron part at the core,
> but have a different number of dummy cycles than specified in the Micron
> data sheet.  The number of required dummy cycles can be read from the
> Non-Volatile Configuration register.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/mtd/spi-nor/altera-asmip2.c | 31 ++++++++++++++++++++++++++-----
>  include/linux/mtd/altera-asmip2.h   |  3 +++
>  2 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/altera-asmip2.c b/drivers/mtd/spi-nor/altera-asmip2.c
> index a977765..d9cd807 100644
> --- a/drivers/mtd/spi-nor/altera-asmip2.c
> +++ b/drivers/mtd/spi-nor/altera-asmip2.c
> @@ -40,6 +40,10 @@
>  #define QSPI_POLL_TIMEOUT_US		10000000
>  #define QSPI_POLL_INTERVAL_US		5
>  
> +#define SPINOR_OP_RD_NVCFG		0xb5
> +#define NVCFG_DUMMY_SFT			12
> +#define NVCFG_DUMMY_MASK		0xf
> +
>  struct altera_asmip2 {
>  	void __iomem *csr_base;
>  	u32 num_flashes;
> @@ -231,7 +235,8 @@ static void altera_asmip2_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>  }
>  
>  static int altera_asmip2_setup_banks(struct device *dev,
> -				      u32 bank, struct device_node *np)
> +				     u32 bank, struct device_node *np,
> +				     u32 flags)
>  {
>  	const struct spi_nor_hwcaps hwcaps = {
>  		.mask = SNOR_HWCAPS_READ |
> @@ -241,6 +246,7 @@ static int altera_asmip2_setup_banks(struct device *dev,
>  	struct altera_asmip2 *q = dev_get_drvdata(dev);
>  	struct altera_asmip2_flash *flash;
>  	struct spi_nor *nor;
> +	u16 nvcfg;
>  	int ret = 0;
>  
>  	if (bank > q->num_flashes - 1)
> @@ -273,6 +279,20 @@ static int altera_asmip2_setup_banks(struct device *dev,
>  		return ret;
>  	}
>  
> +	if (flags & ALTERA_ASMIP2_FLASH_FLG_RD_NVCFG) {
> +		ret = altera_asmip2_read_reg(nor, SPINOR_OP_RD_NVCFG,
> +		 			     (u8*)&nvcfg, sizeof(nvcfg));
> +
> +		if (ret) {
> +			dev_err(nor->dev,
> +				"failed to read NV Configuration register\n");
> +			return ret;
> +		}
> +
> +		nor->read_dummy = (nvcfg >> NVCFG_DUMMY_SFT) & NVCFG_DUMMY_MASK;
> +		dev_info(nor->dev, "%s dummy %d\n", __func__, nor->read_dummy);
> +	}
> +

You have forgotten the special case for values 0000b and 1111b (default
settings). For those 2 values, the actual number of dummy clock cycles is:
- 0 for Read (03h/13h)
- 8 for Fast Read 1-1-1 (0Bh/0Ch)
- 8 for Fast Read 1-1-2 (3Bh/3Ch)
- 8 for Fast Read 1-2-2 (BBh/BCh)
- 8 for Fast Read 1-1-4 (6Bh/6Ch)
- 10 for Fast Read 1-4-4 (EBh/ECh)

Besides, the value read from the Non-Volatile Configuration Register is
the value loaded into the Volatile Configuration Register at power-up.
The actual number of dummy clock cycles to be used by Fast Read commands
should be read from the Volatile Configuration Register.

Anyway, this not the way to go.

Best regards,

Cyrille

>  	ret =  mtd_device_register(&nor->mtd, NULL, 0);
>  
>  	return ret;
> @@ -308,7 +328,7 @@ static int altera_asmip2_create(struct device *dev, void __iomem *csr_base)
>  }
>  
>  static int altera_asmip2_add_bank(struct device *dev,
> -			 u32 bank, struct device_node *np)
> +			 u32 bank, struct device_node *np, u32 flags)
>  {
>  	struct altera_asmip2 *q = dev_get_drvdata(dev);
>  
> @@ -317,7 +337,7 @@ static int altera_asmip2_add_bank(struct device *dev,
>  
>  	q->num_flashes++;
>  
> -	return altera_asmip2_setup_banks(dev, bank, np);
> +	return altera_asmip2_setup_banks(dev, bank, np, flags);
>  }
>  
>  static int altera_asmip2_remove_banks(struct device *dev)
> @@ -361,7 +381,8 @@ static int altera_asmip2_probe_with_pdata(struct platform_device *pdev,
>  	}
>  
>  	for (i = 0; i < qdata->num_chip_sel; i++) {
> -		ret = altera_asmip2_add_bank(dev, i, NULL);
> +		ret = altera_asmip2_add_bank(dev, i, NULL,
> +					     qdata->flash_flags[i]);
>  		if (ret) {
>  			dev_err(dev, "failed to add qspi bank %d\n", ret);
>  			break;
> @@ -414,7 +435,7 @@ static int altera_asmip2_probe(struct platform_device *pdev)
>  			goto error;
>  		}
>  
> -		if (altera_asmip2_add_bank(dev, bank, pp)) {
> +		if (altera_asmip2_add_bank(dev, bank, pp, 0)) {
>  			dev_err(dev, "failed to add bank %u\n", bank);
>  			goto error;
>  		}
> diff --git a/include/linux/mtd/altera-asmip2.h b/include/linux/mtd/altera-asmip2.h
> index 580c43c..185a9b2 100644
> --- a/include/linux/mtd/altera-asmip2.h
> +++ b/include/linux/mtd/altera-asmip2.h
> @@ -16,9 +16,12 @@
>  #define ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP 3
>  #define ALTERA_ASMIP2_RESOURCE_SIZE 0x10
>  
> +#define ALTERA_ASMIP2_FLASH_FLG_RD_NVCFG	BIT(0)
> +
>  struct altera_asmip2_plat_data {
>  	void __iomem *csr_base;
>  	u32 num_chip_sel;
> +	u32 flash_flags[ALTERA_ASMIP2_MAX_NUM_FLASH_CHIP];
>  };
>  
>  #endif
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
