From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v3 01/20] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
Date: Thu, 10 Aug 2017 16:01:17 +0530
Message-ID: <4b66fe6b922115781c67f1555f21fee5@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-2-git-send-email-absahu@codeaurora.org>
 <20170810114250.6663a6b0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170810114250.6663a6b0@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-08-10 15:12, Boris Brezillon wrote:
> Le Sat,  5 Aug 2017 21:49:39 +0530,
> Abhishek Sahu <absahu@codeaurora.org> a écrit :
> 
>> The NAND page read fails without complete boot chain since
>> NAND_DEV_CMD_VLD value is not proper. The default power on reset
>> value for this register is
>> 
>>     0xe - ERASE_START_VALID | WRITE_START_VALID | READ_STOP_VALID
>> 
>> The READ_START_VALID should be enabled for sending PAGE_READ
>> command. READ_STOP_VALID should be cleared since normal NAND
>> page read does not require READ_STOP command.
>> 
>> Fixes: c76b78d8ec05a ("mtd: nand: Qualcomm NAND controller driver")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Archit Taneja <architt@codeaurora.org>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  drivers/mtd/nand/qcom_nandc.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 0289f09..7406019 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -110,6 +110,10 @@
>> 
>>  /* NAND_DEV_CMD_VLD bits */
>>  #define	READ_START_VLD			0
>> +#define	READ_STOP_VALID			1
>> +#define	WRITE_START_VALID		2
>> +#define	ERASE_START_VALID		3
>> +#define	SEQ_READ_START_VLD		4
> 
> Why not
> 
> #define	READ_START_VLD				BIT(0)
> #define	READ_STOP_VALID				BIT(1)
> #define	WRITE_START_VALID			BIT(2)
> #define	ERASE_START_VALID			BIT(3)
> #define	SEQ_READ_START_VLD			BIT(4)
> 

  Sure. we can change to use BIT macro.

  We are using READ_START_VLD only at one place so will replace in
  current code from

  /* configure CMD1 and VLD for ONFI param probing */
         nandc_set_reg(nandc, NAND_DEV_CMD_VLD,
                       (nandc->vld & ~(1 << READ_START_VLD))
                       | 0 << READ_START_VLD);
  to

  nandc_set_reg(nandc, NAND_DEV_CMD_VLD, nandc->vld & ~READ_START_VLD)

>> 
>>  /* NAND_EBI2_ECC_BUF_CFG bits */
>>  #define	NUM_STEPS			0
>> @@ -148,6 +152,12 @@
>>  #define	FETCH_ID			0xb
>>  #define	RESET_DEVICE			0xd
>> 
>> +/* Default Value for NAND_DEV_CMD_VLD */
>> +#define NAND_DEV_CMD_VLD_VAL		(BIT(READ_START_VLD)	| \
>> +					 BIT(WRITE_START_VALID)	| \
>> +					 BIT(ERASE_START_VALID)	| \
>> +					 BIT(SEQ_READ_START_VLD))
>> +
> 
> and then:
> 
> #define NAND_DEV_CMD_VLD_VAL	(READ_START_VLD	| \
> 				 WRITE_START_VALID | \
> 				 ERASE_START_VALID | \
> 				 SEQ_READ_START_VLD)
> 
> BTW, can you use consistent suffixes? Sometime definitions are suffixed
> with _VLD and others are suffixed with _VALID.
> 

  Sure. I will change all the names to _VLD.

>>  /*
>>   * the NAND controller performs reads/writes with ECC in 516 byte 
>> chunks.
>>   * the driver calls the chunks 'step' or 'codeword' interchangeably
>> @@ -1995,13 +2005,14 @@ static int qcom_nandc_setup(struct 
>> qcom_nand_controller *nandc)
>>  {
>>  	/* kill onenand */
>>  	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
>> +	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>> 
>>  	/* enable ADM DMA */
>>  	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>> 
>>  	/* save the original values of these registers */
>>  	nandc->cmd1 = nandc_read(nandc, NAND_DEV_CMD1);
>> -	nandc->vld = nandc_read(nandc, NAND_DEV_CMD_VLD);
>> +	nandc->vld = NAND_DEV_CMD_VLD_VAL;
>> 
>>  	return 0;
>>  }
