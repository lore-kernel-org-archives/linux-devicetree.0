From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROME mode
Date: Wed, 21 Mar 2018 10:53:27 +0100
Message-ID: <20180321105327.27a28987@bbrezillon>
References: <20180321083618.18355-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180321083618.18355-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Kumar Gala <galak@codeaurora.org>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Mar 2018 09:36:18 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> This mode is not used by any existing setup and should not be used
> because it overrides the BBMs. Let's just remove it before someone

	     ^ 'overwrites' not 'overrides'

> starts using it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/sunxi-nand.txt         |   4 +-
>  drivers/mtd/nand/raw/sunxi_nand.c                  | 155 +++------------------
>  2 files changed, 22 insertions(+), 137 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> index 5e13a5cdff03..0734f03bf3d3 100644
> --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> @@ -24,8 +24,8 @@ Optional properties:
>  - allwinner,rb : shall contain the native Ready/Busy ids.
>   or
>  - rb-gpios : shall contain the gpios used as R/B pins.
> -- nand-ecc-mode : one of the supported ECC modes ("hw", "hw_syndrome", "soft",
> -  "soft_bch" or "none")
> +- nand-ecc-mode : one of the supported ECC modes ("hw", "soft", "soft_bch" or
> +		  "none")
>  
>  see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
>  
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index f5a55c63935c..aad42812a353 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1475,92 +1475,18 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct mtd_info *mtd,
>  	return sunxi_nfc_hw_ecc_write_page(mtd, chip, buf, oob_required, page);
>  }
>  
> -static int sunxi_nfc_hw_syndrome_ecc_read_page(struct mtd_info *mtd,
> -					       struct nand_chip *chip,
> -					       uint8_t *buf, int oob_required,
> -					       int page)
> -{
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -	unsigned int max_bitflips = 0;
> -	int ret, i, cur_off = 0;
> -	bool raw_mode = false;
> -
> -	nand_read_page_op(chip, page, 0, NULL, 0);
> -
> -	sunxi_nfc_hw_ecc_enable(mtd);
> -
> -	for (i = 0; i < ecc->steps; i++) {
> -		int data_off = i * (ecc->size + ecc->bytes + 4);
> -		int oob_off = data_off + ecc->size;
> -		u8 *data = buf + (i * ecc->size);
> -		u8 *oob = chip->oob_poi + (i * (ecc->bytes + 4));
> -
> -		ret = sunxi_nfc_hw_ecc_read_chunk(mtd, data, data_off, oob,
> -						  oob_off, &cur_off,
> -						  &max_bitflips, !i,
> -						  oob_required,
> -						  page);
> -		if (ret < 0)
> -			return ret;
> -		else if (ret)
> -			raw_mode = true;
> -	}
> -
> -	if (oob_required)
> -		sunxi_nfc_hw_ecc_read_extra_oob(mtd, chip->oob_poi, &cur_off,
> -						!raw_mode, page);
> -
> -	sunxi_nfc_hw_ecc_disable(mtd);
> -
> -	return max_bitflips;
> -}
> -
> -static int sunxi_nfc_hw_syndrome_ecc_write_page(struct mtd_info *mtd,
> -						struct nand_chip *chip,
> -						const uint8_t *buf,
> -						int oob_required, int page)
> -{
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -	int ret, i, cur_off = 0;
> -
> -	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
> -
> -	sunxi_nfc_hw_ecc_enable(mtd);
> -
> -	for (i = 0; i < ecc->steps; i++) {
> -		int data_off = i * (ecc->size + ecc->bytes + 4);
> -		int oob_off = data_off + ecc->size;
> -		const u8 *data = buf + (i * ecc->size);
> -		const u8 *oob = chip->oob_poi + (i * (ecc->bytes + 4));
> -
> -		ret = sunxi_nfc_hw_ecc_write_chunk(mtd, data, data_off,
> -						   oob, oob_off, &cur_off,
> -						   false, page);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	if (oob_required || (chip->options & NAND_NEED_SCRAMBLING))
> -		sunxi_nfc_hw_ecc_write_extra_oob(mtd, chip->oob_poi,
> -						 &cur_off, page);
> -
> -	sunxi_nfc_hw_ecc_disable(mtd);
> -
> -	return nand_prog_page_end_op(chip);
> -}
> -
> -static int sunxi_nfc_hw_common_ecc_read_oob(struct mtd_info *mtd,
> -					    struct nand_chip *chip,
> -					    int page)
> +static int sunxi_nfc_hw_ecc_read_oob(struct mtd_info *mtd,
> +				     struct nand_chip *chip,
> +				     int page)
>  {
>  	chip->pagebuf = -1;
>  
>  	return chip->ecc.read_page(mtd, chip, chip->data_buf, 1, page);
>  }
>  
> -static int sunxi_nfc_hw_common_ecc_write_oob(struct mtd_info *mtd,
> -					     struct nand_chip *chip,
> -					     int page)
> +static int sunxi_nfc_hw_ecc_write_oob(struct mtd_info *mtd,
> +				      struct nand_chip *chip,
> +				      int page)
>  {
>  	int ret;
>  
> @@ -1801,9 +1727,14 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
>  	.free = sunxi_nand_ooblayout_free,
>  };
>  
> -static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
> -					      struct nand_ecc_ctrl *ecc,
> -					      struct device_node *np)
> +static void sunxi_nand_hw_ecc_ctrl_cleanup(struct nand_ecc_ctrl *ecc)
> +{
> +	kfree(ecc->priv);
> +}
> +
> +static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
> +				       struct nand_ecc_ctrl *ecc,
> +				       struct device_node *np)
>  {
>  	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
>  	struct nand_chip *nand = mtd_to_nand(mtd);
> @@ -1889,37 +1820,11 @@ static int sunxi_nand_hw_common_ecc_ctrl_init(struct mtd_info *mtd,
>  		goto err;
>  	}
>  
> -	ecc->read_oob = sunxi_nfc_hw_common_ecc_read_oob;
> -	ecc->write_oob = sunxi_nfc_hw_common_ecc_write_oob;
> +	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
> +	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
>  	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
>  	ecc->priv = data;
>  
> -	return 0;
> -
> -err:
> -	kfree(data);
> -
> -	return ret;
> -}
> -
> -static void sunxi_nand_hw_common_ecc_ctrl_cleanup(struct nand_ecc_ctrl *ecc)
> -{
> -	kfree(ecc->priv);
> -}
> -
> -static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
> -				       struct nand_ecc_ctrl *ecc,
> -				       struct device_node *np)
> -{
> -	struct nand_chip *nand = mtd_to_nand(mtd);
> -	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
> -	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
> -	int ret;
> -
> -	ret = sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
> -	if (ret)
> -		return ret;
> -
>  	if (nfc->dmac) {
>  		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
>  		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
> @@ -1937,33 +1842,18 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
>  	ecc->write_oob_raw = nand_write_oob_std;
>  
>  	return 0;
> -}
> -
> -static int sunxi_nand_hw_syndrome_ecc_ctrl_init(struct mtd_info *mtd,
> -						struct nand_ecc_ctrl *ecc,
> -						struct device_node *np)
> -{
> -	int ret;
> -
> -	ret = sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
> -	if (ret)
> -		return ret;
>  
> -	ecc->prepad = 4;
> -	ecc->read_page = sunxi_nfc_hw_syndrome_ecc_read_page;
> -	ecc->write_page = sunxi_nfc_hw_syndrome_ecc_write_page;
> -	ecc->read_oob_raw = nand_read_oob_syndrome;
> -	ecc->write_oob_raw = nand_write_oob_syndrome;
> +err:
> +	kfree(data);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
>  {
>  	switch (ecc->mode) {
>  	case NAND_ECC_HW:
> -	case NAND_ECC_HW_SYNDROME:
> -		sunxi_nand_hw_common_ecc_ctrl_cleanup(ecc);
> +		sunxi_nand_hw_ecc_ctrl_cleanup(ecc);
>  		break;
>  	case NAND_ECC_NONE:
>  	default:
> @@ -1991,11 +1881,6 @@ static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc,
>  		if (ret)
>  			return ret;
>  		break;
> -	case NAND_ECC_HW_SYNDROME:
> -		ret = sunxi_nand_hw_syndrome_ecc_ctrl_init(mtd, ecc, np);
> -		if (ret)
> -			return ret;
> -		break;
>  	case NAND_ECC_NONE:
>  	case NAND_ECC_SOFT:
>  		break;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
