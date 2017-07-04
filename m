From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 06/14] qcom: mtd: nand: add bam dma descriptor handling
Date: Tue, 4 Jul 2017 11:40:51 +0530
Message-ID: <021637c8-8ce5-c54e-0254-41caa475063c@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-7-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498720566-20782-7-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06/29/2017 12:45 PM, Abhishek Sahu wrote:
> 1. prepare_bam_async_desc is the function which will call
>     all the DMA API’s. It will fetch the outstanding scatter gather
>     list for passed channel and will do the DMA descriptor formation.
>     The DMA flag is dependent upon the type of channel.
> 
> 2. For ADM DMA, the descriptor is being formed for every DMA
>     request so its sgl count will be always 1 while in BAM DMA, the
>     clubbing of descriptor is being done to increase throughput.
> 
> 3. ADM uses only one channel while in BAM, data descriptors
>     will be submitted to tx channel (for write) or rx channel
>     (for read) and all the registers read/write descriptors in
>     command channel.
> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 119 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 114 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index f8d0bde..7042a65 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -206,14 +206,22 @@ struct bam_transaction {
>    * This data type corresponds to the nand dma descriptor
>    * @list - list for desc_info
>    * @dir - DMA transfer direction
> - * @sgl - sgl which will be used for single sgl dma descriptor
> + * @sgl - sgl which will be used for single sgl dma descriptor. Only used by ADM
> + * @bam_sgl - sgl which will be used for dma descriptor. Only used by BAM
> + * @sgl_cnt - number of SGL in bam_sgl. Only used by BAM
>    * @dma_desc - low level dma engine descriptor
>    */
>   struct desc_info {
>   	struct list_head node;
>   
>   	enum dma_data_direction dir;
> -	struct scatterlist sgl;
> +	union {
> +			struct scatterlist sgl;

Can you make this adm_sgl instead for consistency? Also, please use only
two tabs instead of one here for indentation.

> +			struct {
> +				struct scatterlist *bam_sgl;
> +				int sgl_cnt;
> +			};
> +	};
>   	struct dma_async_tx_descriptor *dma_desc;
>   };
>   
> @@ -564,6 +572,68 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>   }
>   
> +/*
> + * Maps the scatter gather list for DMA transfer and forms the DMA descriptor
> + * for BAM. This descriptor will be added in the NAND DMA descriptor queue
> + * which will be submitted to DMA engine.
> + */
> +static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
> +				  struct dma_chan *chan,
> +				  unsigned long flags)

 From what I gathered in patch #10, this would be called by
prep_dma_desc_data_bam() and prep_dma_desc_command(). Can you rename these
two to something like prep_bam_dma_desc_data() and prep_bam_dma_desc_cmd()


> +{
> +	struct desc_info *desc;
> +	struct scatterlist *sgl;
> +	unsigned int sgl_cnt;
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +	enum dma_transfer_direction dir_eng;
> +	struct dma_async_tx_descriptor *dma_desc;
> +
> +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	if (chan == nandc->cmd_chan) {
> +		sgl = &bam_txn->cmd_sgl[bam_txn->cmd_sgl_start];
> +		sgl_cnt = bam_txn->cmd_sgl_pos - bam_txn->cmd_sgl_start;
> +		bam_txn->cmd_sgl_start = bam_txn->cmd_sgl_pos;
> +		dir_eng = DMA_MEM_TO_DEV;
> +		desc->dir = DMA_TO_DEVICE;
> +	} else if (chan == nandc->tx_chan) {
> +		sgl = &bam_txn->data_sg[bam_txn->tx_sgl_start];
> +		sgl_cnt = bam_txn->tx_sgl_pos - bam_txn->tx_sgl_start;
> +		bam_txn->tx_sgl_start = bam_txn->tx_sgl_pos;
> +		dir_eng = DMA_MEM_TO_DEV;
> +		desc->dir = DMA_TO_DEVICE;
> +	} else {
> +		sgl = &bam_txn->data_sg[bam_txn->rx_sgl_start];
> +		sgl_cnt = bam_txn->rx_sgl_pos - bam_txn->rx_sgl_start;
> +		bam_txn->rx_sgl_start = bam_txn->rx_sgl_pos;
> +		desc->dir = DMA_FROM_DEVICE;
> +		dir_eng = DMA_DEV_TO_MEM;
> +	}
> +
> +	sg_mark_end(sgl + sgl_cnt - 1);
> +	dma_map_sg(nandc->dev, sgl, sgl_cnt, desc->dir);

Is it safe to assume here that dma_map_sg won't return an error?

> +
> +	desc->sgl_cnt = sgl_cnt;
> +	desc->bam_sgl = sgl;
> +
> +	dma_desc = dmaengine_prep_slave_sg(chan, sgl, sgl_cnt, dir_eng,
> +					   flags);
> +
> +	if (!dma_desc) {
> +		dev_err(nandc->dev, "failure in prep desc\n");
> +		kfree(desc);
> +		return -EINVAL;
> +	}
> +
> +	desc->dma_desc = dma_desc;
> +
> +	list_add_tail(&desc->node, &nandc->desc_list);
> +
> +	return 0;
> +}
> +


>   static int prep_dma_desc(struct qcom_nand_controller *nandc, bool read,
>   			 int reg_off, const void *vaddr, int size,
>   			 bool flow_control)

Could you rename this to prep_adm_dma_desc for consistency?

> @@ -891,12 +961,44 @@ static int submit_descs(struct qcom_nand_controller *nandc)
>   {
>   	struct desc_info *desc;
>   	dma_cookie_t cookie = 0;
> +	struct bam_transaction *bam_txn = nandc->bam_txn;
> +	int r;
> +
> +	if (nandc->dma_bam_enabled) {
> +		if (bam_txn->rx_sgl_pos - bam_txn->rx_sgl_start) {

Using '>' instead of '-' here should be more legible.

> +			r = prepare_bam_async_desc(nandc, nandc->rx_chan, 0);
> +			if (r)
> +				return r;
> +		}
> +
> +		if (bam_txn->tx_sgl_pos - bam_txn->tx_sgl_start) {
> +			r = prepare_bam_async_desc(nandc, nandc->tx_chan,
> +						   DMA_PREP_INTERRUPT);
> +			if (r)
> +				return r;
> +		}
> +
> +		if (bam_txn->cmd_sgl_pos - bam_txn->cmd_sgl_start) {
> +			r = prepare_bam_async_desc(nandc, nandc->cmd_chan,
> +						   DMA_PREP_CMD);
> +			if (r)
> +				return r;
> +		}
> +	}
>   
>   	list_for_each_entry(desc, &nandc->desc_list, node)
>   		cookie = dmaengine_submit(desc->dma_desc);
>   
> -	if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
> -		return -ETIMEDOUT;
> +	if (nandc->dma_bam_enabled) {
> +		dma_async_issue_pending(nandc->tx_chan);
> +		dma_async_issue_pending(nandc->rx_chan);
> +
> +		if (dma_sync_wait(nandc->cmd_chan, cookie) != DMA_COMPLETE)
> +			return -ETIMEDOUT;
> +	} else {
> +		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
> +			return -ETIMEDOUT;
> +	}
>   
>   	return 0;
>   }
> @@ -907,7 +1009,14 @@ static void free_descs(struct qcom_nand_controller *nandc)
>   
>   	list_for_each_entry_safe(desc, n, &nandc->desc_list, node) {
>   		list_del(&desc->node);
> -		dma_unmap_sg(nandc->dev, &desc->sgl, 1, desc->dir);
> +
> +		if (nandc->dma_bam_enabled)
> +			dma_unmap_sg(nandc->dev, desc->bam_sgl,
> +				     desc->sgl_cnt, desc->dir);
> +		else
> +			dma_unmap_sg(nandc->dev, &desc->sgl, 1,
> +				     desc->dir);
> +
>   		kfree(desc);
>   	}
>   }
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
