From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 10/14] qcom: mtd: nand: support for QPIC Page read/write
Date: Tue, 4 Jul 2017 15:14:20 +0530
Message-ID: <56a361f8-c9ac-4ed8-5593-f8ddb9fe05bd@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-11-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498720566-20782-11-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/29/2017 12:46 PM, Abhishek Sahu wrote:
> 1. Add the function for command descriptor preparation which
>     will be used only by BAM DMA and it will form the DMA descriptors
>     containing command elements.
> 
> 2. Add the data descriptor preparation function which will be used
>     only by BAM DMA for forming the data SGL’s.
> 
> 3. Add clear BAM transaction and call it before every new request
> 
> 4. Check DMA mode for ADM or BAM and call the appropriate
>     descriptor formation function.
> 
> 5. Enable the BAM in NAND_CTRL.
> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 190 +++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 180 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 17766af..4c6e594 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -156,6 +156,8 @@
>   #define	FETCH_ID			0xb
>   #define	RESET_DEVICE			0xd
>   
> +/* NAND_CTRL bits */
> +#define	BAM_MODE_EN			BIT(0)
>   /*
>    * the NAND controller performs reads/writes with ECC in 516 byte chunks.
>    * the driver calls the chunks 'step' or 'codeword' interchangeably
> @@ -190,6 +192,14 @@
>    */
>   #define NAND_ERASED_CW_SET		(0x0008)
>   
> +/* Returns the dma address for reg read buffer */
> +#define REG_BUF_DMA_ADDR(chip, vaddr) \
> +	((chip)->reg_read_buf_phys + \
> +	((uint8_t *)(vaddr) - (uint8_t *)(chip)->reg_read_buf))
> +
> +/* Returns the NAND register physical address */
> +#define NAND_REG_PHYS(chip, offset) ((chip)->base_phys + (offset))
> +
>   #define QPIC_PER_CW_MAX_CMD_ELEMENTS	(32)
>   #define QPIC_PER_CW_MAX_CMD_SGL		(32)
>   #define QPIC_PER_CW_MAX_DATA_SGL	(8)
> @@ -287,7 +297,8 @@ struct nandc_regs {
>    *				controller
>    * @dev:			parent device
>    * @base:			MMIO base
> - * @base_dma:			physical base address of controller registers
> + * @base_phys:			physical base address of controller registers
> + * @base_dma:			dma base address of controller registers
>    * @core_clk:			controller clock
>    * @aon_clk:			another controller clock
>    *
> @@ -323,6 +334,7 @@ struct qcom_nand_controller {
>   	struct device *dev;
>   
>   	void __iomem *base;
> +	phys_addr_t base_phys;
>   	dma_addr_t base_dma;
>   
>   	struct clk *core_clk;
> @@ -467,6 +479,29 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
>   	return bam_txn;
>   }
>   
> +/* Clears the BAM transaction indexes */
> +static void clear_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	if (!nandc->dma_bam_enabled)
> +		return;
> +
> +	bam_txn->bam_ce_pos = 0;
> +	bam_txn->bam_ce_start = 0;
> +	bam_txn->cmd_sgl_pos = 0;
> +	bam_txn->cmd_sgl_start = 0;
> +	bam_txn->tx_sgl_pos = 0;
> +	bam_txn->tx_sgl_start = 0;
> +	bam_txn->rx_sgl_pos = 0;
> +	bam_txn->rx_sgl_start = 0;
> +
> +	sg_init_table(bam_txn->cmd_sgl, nandc->max_cwperpage *
> +		      QPIC_PER_CW_MAX_CMD_SGL);
> +	sg_init_table(bam_txn->data_sg, nandc->max_cwperpage *
> +		      QPIC_PER_CW_MAX_DATA_SGL);
> +}
> +
>   static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
>   {
>   	return container_of(chip, struct qcom_nand_host, chip);
> @@ -682,6 +717,102 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
>   	return 0;
>   }
>   
> +/*
> + * Prepares the command descriptor for BAM DMA which will be used for NAND
> + * register reads and writes. The command descriptor requires the command
> + * to be formed in command element type so this function uses the command
> + * element from bam transaction ce array and fills the same with required
> + * data. A single SGL can contain multiple command elements so
> + * NAND_BAM_NEXT_SGL will be used for starting the separate SGL
> + * after the current command element.
> + */
> +static int prep_dma_desc_command(struct qcom_nand_controller *nandc, bool read,
> +				 int reg_off, const void *vaddr,
> +				 int size, unsigned int flags)
> +{
> +	int bam_ce_size;
> +	int i, ret;
> +	struct bam_cmd_element *bam_ce_buffer;
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_pos];
> +
> +	/* fill the command desc */
> +	for (i = 0; i < size; i++) {
> +		if (read)
> +			bam_prep_ce(&bam_ce_buffer[i],
> +				    NAND_REG_PHYS(nandc, reg_off + 4 * i),
> +				    BAM_READ_COMMAND,
> +				    REG_BUF_DMA_ADDR(nandc,
> +						     (__le32 *)vaddr + i));
> +		else
> +			bam_prep_ce_le32(&bam_ce_buffer[i],
> +					 NAND_REG_PHYS(nandc, reg_off + 4 * i),
> +					 BAM_WRITE_COMMAND,
> +					 *((__le32 *)vaddr + i));
> +	}
> +
> +	bam_txn->bam_ce_pos += size;
> +
> +	/* use the separate sgl after this command */
> +	if (flags & NAND_BAM_NEXT_SGL) {
> +		bam_ce_buffer = &bam_txn->bam_ce[bam_txn->bam_ce_start];
> +		bam_ce_size = (bam_txn->bam_ce_pos -
> +				bam_txn->bam_ce_start) *
> +				sizeof(struct bam_cmd_element);
> +		sg_set_buf(&bam_txn->cmd_sgl[bam_txn->cmd_sgl_pos],
> +			   bam_ce_buffer, bam_ce_size);
> +		bam_txn->cmd_sgl_pos++;
> +		bam_txn->bam_ce_start = bam_txn->bam_ce_pos;
> +
> +		if (flags & NAND_BAM_NWD) {
> +			ret = prepare_bam_async_desc(nandc, nandc->cmd_chan,
> +						     DMA_PREP_FENCE |
> +						     DMA_PREP_CMD);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Prepares the data descriptor for BAM DMA which will be used for NAND
> + * data reads and writes.
> + */
> +static int prep_dma_desc_data_bam(struct qcom_nand_controller *nandc, bool read,
> +				  int reg_off, const void *vaddr,
> +				  int size, unsigned int flags)
> +{
> +	int ret;
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	if (read) {
> +		sg_set_buf(&bam_txn->data_sg[bam_txn->rx_sgl_pos],
> +			   vaddr, size);
> +		bam_txn->rx_sgl_pos++;
> +	} else {
> +		sg_set_buf(&bam_txn->data_sg[bam_txn->tx_sgl_pos],
> +			   vaddr, size);
> +		bam_txn->tx_sgl_pos++;
> +
> +		/*
> +		 * BAM will only set EOT for DMA_PREP_INTERRUPT so if this flag
> +		 * is not set, form the DMA descriptor
> +		 */
> +		if (!(flags & NAND_BAM_NO_EOT)) {
> +			ret = prepare_bam_async_desc(nandc, nandc->tx_chan,
> +						     DMA_PREP_INTERRUPT);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* Prepares the dma descriptor for adm dma engine */
>   static int prep_dma_desc(struct qcom_nand_controller *nandc, bool read,
>   			 int reg_off, const void *vaddr, int size,
>   			 bool flow_control)
> @@ -764,16 +895,19 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
>   {
>   	bool flow_control = false;
>   	void *vaddr;
> -	int size;
>   
>   	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
>   		flow_control = true;
>   
> -	size = num_regs * sizeof(u32);
>   	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
>   	nandc->reg_read_pos += num_regs;
>   
> -	return prep_dma_desc(nandc, true, first, vaddr, size, flow_control);
> +	if (nandc->dma_bam_enabled)
> +		return prep_dma_desc_command(nandc, true, first, vaddr,
> +					     num_regs, flags);
> +
> +	return prep_dma_desc(nandc, true, first, vaddr, num_regs * sizeof(u32),
> +			     flow_control);
>   }
>   
>   /*
> @@ -789,7 +923,6 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>   	bool flow_control = false;
>   	struct nandc_regs *regs = nandc->regs;
>   	void *vaddr;
> -	int size;
>   
>   	vaddr = offset_to_nandc_reg(regs, first);
>   
> @@ -812,9 +945,12 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>   	if (first == NAND_DEV_CMD_VLD_RESTORE)
>   		first = NAND_DEV_CMD_VLD;
>   
> -	size = num_regs * sizeof(u32);
> +	if (nandc->dma_bam_enabled)
> +		return prep_dma_desc_command(nandc, false, first, vaddr,
> +					     num_regs, flags);
>   
> -	return prep_dma_desc(nandc, false, first, vaddr, size, flow_control);
> +	return prep_dma_desc(nandc, false, first, vaddr, num_regs * sizeof(u32),
> +			     flow_control);
>   }
>   
>   /*
> @@ -828,6 +964,10 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>   static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   			 const u8 *vaddr, int size, unsigned int flags)
>   {
> +	if (nandc->dma_bam_enabled)
> +		return prep_dma_desc_data_bam(nandc, true, reg_off, vaddr, size,
> +					      flags);
> +
>   	return prep_dma_desc(nandc, true, reg_off, vaddr, size, false);
>   }
>   
> @@ -842,6 +982,10 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   			  const u8 *vaddr, int size, unsigned int flags)
>   {
> +	if (nandc->dma_bam_enabled)
> +		return prep_dma_desc_data_bam(nandc, false, reg_off, vaddr,
> +					      size, flags);
> +
>   	return prep_dma_desc(nandc, false, reg_off, vaddr, size, false);
>   }
>   
> @@ -931,6 +1075,8 @@ static int nandc_param(struct qcom_nand_host *host)
>   	struct nand_chip *chip = &host->chip;
>   	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>   
> +	clear_bam_transaction(nandc);

For all the commands that go through chip->cmdfunc, can we move
clear_bam_transaction() calls to pre_command()?

Thanks,
Archit

>   	/*
>   	 * NAND_CMD_PARAM is called before we know much about the FLASH chip
>   	 * in use. we configure the controller to perform a raw read of 512
> @@ -993,6 +1139,8 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
>   	struct nand_chip *chip = &host->chip;
>   	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>   
> +	clear_bam_transaction(nandc);
> +
>   	nandc_set_reg(nandc, NAND_FLASH_CMD,
>   		      BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
>   	nandc_set_reg(nandc, NAND_ADDR0, page_addr);
> @@ -1025,10 +1173,13 @@ static int read_id(struct qcom_nand_host *host, int column)
>   	if (column == -1)
>   		return 0;
>   
> +	clear_bam_transaction(nandc);
> +
>   	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
>   	nandc_set_reg(nandc, NAND_ADDR0, column);
>   	nandc_set_reg(nandc, NAND_ADDR1, 0);
> -	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
> +	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
> +		      nandc->dma_bam_enabled ? 0 : DM_EN);
>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>   
>   	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
> @@ -1045,6 +1196,8 @@ static int reset(struct qcom_nand_host *host)
>   	struct nand_chip *chip = &host->chip;
>   	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>   
> +	clear_bam_transaction(nandc);
> +
>   	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>   
> @@ -1561,6 +1714,7 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>   	data_buf = buf;
>   	oob_buf = oob_required ? chip->oob_poi : NULL;
>   
> +	clear_bam_transaction(nandc);
>   	ret = read_page_ecc(host, data_buf, oob_buf);
>   	if (ret) {
>   		dev_err(nandc->dev, "failure to read page\n");
> @@ -1585,6 +1739,8 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
>   	oob_buf = chip->oob_poi;
>   
>   	host->use_ecc = false;
> +
> +	clear_bam_transaction(nandc);
>   	update_rw_regs(host, ecc->steps, true);
>   
>   	for (i = 0; i < ecc->steps; i++) {
> @@ -1641,6 +1797,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>   	int ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	host->use_ecc = true;
>   	set_address(host, 0, page);
> @@ -1664,6 +1821,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>   	int i, ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	data_buf = (u8 *)buf;
>   	oob_buf = chip->oob_poi;
> @@ -1729,6 +1887,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
>   	int i, ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	data_buf = (u8 *)buf;
>   	oob_buf = chip->oob_poi;
> @@ -1803,6 +1962,7 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>   
>   	host->use_ecc = true;
>   
> +	clear_bam_transaction(nandc);
>   	ret = copy_last_cw(host, page);
>   	if (ret)
>   		return ret;
> @@ -1860,6 +2020,7 @@ static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
>   	 */
>   	host->use_ecc = false;
>   
> +	clear_bam_transaction(nandc);
>   	ret = copy_last_cw(host, page);
>   	if (ret)
>   		goto err;
> @@ -1890,6 +2051,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
>   	int page, ret, status = 0;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	/*
>   	 * to mark the BBM as bad, we flash the entire last codeword with 0s.
> @@ -2396,11 +2558,18 @@ static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
>   /* one time setup of a few nand controller registers */
>   static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
>   {
> +	u32 nand_ctrl;
> +
>   	/* kill onenand */
>   	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>   
> -	/* enable ADM DMA */
> -	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
> +	/* enable ADM or BAM DMA */
> +	if (!nandc->dma_bam_enabled) {
> +		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
> +	} else {
> +		nand_ctrl = nandc_read(nandc, NAND_CTRL);
> +		nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
> +	}
>   
>   	/* save the original values of these registers */
>   	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
> @@ -2592,6 +2761,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>   	if (IS_ERR(nandc->base))
>   		return PTR_ERR(nandc->base);
>   
> +	nandc->base_phys = res->start;
>   	nandc->base_dma = phys_to_dma(dev, (phys_addr_t)res->start);
>   
>   	nandc->core_clk = devm_clk_get(dev, "core");
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
