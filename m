From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 5/9] mtd: rawnand: jz4780: Add ooblayout for the
 JZ4725B
Date: Sun, 3 Feb 2019 08:21:58 +0100
Message-ID: <20190203082158.205b6e38@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
        <20190202231926.2444-6-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190202231926.2444-6-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat,  2 Feb 2019 20:19:22 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
> NAND.
> 
> Add an optional "ingenic,oob-layout" device property. When set to
> "ingenic,jz4725b", this specific OOB layout is used.

It's a SoC-specific layout, please add a compatible for ingenic,jz4725b
and use it to determine the layout to use.

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: Instead of forcing the OOB layout, leave it to the board code or
>     devicetree to decide if the jz4725b-specific layout should be used
>     or not.
> 
>  drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> index c0855fef7735..baebb9a5c7c8 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> @@ -44,6 +44,7 @@ struct jz4780_nand_cs {
>  struct jz4780_nand_controller {
>  	struct device *dev;
>  	const struct jz_soc_info *soc_info;
> +	const struct mtd_ooblayout_ops *oob_layout;
>  	struct jz4780_bch *bch;
>  	struct nand_controller controller;
>  	unsigned int num_banks;
> @@ -213,7 +214,7 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
>  		return -EINVAL;
>  	}
>  
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nfc->oob_layout);
>  
>  	return 0;
>  }
> @@ -345,11 +346,47 @@ static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
>  	return 0;
>  }
>  
> +static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				 struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section || !ecc->total)
> +		return -ERANGE;
> +
> +	oobregion->length = ecc->total;
> +	oobregion->offset = 3;
> +
> +	return 0;
> +}
> +
> +static int jz4725b_ooblayout_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = mtd->oobsize - ecc->total - 3;
> +	oobregion->offset = 3 + ecc->total;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
> +	.ecc = jz4725b_ooblayout_ecc,
> +	.free = jz4725b_ooblayout_free,
> +};
> +
>  static int jz4780_nand_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	unsigned int num_banks;
>  	struct jz4780_nand_controller *nfc;
> +	const char *layout;
>  	int ret;
>  
>  	num_banks = jz4780_nemc_num_banks(dev);
> @@ -366,6 +403,18 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	if (!nfc->soc_info)
>  		return -EINVAL;
>  
> +	nfc->oob_layout = &nand_ooblayout_lp_ops;
> +
> +	ret = device_property_read_string(dev, "ingenic,oob-layout", &layout);
> +	if (!ret) {
> +		if (!strcmp(layout, "ingenic,jz4725b")) {
> +			nfc->oob_layout  = &jz4725b_ooblayout_ops;
> +		} else {
> +			dev_err(dev, "Unrecognized OOB layout %s\n", layout);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/*
>  	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
>  	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
