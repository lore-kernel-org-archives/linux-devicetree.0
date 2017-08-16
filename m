From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 19/20] mtd: nand: qcom: support for IPQ4019 QPIC NAND
 controller
Date: Wed, 16 Aug 2017 11:32:03 +0530
Message-ID: <651595b5-3877-f771-0aba-d6466f8ba8db@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-20-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502451575-15712-20-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
> Add the compatible string for IPQ4019 QPIC NAND controller
> version 1.4.0 which uses BAM DMA.


Reviewed-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Thanks,
Archit

> 
> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index f2cb696..03e671e 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2857,6 +2857,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   	.flash_dev_offset = 0x0,
>   };
>   
> +static const struct qcom_nandc_props ipq4019_nandc_props = {
> +	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
> +	.is_bam = true,
> +	.flash_dev_offset = 0x0,
> +};
> +
>   /*
>    * data will hold a struct pointer containing more differences once we support
>    * more controller variants
> @@ -2866,6 +2872,10 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   		.compatible = "qcom,ipq806x-nand",
>   		.data = &ipq806x_nandc_props,
>   	},
> +	{
> +		.compatible = "qcom,ipq4019-nand",
> +		.data = &ipq4019_nandc_props,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
