From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Date: Thu, 18 Sep 2014 16:08:03 +0800
Message-ID: <541A92E3.60906@atmel.com>
References: <1408345720-5402-1-git-send-email-josh.wu@atmel.com> <20140918003258.GD1193@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140918003258.GD1193@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Brain

On 9/18/2014 8:32 AM, Brian Norris wrote:
> On Mon, Aug 18, 2014 at 03:08:40PM +0800, Josh Wu wrote:
>> If there is no PMECC lookup table stored in ROM, or lookup table offset is
>> not specified, PMECC driver should build it in DDR by itself.
>>
>> That make the PMECC driver work for some board which doesn't has PMECC
>> lookup table in ROM.
>>
>> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>> This patch is based on mtd-l2/next branch
>>
>> v1 -> v2:
>>    make create_lookup_table() static.
> sparse gives me several new complaints:
>
> +drivers/mtd/nand/atmel_nand.c:1219:50: warning: incorrect type in argument 2 (different signedness) [sparse]
> +drivers/mtd/nand/atmel_nand.c:1219:50:    expected signed short [usertype] *index_of [sparse]
> +drivers/mtd/nand/atmel_nand.c:1219:50:    got unsigned short [usertype] *addr [sparse]
> +drivers/mtd/nand/atmel_nand.c:1219:61: warning: incorrect type in argument 3 (different signedness) [sparse]
> +drivers/mtd/nand/atmel_nand.c:1219:61:    expected signed short [usertype] *alpha_to [sparse]
> +drivers/mtd/nand/atmel_nand.c:1219:61:    got unsigned short [usertype] * [sparse]
> +drivers/mtd/nand/atmel_nand.c:1292:38: warning: incorrect type in assignment (different address spaces) [sparse]
> +drivers/mtd/nand/atmel_nand.c:1292:38:    expected void [noderef] <asn:2>*pmecc_rom_base [sparse]
> +drivers/mtd/nand/atmel_nand.c:1292:38:    got unsigned short [usertype] *[assigned] galois_table [sparse]
>
> The third one might be a false positive. I suppose it's safe to use
> regular memory with __iomem accessors (but not vice versa).

Thanks. I will check this.
>
>>   .../devicetree/bindings/mtd/atmel-nand.txt         |   6 +-
>>   drivers/mtd/nand/atmel_nand.c                      | 136 ++++++++++++++++++++-
>>   2 files changed, 136 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> index c472883..75d1847 100644
>> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> @@ -5,7 +5,9 @@ Required properties:
>>   - reg : should specify localbus address and size used for the chip,
>>   	and hardware ECC controller if available.
>>   	If the hardware ECC is PMECC, it should contain address and size for
>> -	PMECC, PMECC Error Location controller and ROM which has lookup tables.
>> +	PMECC and PMECC Error Location controller.
>> +	The PMECC lookup table address and size in ROM is optional. If not
>> +	specified, driver will build it in runtime.
>>   - atmel,nand-addr-offset : offset for the address latch.
>>   - atmel,nand-cmd-offset : offset for the command latch.
>>   - #address-cells, #size-cells : Must be present if the device has sub-nodes
>> @@ -27,7 +29,7 @@ Optional properties:
>>     are: 512, 1024.
>>   - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
>>     for different sector size. First one is for sector size 512, the next is for
>> -  sector size 1024.
>> +  sector size 1024. If not specified, driver will build the table in runtime.
>>   - nand-bus-width : 8 or 16 bus width if not present 8
>>   - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
>>   - Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
>> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
>> index effa7a29..84af313 100644
>> --- a/drivers/mtd/nand/atmel_nand.c
>> +++ b/drivers/mtd/nand/atmel_nand.c
>> @@ -124,6 +124,7 @@ struct atmel_nand_host {
>>   	bool			has_pmecc;
>>   	u8			pmecc_corr_cap;
>>   	u16			pmecc_sector_size;
>> +	bool			has_no_lookup_table;
>>   	u32			pmecc_lookup_table_offset;
>>   	u32			pmecc_lookup_table_offset_512;
>>   	u32			pmecc_lookup_table_offset_1024;
>> @@ -1109,12 +1110,121 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
>>   	return 0;
>>   }
>>   
>> +static int pmecc_build_galois_table(int mm,
>> +		int16_t *index_of, int16_t *alpha_to)
>> +{
>> +	unsigned int i, mask, nn;
>> +	unsigned int p[PMECC_GF_DIMENSION_14 + 1];
>> +
>> +	nn = (1 << mm) - 1;
>> +	/* set default value */
>> +	for (i = 1; i < mm; i++)
>> +		p[i] = 0;
>> +
>> +	/* 1 + X^mm */
>> +	p[0]  = 1;
>> +	p[mm] = 1;
>> +
>> +	/* others  */
>> +	switch (mm) {
>> +	case 3:
>> +	case 4:
>> +	case 6:
>> +	case 15:
>> +		p[1] = 1;
>> +		break;
>> +	case 5:
>> +	case 11:
>> +		p[2] = 1;
>> +		break;
>> +	case 7:
>> +	case 10:
>> +		p[3] = 1;
>> +		break;
>> +	case 8:
>> +		p[2] = p[3] = p[4] = 1;
>> +		break;
>> +	case 9:
>> +		p[4] = 1;
>> +		break;
>> +	case 12:
>> +		p[1] = p[4] = p[6] = 1;
>> +		break;
>> +	case 13:
>> +		p[1] = p[3] = p[4] = 1;
>> +		break;
>> +	case 14:
>> +		p[1] = p[6] = p[10] = 1;
>> +		break;
>> +	default:
>> +		/* Error */
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Build alpha ^ mm it will help to generate the field (primitiv) */
>> +	alpha_to[mm] = 0;
>> +	for (i = 0; i < mm; i++)
>> +		if (p[i])
>> +			alpha_to[mm] |= 1 << i;
>> +
>> +	/*
>> +	 * Then build elements from 0 to mm - 1. As degree is less than mm
>> +	 * so it is just a logical shift.
>> +	 */
>> +	mask = 1;
>> +	for (i = 0; i < mm; i++) {
>> +		alpha_to[i] = mask;
>> +		index_of[alpha_to[i]] = i;
>> +		mask <<= 1;
>> +	}
>> +
>> +	index_of[alpha_to[mm]] = mm;
>> +
>> +	/* use a mask to select the MSB bit of the LFSR */
>> +	mask >>= 1;
>> +
>> +	/* then finish the building */
>> +	for (i = mm + 1; i <= nn; i++) {
>> +		/* check if the msb bit of the lfsr is set */
>> +		if (alpha_to[i - 1] & mask)
>> +			alpha_to[i] = alpha_to[mm] ^
>> +				((alpha_to[i - 1] ^ mask) << 1);
>> +		else
>> +			alpha_to[i] = alpha_to[i - 1] << 1;
>> +
>> +		index_of[alpha_to[i]] = i % nn;
>> +	}
>> +
>> +	/* index of 0 is undefined in a multiplicative field */
>> +	index_of[0] = -1;
>> +
>> +	return 0;
>> +}
> Is this algorithm documented? How did you come up with this?

It is not documented in datasheet. It is based BCH algorithm. But do you 
know if the soft BCH use a same table like this?

Best Regards,
Josh Wu

>
>> +
>> +static uint16_t *create_lookup_table(struct device *dev, int sector_size)
>> +{
>> +	int table_size = (sector_size == 512) ?
>> +			PMECC_LOOKUP_TABLE_SIZE_512 :
>> +			PMECC_LOOKUP_TABLE_SIZE_1024;
>> +	int degree = (sector_size == 512) ?
>> +			PMECC_GF_DIMENSION_13 :
>> +			PMECC_GF_DIMENSION_14;
>> +	uint16_t *addr = devm_kzalloc(dev, 2 * table_size * sizeof(uint16_t),
>> +			GFP_KERNEL);
>> +
>> +	if (addr)
>> +		pmecc_build_galois_table(degree, addr, addr + table_size);
>> +
>> +	return addr;
>> +}
>> +
>>   static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
>>   					 struct atmel_nand_host *host)
>>   {
>>   	struct mtd_info *mtd = &host->mtd;
>>   	struct nand_chip *nand_chip = &host->nand_chip;
>>   	struct resource *regs, *regs_pmerr, *regs_rom;
>> +	uint16_t *galois_table;
>>   	int cap, sector_size, err_no;
>>   
>>   	err_no = pmecc_choose_ecc(host, &cap, &sector_size);
>> @@ -1160,8 +1270,24 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
>>   	regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
>>   	host->pmecc_rom_base = devm_ioremap_resource(&pdev->dev, regs_rom);
>>   	if (IS_ERR(host->pmecc_rom_base)) {
>> -		err_no = PTR_ERR(host->pmecc_rom_base);
>> -		goto err;
>> +		if (!host->has_no_lookup_table)
>> +			/* Don't display the information again */
>> +			dev_err(host->dev, "Can not get I/O resource for ROM, will build a lookup table in runtime!\n");
>> +
>> +		host->has_no_lookup_table = true;
>> +	}
>> +
>> +	if (host->has_no_lookup_table) {
>> +		/* Build the look-up table in runtime */
>> +		galois_table = create_lookup_table(host->dev, sector_size);
>> +		if (!galois_table) {
>> +			dev_err(host->dev, "Failed to build a lookup table in runtime!\n");
>> +			err_no = -ENOMEM;
>> +			goto err;
>> +		}
>> +
>> +		host->pmecc_rom_base = galois_table;
>> +		host->pmecc_lookup_table_offset = 0;
>>   	}
>>   
>>   	nand_chip->ecc.size = sector_size;
>> @@ -1498,8 +1624,10 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
>>   
>>   	if (of_property_read_u32_array(np, "atmel,pmecc-lookup-table-offset",
>>   			offset, 2) != 0) {
>> -		dev_err(host->dev, "Cannot get PMECC lookup table offset\n");
>> -		return -EINVAL;
>> +		dev_err(host->dev, "Cannot get PMECC lookup table offset, will build a lookup table in runtime.\n");
>> +		host->has_no_lookup_table = true;
>> +		/* Will build a lookup table and initialize the offset later */
>> +		return 0;
>>   	}
>>   	if (!offset[0] && !offset[1]) {
>>   		dev_err(host->dev, "Invalid PMECC lookup table offset\n");
> Brian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
