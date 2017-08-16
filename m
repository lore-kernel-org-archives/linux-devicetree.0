From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 13/20] mtd: nand: qcom: support for different DEV_CMD
 register offsets
Date: Wed, 16 Aug 2017 14:27:38 +0530
Message-ID: <df7b3f702951b988b643a4a5a3ab0631@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-14-git-send-email-absahu@codeaurora.org>
 <d419a60c-3a00-36c2-6c6d-6f9edb396d53@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d419a60c-3a00-36c2-6c6d-6f9edb396d53-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-08-16 11:22, Archit Taneja wrote:
> On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
>> The FLASH_DEV_CMD registers starting offset is not same in
>> different QPIC NAND controller versions. This patch adds
>> the starting offset in NAND controller properties and uses
>> the same for calculating the actual offset of these registers.
>> 
>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 22 ++++++++++++++++------
>>   1 file changed, 16 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 85fbe00..c0c140b 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -193,6 +193,9 @@
>>   	      ((size) << READ_LOCATION_SIZE) |			\
>>   	      ((is_last) << READ_LOCATION_LAST))
>>   +/* Returns the actual register address for NAND_FLASH_DEV_* */
> 
> There aren't any registers starting with NAND_FLASH_DEV_* in the 
> registers
> defined above, it might get confusing for someone who doesn't have 
> access
> to the HW docs. Could you explicitly mention in this comment all the 
> register
> names that are required to go through this translation, it should make 
> things
> more readable. With that:

  Thanks Archit. Following are the registers

  #define NAND_DEV_CMD0                   0xa0
  #define NAND_DEV_CMD1                   0xa4
  #define NAND_DEV_CMD2                   0xa8
  #define NAND_DEV_CMD_VLD                0xac

  I will update the comment.

> 
> Reviewed-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> 
> Thanks,
> Archit
> 
> 
>> +#define nandc_dev_addr(nandc, reg) ((nandc)->props->flash_dev_offset 
>> + (reg))
>> +
>>   #define QPIC_PER_CW_CMD_SGL		32
>>   #define QPIC_PER_CW_DATA_SGL		8
>>   @@ -426,10 +429,12 @@ struct qcom_nand_host {
>>    * among different NAND controllers.
>>    * @ecc_modes - ecc mode for NAND
>>    * @is_bam - whether NAND controller is using BAM
>> + * @flash_dev_offset - NAND_FLASH_DEV_* registers start offset
>>    */
>>   struct qcom_nandc_props {
>>   	u32 ecc_modes;
>>   	bool is_bam;
>> +	u32 flash_dev_offset;
>>   };
>>     /* Frees the BAM transaction memory */
>> @@ -844,6 +849,9 @@ static int read_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>   	if (first == NAND_READ_ID || first == NAND_FLASH_STATUS)
>>   		flow_control = true;
>>   +	if (first == NAND_DEV_CMD_VLD || first == NAND_DEV_CMD1)
>> +		first = nandc_dev_addr(nandc, first);
>> +
>>   	size = num_regs * sizeof(u32);
>>   	vaddr = nandc->reg_read_buf + nandc->reg_read_pos;
>>   	nandc->reg_read_pos += num_regs;
>> @@ -881,11 +889,11 @@ static int write_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>   	if (first == NAND_EXEC_CMD)
>>   		flags |= NAND_BAM_NWD;
>>   -	if (first == NAND_DEV_CMD1_RESTORE)
>> -		first = NAND_DEV_CMD1;
>> +	if (first == NAND_DEV_CMD1_RESTORE || first == NAND_DEV_CMD1)
>> +		first = nandc_dev_addr(nandc, NAND_DEV_CMD1);
>>   -	if (first == NAND_DEV_CMD_VLD_RESTORE)
>> -		first = NAND_DEV_CMD_VLD;
>> +	if (first == NAND_DEV_CMD_VLD_RESTORE || first == NAND_DEV_CMD_VLD)
>> +		first = nandc_dev_addr(nandc, NAND_DEV_CMD_VLD);
>>     	size = num_regs * sizeof(u32);
>>   @@ -2492,7 +2500,8 @@ static int qcom_nandc_setup(struct 
>> qcom_nand_controller *nandc)
>>     	/* kill onenand */
>>   	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>> -	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>> +	nandc_write(nandc, nandc_dev_addr(nandc, NAND_DEV_CMD_VLD),
>> +		    NAND_DEV_CMD_VLD_VAL);
>>     	/* enable ADM or BAM DMA */
>>   	if (nandc->props->is_bam) {
>> @@ -2503,7 +2512,7 @@ static int qcom_nandc_setup(struct 
>> qcom_nand_controller *nandc)
>>   	}
>>     	/* save the original values of these registers */
>> -	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
>> +	nandc->cmd1 = nandc_read(nandc, nandc_dev_addr(nandc, 
>> NAND_DEV_CMD1));
>>   	nandc->vld = NAND_DEV_CMD_VLD_VAL;
>>     	return 0;
>> @@ -2752,6 +2761,7 @@ static int qcom_nandc_remove(struct 
>> platform_device *pdev)
>>   static const struct qcom_nandc_props ipq806x_nandc_props = {
>>   	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
>>   	.is_bam = false,
>> +	.flash_dev_offset = 0x0,
>>   };
>>     /*
>> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
