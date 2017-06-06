From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 04/23] mtd: nand: denali: avoid hard-coding ECC step,
 strength, bytes
Date: Wed, 7 Jun 2017 00:01:33 +0200
Message-ID: <20170607000133.69fbf82b@bbrezillon>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
        <1496704922-12261-5-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496704922-12261-5-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue,  6 Jun 2017 08:21:43 +0900
Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:

> This driver was originally written for the Intel MRST platform with
> several platform-specific parameters hard-coded.
> 
> Currently, the ECC settings are hard-coded as follows:
> 
>   #define ECC_SECTOR_SIZE 512
>   #define ECC_8BITS       14
>   #define ECC_15BITS      26
> 
> Therefore, the driver can only support two cases.
>  - ecc.size = 512, ecc.strength = 8    --> ecc.bytes = 14
>  - ecc.size = 512, ecc.strength = 15   --> ecc.bytes = 26
> 
> However, these are actually customizable parameters, for example,
> UniPhier platform supports the following:
> 
>  - ecc.size = 1024, ecc.strength = 8   --> ecc.bytes = 14
>  - ecc.size = 1024, ecc.strength = 16  --> ecc.bytes = 28
>  - ecc.size = 1024, ecc.strength = 24  --> ecc.bytes = 42
> 
> So, we need to handle the ECC parameters in a more generic manner.
> Fortunately, the Denali User's Guide explains how to calculate the
> ecc.bytes.  The formula is:
> 
>   ecc.bytes = 2 * CEIL(13 * ecc.strength / 16)  (for ecc.size = 512)
>   ecc.bytes = 2 * CEIL(14 * ecc.strength / 16)  (for ecc.size = 1024)
> 
> For DT platforms, it would be reasonable to allow DT to specify ECC
> strength by either "nand-ecc-strength" or "nand-ecc-maximize".  If
> none of them is specified, the driver will try to meet the chip's ECC
> requirement.
> 
> For PCI platforms, the max ECC strength is used to keep the original
> behavior.
> 
> Newer versions of this IP need ecc.size and ecc.steps explicitly
> set up via the following registers:
>   CFG_DATA_BLOCK_SIZE       (0x6b0)
>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
>   CFG_NUM_DATA_BLOCKS       (0x6d0)
> 
> For older IP versions, write accesses to these registers are just
> ignored.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes in v4:
>   - Rewrite by using generic helpers, nand_check_caps(),
>     nand_match_ecc_req(), nand_maximize_ecc().
> 
> Changes in v3:
>   - Move DENALI_CAP_ define out of struct denali_nand_info
>   - Use chip->ecc_step_ds as a hint to choose chip->ecc.size
>     where possible
> 
> Changes in v2:
>   - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_
>   - Make ECC 512 cap and ECC 1024 cap independent
>   - Set up three CFG_... registers
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |   7 ++
>  drivers/mtd/nand/denali.c                          | 103 ++++++++++++++-------
>  drivers/mtd/nand/denali.h                          |  11 ++-
>  drivers/mtd/nand/denali_dt.c                       |   8 ++
>  drivers/mtd/nand/denali_pci.c                      |   9 ++
>  5 files changed, 101 insertions(+), 37 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index e593bbe..b7742a7 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -7,6 +7,13 @@ Required properties:
>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>    - interrupts : The interrupt number.
>  
> +Optional properties:
> +  - nand-ecc-step-size: see nand.txt for details.  If present, the value must be
> +      512        for "altr,socfpga-denali-nand"
> +  - nand-ecc-strength: see nand.txt for details.  Valid values are:
> +      8, 15      for "altr,socfpga-denali-nand"
> +  - nand-ecc-maximize: see nand.txt for details
> +
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
>  
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 16634df..3204c51 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -886,8 +886,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> -#define ECC_SECTOR_SIZE 512
> -
>  #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
>  #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
>  #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
> @@ -899,6 +897,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  			       struct denali_nand_info *denali,
>  			       unsigned long *uncor_ecc_flags, uint8_t *buf)
>  {
> +	unsigned int ecc_size = denali->nand.ecc.size;
>  	unsigned int bitflips = 0;
>  	unsigned int max_bitflips = 0;
>  	uint32_t err_addr, err_cor_info;
> @@ -928,9 +927,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  			 * an erased sector.
>  			 */
>  			*uncor_ecc_flags |= BIT(err_sector);
> -		} else if (err_byte < ECC_SECTOR_SIZE) {
> +		} else if (err_byte < ecc_size) {
>  			/*
> -			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
> +			 * If err_byte is larger than ecc_size, means error
>  			 * happened in OOB, so we ignore it. It's no need for
>  			 * us to correct it err_device is represented the NAND
>  			 * error bits are happened in if there are more than
> @@ -939,7 +938,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  			int offset;
>  			unsigned int flips_in_byte;
>  
> -			offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
> +			offset = (err_sector * ecc_size + err_byte) *
>  						denali->devnum + err_device;
>  
>  			/* correct the ECC error */
> @@ -1345,13 +1344,55 @@ static void denali_hw_init(struct denali_nand_info *denali)
>  	denali_irq_init(denali);
>  }
>  
> -/*
> - * Althogh controller spec said SLC ECC is forceb to be 4bit,
> - * but denali controller in MRST only support 15bit and 8bit ECC
> - * correction
> - */
> -#define ECC_8BITS	14
> -#define ECC_15BITS	26
> +static int denali_calc_ecc_bytes(int step_size, int strength)
> +{
> +	int coef;
> +
> +	switch (step_size) {
> +	case 512:
> +		coef = 13;
> +		break;
> +	case 1024:
> +		coef = 14;
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	return DIV_ROUND_UP(strength * coef, 16) * 2;

or just

	return DIV_ROUND_UP(strength * fls(8 * step_size), 16) * 2;

the array of supported step size/strength should guarantee that you're
called with unsupported settings.

> +}
> +
> +static int denali_ecc_setup(struct mtd_info *mtd, struct nand_chip *chip,
> +			    struct denali_nand_info *denali)
> +{
> +	struct nand_ecc_caps caps;
> +	int ret;
> +
> +	caps.stepinfos = denali->stepinfo;
> +	caps.nstepinfos = 1;
> +	caps.calc_ecc_bytes = denali_calc_ecc_bytes;
> +	caps.oob_reserve_bytes = denali->bbtskipbytes;

If you get rid of this oob_reserve_bytes field, you can define caps as
a static const and even directly store ecc_caps in denali_nand_info.

> +
> +	/*
> +	 * If .size and .strength are already set (usually by DT),
> +	 * check if they are supported by this controller.
> +	 */
> +	if (chip->ecc.size && chip->ecc.strength)
> +		return nand_check_ecc_caps(mtd, chip, &caps);
> +
> +	/*
> +	 * We want .size and .strength closest to the chip's requirement
> +	 * unless NAND_ECC_MAXIMIZE is requested.
> +	 */
> +	if (!(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
> +		ret = nand_match_ecc_req(mtd, chip, &caps);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	/* Max ECC strength is the last thing we can do */
> +	return nand_maximize_ecc(mtd, chip, &caps);
> +}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
