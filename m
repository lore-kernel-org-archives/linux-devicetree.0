From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 11/20] mtd: nand: qcom: enable BAM or ADM mode
Date: Wed, 16 Aug 2017 14:19:01 +0530
Message-ID: <d68712ee25564439178a81e59ac2ff35@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-12-git-send-email-absahu@codeaurora.org>
 <db662967-2f73-bcfe-aef1-8b9cc860c743@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <db662967-2f73-bcfe-aef1-8b9cc860c743-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-08-16 10:20, Archit Taneja wrote:
> On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
>> 1. DM_EN is only required for EBI2 NAND controller which uses ADM
>> 2. BAM mode will be disabled after power on reset which needs to
>>     be enabled before starting any BAM transfers.
>> 
>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 3d9fd7f..ae873d3 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -163,6 +163,9 @@
>>   #define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
>>   					 ERASE_START_VLD | SEQ_READ_START_VLD)
>>   +/* NAND_CTRL bits */
>> +#define	BAM_MODE_EN			BIT(0)
>> +
>>   /*
>>    * the NAND controller performs reads/writes with ECC in 516 byte 
>> chunks.
>>    * the driver calls the chunks 'step' or 'codeword' interchangeably
>> @@ -1035,7 +1038,8 @@ static int read_id(struct qcom_nand_host *host, 
>> int column)
>>   	nandc_set_reg(nandc, NAND_FLASH_CMD, FETCH_ID);
>>   	nandc_set_reg(nandc, NAND_ADDR0, column);
>>   	nandc_set_reg(nandc, NAND_ADDR1, 0);
>> -	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> +	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
>> +		      nandc->props->is_bam ? 0 : DM_EN);
> 
> I'm not sure why the above register was configured in read_id in the
> first place. Would
> it be required later if we want the controller to support multiple
> NAND chips? If not,
> then we could consider dropping this. Anyway, that can be posted as a
> separate patch
> later.

  Correct. It seems the current driver does not have fully support
  second NAND chip select since it need to program NAND_DEV1_CFG1 and
  NAND_DEV1_CFG0 also.

  We can have separate patch series which will add the full support
  for multiple NAND chips and this line can be removed in that patch
  series.

> 
> Reviewed-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Thanks,
> Archit
> 
>>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>>     	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
>> @@ -2408,12 +2412,19 @@ static void qcom_nandc_unalloc(struct 
>> qcom_nand_controller *nandc)
>>   /* one time setup of a few nand controller registers */
>>   static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
>>   {
>> +	u32 nand_ctrl;
>> +
>>   	/* kill onenand */
>>   	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>>   	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>>   -	/* enable ADM DMA */
>> -	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> +	/* enable ADM or BAM DMA */
>> +	if (nandc->props->is_bam) {
>> +		nand_ctrl = nandc_read(nandc, NAND_CTRL);
>> +		nandc_write(nandc, NAND_CTRL, nand_ctrl | BAM_MODE_EN);
>> +	} else {
>> +		nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> +	}
>>     	/* save the original values of these registers */
>>   	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
>> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
