From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 2/2] mtd: nand: Add support for Arasan NAND Flash
 Controller
Date: Sun, 19 Feb 2017 11:26:03 +0100
Message-ID: <20170219112603.42317e1b@bbrezillon>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
 <1483930734-10309-2-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483930734-10309-2-git-send-email-punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Punnaiah,

Sorry for the late reply.

On Mon, 9 Jan 2017 08:28:54 +0530
Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

> Added the basic driver for Arasan NAND Flash Controller used in
> Zynq UltraScale+ MPSoC. It supports only Hw ECC and upto 24bit
> correction.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v7:
> - Implemented Marek suggestions and comments
> - Corrected the acronyms those should be in caps
> - Modified kconfig/Make file to keep arasan entry in sorted order
> - Added is_vmlloc_addr check
> - Used ioread/write32_rep variants to avoid compilation error for intel
>   platforms
> - separated PIO and DMA mode read/write functions
> - Minor cleanup
> Chnages in v6:
> - Addressed most of the Brian and Boris comments
> - Separated the nandchip from the nand controller
> - Removed the ecc lookup table from driver
> - Now use framework nand waitfunction and readoob
> - Fixed the compiler warning
> - Adapted the new frameowrk changes related to ecc and ooblayout
> - Disabled the clocks after the nand_reelase
> - Now using only one completion object
> - Boris suggessions like adapting cmd_ctrl and rework on read/write byte
>   are not implemented and i will patch them later
> - Also check_erased_ecc_chunk for erase and check for is_vmalloc_addr will
>   implement later once the basic driver is mainlined.
> Changes in v5:
> - Renamed the driver filei as arasan_nand.c
> - Fixed all comments relaqted coding style
> - Fixed comments related to propagating the errors
> - Modified the anfc_write_page_hwecc as per the write_page
>   prototype
> Changes in v4:
> - Added support for onfi timing mode configuration
> - Added clock supppport
> - Added support for multiple chipselects
> Changes in v3:
> - Removed unused variables
> - Avoided busy loop and used jifies based implementation
> - Fixed compiler warnings "right shift count >= width of type"
> - Removed unneeded codei and improved error reporting
> - Added onfi version check to ensure reading the valid address cycles
> Changes in v2:
> - Added missing of.h to avoid kbuild system report erro
> ---
>  drivers/mtd/nand/Kconfig       |   8 +
>  drivers/mtd/nand/Makefile      |   1 +
>  drivers/mtd/nand/arasan_nand.c | 932 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 941 insertions(+)
>  create mode 100644 drivers/mtd/nand/arasan_nand.c

checkpatch.pl --strict reports a few coding style problems. Can you fix
them?

[...]

> +#define PROG_PGRD			BIT(0)
> +#define PROG_ERASE			BIT(2)
> +#define PROG_STATUS			BIT(3)
> +#define PROG_PGPROG			BIT(4)
> +#define PROG_RDID			BIT(6)
> +#define PROG_RDPARAM			BIT(7)
> +#define PROG_RST			BIT(8)
> +#define PROG_GET_FEATURE		BIT(9)
> +#define PROG_SET_FEATURE		BIT(10)

I know I'm being insistent on this, but I don't understand what these
different prog modes are meant for. You still have to set the NAND
command and address cycles, so it probably has to do with timing
sequences, but that's not clearly described in the doc you pointed.

[...]

> +static void anfc_rw_buf_dma(struct mtd_info *mtd, uint8_t *buf, int len,
> +			    int operation, u32 prog)
> +{
> +	dma_addr_t paddr;
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct anfc *nfc = to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	u32 eccintr = 0, dir;
> +	u32 pktsize = len, pktcount = 1;
> +
> +	if ((nfc->curr_cmd == NAND_CMD_READ0) ||
> +		((nfc->curr_cmd == NAND_CMD_SEQIN) && !nfc->iswriteoob)) {
> +		pktsize = achip->pktsize;
> +		pktcount = DIV_ROUND_UP(mtd->writesize, pktsize);
> +	}

I really don't like what's done here (the fact that you test
->curr_cmd in something that is supposed to be command agnostic). Maybe
you should just avoid using ->write_buf() when programming a page, and
have a custom function doing that.

Let's try to keep ->read/write_buf() as generic as possible.

> +	anfc_setpktszcnt(nfc, pktsize, pktcount);
> +
> +	if (!achip->bch && (nfc->curr_cmd == NAND_CMD_READ0))
> +		eccintr = MBIT_ERROR;

Ditto.

> +
> +	if (operation)
> +		dir = DMA_FROM_DEVICE;
> +	else
> +		dir = DMA_TO_DEVICE;
> +
> +	paddr = dma_map_single(nfc->dev, buf, len, dir);
> +	if (dma_mapping_error(nfc->dev, paddr)) {
> +		dev_err(nfc->dev, "Read buffer mapping error");
> +		return;
> +	}
> +	lo_hi_writeq(paddr, nfc->base + DMA_ADDR0_OFST);
> +	anfc_enable_intrs(nfc, (XFER_COMPLETE | eccintr));
> +	writel(prog, nfc->base + PROG_OFST);
> +	anfc_wait_for_event(nfc);
> +	dma_unmap_single(nfc->dev, paddr, len, dir);
> +}
> +
> +static void anfc_rw_buf_pio(struct mtd_info *mtd, uint8_t *buf, int len,
> +			    int operation, int prog)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct anfc *nfc = to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	u32 *bufptr = (u32 *)buf;
> +	u32 cnt = 0, intr = 0;
> +	u32 pktsize = len, pktcount = 1;
> +
> +	anfc_config_dma(nfc, 0);
> +
> +	if ((nfc->curr_cmd == NAND_CMD_READ0) ||
> +		((nfc->curr_cmd == NAND_CMD_SEQIN) && !nfc->iswriteoob)) {
> +		pktsize = achip->pktsize;
> +		pktcount = DIV_ROUND_UP(mtd->writesize, pktsize);
> +	}

Ditto.

> +	anfc_setpktszcnt(nfc, pktsize, pktcount);
> +
> +	if (!achip->bch && (nfc->curr_cmd == NAND_CMD_READ0))
> +		intr = MBIT_ERROR;
> +
> +	if (operation)
> +		intr |= READ_READY;
> +	else
> +		intr |= WRITE_READY;
> +
> +	anfc_enable_intrs(nfc, intr);
> +	writel(prog, nfc->base + PROG_OFST);
> +
> +	while (cnt < pktcount) {
> +		anfc_wait_for_event(nfc);
> +		cnt++;
> +		if (cnt == pktcount)
> +			anfc_enable_intrs(nfc, XFER_COMPLETE);
> +		if (operation)
> +			ioread32_rep(nfc->base + DATA_PORT_OFST, bufptr,
> +				     pktsize/4);
> +		else
> +			iowrite32_rep(nfc->base + DATA_PORT_OFST, bufptr,
> +				      pktsize/4);
> +		bufptr += (pktsize / 4);
> +		if (cnt < pktcount)
> +			anfc_enable_intrs(nfc, intr);
> +	}
> +
> +	anfc_wait_for_event(nfc);
> +}
> +
> +static void anfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct anfc *nfc = to_anfc(chip->controller);
> +
> +	if (nfc->dma && !is_vmalloc_addr(buf))

			^ virt_addr_valid(buf) ?

> +		anfc_rw_buf_dma(mtd, buf, len, 1, PROG_PGRD);
> +	else
> +		anfc_rw_buf_pio(mtd, buf, len, 1, PROG_PGRD);
> +}
> +
> +static void anfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct anfc *nfc = to_anfc(chip->controller);
> +
> +	if (nfc->dma && !is_vmalloc_addr(buf))
> +		anfc_rw_buf_dma(mtd, (char *)buf, len, 0, PROG_PGPROG);
> +	else
> +		anfc_rw_buf_pio(mtd, (char *)buf, len, 0, PROG_PGPROG);
> +}
> +
> +static int anfc_read_page_hwecc(struct mtd_info *mtd,
> +				struct nand_chip *chip, uint8_t *buf,
> +				int oob_required, int page)
> +{
> +	u32 val;
> +	struct anfc *nfc = to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +
> +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDOUT, NAND_CMD_RNDOUTSTART);
> +	anfc_config_ecc(nfc, 1);
> +
> +	val = readl(nfc->base + CMD_OFST);
> +	val = val | ECC_ENABLE;
> +	writel(val, nfc->base + CMD_OFST);

Hm, isn't it done in anfc_config_ecc()?

> +
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +
> +	val = readl(nfc->base + ECC_ERR_CNT_OFST);
> +	if (achip->bch) {
> +		mtd->ecc_stats.corrected += val & PAGE_ERR_CNT_MASK;
> +	} else {
> +		val = readl(nfc->base + ECC_ERR_CNT_1BIT_OFST);
> +		mtd->ecc_stats.corrected += val;
> +		val = readl(nfc->base + ECC_ERR_CNT_2BIT_OFST);
> +		mtd->ecc_stats.failed += val;
> +		/* Clear ecc error count register 1Bit, 2Bit */
> +		writel(0x0, nfc->base + ECC_ERR_CNT_1BIT_OFST);
> +		writel(0x0, nfc->base + ECC_ERR_CNT_2BIT_OFST);
> +	}
> +
> +	if (oob_required)
> +		chip->ecc.read_oob(mtd, chip, page);
> +

Shouldn't you disable the ECC engine here (anfc_config_ecc(nfc, 0))?

> +	return 0;
> +}
> +
> +static int anfc_write_page_hwecc(struct mtd_info *mtd,
> +				 struct nand_chip *chip, const uint8_t *buf,
> +				 int oob_required, int page)
> +{
> +	int ret;
> +	struct anfc *nfc = to_anfc(chip->controller);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	uint8_t *ecc_calc = chip->buffers->ecccalc;
> +
> +	anfc_set_eccsparecmd(nfc, achip, NAND_CMD_RNDIN, 0);
> +	anfc_config_ecc(nfc, 1);
> +
> +	chip->write_buf(mtd, buf, mtd->writesize);
> +
> +	if (oob_required) {
> +		chip->waitfunc(mtd, chip);
> +		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> +		chip->read_buf(mtd, ecc_calc, mtd->oobsize);
> +		ret = mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi,
> +						 0, chip->ecc.total);
> +		if (ret)
> +			return ret;
> +		chip->ecc.write_oob(mtd, chip, page);
> +	}

Ditto:

	anfc_config_ecc(nfc, 0);


> +
> +	return 0;
> +}
> +
> +static u8 anfc_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct anfc *nfc = to_anfc(chip->controller);
> +
> +	return nfc->buf[nfc->bufshift++];

I'm still not happy with this intermediate buffer. Can't you just call
anfc_read_buf() with len = 1 ?

> +}

[...]

> +
> +static void anfc_cmd_function(struct mtd_info *mtd,
> +			      unsigned int cmd, int column, int page_addr)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct anfc_nand_chip *achip = to_anfc_nand(chip);
> +	struct anfc *nfc = to_anfc(chip->controller);
> +	bool wait = false, read = false;
> +	u32 addrcycles, prog;
> +	u32 *bufptr = (u32 *)nfc->buf;
> +
> +	nfc->bufshift = 0;
> +	nfc->curr_cmd = cmd;
> +
> +	if (page_addr == -1)
> +		page_addr = 0;
> +	if (column == -1)
> +		column = 0;
> +
> +	switch (cmd) {
> +	case NAND_CMD_RESET:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> +		prog = PROG_RST;
> +		wait = true;
> +		break;
> +	case NAND_CMD_SEQIN:
> +		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
> +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_PAGEPROG, 1,
> +				 mtd->writesize, addrcycles);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	case NAND_CMD_READOOB:
> +		column += mtd->writesize;
> +	case NAND_CMD_READ0:
> +	case NAND_CMD_READ1:
> +		addrcycles = achip->raddr_cycles + achip->caddr_cycles;
> +		anfc_prepare_cmd(nfc, NAND_CMD_READ0, NAND_CMD_READSTART, 1,
> +				 mtd->writesize, addrcycles);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	case NAND_CMD_RNDOUT:
> +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_RNDOUTSTART, 1,
> +				 mtd->writesize, 2);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	case NAND_CMD_PARAM:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		anfc_rw_buf_pio(mtd, nfc->buf,
> +				(4 * sizeof(struct nand_onfi_params)),
> +				1, PROG_RDPARAM);
> +		break;
> +	case NAND_CMD_READID:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		anfc_rw_buf_pio(mtd, nfc->buf, ONFI_ID_LEN, 1, PROG_RDID);
> +		break;
> +	case NAND_CMD_ERASE1:
> +		addrcycles = achip->raddr_cycles;
> +		prog = PROG_ERASE;
> +		anfc_prepare_cmd(nfc, cmd, NAND_CMD_ERASE2, 0, 0, addrcycles);
> +		column = page_addr & 0xffff;
> +		page_addr = (page_addr >> PG_ADDR_SHIFT) & 0xffff;
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		wait = true;
> +		break;
> +	case NAND_CMD_STATUS:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 0);
> +		anfc_setpktszcnt(nfc, achip->spktsize/4, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		prog = PROG_STATUS;
> +		wait = read = true;
> +		break;
> +	case NAND_CMD_GET_FEATURES:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		anfc_rw_buf_pio(mtd, nfc->buf, achip->spktsize, 1,
> +				PROG_GET_FEATURE);

As already mentioned above, I don't understand why do you sometime do
the data xfer (READID, CMDPARAM, GET/SET_FEATURES) in ->cmdfunc()
instead of ->read/write_byte/buf()?

> +		break;
> +	case NAND_CMD_SET_FEATURES:
> +		anfc_prepare_cmd(nfc, cmd, 0, 0, 0, 1);
> +		anfc_setpagecoladdr(nfc, page_addr, column);
> +		break;
> +	default:

Please put a dev/pr_warn() here.

> +		return;
> +	}
> +
> +	if (wait) {
> +		anfc_enable_intrs(nfc, XFER_COMPLETE);
> +		writel(prog, nfc->base + PROG_OFST);
> +		anfc_wait_for_event(nfc);
> +	}
> +
> +	if (read)
> +		bufptr[0] = readl(nfc->base + FLASH_STS_OFST);

Hm, I'm pretty sure that won't always work. The core sometime send
the NAND_CMD_STATUS once and then polls the status by calling
->read_byte() several times. Here, you're only storing the status byte
when the command is sent.
This tend to confirm my previous statement: doing I/Os in ->cmdfunc()
is a bad idea.

> +}
> +

[...]

> +
> +static int anfc_init_timing_mode(struct anfc *nfc,
> +				 struct anfc_nand_chip *achip)
> +{
> +	int mode, err;
> +	unsigned int feature[2];
> +	u32 inftimeval;
> +	struct nand_chip *chip = &achip->chip;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +	memset(feature, 0, NVDDR_MODE_PACKET_SIZE);
> +	/* Get nvddr timing modes */
> +	mode = onfi_get_sync_timing_mode(chip) & 0xff;
> +	if (!mode) {
> +		mode = fls(onfi_get_async_timing_mode(chip)) - 1;
> +		inftimeval = mode;
> +	} else {
> +		mode = fls(mode) - 1;
> +		inftimeval = NVDDR_MODE | (mode << NVDDR_TIMING_MODE_SHIFT);
> +		mode |= ONFI_DATA_INTERFACE_NVDDR;
> +	}
> +
> +	feature[0] = mode;
> +	chip->select_chip(mtd, achip->csnum);
> +	err = chip->onfi_set_features(mtd, chip, ONFI_FEATURE_ADDR_TIMING_MODE,
> +				      (uint8_t *)feature);
> +	chip->select_chip(mtd, -1);
> +	if (err)
> +		return err;
> +
> +	achip->inftimeval = inftimeval;
> +
> +	if (mode & ONFI_DATA_INTERFACE_NVDDR)
> +		achip->spktsize = NVDDR_MODE_PACKET_SIZE;
> +
> +	return 0;
> +}

The ->setup_data_interface() hook has been added in 4.9. Can you
enhance the core to support DDR interfaces?

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
