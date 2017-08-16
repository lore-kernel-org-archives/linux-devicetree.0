From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v4 12/20] mtd: nand: qcom: QPIC data descriptors handling
Date: Wed, 16 Aug 2017 11:11:16 +0530
Message-ID: <3797ccb1-6e39-ed4a-6b93-2863a2944a29@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-13-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-13-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
> 1. Add the data descriptor preparation function which will be used
>     only by BAM DMA for forming the data SGL’s
> 2. Add clear BAM transaction and call it before every new request
> 3. Check DMA mode for ADM or BAM and call the appropriate
>     descriptor formation function.

Reviewed-by: Archit Taneja <architt@codeaurora.org>

Thanks,
Archit

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 76 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index ae873d3..85fbe00 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -470,6 +470,27 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
>   	return bam_txn;
>   }
>   
> +/* Clears the BAM transaction indexes */
> +static void clear_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	if (!nandc->props->is_bam)
> +		return;
> +
> +	bam_txn->cmd_sgl_pos = 0;
> +	bam_txn->cmd_sgl_start = 0;
> +	bam_txn->tx_sgl_pos = 0;
> +	bam_txn->tx_sgl_start = 0;
> +	bam_txn->rx_sgl_pos = 0;
> +	bam_txn->rx_sgl_start = 0;
> +
> +	sg_init_table(bam_txn->cmd_sgl, nandc->max_cwperpage *
> +		      QPIC_PER_CW_CMD_SGL);
> +	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
> +		      QPIC_PER_CW_DATA_SGL);
> +}
> +
>   static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
>   {
>   	return container_of(chip, struct qcom_nand_host, chip);
> @@ -701,6 +722,41 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
>   	return 0;
>   }
>   
> +/*
> + * Prepares the data descriptor for BAM DMA which will be used for NAND
> + * data reads and writes.
> + */
> +static int prep_bam_dma_desc_data(struct qcom_nand_controller *nandc, bool read,
> +				  const void *vaddr,
> +				  int size, unsigned int flags)
> +{
> +	int ret;
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	if (read) {
> +		sg_set_buf(&bam_txn->data_sgl[bam_txn->rx_sgl_pos],
> +			   vaddr, size);
> +		bam_txn->rx_sgl_pos++;
> +	} else {
> +		sg_set_buf(&bam_txn->data_sgl[bam_txn->tx_sgl_pos],
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
>   static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
>   			     int reg_off, const void *vaddr, int size,
>   			     bool flow_control)
> @@ -848,6 +904,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>   static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   			 const u8 *vaddr, int size, unsigned int flags)
>   {
> +	if (nandc->props->is_bam)
> +		return prep_bam_dma_desc_data(nandc, true, vaddr, size, flags);
> +
>   	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
>   }
>   
> @@ -862,6 +921,9 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   			  const u8 *vaddr, int size, unsigned int flags)
>   {
> +	if (nandc->props->is_bam)
> +		return prep_bam_dma_desc_data(nandc, false, vaddr, size, flags);
> +
>   	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, false);
>   }
>   
> @@ -1149,6 +1211,10 @@ static void pre_command(struct qcom_nand_host *host, int command)
>   	host->last_command = command;
>   
>   	clear_read_regs(nandc);
> +
> +	if (command == NAND_CMD_RESET || command == NAND_CMD_READID ||
> +	    command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
> +		clear_bam_transaction(nandc);
>   }
>   
>   /*
> @@ -1553,6 +1619,7 @@ static int qcom_nandc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>   	data_buf = buf;
>   	oob_buf = oob_required ? chip->oob_poi : NULL;
>   
> +	clear_bam_transaction(nandc);
>   	ret = read_page_ecc(host, data_buf, oob_buf);
>   	if (ret) {
>   		dev_err(nandc->dev, "failure to read page\n");
> @@ -1578,6 +1645,8 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
>   	oob_buf = chip->oob_poi;
>   
>   	host->use_ecc = false;
> +
> +	clear_bam_transaction(nandc);
>   	update_rw_regs(host, ecc->steps, true);
>   	config_nand_page_read(nandc);
>   
> @@ -1649,6 +1718,7 @@ static int qcom_nandc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>   	int ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	host->use_ecc = true;
>   	set_address(host, 0, page);
> @@ -1672,6 +1742,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>   	int i, ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	data_buf = (u8 *)buf;
>   	oob_buf = chip->oob_poi;
> @@ -1737,6 +1808,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
>   	int i, ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	data_buf = (u8 *)buf;
>   	oob_buf = chip->oob_poi;
> @@ -1813,11 +1885,13 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>   
>   	host->use_ecc = true;
>   
> +	clear_bam_transaction(nandc);
>   	ret = copy_last_cw(host, page);
>   	if (ret)
>   		return ret;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	/* calculate the data and oob size for the last codeword/step */
>   	data_size = ecc->size - ((ecc->steps - 1) << 2);
> @@ -1870,6 +1944,7 @@ static int qcom_nandc_block_bad(struct mtd_info *mtd, loff_t ofs)
>   	 */
>   	host->use_ecc = false;
>   
> +	clear_bam_transaction(nandc);
>   	ret = copy_last_cw(host, page);
>   	if (ret)
>   		goto err;
> @@ -1900,6 +1975,7 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
>   	int page, ret, status = 0;
>   
>   	clear_read_regs(nandc);
> +	clear_bam_transaction(nandc);
>   
>   	/*
>   	 * to mark the BBM as bad, we flash the entire last codeword with 0s.
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
