From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 05/14] qcom: mtd: nand: allocate bam transaction
Date: Mon, 17 Jul 2017 12:14:34 +0530
Message-ID: <c4a814af02d1c00b15552f15e93d13b8@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-6-git-send-email-absahu@codeaurora.org>
 <906da0d9-2ef7-583a-4008-4f444eaa340b@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <906da0d9-2ef7-583a-4008-4f444eaa340b-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-07-03 13:52, Sricharan R wrote:
> Hi Abhishek,
> 
> <..>
> 
>> +/* Allocates and Initializes the BAM transaction */
>> +static struct bam_transaction *
>> +alloc_bam_transaction(struct qcom_nand_controller *nandc, unsigned 
>> int
>> num_cw)
>> +{
>> +	struct bam_transaction *bam_txn;
>> +
>> +	bam_txn = devm_kzalloc(nandc->dev, sizeof(*bam_txn), GFP_KERNEL);
>> +
>> +	if (!bam_txn)
>> +		return NULL;
>> +
>> +	bam_txn->bam_ce =
>> +		devm_kzalloc(nandc->dev, sizeof(*bam_txn->bam_ce) *
>> +			     num_cw * QPIC_PER_CW_MAX_CMD_ELEMENTS, GFP_KERNEL);
>> +	if (!bam_txn->bam_ce)
>> +		return NULL;
>> +
>> +	bam_txn->cmd_sgl =
>> +		devm_kzalloc(nandc->dev, sizeof(*bam_txn->cmd_sgl) * num_cw *
>> +			     QPIC_PER_CW_MAX_CMD_SGL, GFP_KERNEL);
>> +	if (!bam_txn->cmd_sgl)
>> +		return NULL;
>> +
>> +	bam_txn->data_sg =
>> +		devm_kzalloc(nandc->dev, sizeof(*bam_txn->data_sg) *
>> +			     num_cw * QPIC_PER_CW_MAX_DATA_SGL, GFP_KERNEL);
>> +	if (!bam_txn->data_sg)
>> +		return NULL;
>> +
>> +	nandc->max_cwperpage = num_cw;
>> +
>> +	return bam_txn;
>> +}
>> +
>>  static inline struct qcom_nand_host *to_qcom_nand_host(struct 
>> nand_chip
>> *chip)
>>  {
>>  	return container_of(chip, struct qcom_nand_host, chip);
>> @@ -1868,6 +1958,8 @@ static int qcom_nand_host_setup(struct
>> qcom_nand_host *host)
>>  	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
>> 
>>  	cwperpage = mtd->writesize / ecc->size;
>> +	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
>> +					cwperpage);
>> 
>>  	/*
>>  	 * DATA_UD_BYTES varies based on whether the read/write command 
>> protects
>> @@ -2010,6 +2102,19 @@ static int qcom_nandc_alloc(struct
>> qcom_nand_controller *nandc)
>>  			dev_err(nandc->dev, "failed to request cmd channel\n");
>>  			return -ENODEV;
>>  		}
>> +
>> +		/*
>> +		 * Initially allocate BAM transaction to read ONFI param page.
>> +		 * After detecting all the devices, this BAM transaction will
>> +		 * be freed and the next BAM tranasction will be allocated with
>> +		 * maximum codeword size
>> +		 */
>> +		nandc->bam_txn = alloc_bam_transaction(nandc, 1);
>> +		if (!nandc->bam_txn) {
>> +			dev_err(nandc->dev,
>> +				"failed to allocate bam transaction\n");
>> +			return -ENOMEM;
>> +		}
>>  	}
>> 
>>  	INIT_LIST_HEAD(&nandc->desc_list);
>> @@ -2153,6 +2258,17 @@ static int qcom_probe_nand_devices(struct
>> qcom_nand_controller *nandc)
>>  	if (list_empty(&nandc->host_list))
>>  		return -ENODEV;
>> 
>> +	if (nandc->dma_bam_enabled) {
>> +		free_bam_transaction(nandc);
>> +		nandc->bam_txn = alloc_bam_transaction(nandc,
>> +						       nandc->max_cwperpage);
> 
>  Somehow, looks like something is missing because, nandc->max_cwperpage
> passed from
>  here is used in alloc_bam_transaction, but it is assigned in the same
> function ?
> 

  Yes. This assignment is not required. I will fix this in v2.

> Regards,
>  Sricharan

-- 
Abhishek Sahu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
