From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH 07/14] qcom: mtd: nand: support for passing flags in
 transfer functions
Date: Mon, 10 Jul 2017 19:40:46 +0530
Message-ID: <70776f79-6d51-5544-8be8-38e62b7c073e@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-8-git-send-email-absahu@codeaurora.org>
 <da4830df-7f64-d5b3-d562-86e290416c8a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <da4830df-7f64-d5b3-d562-86e290416c8a@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org
List-Id: devicetree@vger.kernel.org

Hi,

On 7/4/2017 12:19 PM, Archit Taneja wrote:
> 
> 
> On 06/29/2017 12:45 PM, Abhishek Sahu wrote:
>> The BAM has multiple flags to control the transfer. This patch
>> adds flags parameter in register and data transfer functions and
>> modifies all these function call with appropriate flags.
>>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 114 ++++++++++++++++++++++++------------------
>>   1 file changed, 65 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
>> index 7042a65..65c9059 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -170,6 +170,14 @@
>>   #define    ECC_BCH_4BIT    BIT(2)
>>   #define    ECC_BCH_8BIT    BIT(3)
>>   +/* Flags used for BAM DMA desc preparation*/
>> +/* Don't set the EOT in current tx sgl */
>> +#define NAND_BAM_NO_EOT            (0x0001)
>> +/* Set the NWD flag in current sgl */
>> +#define NAND_BAM_NWD            (0x0002)
>> +/* Finish writing in the current sgl and start writing in another sgl */
>> +#define NAND_BAM_NEXT_SGL        (0x0004)
>> +
>>   #define QPIC_PER_CW_MAX_CMD_ELEMENTS    (32)
>>   #define QPIC_PER_CW_MAX_CMD_SGL        (32)
>>   #define QPIC_PER_CW_MAX_DATA_SGL    (8)
>> @@ -712,7 +720,7 @@ static int prep_dma_desc(struct qcom_nand_controller *nandc, bool read,
>>    * @num_regs:        number of registers to read
>>    */
>>   static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
>> -            int num_regs)
>> +            int num_regs, unsigned int flags)
>>   {
>>       bool flow_control = false;
>>       void *vaddr;
>> @@ -736,7 +744,7 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
>>    * @num_regs:        number of registers to write
>>    */
>>   static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>> -             int num_regs)
>> +             int num_regs, unsigned int flags)
> 
> Adding flags to read_reg_dma and write_reg_dma is making things a bit messy. I can't
> think of a better way to share the code either, though.
> 
> One thing we could consider doing is something like below. I don't know if it would
> make things more legible.
> 
> union nand_dma_props {
>     bool adm_flow_control;
>     unsigned int bam_flags;
> };
> 
> config_cw_read()
> {
>     union nand_dma_props dma_props;
>     ...
>     ...
> 
>     if (is_bam)
>         dma_props.bam_flags = NAND_BAM_NWD;
>     else
>         dma_props.adm_flow_control = false;
> 
>     write_reg_dma(nandc, NAND_EXEC_CMD, 1, &dma_props);
>     ...
>     ...
> }

 Right, with this , i think we can have two different indirections for functions like,
 prep_dma_desc_command and prep_dma_desc. That will help to reduce the bam_dma_enabled
 checks.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
