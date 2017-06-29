From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/14] qcom: mtd: nand: allocate bam transaction
Date: Thu, 29 Jun 2017 11:50:53 +0200
Message-ID: <659d69fd-ae7c-b566-ccab-aca2a3efe178@gmail.com>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-6-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498720566-20782-6-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/29/2017 09:15 AM, Abhishek Sahu wrote:
> The BAM transaction is the core data structure which will be used
> for all the data transfers in QPIC NAND. Since the base layer is
> serializing all the NAND requests so allocating BAM transaction
> before every transfer will be overhead. The memory for it be
> allocated during probe time and before every transfer, it will be
> cleared. The BAM transaction contains the array of command
> elements, command and data scatter gather list and indexes. For
> every transfer, all the resource will be taken from bam
> transaction.
> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 116 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index eb0ec19..f8d0bde 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -22,6 +22,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/delay.h>
> +#include <linux/dma/qcom_bam_dma.h>
>  
>  /* NANDc reg offsets */
>  #define	NAND_FLASH_CMD			0x00
> @@ -169,6 +170,45 @@
>  #define	ECC_BCH_4BIT	BIT(2)
>  #define	ECC_BCH_8BIT	BIT(3)
>  
> +#define QPIC_PER_CW_MAX_CMD_ELEMENTS	(32)
> +#define QPIC_PER_CW_MAX_CMD_SGL		(32)
> +#define QPIC_PER_CW_MAX_DATA_SGL	(8)
> +
> +/*
> + * This data type corresponds to the BAM transaction which will be used for all
> + * NAND transfers.
> + * @bam_ce - the array of bam command elements
> + * @cmd_sgl - sgl for nand bam command pipe
> + * @data_sgl - sgl for nand bam consumer/producer pipe
> + * @bam_ce_pos - the index in bam_ce which is available for next sgl request
> + * @bam_ce_start - the index in bam_ce which marks the start position ce
> + *		   for current sgl. It will be used for size calculation
> + *		   for current sgl
> + * @cmd_sgl_pos - current index in command sgl.
> + * @tx_sgl_pos - current index in data sgl for tx.
> + * @rx_sgl_pos - current index in data sgl for rx.
> + */
> +struct bam_transaction {
> +	struct bam_cmd_element *bam_ce;
> +	struct scatterlist *cmd_sgl;
> +	struct scatterlist *data_sg;
> +	u32 bam_ce_pos;
> +	u32 bam_ce_start;
> +	u32 cmd_sgl_pos;
> +	u32 cmd_sgl_start;
> +	u32 tx_sgl_pos;
> +	u32 tx_sgl_start;
> +	u32 rx_sgl_pos;
> +	u32 rx_sgl_start;
> +};
> +
> +/*
> + * This data type corresponds to the nand dma descriptor
> + * @list - list for desc_info
> + * @dir - DMA transfer direction
> + * @sgl - sgl which will be used for single sgl dma descriptor
> + * @dma_desc - low level dma engine descriptor
> + */
>  struct desc_info {
>  	struct list_head node;
>  
> @@ -217,6 +257,7 @@ struct nandc_regs {
>   * @aon_clk:			another controller clock
>   *
>   * @chan:			dma channel
> + * @bam_txn:			contains the bam transaction buffer
>   * @cmd_crci:			ADM DMA CRCI for command flow control
>   * @data_crci:			ADM DMA CRCI for data flow control
>   * @desc_list:			DMA descriptor list (list of desc_infos)
> @@ -237,6 +278,8 @@ struct nandc_regs {
>   *				initialized via DT match data
>   * @dma_bam_enabled:		flag to tell whether nand controller is using
>   *				bam dma
> + * @max_cwperpage:		maximum qpic codeword required. calcualted
> + *				from all nand device pagesize
>   */
>  struct qcom_nand_controller {
>  	struct nand_hw_control controller;
> @@ -264,12 +307,14 @@ struct qcom_nand_controller {
>  	};
>  
>  	struct list_head desc_list;
> +	struct bam_transaction *bam_txn;
>  
>  	u8		*data_buffer;
>  	bool		dma_bam_enabled;
>  	int		buf_size;
>  	int		buf_count;
>  	int		buf_start;
> +	unsigned int	max_cwperpage;
>  
>  	__le32 *reg_read_buf;
>  	dma_addr_t reg_read_buf_phys;
> @@ -342,6 +387,51 @@ struct qcom_nand_driver_data {
>  	bool dma_bam_enabled;
>  };
>  
> +/* Frees the BAM transaction memory */
> +static void free_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	devm_kfree(nandc->dev, bam_txn->bam_ce);
> +	devm_kfree(nandc->dev, bam_txn->cmd_sgl);
> +	devm_kfree(nandc->dev, bam_txn->data_sg);
> +	devm_kfree(nandc->dev, bam_txn);
> +}
> +
> +/* Allocates and Initializes the BAM transaction */
> +static struct bam_transaction *
> +alloc_bam_transaction(struct qcom_nand_controller *nandc, unsigned int num_cw)
> +{
> +	struct bam_transaction *bam_txn;
> +
> +	bam_txn = devm_kzalloc(nandc->dev, sizeof(*bam_txn), GFP_KERNEL);

Can you make these four allocations into a single allocation ?

> +	if (!bam_txn)
> +		return NULL;
> +
> +	bam_txn->bam_ce =
> +		devm_kzalloc(nandc->dev, sizeof(*bam_txn->bam_ce) *
> +			     num_cw * QPIC_PER_CW_MAX_CMD_ELEMENTS, GFP_KERNEL);
> +	if (!bam_txn->bam_ce)
> +		return NULL;
> +
> +	bam_txn->cmd_sgl =
> +		devm_kzalloc(nandc->dev, sizeof(*bam_txn->cmd_sgl) * num_cw *
> +			     QPIC_PER_CW_MAX_CMD_SGL, GFP_KERNEL);
> +	if (!bam_txn->cmd_sgl)
> +		return NULL;
> +
> +	bam_txn->data_sg =
> +		devm_kzalloc(nandc->dev, sizeof(*bam_txn->data_sg) *
> +			     num_cw * QPIC_PER_CW_MAX_DATA_SGL, GFP_KERNEL);
> +	if (!bam_txn->data_sg)
> +		return NULL;
> +
> +	nandc->max_cwperpage = num_cw;
> +
> +	return bam_txn;
> +}
> +
>  static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
>  {
>  	return container_of(chip, struct qcom_nand_host, chip);
> @@ -1868,6 +1958,8 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>  	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
>  
>  	cwperpage = mtd->writesize / ecc->size;
> +	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
> +					cwperpage);
>  
>  	/*
>  	 * DATA_UD_BYTES varies based on whether the read/write command protects
> @@ -2010,6 +2102,19 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  			dev_err(nandc->dev, "failed to request cmd channel\n");
>  			return -ENODEV;
>  		}
> +
> +		/*
> +		 * Initially allocate BAM transaction to read ONFI param page.
> +		 * After detecting all the devices, this BAM transaction will
> +		 * be freed and the next BAM tranasction will be allocated with
> +		 * maximum codeword size
> +		 */
> +		nandc->bam_txn = alloc_bam_transaction(nandc, 1);
> +		if (!nandc->bam_txn) {
> +			dev_err(nandc->dev,
> +				"failed to allocate bam transaction\n");
> +			return -ENOMEM;
> +		}
>  	}
>  
>  	INIT_LIST_HEAD(&nandc->desc_list);
> @@ -2153,6 +2258,17 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
>  	if (list_empty(&nandc->host_list))
>  		return -ENODEV;
>  
> +	if (nandc->dma_bam_enabled) {
> +		free_bam_transaction(nandc);
> +		nandc->bam_txn = alloc_bam_transaction(nandc,
> +						       nandc->max_cwperpage);
> +		if (!nandc->bam_txn) {
> +			dev_err(nandc->dev,
> +				"failed to allocate bam transaction\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
>  	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
>  		ret = qcom_nand_mtd_register(nandc, host, child);
>  		if (ret) {
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
