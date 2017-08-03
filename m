From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 01/25] mtd: nand: qcom: fix config error for BCH
Date: Thu, 03 Aug 2017 23:22:37 +0530
Message-ID: <a48aafe1d5d0623f2cc7cd5c29fc1410@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-2-git-send-email-absahu@codeaurora.org>
 <20170803175602.3e0a4c18@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20170803175602.3e0a4c18@bbrezillon>
Sender: stable-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, architt@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2017-08-03 21:26, Boris Brezillon wrote:
> On Wed, 19 Jul 2017 17:17:49 +0530
> Abhishek Sahu <absahu@codeaurora.org> wrote:
> 
>> The configuration for BCH is not correct in the current driver.
>> The ECC_CFG_ECC_DISABLE bit defines whether to enable or disable the
>> BCH ECC in which
>> 
>> 	0x1 : BCH_DISABLED
>> 	0x0 : BCH_ENABLED
>> 
>> But currently host->bch_enabled is being assined to BCH_DISABLED.
>> 
>> Fixes: c76b78d8ec05a ("mtd: nand: Qualcomm NAND controller driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  drivers/mtd/nand/qcom_nandc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 57d483a..bc0408c 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -1,5 +1,5 @@
>>  /*
>> - * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2016-2017, The Linux Foundation. All rights 
>> reserved.
> 
> Hm, this copyright update is not really related to the changes you're
> describing in the commit message. I'll drop this line from the commit
> (no need to resend it) and ask you to send a separate patch updating 
> the
> copyright. Is that ok?
> 

  The idea was to change the copyright year since we are making
  the changes in this file. If it requires separate patch, then I
  will do the same.

  Also I need to change 'assined' -> assigned in commit text. I can
  update the patch and fix this. I am planning to send the v3 patches
  tomorrow which incorporates all the review comments.

>>   *
>>   * This software is licensed under the terms of the GNU General 
>> Public
>>   * License version 2, as published by the Free Software Foundation, 
>> and
>> @@ -1893,7 +1893,7 @@ static int qcom_nand_host_setup(struct 
>> qcom_nand_host *host)
>>  				| wide_bus << WIDE_FLASH
>>  				| 1 << DEV0_CFG1_ECC_DISABLE;
>> 
>> -	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
>> +	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
>>  				| 0 << ECC_SW_RESET
>>  				| host->cw_data << ECC_NUM_DATA_BYTES
>>  				| 1 << ECC_FORCE_CLK_OPEN

-- 
Abhishek Sahu
