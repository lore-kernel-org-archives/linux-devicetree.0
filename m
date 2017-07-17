From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 12/14] qcom: mtd: nand: change register offset defines
 with enums
Date: Mon, 17 Jul 2017 13:01:11 +0530
Message-ID: <76b81dad9dc710f57245051fee72707f@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-13-git-send-email-absahu@codeaurora.org>
 <a8961294-c72b-035c-0924-f0f901821ea4@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a8961294-c72b-035c-0924-f0f901821ea4-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-07-04 15:25, Archit Taneja wrote:
> On 06/29/2017 12:46 PM, Abhishek Sahu wrote:
>> The current driver defines the register offset with preprocessor
>> macro which is defined crossponding to NAND controller version
>> 1.4.0. This patch changes these macro with enumeration. It also
>> adds mapping array which contains controller register offsets for
>> each register offset enumeration. This mapping array will be
>> referenced before each register read and writes, where the register
>> offset enumeration is being replaced with actual register offsets.
>> 
>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 136 
>> +++++++++++++++++++++++++++---------------
>>   1 file changed, 89 insertions(+), 47 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 6d749b6..24750e6 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -24,43 +24,6 @@
>>   #include <linux/delay.h>
>>   #include <linux/dma/qcom_bam_dma.h>
>> 
>> -/* NANDc reg offsets */
>> -#define	NAND_FLASH_CMD			0x00
>> -#define	NAND_ADDR0			0x04
>> -#define	NAND_ADDR1			0x08
>> -#define	NAND_FLASH_CHIP_SELECT		0x0c
>> -#define	NAND_EXEC_CMD			0x10
>> -#define	NAND_FLASH_STATUS		0x14
>> -#define	NAND_BUFFER_STATUS		0x18
>> -#define	NAND_DEV0_CFG0			0x20
>> -#define	NAND_DEV0_CFG1			0x24
>> -#define	NAND_DEV0_ECC_CFG		0x28
>> -#define	NAND_DEV1_ECC_CFG		0x2c
>> -#define	NAND_DEV1_CFG0			0x30
>> -#define	NAND_DEV1_CFG1			0x34
>> -#define	NAND_READ_ID			0x40
>> -#define	NAND_READ_STATUS		0x44
>> -#define	NAND_DEV_CMD0			0xa0
>> -#define	NAND_DEV_CMD1			0xa4
>> -#define	NAND_DEV_CMD2			0xa8
>> -#define	NAND_DEV_CMD_VLD		0xac
>> -#define	SFLASHC_BURST_CFG		0xe0
>> -#define	NAND_ERASED_CW_DETECT_CFG	0xe8
>> -#define	NAND_ERASED_CW_DETECT_STATUS	0xec
>> -#define	NAND_EBI2_ECC_BUF_CFG		0xf0
>> -#define	FLASH_BUF_ACC			0x100
>> -
>> -#define	NAND_CTRL			0xf00
>> -#define	NAND_VERSION			0xf08
>> -#define	NAND_READ_LOCATION_0		0xf20
>> -#define	NAND_READ_LOCATION_1		0xf24
>> -#define	NAND_READ_LOCATION_2		0xf28
>> -#define	NAND_READ_LOCATION_3		0xf2c
>> -
>> -/* dummy register offsets, used by write_reg_dma */
>> -#define	NAND_DEV_CMD1_RESTORE		0xdead
>> -#define	NAND_DEV_CMD_VLD_RESTORE	0xbeef
>> -
>>   /* NAND_FLASH_CMD bits */
>>   #define	PAGE_ACC			BIT(4)
>>   #define	LAST_PAGE			BIT(5)
>> @@ -204,6 +167,44 @@
>>   #define QPIC_PER_CW_MAX_CMD_SGL		(32)
>>   #define QPIC_PER_CW_MAX_DATA_SGL	(8)
>> 
>> +/* NANDc reg offsets enumeration */
>> +enum {
>> +	NAND_FLASH_CMD,
>> +	NAND_ADDR0,
>> +	NAND_ADDR1,
>> +	NAND_FLASH_CHIP_SELECT,
>> +	NAND_EXEC_CMD,
>> +	NAND_FLASH_STATUS,
>> +	NAND_BUFFER_STATUS,
>> +	NAND_DEV0_CFG0,
>> +	NAND_DEV0_CFG1,
>> +	NAND_DEV0_ECC_CFG,
>> +	NAND_DEV1_ECC_CFG,
>> +	NAND_DEV1_CFG0,
>> +	NAND_DEV1_CFG1,
>> +	NAND_READ_ID,
>> +	NAND_READ_STATUS,
>> +	NAND_DEV_CMD0,
>> +	NAND_DEV_CMD1,
>> +	NAND_DEV_CMD2,
>> +	NAND_DEV_CMD_VLD,
>> +	SFLASHC_BURST_CFG,
>> +	NAND_ERASED_CW_DETECT_CFG,
>> +	NAND_ERASED_CW_DETECT_STATUS,
>> +	NAND_EBI2_ECC_BUF_CFG,
>> +	FLASH_BUF_ACC,
>> +	NAND_CTRL,
>> +	NAND_VERSION,
>> +	NAND_READ_LOCATION_0,
>> +	NAND_READ_LOCATION_1,
>> +	NAND_READ_LOCATION_2,
>> +	NAND_READ_LOCATION_3,
>> +
>> +	/* dummy register offsets, used by write_reg_dma */
>> +	NAND_DEV_CMD1_RESTORE,
>> +	NAND_DEV_CMD_VLD_RESTORE,
>> +};
>> +
>>   /*
>>    * This data type corresponds to the BAM transaction which will be 
>> used for all
>>    * NAND transfers.
>> @@ -326,6 +327,7 @@ struct nandc_regs {
>>    *				bam dma
>>    * @max_cwperpage:		maximum qpic codeword required. calcualted
>>    *				from all nand device pagesize
>> + * @regs_offsets:		register offset mapping array
>>    */
>>   struct qcom_nand_controller {
>>   	struct nand_hw_control controller;
>> @@ -371,6 +373,7 @@ struct qcom_nand_controller {
>> 
>>   	u32 cmd1, vld;
>>   	u32 ecc_modes;
>> +	const u32 *regs_offsets;
> 
> minor quirk:
> 
> s/regs_offsets/reg_offsets
> 

  Sure. I will fix this in v2.

>>   };
>> 
>>   /*
>> @@ -434,6 +437,40 @@ struct qcom_nand_driver_data {
>>   	bool dma_bam_enabled;
>>   };
>> 
>> +/* Mapping table which contains the actual register offsets */
>> +static const u32 regs_offsets[] = {
>> +	[NAND_FLASH_CMD] = 0x00,
>> +	[NAND_ADDR0] = 0x04,
>> +	[NAND_ADDR1] = 0x08,
>> +	[NAND_FLASH_CHIP_SELECT] = 0x0c,
>> +	[NAND_EXEC_CMD] = 0x10,
>> +	[NAND_FLASH_STATUS] = 0x14,
>> +	[NAND_BUFFER_STATUS] = 0x18,
>> +	[NAND_DEV0_CFG0] = 0x20,
>> +	[NAND_DEV0_CFG1] = 0x24,
>> +	[NAND_DEV0_ECC_CFG] = 0x28,
>> +	[NAND_DEV1_ECC_CFG] = 0x2c,
>> +	[NAND_DEV1_CFG0] = 0x30,
>> +	[NAND_DEV1_CFG1] = 0x34,
>> +	[NAND_READ_ID] = 0x40,
>> +	[NAND_READ_STATUS] = 0x44,
>> +	[NAND_DEV_CMD0] = 0xa0,
>> +	[NAND_DEV_CMD1] = 0xa4,
>> +	[NAND_DEV_CMD2] = 0xa8,
>> +	[NAND_DEV_CMD_VLD] = 0xac,
>> +	[SFLASHC_BURST_CFG] = 0xe0,
>> +	[NAND_ERASED_CW_DETECT_CFG] = 0xe8,
>> +	[NAND_ERASED_CW_DETECT_STATUS] = 0xec,
>> +	[NAND_EBI2_ECC_BUF_CFG] = 0xf0,
>> +	[FLASH_BUF_ACC] = 0x100,
>> +	[NAND_CTRL] = 0xf00,
>> +	[NAND_VERSION] = 0xf08,
>> +	[NAND_READ_LOCATION_0] = 0xf20,
>> +	[NAND_READ_LOCATION_1] = 0xf24,
>> +	[NAND_READ_LOCATION_2] = 0xf28,
>> +	[NAND_READ_LOCATION_3] = 0xf2c,
>> +};
>> +
>>   /* Frees the BAM transaction memory */
>>   static void free_bam_transaction(struct qcom_nand_controller *nandc)
>>   {
>> @@ -516,13 +553,13 @@ static inline struct qcom_nand_host 
>> *to_qcom_nand_host(struct nand_chip *chip)
>> 
>>   static inline u32 nandc_read(struct qcom_nand_controller *nandc, int 
>> offset)
>>   {
>> -	return ioread32(nandc->base + offset);
>> +	return ioread32(nandc->base + nandc->regs_offsets[offset]);
>>   }
>> 
>>   static inline void nandc_write(struct qcom_nand_controller *nandc, 
>> int offset,
>>   			       u32 val)
>>   {
>> -	iowrite32(val, nandc->base + offset);
>> +	iowrite32(val, nandc->base + nandc->regs_offsets[offset]);
>>   }
>> 
>>   static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int 
>> offset)
>> @@ -903,11 +940,12 @@ static int read_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>   	nandc->reg_read_pos += num_regs;
>> 
>>   	if (nandc->dma_bam_enabled)
>> -		return prep_dma_desc_command(nandc, true, first, vaddr,
>> +		return prep_dma_desc_command(nandc, true,
>> +					     nandc->regs_offsets[first], vaddr,
>>   					     num_regs, flags);
>> 
>> -	return prep_dma_desc(nandc, true, first, vaddr, num_regs * 
>> sizeof(u32),
>> -			     flow_control);
>> +	return prep_dma_desc(nandc, true, nandc->regs_offsets[first], vaddr,
>> +			     num_regs * sizeof(u32), flow_control);
>>   }
>> 
>>   /*
>> @@ -946,11 +984,12 @@ static int write_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>   		first = NAND_DEV_CMD_VLD;
>> 
>>   	if (nandc->dma_bam_enabled)
>> -		return prep_dma_desc_command(nandc, false, first, vaddr,
>> +		return prep_dma_desc_command(nandc, false,
>> +					     nandc->regs_offsets[first], vaddr,
>>   					     num_regs, flags);
>> 
>> -	return prep_dma_desc(nandc, false, first, vaddr, num_regs * 
>> sizeof(u32),
>> -			     flow_control);
>> +	return prep_dma_desc(nandc, false, nandc->regs_offsets[first], 
>> vaddr,
>> +			     num_regs * sizeof(u32), flow_control);
>>   }
>> 
>>   /*
>> @@ -968,7 +1007,8 @@ static int read_data_dma(struct 
>> qcom_nand_controller *nandc, int reg_off,
>>   		return prep_dma_desc_data_bam(nandc, true, reg_off, vaddr, size,
>>   					      flags);
>> 
>> -	return prep_dma_desc(nandc, true, reg_off, vaddr, size, false);
>> +	return prep_dma_desc(nandc, true, nandc->regs_offsets[FLASH_BUF_ACC] 
>> +
>> +			     reg_off - FLASH_BUF_ACC, vaddr, size, false);
> 
> This doesn't make sense. The integer corresponding to FLASH_BUF_ACC
> enum constant shouldn't be
> involved in any calculations.
> 
> It would be better to pass the correct param to reg_off in all the
> call sites to read_data_dma()
> and write_data_dma()
> 

  Yes. I will do the same in v2.

> Looks good otherwise.
> 
> Archit
> 
>>   }
>> 
>>   /*
>> @@ -986,7 +1026,8 @@ static int write_data_dma(struct 
>> qcom_nand_controller *nandc, int reg_off,
>>   		return prep_dma_desc_data_bam(nandc, false, reg_off, vaddr,
>>   					      size, flags);
>> 
>> -	return prep_dma_desc(nandc, false, reg_off, vaddr, size, false);
>> +	return prep_dma_desc(nandc, false, 
>> nandc->regs_offsets[FLASH_BUF_ACC] +
>> +			     reg_off - FLASH_BUF_ACC, vaddr, size, false);
>>   }
>> 
>>   /*
>> @@ -2791,6 +2832,7 @@ static int qcom_nandc_probe(struct 
>> platform_device *pdev)
>> 
>>   	nandc->ecc_modes = driver_data->ecc_modes;
>>   	nandc->dma_bam_enabled = driver_data->dma_bam_enabled;
>> +	nandc->regs_offsets = regs_offsets;
>> 
>>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	nandc->base = devm_ioremap_resource(dev, res);
>> 

-- 
Abhishek Sahu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
