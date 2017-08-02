From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 01/25] mtd: nand: qcom: fix config error for BCH
Date: Wed, 2 Aug 2017 11:17:34 +0530
Message-ID: <8bdc2e44-5403-4b3c-a102-a78631518bff@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-2-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-2-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 07/19/2017 05:17 PM, Abhishek Sahu wrote:
> The configuration for BCH is not correct in the current driver.
> The ECC_CFG_ECC_DISABLE bit defines whether to enable or disable the
> BCH ECC in which
> 
> 	0x1 : BCH_DISABLED
> 	0x0 : BCH_ENABLED
> 
> But currently host->bch_enabled is being assined to BCH_DISABLED.

s/assined/assigned

Thanks for fixing this up.

Reviewed-by: Archit Taneja <architt@codeaurora.org>

> 
> Fixes: c76b78d8ec05a ("mtd: nand: Qualcomm NAND controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 57d483a..bc0408c 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
>    *
>    * This software is licensed under the terms of the GNU General Public
>    * License version 2, as published by the Free Software Foundation, and
> @@ -1893,7 +1893,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>   				| wide_bus << WIDE_FLASH
>   				| 1 << DEV0_CFG1_ECC_DISABLE;
>   
> -	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
> +	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
>   				| 0 << ECC_SW_RESET
>   				| host->cw_data << ECC_NUM_DATA_BYTES
>   				| 1 << ECC_FORCE_CLK_OPEN
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
