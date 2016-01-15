From: romain izard <romain.izard-Tny/h2m1dROW3RwJEphJ61AUjnlXr6A1@public.gmane.org>
Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
Date: Fri, 15 Jan 2016 11:06:53 +0100
Message-ID: <CAGkQfmPPat_rs9wtB2auzEathhWHcc7GMTTJeW_0FKmrHMzF_g@mail.gmail.com>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-4-git-send-email-romain.izard.pro@gmail.com> <20160114101910.4e772968@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160114101910.4e772968@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2016-01-14 10:19 GMT+01:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Wed, 13 Jan 2016 17:34:15 +0100
> Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
>> controller that can correct 32 bits in each sector. This controller is
>> not 100% compatible with the previous revision that corrected a maximum
>> of 24 bits by sector, as some register addresses overlap.
>>
>> Using information from the device tree, we can configure the driver to
>> work with both versions.
>>
>> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mtd/atmel-nand.txt         |  7 +++++--
>>  drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++++++++++-
>>  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
>>  3 files changed, 33 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> index 89b0db9801b0..90887b430f03 100644
>> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
>> @@ -1,7 +1,10 @@
>>  Atmel NAND flash
>>
>>  Required properties:
>> -- compatible : should be "atmel,at91rm9200-nand" or "atmel,sama5d4-nand".
>> +- compatible: The possible values are:
>> +     "atmel,at91rm9200-nand"
>> +     "atmel,sama5d2-nand"
>> +     "atmel,sama5d4-nand"
>>  - reg : should specify localbus address and size used for the chip,
>>       and hardware ECC controller if available.
>>       If the hardware ECC is PMECC, it should contain address and size for
>> @@ -22,7 +25,7 @@ Optional properties:
>>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>>    "soft_bch".
>>  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
>> -  Only supported by at91sam9x5 or later sam9 product.
>> +  Supported by AT91SAM9x5 or later SAM9 chips, and SAMA5 chips.
>>  - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
>>    Controller. Supported values are: 2, 4, 8, 12, 24.
>>  - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
>> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
>> index e5d7e7e63f49..6fe50e2d291f 100644
>> --- a/drivers/mtd/nand/atmel_nand.c
>> +++ b/drivers/mtd/nand/atmel_nand.c
>> @@ -65,6 +65,7 @@ module_param(on_flash_bbt, int, 0);
>>
>>  struct atmel_nand_caps {
>>       bool pmecc_correct_erase_page;
>> +     uint8_t pmecc_max_correction;
>>  };
>>
>>  struct atmel_nand_nfc_priv {
>> @@ -146,6 +147,7 @@ struct atmel_nand_host {
>>       int                     pmecc_cw_len;   /* Length of codeword */
>>
>>       void __iomem            *pmerrloc_base;
>> +     void __iomem            *pmerrloc_el_base;
>>       void __iomem            *pmecc_rom_base;
>>
>>       /* lookup table for alpha_to and index_of */
>> @@ -817,7 +819,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
>>       sector_size = host->pmecc_sector_size;
>>
>>       while (err_nbr) {
>> -             tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_base, i) - 1;
>> +             tmp = pmerrloc_readl_el_relaxed(host->pmerrloc_el_base, i) - 1;
>>               byte_pos = tmp / 8;
>>               bit_pos  = tmp % 8;
>>
>> @@ -1208,6 +1210,8 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
>>               err_no = PTR_ERR(host->pmerrloc_base);
>>               goto err;
>>       }
>
> How about putting the comment you added below here:
>
> /*
>  * The ATMEL_PMERRLOC_ELx register location depends on the number of
>  * bits corrected by the PMECC controller. Pre-calculate the
>  * pmerrloc_el_base according to the PMECC capabilities.
>  */
>
Here, this comment is paraphrasing the code. That's not very useful.

>> +     host->pmerrloc_el_base = host->pmerrloc_base + ATMEL_PMERRLOC_SIGMAx +
>> +             (host->caps->pmecc_max_correction + 1) * 4;
>>
>>       if (!host->has_no_lookup_table) {
>>               regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
>> @@ -2307,17 +2311,34 @@ static int atmel_nand_remove(struct platform_device *pdev)
>>       return 0;
>>  }
>>
>> +/*
>> + * AT91RM9200 does not have PMECC or PMECC Errloc peripherals for
>> + * BCH ECC. Combined with the "atmel,has-pmecc", it is used to describe
>> + * devices from the SAM9 family that have those.
>> + */
>>  static struct atmel_nand_caps at91rm9200_caps = {
>>       .pmecc_correct_erase_page = false,
>> +     .pmecc_max_correction = 24,
>>  };
>>
>>  static struct atmel_nand_caps sama5d4_caps = {
>>       .pmecc_correct_erase_page = true,
>> +     .pmecc_max_correction = 24,
>> +};
>> +
>> +/*
>> + * The PMECC Errloc controller starting in SAMA5D2 is not compatible,
>> + * as the increased correction strength requires more registers.
>> + */
>> +static struct atmel_nand_caps sama5d2_caps = {
>> +     .pmecc_correct_erase_page = true,
>> +     .pmecc_max_correction = 32,
>>  };
>>
>>  static const struct of_device_id atmel_nand_dt_ids[] = {
>>       { .compatible = "atmel,at91rm9200-nand", .data = &at91rm9200_caps },
>>       { .compatible = "atmel,sama5d4-nand", .data = &sama5d4_caps },
>> +     { .compatible = "atmel,sama5d2-nand", .data = &sama5d2_caps },
>>       { /* sentinel */ }
>>  };
>>
>> diff --git a/drivers/mtd/nand/atmel_nand_ecc.h b/drivers/mtd/nand/atmel_nand_ecc.h
>> index 668e7358f19b..ec964c43c932 100644
>> --- a/drivers/mtd/nand/atmel_nand_ecc.h
>> +++ b/drivers/mtd/nand/atmel_nand_ecc.h
>> @@ -108,7 +108,11 @@
>>  #define              PMERRLOC_ERR_NUM_MASK           (0x1f << 8)
>>  #define              PMERRLOC_CALC_DONE              (1 << 0)
>>  #define ATMEL_PMERRLOC_SIGMAx                0x028   /* Error location SIGMA x */
>> -#define ATMEL_PMERRLOC_ELx           0x08c   /* Error location x */
>> +
>> +/*
>> + * The ATMEL_PMERRLOC_ELx register location depends from the number of
>> + * bits corrected by the PMECC controller. Do not use it.
>> + */
>>
>>  /* Register access macros for PMECC */
>>  #define pmecc_readl_relaxed(addr, reg) \
>> @@ -136,7 +140,7 @@
>>       readl_relaxed((addr) + ATMEL_PMERRLOC_SIGMAx + ((n) * 4))
>>
>>  #define pmerrloc_readl_el_relaxed(addr, n) \
>> -     readl_relaxed((addr) + ATMEL_PMERRLOC_ELx + ((n) * 4))
>> +     readl_relaxed((addr) + ((n) * 4))
>
> Another option would have been to pass the maximum ECC strength here,
> and modify the ATMEL_PMERRLOC_ELx macro to take a max_strength argument
> and return the adjusted ELx offset.
> Anyway, both solutions work for me.
>
The current solution makes it easier to keep within the 80 character limit.
The memory/computing tradeoff is so small it won't change anything.

>>
>>  /* Galois field dimension */
>>  #define PMECC_GF_DIMENSION_13                        13

Best regards,
-- 
Romain Izard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
