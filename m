From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 02/25] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
Date: Thu, 03 Aug 2017 23:29:51 +0530
Message-ID: <6262dc2740eeb74288886a95e53286ca@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
 <20170803174713.5b5f5dde@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170803174713.5b5f5dde@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-08-03 21:17, Boris Brezillon wrote:
> On Wed, 19 Jul 2017 17:17:50 +0530
> Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
>> The current driver is failing without complete bootchain since
>> NAND_DEV_CMD_VLD value is not valid.
>> 
>> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
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
> 
> Where does this 0x1d value comes from? Defining a macro instead of
> passing 0x1d does not change the fact that this is a magic value :-).
> 

  This register tells the NAND controller which commands are valid

  Bits    Meaning
  0       READ_START_VALID
  1       READ_STOP_VALID
  2       WRITE_START_VALID
  3       ERASE_START_VALID
  4       SEQ_READ_START_VLD

  The default power on value is
  0xe - ERASE_START_VALID | WRITE_START_VALID | READ_STOP_VALID

  It need to be programmed for
  0x1d - READ_START_VALID | WRITE_START_VALID | ERASE_START_VALID | 
SEQ_READ_START_VLD

  Read STOP command is not required in normal NAND reads so it need to be 
disabled.

  I will define the individual bits and will make this value with bits 
which will
  make this more clear.

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
Abhishek Sahu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
