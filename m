From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 07/14] qcom: mtd: nand: support for passing flags in
 transfer functions
Date: Mon, 17 Jul 2017 12:29:37 +0530
Message-ID: <1ebb05e67a5d29d19da5743e8d995946@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-8-git-send-email-absahu@codeaurora.org>
 <da4830df-7f64-d5b3-d562-86e290416c8a@codeaurora.org>
 <70776f79-6d51-5544-8be8-38e62b7c073e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70776f79-6d51-5544-8be8-38e62b7c073e-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-07-10 19:40, Sricharan R wrote:
> Hi,
> 
> On 7/4/2017 12:19 PM, Archit Taneja wrote:
>> 
>> 
>> On 06/29/2017 12:45 PM, Abhishek Sahu wrote:
>>> The BAM has multiple flags to control the transfer. This patch
>>> adds flags parameter in register and data transfer functions and
>>> modifies all these function call with appropriate flags.
>>> 
>>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>> ---
>>>   drivers/mtd/nand/qcom_nandc.c | 114
>>> ++++++++++++++++++++++++------------------
>>>   1 file changed, 65 insertions(+), 49 deletions(-)
>>> 
>>> diff --git a/drivers/mtd/nand/qcom_nandc.c
>>> b/drivers/mtd/nand/qcom_nandc.c
>>> index 7042a65..65c9059 100644
>>> --- a/drivers/mtd/nand/qcom_nandc.c
>>> +++ b/drivers/mtd/nand/qcom_nandc.c
>>> @@ -170,6 +170,14 @@
>>>   #define    ECC_BCH_4BIT    BIT(2)
>>>   #define    ECC_BCH_8BIT    BIT(3)
>>>   +/* Flags used for BAM DMA desc preparation*/
>>> +/* Don't set the EOT in current tx sgl */
>>> +#define NAND_BAM_NO_EOT            (0x0001)
>>> +/* Set the NWD flag in current sgl */
>>> +#define NAND_BAM_NWD            (0x0002)
>>> +/* Finish writing in the current sgl and start writing in another 
>>> sgl */
>>> +#define NAND_BAM_NEXT_SGL        (0x0004)
>>> +
>>>   #define QPIC_PER_CW_MAX_CMD_ELEMENTS    (32)
>>>   #define QPIC_PER_CW_MAX_CMD_SGL        (32)
>>>   #define QPIC_PER_CW_MAX_DATA_SGL    (8)

  I will remove the braces and use the bit macros.

>>> @@ -712,7 +720,7 @@ static int prep_dma_desc(struct 
>>> qcom_nand_controller
>>> *nandc, bool read,
>>>    * @num_regs:        number of registers to read
>>>    */
>>>   static int read_reg_dma(struct qcom_nand_controller *nandc, int 
>>> first,
>>> -            int num_regs)
>>> +            int num_regs, unsigned int flags)
>>>   {
>>>       bool flow_control = false;
>>>       void *vaddr;
>>> @@ -736,7 +744,7 @@ static int read_reg_dma(struct 
>>> qcom_nand_controller
>>> *nandc, int first,
>>>    * @num_regs:        number of registers to write
>>>    */
>>>   static int write_reg_dma(struct qcom_nand_controller *nandc, int 
>>> first,
>>> -             int num_regs)
>>> +             int num_regs, unsigned int flags)
>> 
>> Adding flags to read_reg_dma and write_reg_dma is making things a bit
>> messy. I can't
>> think of a better way to share the code either, though.
>> 
>> One thing we could consider doing is something like below. I don't 
>> know if
>> it would
>> make things more legible.
>> 
>> union nand_dma_props {
>>     bool adm_flow_control;
>>     unsigned int bam_flags;
>> };
>> 
>> config_cw_read()
>> {
>>     union nand_dma_props dma_props;
>>     ...
>>     ...
>> 
>>     if (is_bam)
>>         dma_props.bam_flags = NAND_BAM_NWD;
>>     else
>>         dma_props.adm_flow_control = false;
>> 
>>     write_reg_dma(nandc, NAND_EXEC_CMD, 1, &dma_props);
>>     ...
>>     ...
>> }

  The flags for each write_reg_dma and read_reg_dma will be different.
  Normally, for all the API's which uses flags
  (like dmaengine_prep_slave_sg), we are passing the flags directly.
  this union won't help us making this code more readable.

> 
>  Right, with this , i think we can have two different indirections for
> functions like,
>  prep_dma_desc_command and prep_dma_desc. That will help to reduce the
> bam_dma_enabled
>  checks.

  Since common code changes are intermixed with bam_dma_enabled check
  so taking function pointer won't help much in making code more 
readable.

  anyway, I will analyze the final code for v2 and will check the
  possibility of using function pointers.

> 
> Regards,
>  Sricharan

-- 
Abhishek Sahu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
