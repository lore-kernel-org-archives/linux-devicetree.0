From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 4/8] mtd: rawnand: jz4780: Add support for the JZ4725B
Date: Fri, 18 Jan 2019 09:26:57 +0100
Message-ID: <20190118092657.0293b819@bbrezillon>
References: <20190118010634.27399-1-paul@crapouillou.net>
        <20190118010634.27399-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118010634.27399-4-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 17 Jan 2019 22:06:30 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Add support for probing the jz4780-nand driver on the JZ4725B SoC from
> Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

BTW, if you have some time, maybe you could convert this driver to
->exec_op() ;-).

> ---
>  drivers/mtd/nand/raw/jz4780_nand.c | 39 +++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index 7f55358b860f..cf24bf12884f 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -26,13 +27,15 @@
>  
>  #define DRV_NAME	"jz4780-nand"
>  
> -#define OFFSET_DATA	0x00000000
> -#define OFFSET_CMD	0x00400000
> -#define OFFSET_ADDR	0x00800000
> -
>  /* Command delay when there is no R/B pin. */
>  #define RB_DELAY_US	100
>  
> +struct jz_soc_info {
> +	unsigned long data_offset;
> +	unsigned long addr_offset;
> +	unsigned long cmd_offset;
> +};
> +
>  struct jz4780_nand_cs {
>  	unsigned int bank;
>  	void __iomem *base;
> @@ -40,6 +43,7 @@ struct jz4780_nand_cs {
>  
>  struct jz4780_nand_controller {
>  	struct device *dev;
> +	const struct jz_soc_info *soc_info;
>  	struct jz4780_bch *bch;
>  	struct nand_controller controller;
>  	unsigned int num_banks;
> @@ -101,9 +105,9 @@ static void jz4780_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
>  		return;
>  
>  	if (ctrl & NAND_ALE)
> -		writeb(cmd, cs->base + OFFSET_ADDR);
> +		writeb(cmd, cs->base + nfc->soc_info->addr_offset);
>  	else if (ctrl & NAND_CLE)
> -		writeb(cmd, cs->base + OFFSET_CMD);
> +		writeb(cmd, cs->base + nfc->soc_info->cmd_offset);
>  }
>  
>  static int jz4780_nand_dev_ready(struct nand_chip *chip)
> @@ -272,8 +276,8 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
>  		return -ENOMEM;
>  	mtd->dev.parent = dev;
>  
> -	chip->legacy.IO_ADDR_R = cs->base + OFFSET_DATA;
> -	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
> +	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
> +	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
>  	chip->legacy.chip_delay = RB_DELAY_US;
>  	chip->options = NAND_NO_SUBPAGE_WRITE;
>  	chip->legacy.select_chip = jz4780_nand_select_chip;
> @@ -353,6 +357,10 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	if (!nfc)
>  		return -ENOMEM;
>  
> +	nfc->soc_info = device_get_match_data(dev);
> +	if (!nfc->soc_info)
> +		return -EINVAL;
> +
>  	/*
>  	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
>  	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
> @@ -390,8 +398,21 @@ static int jz4780_nand_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct jz_soc_info jz4725b_soc_info = {
> +	.data_offset = 0x00000000,
> +	.cmd_offset  = 0x00008000,
> +	.addr_offset = 0x00010000,
> +};
> +
> +static const struct jz_soc_info jz4780_soc_info = {
> +	.data_offset = 0x00000000,
> +	.cmd_offset  = 0x00400000,
> +	.addr_offset = 0x00800000,
> +};
> +
>  static const struct of_device_id jz4780_nand_dt_match[] = {
> -	{ .compatible = "ingenic,jz4780-nand" },
> +	{ .compatible = "ingenic,jz4725b-nand", .data = &jz4725b_soc_info },
> +	{ .compatible = "ingenic,jz4780-nand",  .data = &jz4780_soc_info  },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);
