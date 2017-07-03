From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH 05/14] qcom: mtd: nand: allocate bam transaction
Date: Mon, 3 Jul 2017 13:52:03 +0530
Message-ID: <906da0d9-2ef7-583a-4008-4f444eaa340b@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-6-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-6-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

<..>

> +/* Allocates and Initializes the BAM transaction */
> +static struct bam_transaction *
> +alloc_bam_transaction(struct qcom_nand_controller *nandc, unsigned int num_cw)
> +{
> +	struct bam_transaction *bam_txn;
> +
> +	bam_txn = devm_kzalloc(nandc->dev, sizeof(*bam_txn), GFP_KERNEL);
> +
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

 Somehow, looks like something is missing because, nandc->max_cwperpage passed from
 here is used in alloc_bam_transaction, but it is assigned in the same function ?

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
