From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 15/25] mtd: nand: qcom: DMA mapping support for
 register read buffer
Date: Fri, 4 Aug 2017 10:56:01 +0530
Message-ID: <2d1accf4-811a-1246-99cc-ab1b9c7f0a32@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-16-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500464893-11352-16-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07/19/2017 05:18 PM, Abhishek Sahu wrote:
> The EBI2 NAND directly remaps register read buffer with
> dma_map_sg. The QPIC NAND will give register read buffer in its
> command descriptor and the command descriptor will be mapped with
> dma_map_sg instead of register read buffer. This command
> descriptor will contain the dma address of the register read
> buffer.

It isn't entirely clear from the commit message why we can't use
the existing code with QPIC NAND. A bit of background would help.
Can you consider adding something like this:

"On QPIC NAND, which uses BAM DMA, we read the controller registers
by preparing a BAM command descriptor. This descriptor requires the
the a) controller register address and b) the DMA address in which we
want to store the value read back from the controller register. Therefore,
it's required that we also map our register read buffer for DMA (using
dma_map_single). We use the returned DMA address for preparing
entries in our command descriptor."

> 
> This patch adds the DMA mapping support for register read buffer.
> This buffer will be DMA mapped during allocation time. Before
> starting of any operation, this buffer will be synced for device
> operation and after operation completion, it will be synced for
> CPU.
> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index cb2b245..f49c3da 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -229,6 +229,7 @@ struct nandc_regs {
>    *				by upper layers directly
>    * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
>    * @reg_read_buf:		local buffer for reading back registers via DMA
> + * @reg_read_buf_phys:		contains dma address for register read buffer

Maybe we should rename this as reg_read_dma since it is dma_addr_t ?

Looks good otherwise.

Thanks,
Archit

>    * @reg_read_pos:		marker for data read in reg_read_buf
>    *
>    * @regs:			a contiguous chunk of memory for DMA register
> @@ -271,6 +272,7 @@ struct qcom_nand_controller {
>   	int		buf_start;
>   
>   	__le32 *reg_read_buf;
> +	dma_addr_t reg_read_buf_phys;
>   	int reg_read_pos;
>   
>   	struct nandc_regs *regs;
> @@ -363,6 +365,24 @@ static inline void nandc_write(struct qcom_nand_controller *nandc, int offset,
>   	iowrite32(val, nandc->base + offset);
>   }
>   
> +static inline void nandc_read_buffer_sync(struct qcom_nand_controller *nandc,
> +					  bool is_cpu)
> +{
> +	if (!nandc->props->is_bam)
> +		return;
> +
> +	if (is_cpu)
> +		dma_sync_single_for_cpu(nandc->dev, nandc->reg_read_buf_phys,
> +					MAX_REG_RD *
> +					sizeof(*nandc->reg_read_buf),
> +					DMA_FROM_DEVICE);
> +	else
> +		dma_sync_single_for_device(nandc->dev, nandc->reg_read_buf_phys,
> +					   MAX_REG_RD *
> +					   sizeof(*nandc->reg_read_buf),
> +					   DMA_FROM_DEVICE);
> +}
> +
>   static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
>   {
>   	switch (offset) {
> @@ -847,6 +867,7 @@ static void free_descs(struct qcom_nand_controller *nandc)
>   static void clear_read_regs(struct qcom_nand_controller *nandc)
>   {
>   	nandc->reg_read_pos = 0;
> +	nandc_read_buffer_sync(nandc, false);
>   }
>   
>   static void pre_command(struct qcom_nand_host *host, int command)
> @@ -876,6 +897,7 @@ static void parse_erase_write_errors(struct qcom_nand_host *host, int command)
>   	int i;
>   
>   	num_cw = command == NAND_CMD_PAGEPROG ? ecc->steps : 1;
> +	nandc_read_buffer_sync(nandc, true);
>   
>   	for (i = 0; i < num_cw; i++) {
>   		u32 flash_status = le32_to_cpu(nandc->reg_read_buf[i]);
> @@ -897,6 +919,7 @@ static void post_command(struct qcom_nand_host *host, int command)
>   
>   	switch (command) {
>   	case NAND_CMD_READID:
> +		nandc_read_buffer_sync(nandc, true);
>   		memcpy(nandc->data_buffer, nandc->reg_read_buf,
>   		       nandc->buf_count);
>   		break;
> @@ -1060,6 +1083,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
>   	int i;
>   
>   	buf = (struct read_stats *)nandc->reg_read_buf;
> +	nandc_read_buffer_sync(nandc, true);
>   
>   	for (i = 0; i < ecc->steps; i++, buf++) {
>   		u32 flash, buffer, erased_cw;
> @@ -1996,6 +2020,16 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>   		return -ENOMEM;
>   
>   	if (nandc->props->is_bam) {
> +		nandc->reg_read_buf_phys =
> +			dma_map_single(nandc->dev, nandc->reg_read_buf,
> +				       MAX_REG_RD *
> +				       sizeof(*nandc->reg_read_buf),
> +				       DMA_FROM_DEVICE);
> +		if (dma_mapping_error(nandc->dev, nandc->reg_read_buf_phys)) {
> +			dev_err(nandc->dev, "failed to DMA MAP reg buffer\n");
> +			return -EIO;
> +		}
> +
>   		nandc->tx_chan = dma_request_slave_channel(nandc->dev, "tx");
>   		if (!nandc->tx_chan) {
>   			dev_err(nandc->dev, "failed to request tx channel\n");
> @@ -2033,6 +2067,12 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>   static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
>   {
>   	if (nandc->props->is_bam) {
> +		if (!dma_mapping_error(nandc->dev, nandc->reg_read_buf_phys))
> +			dma_unmap_single(nandc->dev, nandc->reg_read_buf_phys,
> +					 MAX_REG_RD *
> +					 sizeof(*nandc->reg_read_buf),
> +					 DMA_FROM_DEVICE);
> +
>   		if (nandc->tx_chan)
>   			dma_release_channel(nandc->tx_chan);
>   
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
