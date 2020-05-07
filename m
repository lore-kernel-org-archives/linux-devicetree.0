Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2665C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CAF320838
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgEGPJd convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 11:09:33 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47517 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgEGPJd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 11:09:33 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9BA89200006;
        Thu,  7 May 2020 15:09:27 +0000 (UTC)
Date:   Thu, 7 May 2020 17:09:26 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v3 8/8] mtd: rawnand: arasan: Support the hardware BCH
 ECC engine
Message-ID: <20200507170926.1dd85246@xps13>
In-Reply-To: <20200507140336.02b3edff@collabora.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-9-miquel.raynal@bootlin.com>
        <20200507140336.02b3edff@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
2020 14:03:36 +0200:

> On Thu,  7 May 2020 13:00:34 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Add support for the hardware ECC BCH engine.
> > 
> > Please mind that this engine as an important limitation:  
> 
> 				^has

Oops

> 
> > BCH implementation does not inform the user when an uncorrectable ECC
> > error occurs. To workaround this, we avoid using the hardware engine
> > in the read path and do the computation with the software BCH
> > implementation, which is faster than mixing hardware (for correction)
> > and software (for verification).
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/arasan-nand-controller.c | 340 ++++++++++++++++++
> >  1 file changed, 340 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
> > index 61ea90ecf86e..01c0a741b4cd 100644
> > --- a/drivers/mtd/nand/raw/arasan-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
> > @@ -10,6 +10,7 @@
> >   *   Naga Sureshkumar Relli <nagasure@xilinx.com>
> >   */
> >  
> > +#include <linux/bch.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> > @@ -143,6 +144,10 @@ struct anfc_op {
> >   * @strength:		Register value of the ECC strength
> >   * @raddr_cycles:	Row address cycle information
> >   * @caddr_cycles:	Column address cycle information
> > + * @ecc_bits:		Exact number of ECC bits per syndrome
> > + * @ecc_total:		Total number of ECC bytes
> > + * @hw_ecc:		Buffer to store syndromes computed by hardware
> > + * @bch:		BCH structure
> >   */
> >  struct anand {
> >  	struct list_head node;
> > @@ -156,6 +161,10 @@ struct anand {
> >  	u32 strength;
> >  	u16 raddr_cycles;
> >  	u16 caddr_cycles;
> > +	unsigned int ecc_bits;
> > +	unsigned int ecc_total;
> > +	u8 *hw_ecc;
> > +	struct bch_control *bch;
> >  };
> >  
> >  /**
> > @@ -168,6 +177,7 @@ struct anand {
> >   * @chips:		List of all NAND chips attached to the controller
> >   * @assigned_cs:	Bitmask describing already assigned CS lines
> >   * @cur_clk:		Current clock rate
> > + * @errloc:		Array of errors located with soft BCH
> >   * @bf:			Array of bitflips read in each ECC step
> >   */
> >  struct arasan_nfc {
> > @@ -179,6 +189,7 @@ struct arasan_nfc {
> >  	struct list_head chips;
> >  	unsigned long assigned_cs;
> >  	unsigned int cur_clk;
> > +	unsigned int *errloc;
> >  	u8 *bf;
> >  };
> >  
> > @@ -257,6 +268,206 @@ static int anfc_len_to_steps(struct nand_chip *chip, unsigned int len)
> >  	return steps;
> >  }
> >  
> > +static void anfc_extract_ecc_bits(struct anand *anand, const u8 *ecc)
> > +{
> > +	struct nand_chip *chip = &anand->chip;
> > +	int step;
> > +
> > +	memset(anand->hw_ecc, 0, chip->ecc.bytes * chip->ecc.steps);
> > +
> > +	for (step = 0; step < chip->ecc.steps; step++) {
> > +		unsigned int src_off = anand->ecc_bits * step;
> > +		u8 *dst = &anand->hw_ecc[chip->ecc.bytes * step];
> > +
> > +		/* Extract the syndrome, it is not necessarily aligned */
> > +		nand_extract_bits(dst, ecc, src_off, anand->ecc_bits);  
> 
> I don't think you need to extract all bytes ahead of time. Just move
> the extraction bits to the for_each_ecc_step() loop in
> anfc_read_page_hw_ecc(). This way you can make the anand->hw_ecc buffer
> smaller.

Faire enough.

> 
> > +	}
> > +}
> > +
> > +/*
> > + * When using the embedded hardware ECC engine, the controller is in charge of
> > + * feeding the engine with, first, the ECC residue present in the data array.
> > + * A typical read operation is:
> > + * 1/ Assert the read operation by sending the relevant command/address cycles
> > + *    but targeting the column of the first ECC bytes in the OOB area instead of
> > + *    the main data directly.
> > + * 2/ After having read the relevant number of ECC bytes, the controller uses
> > + *    the RNDOUT/RNDSTART commands which are set into the "ECC Spare Command
> > + *    Register" to move the pointer back at the beginning of the main data.
> > + * 3/ It will read the content of the main area for a given size (pktsize) and
> > + *    will feed the ECC engine with this buffer again.
> > + * 4/ The ECC engine derives the ECC bytes for the given data and compare them
> > + *    with the ones already received. It eventually trigger status flags and
> > + *    then set the "Buffer Read Ready" flag.
> > + * 5/ The corrected data is then available for reading from the data port
> > + *    register.
> > + *
> > + * The hardware BCH ECC engine is known to be inconstent in BCH mode and never
> > + * reports errors. We need to ensure we return consistent data. This involves  
> 
> 	     ^ uncorrectable errors

True.

> 
> > + * knowing the primary polynomial used by the hardware engine and compute the
> > + * syndrome by ourselves in the read path instead of relying on the hardware.  
> 
> I would just say "Because of this bug, we have to use the
> software BCH implementation in the read path."
> 
> > + */
> > +static int anfc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
> > +				 int oob_required, int page)
> > +{
> > +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +	struct anand *anand = to_anand(chip);
> > +	unsigned int len = mtd->writesize + (oob_required ? mtd->oobsize : 0);
> > +	unsigned int max_bitflips = 0;
> > +	dma_addr_t paddr;
> > +	int step, ret;
> > +	struct anfc_op nfc_op = {
> > +		.pkt_reg =
> > +			PKT_SIZE(chip->ecc.size) |
> > +			PKT_STEPS(chip->ecc.steps),
> > +		.addr1_reg =
> > +			(page & 0xFF) << (8 * (anand->caddr_cycles)) |
> > +			(((page >> 8) & 0xFF) << (8 * (1 + anand->caddr_cycles))),
> > +		.addr2_reg =
> > +			((page >> 16) & 0xFF) |
> > +			ADDR2_STRENGTH(anand->strength) |
> > +			ADDR2_CS(anand->cs),
> > +		.cmd_reg =
> > +			CMD_1(NAND_CMD_READ0) |
> > +			CMD_2(NAND_CMD_READSTART) |
> > +			CMD_PAGE_SIZE(anand->page_sz) |
> > +			CMD_DMA_ENABLE |
> > +			CMD_NADDRS(anand->caddr_cycles +
> > +				   anand->raddr_cycles),
> > +		.prog_reg = PROG_PGRD,
> > +	};
> > +
> > +	paddr = dma_map_single(nfc->dev, (void *)buf, len, DMA_FROM_DEVICE);
> > +	if (dma_mapping_error(nfc->dev, paddr)) {
> > +		dev_err(nfc->dev, "Buffer mapping error");
> > +		return -EIO;
> > +	}
> > +
> > +	writel_relaxed(paddr, nfc->base + DMA_ADDR0_REG);
> > +	writel_relaxed((paddr >> 32), nfc->base + DMA_ADDR1_REG);
> > +
> > +	anfc_trigger_op(nfc, &nfc_op);
> > +
> > +	ret = anfc_wait_for_event(nfc, XFER_COMPLETE);
> > +	dma_unmap_single(nfc->dev, paddr, len, DMA_FROM_DEVICE);
> > +	if (ret) {
> > +		dev_err(nfc->dev, "Error reading page %d\n", page);
> > +		return ret;
> > +	}
> > +
> > +	/* Store the raw OOB bytes as well */
> > +	ret = nand_change_read_column_op(chip, mtd->writesize, chip->oob_poi,
> > +					 mtd->oobsize, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Extract and reorder ECC bytes */
> > +	anfc_extract_ecc_bits(anand, &chip->oob_poi[mtd->oobsize -
> > +						    anand->ecc_total]);
> > +
> > +	/*
> > +	 * For each step, compute by softare the BCH syndrome over the raw data.
> > +	 * Compare the theoretical amount of errors and compare with the
> > +	 * hardware engine feedback.
> > +	 */
> > +	for (step = 0; step < chip->ecc.steps; step++) {
> > +		u8 *raw_buf = &buf[step * chip->ecc.size];
> > +		u8 *ecc_buf = &anand->hw_ecc[chip->ecc.bytes * step];
> > +		unsigned int bit, byte;
> > +		int bf, i;
> > +
> > +		bf = bch_decode(anand->bch, raw_buf, chip->ecc.size, ecc_buf,
> > +				NULL, NULL, nfc->errloc);
> > +		if (!bf) {
> > +			continue;
> > +		} else if (bf > 0) {
> > +			for (i = 0; i < bf; i++) {
> > +				/* Only correct the data, not the syndrome */
> > +				if (nfc->errloc[i] < (chip->ecc.size * 8)) {
> > +					bit = BIT(nfc->errloc[i] & 7);
> > +					byte = nfc->errloc[i] >> 3;
> > +					raw_buf[byte] ^= bit;
> > +				}
> > +			}
> > +
> > +			mtd->ecc_stats.corrected += bf;
> > +			max_bitflips = max_t(unsigned int, max_bitflips, bf);
> > +
> > +			continue;
> > +		}
> > +
> > +		bf = nand_check_erased_ecc_chunk(raw_buf, chip->ecc.size,
> > +						 NULL, 0, NULL, 0,
> > +						 chip->ecc.strength);
> > +		if (bf > 0) {
> > +			mtd->ecc_stats.corrected += bf;
> > +			max_bitflips = max_t(unsigned int, max_bitflips, bf);
> > +			memset(raw_buf, 0xFF, chip->ecc.size);
> > +		} else if (bf < 0) {
> > +			mtd->ecc_stats.failed++;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int anfc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
> > +				  int oob_required, int page)
> > +{
> > +	struct anand *anand = to_anand(chip);
> > +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +	unsigned int len = mtd->writesize + (oob_required ? mtd->oobsize : 0);
> > +	dma_addr_t paddr;
> > +	int ret;
> > +	struct anfc_op nfc_op = {
> > +		.pkt_reg =
> > +			PKT_SIZE(chip->ecc.size) |
> > +			PKT_STEPS(chip->ecc.steps),
> > +		.addr1_reg =
> > +			(page & 0xFF) << (8 * (anand->caddr_cycles)) |
> > +			(((page >> 8) & 0xFF) << (8 * (1 + anand->caddr_cycles))),
> > +		.addr2_reg =
> > +			((page >> 16) & 0xFF) |
> > +			ADDR2_STRENGTH(anand->strength) |
> > +			ADDR2_CS(anand->cs),
> > +		.cmd_reg =
> > +			CMD_1(NAND_CMD_SEQIN) |
> > +			CMD_2(NAND_CMD_PAGEPROG) |
> > +			CMD_PAGE_SIZE(anand->page_sz) |
> > +			CMD_DMA_ENABLE |
> > +			CMD_NADDRS(anand->caddr_cycles +
> > +				   anand->raddr_cycles) |
> > +			CMD_ECC_ENABLE,
> > +		.prog_reg = PROG_PGPROG,
> > +	};
> > +
> > +	writel_relaxed(anand->ecc_conf, nfc->base + ECC_CONF_REG);
> > +	writel_relaxed(ECC_SP_CMD1(NAND_CMD_RNDIN) |
> > +		       ECC_SP_ADDRS(anand->caddr_cycles),
> > +		       nfc->base + ECC_SP_REG);
> > +
> > +	paddr = dma_map_single(nfc->dev, (void *)buf, len, DMA_TO_DEVICE);
> > +	if (dma_mapping_error(nfc->dev, paddr)) {
> > +		dev_err(nfc->dev, "Buffer mapping error");
> > +		return -EIO;
> > +	}
> > +
> > +	writel_relaxed(paddr, nfc->base + DMA_ADDR0_REG);
> > +	writel_relaxed((paddr >> 32), nfc->base + DMA_ADDR1_REG);
> > +
> > +	anfc_trigger_op(nfc, &nfc_op);
> > +	ret = anfc_wait_for_event(nfc, XFER_COMPLETE);
> > +	dma_unmap_single(nfc->dev, paddr, len, DMA_TO_DEVICE);
> > +	if (ret)
> > +		dev_err(nfc->dev, "Error writing page %d\n", page);
> > +
> > +	/* OOB data cannot be written here */
> > +
> > +	return ret;
> > +}
> > +
> >  /* NAND framework ->exec_op() hooks and related helpers */
> >  static void anfc_parse_instructions(struct nand_chip *chip,
> >  				    const struct nand_subop *subop,
> > @@ -599,6 +810,121 @@ static int anfc_setup_data_interface(struct nand_chip *chip, int target,
> >  	return 0;
> >  }
> >  
> > +static int anfc_init_hw_ecc_controller(struct arasan_nfc *nfc,
> > +				       struct nand_chip *chip)
> > +{
> > +	struct anand *anand = to_anand(chip);
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> > +	unsigned int bch_prim_poly = 0, bch_gf_mag = 0, ecc_offset;
> > +
> > +	switch (mtd->writesize) {
> > +	case SZ_512:
> > +	case SZ_2K:
> > +	case SZ_4K:
> > +	case SZ_8K:
> > +	case SZ_16K:
> > +		break;
> > +	default:
> > +		dev_err(nfc->dev, "Unsupported page size %d\n", mtd->writesize);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!ecc->size || !ecc->strength) {
> > +		ecc->size = chip->base.eccreq.step_size;
> > +		ecc->strength = chip->base.eccreq.strength;
> > +	}
> > +
> > +	if (!ecc->size || !ecc->strength) {
> > +		dev_err(nfc->dev,
> > +			"Missing controller ECC step size/strength\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (ecc->strength) {
> > +	case 1:
> > +		anand->strength = 0x0;
> > +		break;
> > +	case 12:
> > +		anand->strength = 0x1;
> > +		break;
> > +	case 8:
> > +		anand->strength = 0x2;
> > +		break;
> > +	case 4:
> > +		anand->strength = 0x3;
> > +		break;
> > +	case 24:
> > +		anand->strength = 0x4;
> > +		break;
> > +	default:  
> 
> Maybe you should pick something that's higher than the requested
> strength in that case instead of returning an error. There's generic
> helper to help with that IIRC.

That's right. I'll try to write something easier for the user so that
the nand-ecc-size/strength DT properties are not needed.

> 
> > +		dev_err(nfc->dev, "Unsupported strength %d\n", ecc->strength);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (ecc->size) {
> > +	case SZ_512:
> > +		bch_gf_mag = 13;
> > +		bch_prim_poly = 0x201b;
> > +		break;
> > +	case SZ_1K:
> > +		bch_gf_mag = 14;
> > +		bch_prim_poly = 0x4443;
> > +		break;
> > +	default:
> > +		dev_err(nfc->dev, "Unsupported step size %d\n", ecc->strength);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if ((ecc->size == SZ_1K && ecc->strength != 24) ||
> > +	    (ecc->size != SZ_1K && ecc->strength == 24)) {
> > +		dev_err(nfc->dev,
> > +			"Unsupported couple strength/step-size: %dB/%db\n",
> > +			ecc->strength, ecc->size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> > +
> > +	ecc->steps = mtd->writesize / ecc->size;
> > +
> > +	if (ecc->strength == 1) {
> > +		dev_err(nfc->dev, "Hardware Hamming engine not supported yet\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ecc->algo = NAND_ECC_BCH;
> > +	anand->ecc_bits = bch_gf_mag * ecc->strength;
> > +	ecc->bytes = DIV_ROUND_UP(anand->ecc_bits, 8);
> > +	anand->ecc_total = DIV_ROUND_UP(anand->ecc_bits * ecc->steps, 8);
> > +	ecc_offset = mtd->writesize + mtd->oobsize - anand->ecc_total;
> > +	anand->ecc_conf = ECC_CONF_COL(ecc_offset) |
> > +			  ECC_CONF_LEN(anand->ecc_total) |
> > +			  ECC_CONF_BCH_EN;
> > +
> > +	nfc->errloc = devm_kmalloc_array(nfc->dev, ecc->strength,
> > +					 sizeof(*nfc->errloc), GFP_KERNEL);
> > +	if (!nfc->errloc)
> > +		return -ENOMEM;
> > +
> > +	anand->hw_ecc = devm_kmalloc(nfc->dev, ecc->steps * ecc->bytes,
> > +				     GFP_KERNEL);
> > +	if (!anand->hw_ecc)
> > +		return -ENOMEM;
> > +
> > +	anand->bch = bch_init(bch_gf_mag, ecc->strength,
> > +			      bch_prim_poly);
> > +	if (!anand->bch)
> > +		return -EINVAL;
> > +
> > +	anand->bch->swap_bits = true;  
> 
> As mentioned in my previous reply, I don't think we should touch the
> bch_control fields (even if they are exposed).

Yes, I'll add a boolean to bch_init.

> 
> > +
> > +	ecc->read_page = anfc_read_page_hw_ecc;
> > +	ecc->write_page = anfc_write_page_hw_ecc;
> > +
> > +	return 0;
> > +}
> > +
> >  static int anfc_attach_chip(struct nand_chip *chip)
> >  {
> >  	struct anand *anand = to_anand(chip);
> > @@ -649,6 +975,8 @@ static int anfc_attach_chip(struct nand_chip *chip)
> >  	case NAND_ECC_ON_DIE:
> >  		break;
> >  	case NAND_ECC_HW:
> > +		ret = anfc_init_hw_ecc_controller(nfc, chip);
> > +		break;
> >  	default:
> >  		dev_err(nfc->dev, "Unsupported ECC mode: %d\n",
> >  			chip->ecc.mode);
> > @@ -658,10 +986,19 @@ static int anfc_attach_chip(struct nand_chip *chip)
> >  	return ret;
> >  }
> >  
> > +static void anfc_detach_chip(struct nand_chip *chip)
> > +{
> > +	struct anand *anand = to_anand(chip);
> > +
> > +	if (anand->bch)
> > +		bch_free(anand->bch);
> > +}
> > +
> >  static const struct nand_controller_ops anfc_ops = {
> >  	.exec_op = anfc_exec_op,
> >  	.setup_data_interface = anfc_setup_data_interface,
> >  	.attach_chip = anfc_attach_chip,
> > +	.detach_chip = anfc_detach_chip,
> >  };
> >  
> >  static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
> > @@ -737,6 +1074,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
> >  	struct anand *anand, *tmp;
> >  
> >  	list_for_each_entry_safe(anand, tmp, &nfc->chips, node) {
> > +		if (anand->bch)
> > +			bch_free(anand->bch);
> > +  
> 
> Looks like you have a double-free here. I expect ->detach_chip() to be
> called as part of the nand_cleanup() step.

Good one I forgot about that.

> 
> >  		nand_release(&anand->chip);
> >  		list_del(&anand->node);
> >  	}  
> 

Thanks for reviewing!
Miquèl
