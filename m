From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v4 20/20] mtd: nand: qcom: support for IPQ8074 QPIC NAND
 controller
Date: Wed, 16 Aug 2017 11:32:15 +0530
Message-ID: <acb0b694-1210-dc8e-4d5a-551b0114182f@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-21-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502451575-15712-21-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
> Add the compatible string for IPQ8074 QPIC NAND controller
> version 1.5.0 which uses BAM DMA and its FLASH_DEV_CMD registers
> starting offset is 0x7000.

Reviewed-by: Archit Taneja <architt@codeaurora.org>

Thanks,
Archit

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 03e671e..1484fb4 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2863,6 +2863,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   	.flash_dev_offset = 0x0,
>   };
>   
> +static const struct qcom_nandc_props ipq8074_nandc_props = {
> +	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
> +	.is_bam = true,
> +	.flash_dev_offset = 0x7000,
> +};
> +
>   /*
>    * data will hold a struct pointer containing more differences once we support
>    * more controller variants
> @@ -2876,6 +2882,10 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   		.compatible = "qcom,ipq4019-nand",
>   		.data = &ipq4019_nandc_props,
>   	},
> +	{
> +		.compatible = "qcom,ipq8074-nand",
> +		.data = &ipq8074_nandc_props,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
