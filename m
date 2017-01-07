From: "linshunquan (A)" <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v1] mtd: spi nor: modify the boot and flash type of FMC
Date: Sat, 7 Jan 2017 15:33:41 +0800
Message-ID: <d77207c5-891d-d35e-f6b8-4b0467fabd25@hisilicon.com>
References: <1483693931-22249-1-git-send-email-linshunquan1@hisilicon.com>
 <506ed7d0-0bd9-874c-eaf8-4fc5d4366612@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <506ed7d0-0bd9-874c-eaf8-4fc5d4366612-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille,
 Thanks for your relay, I will update this patch soon.

On 2017/1/6 21:44, Cyrille Pitchen wrote:
> Hi,
> 
> Le 06/01/2017 à 10:12, linshunquan 00354166 a écrit :
>> (1) The HiSilicon Flash Memory Controller(FMC) is a multi-functions
>>  device which supports SPI Nor flash controller, SPI nand Flash
>>  controller and parallel nand flash controller. So when we are prepare
>>  to operation SPI Nor, we should make sure the flash type is SPI Nor.
>>
>> (2) Make sure the boot type is Normal Type before initialize the SPI
>>     Nor controller.
>>
>> Signed-off-by: linshunquan 00354166 <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> ---
>>  drivers/mtd/spi-nor/hisi-sfc.c | 30 ++++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
>> index 20378b0..7855024 100644
>> --- a/drivers/mtd/spi-nor/hisi-sfc.c
>> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
>> @@ -32,6 +32,8 @@
>>  #define FMC_CFG_OP_MODE_MASK		BIT_MASK(0)
>>  #define FMC_CFG_OP_MODE_BOOT		0
>>  #define FMC_CFG_OP_MODE_NORMAL		1
>> +#define FMC_CFG_OP_MODE_SEL(mode)      ((mode) & 0x1)
>> +#define FMC_CFG_FLASH_SEL_SPI_NOR	(0x0 << 1)
>>  #define FMC_CFG_FLASH_SEL(type)		(((type) & 0x3) << 1)
>>  #define FMC_CFG_FLASH_SEL_MASK		0x6
>>  #define FMC_ECC_TYPE(type)		(((type) & 0x7) << 5)
>> @@ -141,10 +143,36 @@ static int get_if_type(enum read_mode flash_read)
>>  	return if_type;
>>  }
>>  
>> +static void spi_nor_switch_spi_type(struct hifmc_host *host)
>> +{
>> +	unsigned int reg;
>> +
>> +	reg = readl(host->regbase + FMC_CFG);
>> +	if ((reg & FMC_CFG_FLASH_SEL_MASK)
>> +		   	== FMC_CFG_FLASH_SEL_SPI_NOR)
>> +		return;
>> +
>> +	/* if the flash type isn't spi nor, change it */
>> +	reg &= ~FMC_CFG_FLASH_SEL_MASK;
>> +	reg |= FMC_CFG_FLASH_SEL(0);
>> +	writel(reg, host->regbase + FMC_CFG);
>> +}
>> +
> 
> This is not consistent: we have to check the macro definitions to
> understand that FMC_CFG_FLASH_SPI_NOR == FMC_CFG_FLASH_SEL(0)
> 
> In such a function, you should use the very same macro for both the test
> and the update of reg; either FMC_CFG_FLASH_SEL_SPI_NOR or
> FMC_CFG_FLASH_SEL(0). Please don't mix the use of those macros.
> 
>>  static void hisi_spi_nor_init(struct hifmc_host *host)
>>  {
>>  	u32 reg;
>>  
>> +	/* switch the flash type to spi nor */
>> +	spi_nor_switch_spi_type(host);
>> +
>> +	/* set the boot mode to normal */
>> +	reg = readl(host->regbase + FMC_CFG);
>> +	if ((reg & FMC_CFG_OP_MODE_MASK) == FMC_CFG_OP_MODE_BOOT) {
>> +		reg |= FMC_CFG_OP_MODE_SEL(FMC_CFG_OP_MODE_NORMAL);
> 
> This is not consistent: you test FMC_CFG_OP_MODE_BOOT, hence without
> FMC_CFG_OP_MODE_SEL() but you set
> FMC_CFG_OP_MODE_SEL(FMC_CFG_OP_MODE_NORMAL), with FMC_CFG_OP_MODE_SEL().
> 
> Of course, looking at the macro definitions, it works as is but once again
> we have to check the macro definitions to understand why sometime you use
> FMC_CFG_OP_MODE_SEL() whereas other times you don't.
> 
>> +		writel(reg, host->regbase + FMC_CFG);
>> +	}
> 
> spi_nor_switch_spi_type() already updates the FMC_CFG register in the very
> same manner: read, test, modify, write. Hence you should write a more
> generic function and update both bitfields at once.
> 
> static void hisi_spi_nor_update_reg(struct hifmc_host *host,
> 				    unsigned int reg_offset,
> 				    unsigned int value,
> 				    unsigned int mask)
> {
> 	unsigned int reg;
> 
> 	reg = readl(host->regbase + reg_offset);
> 	if (((reg ^ value) & mask) == 0)
> 		return;
> 
> 	reg = (reg & ~mask) | (value & mask);
> 	writel(reg, host->regbase + reg_offset);
> }
> 
> ...
> 
> 	unsigned int value, mask;
> 
> 	/*
> 	 * switch the flash type to spi nor and set the boot mode to
> 	 * normal.
> 	 */
> 	value = FMC_CFG_OP_MODE_NORMAL | FMC_CFG_FLASH_SEL_SPI_NOR;
> 	mask = FMC_CFG_OP_MODE_MASK | FMC_CFG_FLASH_SEL_MASK;
> 	hisi_spi_nor_update_reg(host, FMC_CFG, value, mask);
> 
>> +
>> +	/* set timming */
>>  	reg = TIMING_CFG_TCSH(CS_HOLD_TIME)
>>  		| TIMING_CFG_TCSS(CS_SETUP_TIME)
>>  		| TIMING_CFG_TSHSL(CS_DESELECT_TIME);
>> @@ -167,6 +195,8 @@ static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
>>  	if (ret)
>>  		goto out;
>>  
>> +	spi_nor_switch_spi_type(host);
>> +
>>  	return 0;
>>  
>>  out:
>>
> 
> Best regards,
> 
> Cyrille
> .
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
