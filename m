From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 16/25] mtd: nand: qcom: allocate BAM transaction
Date: Fri, 4 Aug 2017 11:13:19 +0530
Message-ID: <84dae808-ec01-0b96-ec9c-4667d4c20533@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-17-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-17-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 07/19/2017 05:18 PM, Abhishek Sahu wrote:
> The BAM transaction is the core data structure which will be used
> for all the data transfers in QPIC NAND. Since the base layer is
> serializing all the NAND requests so allocating BAM transaction
> before every transfer will be overhead. The memory for it be

What does 'base layer' here mean?

> allocated during probe time and before every transfer, it will be
> cleared. The BAM transaction contains the array of command
> elements, command and data scatter gather list and indexes. For
> every transfer, all the resource will be taken from BAM
> transaction.

Could you also mention in the commit message that the size of the
buffer used for BAM transactions is calculated based on the NAND device
with the maximum page size, among all the devices connected to the
controller.

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 114 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 114 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index f49c3da..fc29c97 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -22,6 +22,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/delay.h>
> +#include <linux/dma/qcom_bam_dma.h>
>   
>   /* NANDc reg offsets */
>   #define	NAND_FLASH_CMD			0x00
> @@ -172,6 +173,45 @@
>   #define	ECC_BCH_4BIT	BIT(2)
>   #define	ECC_BCH_8BIT	BIT(3)
>   
> +#define QPIC_PER_CW_CMD_ELEMENTS	32
> +#define QPIC_PER_CW_CMD_SGL		32
> +#define QPIC_PER_CW_DATA_SGL		8
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
> +	struct scatterlist *data_sgl;
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
>   struct desc_info {
>   	struct list_head node;
>   
> @@ -238,6 +278,8 @@ struct nandc_regs {
>    * @cmd1/vld:			some fixed controller register values
>    * @props:			properties of current NAND controller IP,
>    *				initialized via DT match data
> + * @max_cwperpage:		maximum qpic codeword required. calcualted

s/calcualted/calculated

Thanks,
Archit

> + *				from all nand device pagesize
>    */
>   struct qcom_nand_controller {
>   	struct nand_hw_control controller;
> @@ -265,11 +307,13 @@ struct qcom_nand_controller {
>   	};
>   
>   	struct list_head desc_list;
> +	struct bam_transaction *bam_txn;
>   
>   	u8		*data_buffer;
>   	int		buf_size;
>   	int		buf_count;
>   	int		buf_start;
> +	unsigned int	max_cwperpage;
>   
>   	__le32 *reg_read_buf;
>   	dma_addr_t reg_read_buf_phys;
> @@ -342,6 +386,50 @@ struct qcom_props {
>   	bool is_bam;
>   };
>   
> +/* Frees the BAM transaction memory */
> +static void free_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +	devm_kfree(nandc->dev, bam_txn);
> +}
> +
> +/* Allocates and Initializes the BAM transaction */
> +static struct bam_transaction *
> +alloc_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +	struct bam_transaction *bam_txn;
> +	size_t bam_txn_size;
> +	unsigned int num_cw = nandc->max_cwperpage;
> +	void *bam_txn_buf;
> +
> +	bam_txn_size =
> +		sizeof(*bam_txn) + num_cw *
> +		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
> +		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
> +		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
> +
> +	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
> +	if (!bam_txn_buf)
> +		return NULL;
> +
> +	bam_txn = bam_txn_buf;
> +	bam_txn_buf += sizeof(*bam_txn);
> +
> +	bam_txn->bam_ce = bam_txn_buf;
> +	bam_txn_buf +=
> +		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
> +
> +	bam_txn->cmd_sgl = bam_txn_buf;
> +	bam_txn_buf +=
> +		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_SGL * num_cw;
> +
> +	bam_txn->data_sgl = bam_txn_buf;
> +	nandc->max_cwperpage = num_cw;
> +
> +	return bam_txn;
> +}
> +
>   static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
>   {
>   	return container_of(chip, struct qcom_nand_host, chip);
> @@ -1913,6 +2001,8 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>   	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
>   
>   	cwperpage = mtd->writesize / ecc->size;
> +	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
> +				     cwperpage);
>   
>   	/*
>   	 * DATA_UD_BYTES varies based on whether the read/write command protects
> @@ -2047,6 +2137,20 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>   			dev_err(nandc->dev, "failed to request cmd channel\n");
>   			return -ENODEV;
>   		}
> +
> +		/*
> +		 * Initially allocate BAM transaction to read ONFI param page.
> +		 * After detecting all the devices, this BAM transaction will
> +		 * be freed and the next BAM tranasction will be allocated with
> +		 * maximum codeword size
> +		 */
> +		nandc->max_cwperpage = 1;
> +		nandc->bam_txn = alloc_bam_transaction(nandc);
> +		if (!nandc->bam_txn) {
> +			dev_err(nandc->dev,
> +				"failed to allocate bam transaction\n");
> +			return -ENOMEM;
> +		}
>   	} else {
>   		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
>   		if (!nandc->chan) {
> @@ -2202,6 +2306,16 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
>   	if (list_empty(&nandc->host_list))
>   		return -ENODEV;
>   
> +	if (nandc->props->is_bam) {
> +		free_bam_transaction(nandc);
> +		nandc->bam_txn = alloc_bam_transaction(nandc);
> +		if (!nandc->bam_txn) {
> +			dev_err(nandc->dev,
> +				"failed to allocate bam transaction\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
>   	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
>   		ret = qcom_nand_mtd_register(nandc, host, child);
>   		if (ret) {
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
