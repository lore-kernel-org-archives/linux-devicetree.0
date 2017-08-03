From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 02/25] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
Date: Thu, 03 Aug 2017 23:24:48 +0530
Message-ID: <42e9c0da4fbc79c71388172ed7ea5c23@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
 <20170803174834.6ad3a542@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803174834.6ad3a542@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-08-03 21:18, Boris Brezillon wrote:
> On Wed, 19 Jul 2017 17:17:50 +0530
> Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
>> The current driver is failing without complete bootchain since
>> NAND_DEV_CMD_VLD value is not valid.
>> 
>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> BTW, do you want to backport this fix? Maybe you add Fixes and
> Cc-stable tags...
> 

  It was not a critical fix but its better to backport this.
  I will add these tags in v3.

>> ---
>>  drivers/mtd/nand/qcom_nandc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index bc0408c..f3b995d 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -148,6 +148,9 @@
>>  #define	FETCH_ID			0xb
>>  #define	RESET_DEVICE			0xd
>> 
>> +/* Value for NAND_DEV_CMD_VLD */
>> +#define NAND_DEV_CMD_VLD_VAL		0x1d
>> +
>>  /*
>>   * the NAND controller performs reads/writes with ECC in 516 byte 
>> chunks.
>>   * the driver calls the chunks 'step' or 'codeword' interchangeably
>> @@ -1972,6 +1975,7 @@ static int qcom_nandc_setup(struct 
>> qcom_nand_controller *nandc)
>>  {
>>  	/* kill onenand */
>>  	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>> +	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>> 
>>  	/* enable ADM DMA */
>>  	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
