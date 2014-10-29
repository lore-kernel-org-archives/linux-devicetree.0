From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Date: Wed, 29 Oct 2014 14:41:49 +0800
Message-ID: <54508C2D.5020309@atmel.com>
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413021710-32264-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Just a ping for this patch.

Best Regards,
Josh Wu

On 10/11/2014 6:01 PM, Josh Wu wrote:
> From: Josh Wu <Josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
> If there is no PMECC lookup table stored in ROM, or lookup table offset is
> not specified, PMECC driver should build it in DDR by itself.
>
> That make the PMECC driver work for some board which doesn't has PMECC
> lookup table in ROM.
>
> The PMECC use the BCH algorithm, so based on the build_gf_tables()
> function in lib/bch.c, we can build the Galois Field lookup table.
>
> For more information can refer to section 5.4 of PMECC controller
> application note:
> 	http://www.atmel.com/images/doc11127.pdf
>
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> v1 -> v2:
>    make create_lookup_table() static.
>
> v2 -> v3:
>    rewrite the build_gf_tables() function based on lib/bch.c.
>    add error handling in create_lookup_table().
>
>   .../devicetree/bindings/mtd/atmel-nand.txt         |  6 +-
>   drivers/mtd/nand/atmel_nand.c                      | 81 ++++++++++++++++++++--
>   drivers/mtd/nand/atmel_nand_ecc.h                  |  4 ++
>   3 files changed, 85 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 6edc3b6..1fe6dde 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -5,7 +5,9 @@ Required properties:
>   - reg : should specify localbus address and size used for the chip,
>   	and hardware ECC controller if available.
>   	If the hardware ECC is PMECC, it should contain address and size for
> -	PMECC, PMECC Error Location controller and ROM which has lookup tables.
> +	PMECC and PMECC Error Location controller.
> +	The PMECC lookup table address and size in ROM is optional. If not
> +	specified, driver will build it in runtime.
>   - atmel,nand-addr-offset : offset for the address latch.
>   - atmel,nand-cmd-offset : offset for the command latch.
>   - #address-cells, #size-cells : Must be present if the device has sub-nodes
> @@ -27,7 +29,7 @@ Optional properties:
>     are: 512, 1024.
>   - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
>     for different sector size. First one is for sector size 512, the next is for
> -  sector size 1024.
> +  sector size 1024. If not specified, driver will build the table in runtime.
>   - nand-bus-width : 8 or 16 bus width if not present 8
>   - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
>   - Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 19d1e9d..5c1423a 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -127,6 +127,7 @@ struct atmel_nand_host {
>   	bool			has_pmecc;
>   	u8			pmecc_corr_cap;
>   	u16			pmecc_sector_size;
> +	bool			has_no_lookup_table;
>   	u32			pmecc_lookup_table_offset;
>   	u32			pmecc_lookup_table_offset_512;
>   	u32			pmecc_lookup_table_offset_1024;
> @@ -1112,12 +1113,66 @@ static int pmecc_choose_ecc(struct atmel_nand_host *host,
>   	return 0;
>   }
>   
> +static inline int deg(unsigned int poly)
> +{
> +	/* polynomial degree is the most-significant bit index */
> +	return fls(poly) - 1;
> +}
> +
> +static int build_gf_tables(int mm, unsigned int poly,
> +		int16_t *index_of, int16_t *alpha_to)
> +{
> +	unsigned int i, x = 1;
> +	const unsigned int k = 1 << deg(poly);
> +	unsigned int nn = (1 << mm) - 1;
> +
> +	/* primitive polynomial must be of degree m */
> +	if (k != (1u << mm))
> +		return -EINVAL;
> +
> +	for (i = 0; i < nn; i++) {
> +		alpha_to[i] = x;
> +		index_of[x] = i;
> +		if (i && (x == 1))
> +			/* polynomial is not primitive (a^i=1 with 0<i<2^m-1) */
> +			return -EINVAL;
> +		x <<= 1;
> +		if (x & k)
> +			x ^= poly;
> +	}
> +	alpha_to[nn] = 1;
> +	index_of[0] = 0;
> +
> +	return 0;
> +}
> +
> +static uint16_t *create_lookup_table(struct device *dev, int sector_size)
> +{
> +	int degree = (sector_size == 512) ?
> +			PMECC_GF_DIMENSION_13 :
> +			PMECC_GF_DIMENSION_14;
> +	unsigned int poly = (sector_size == 512) ?
> +			PMECC_GF_13_PRIMITIVE_POLY :
> +			PMECC_GF_14_PRIMITIVE_POLY;
> +	int table_size = (sector_size == 512) ?
> +			PMECC_LOOKUP_TABLE_SIZE_512 :
> +			PMECC_LOOKUP_TABLE_SIZE_1024;
> +
> +	int16_t *addr = devm_kzalloc(dev, 2 * table_size * sizeof(uint16_t),
> +			GFP_KERNEL);
> +	if (addr && build_gf_tables(degree, poly, addr, addr + table_size))
> +		return NULL;
> +
> +	return addr;
> +}
> +
>   static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
>   					 struct atmel_nand_host *host)
>   {
>   	struct mtd_info *mtd = &host->mtd;
>   	struct nand_chip *nand_chip = &host->nand_chip;
>   	struct resource *regs, *regs_pmerr, *regs_rom;
> +	uint16_t *galois_table;
>   	int cap, sector_size, err_no;
>   
>   	err_no = pmecc_choose_ecc(host, &cap, &sector_size);
> @@ -1163,8 +1218,24 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
>   	regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
>   	host->pmecc_rom_base = devm_ioremap_resource(&pdev->dev, regs_rom);
>   	if (IS_ERR(host->pmecc_rom_base)) {
> -		err_no = PTR_ERR(host->pmecc_rom_base);
> -		goto err;
> +		if (!host->has_no_lookup_table)
> +			/* Don't display the information again */
> +			dev_err(host->dev, "Can not get I/O resource for ROM, will build a lookup table in runtime!\n");
> +
> +		host->has_no_lookup_table = true;
> +	}
> +
> +	if (host->has_no_lookup_table) {
> +		/* Build the look-up table in runtime */
> +		galois_table = create_lookup_table(host->dev, sector_size);
> +		if (!galois_table) {
> +			dev_err(host->dev, "Failed to build a lookup table in runtime!\n");
> +			err_no = -EINVAL;
> +			goto err;
> +		}
> +
> +		host->pmecc_rom_base = (void __iomem *)galois_table;
> +		host->pmecc_lookup_table_offset = 0;
>   	}
>   
>   	nand_chip->ecc.size = sector_size;
> @@ -1501,8 +1572,10 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
>   
>   	if (of_property_read_u32_array(np, "atmel,pmecc-lookup-table-offset",
>   			offset, 2) != 0) {
> -		dev_err(host->dev, "Cannot get PMECC lookup table offset\n");
> -		return -EINVAL;
> +		dev_err(host->dev, "Cannot get PMECC lookup table offset, will build a lookup table in runtime.\n");
> +		host->has_no_lookup_table = true;
> +		/* Will build a lookup table and initialize the offset later */
> +		return 0;
>   	}
>   	if (!offset[0] && !offset[1]) {
>   		dev_err(host->dev, "Invalid PMECC lookup table offset\n");
> diff --git a/drivers/mtd/nand/atmel_nand_ecc.h b/drivers/mtd/nand/atmel_nand_ecc.h
> index 8a1e9a6..d4035e3 100644
> --- a/drivers/mtd/nand/atmel_nand_ecc.h
> +++ b/drivers/mtd/nand/atmel_nand_ecc.h
> @@ -142,6 +142,10 @@
>   #define PMECC_GF_DIMENSION_13			13
>   #define PMECC_GF_DIMENSION_14			14
>   
> +/* Primitive Polynomial used by PMECC */
> +#define PMECC_GF_13_PRIMITIVE_POLY		0x201b
> +#define PMECC_GF_14_PRIMITIVE_POLY		0x4443
> +
>   #define PMECC_LOOKUP_TABLE_SIZE_512		0x2000
>   #define PMECC_LOOKUP_TABLE_SIZE_1024		0x4000
>   

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
