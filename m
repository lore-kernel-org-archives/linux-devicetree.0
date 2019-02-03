From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 6/9] mtd: rawnand: jz4780: Add ooblayout for the Qi
 Ben Nanonote
Date: Sun, 3 Feb 2019 08:30:04 +0100
Message-ID: <20190203083004.390b96be@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190202231926.2444-7-paul@crapouillou.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat,  2 Feb 2019 20:19:23 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> The Ben Nanonote from Qi Hardware expects a specific OOB layout on its
> NAND. If the "ingenic,oob-layout" device property is set to "qi,lb60",
> this specific OOB layout is used.

I'm really not a big fan of this ingenic,oob-layout property, it
encourages people to use new custom layouts which is just a pain to
maintain. I understand that we don't have the choice for this board as
it's already upstream, but maybe we can avoid adding this prop and
check the root compat (which should contain the board name). 

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: New patch
> 
>  drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> index baebb9a5c7c8..4b304eceae8d 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> @@ -346,6 +346,41 @@ static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
>  	return 0;
>  }
>  
> +static int qi_lb60_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				 struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section || !ecc->total)
> +		return -ERANGE;
> +
> +	oobregion->length = ecc->total;
> +	oobregion->offset = 12;
> +
> +	return 0;
> +}
> +
> +static int qi_lb60_ooblayout_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = mtd->oobsize - ecc->total - 12;
> +	oobregion->offset = 12 + ecc->total;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops qi_lb60_ooblayout_ops = {
> +	.ecc = qi_lb60_ooblayout_ecc,
> +	.free = qi_lb60_ooblayout_free,
> +};
> +
>  static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
>  				 struct mtd_oob_region *oobregion)
>  {
> @@ -409,6 +444,8 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	if (!ret) {
>  		if (!strcmp(layout, "ingenic,jz4725b")) {
>  			nfc->oob_layout  = &jz4725b_ooblayout_ops;
> +		} else if (!strcmp(layout, "qi,lb60")) {
> +			nfc->oob_layout = &qi_lb60_ooblayout_ops;
>  		} else {
>  			dev_err(dev, "Unrecognized OOB layout %s\n", layout);
>  			return -EINVAL;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
