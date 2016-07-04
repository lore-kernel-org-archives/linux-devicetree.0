From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/6] mtd: nand: gpmi: correct bitflip for erased NAND
 page
Date: Mon, 4 Jul 2016 15:58:46 +0200
Message-ID: <20160704155846.0b0b4c8f@bbrezillon>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
	<1466804411-19874-5-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466804411-19874-5-git-send-email-han.xu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
Cc: richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 24 Jun 2016 16:40:09 -0500
Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org> wrote:

> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> bitflip number for erased NAND page. So for these two platform, set the
> erase threshold to ecc_strength and if bitflip detected, GPMI driver
> will correct the data to all 0xFF.
> 
> Signed-off-by: Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 10 +++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  5 +++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 37 +++++++++++++++++++++++++++++++---
>  3 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> index 228142c..2c44b88 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -30,7 +30,13 @@
>  #define BM_BCH_CTRL_COMPLETE_IRQ		(1 << 0)
>  
>  #define HW_BCH_STATUS0				0x00000010
> +
>  #define HW_BCH_MODE				0x00000020
> +#define BP_BCH_MODE_ERASE_THRESHOLD		0
> +#define BM_BCH_MODE_ERASE_THRESHOLD	(0xff << BP_BCH_MODE_ERASE_THRESHOLD)
> +#define BF_BCH_MODE_ERASE_THRESHOLD(v)		\
> +	(((v) << BP_BCH_MODE_ERASE_THRESHOLD) & BM_BCH_MODE_ERASE_THRESHOLD)
> +
>  #define HW_BCH_ENCODEPTR			0x00000030
>  #define HW_BCH_DATAPTR				0x00000040
>  #define HW_BCH_METAPTR				0x00000050
> @@ -125,4 +131,8 @@
>  	)
>  
>  #define HW_BCH_VERSION				0x00000160
> +#define HW_BCH_DEBUG1				0x00000170
> +#define BP_BCH_DEBUG1_ERASED_ZERO_COUNT	0
> +#define BM_BCH_DEBUG1_ERASED_ZERO_COUNT		\
> +		(0x1ff << BP_BCH_DEBUG1_ERASED_ZERO_COUNT)
>  #endif
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> index 358ff5d..0b5666a 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -298,6 +298,11 @@ int bch_set_geometry(struct gpmi_nand_data *this)
>  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
>  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
>  
> +	/* Set erase threshold to ecc_strength for mx6qp and mx7 */
> +	if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))
> +		writel(BF_BCH_MODE_ERASE_THRESHOLD(ecc_strength),
> +			r->bch_regs + HW_BCH_MODE);
> +
>  	/* Set *all* chip selects to use layout 0. */
>  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
>  
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index aedaff3..db8e546 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1043,11 +1043,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	struct gpmi_nand_data *this = nand_get_controller_data(chip);
>  	struct bch_geometry *nfc_geo = &this->bch_geometry;
> +	void __iomem *bch_regs = this->resources.bch_regs;
>  	void          *payload_virt;
>  	dma_addr_t    payload_phys;
>  	void          *auxiliary_virt;
>  	dma_addr_t    auxiliary_phys;
> -	unsigned int  i;
> +	unsigned int  i, j;
>  	unsigned char *status;
>  	unsigned int  max_bitflips = 0;
>  	int           ret;
> @@ -1087,9 +1088,14 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			   nfc_geo->payload_size,
>  			   payload_virt, payload_phys);
>  
> -	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> -		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
> +	for (i = 0, j = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
> +		if (*status == STATUS_GOOD)
> +			continue;
> +		if (*status == STATUS_ERASED) {
> +			/* count the number of erased chunks */
> +			j++;
>  			continue;
> +		}
>  
>  		if (*status == STATUS_UNCORRECTABLE) {
>  			int eccbits = nfc_geo->ecc_strength * nfc_geo->gf_len;
> @@ -1098,6 +1104,12 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			int eccbytes;
>  			int flips;
>  
> +			/* shortcut for i.MX7 and i.MX6QP */
> +			if (GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this)) {
> +				mtd->ecc_stats.failed++;
> +				continue;
> +			}
> +
>  			/* Read ECC bytes into our internal raw_buffer */
>  			offset = nfc_geo->metadata_size * 8;
>  			offset += ((8 * nfc_geo->ecc_chunk_size) + eccbits) * (i + 1);
> @@ -1167,6 +1179,25 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  		max_bitflips = max_t(unsigned int, max_bitflips, *status);
>  	}
>  
> +	/*
> +	 * i.MX6QP and i.MX7 have dedicate register to check bitflips in the
> +	 * page, while it cannot tell in which chunk bitflips locate, memset
> +	 * all the data if bitflips exist and all chunks are erased.

Hm, that's a big problem: how can we decide if the number of bitflips
per ECC chunk exceed the bitflips threshold?

> +	 */
> +	if (j == nfc_geo->ecc_chunk_count &&
> +		(GPMI_IS_MX6QP(this) || GPMI_IS_MX7(this))) {
> +		int flips;
> +
> +		flips = readl(bch_regs + HW_BCH_DEBUG1);
> +		if (flips) {
> +			max_bitflips = max_t(unsigned int, max_bitflips,
> +					flips);

max_bitflips is supposed to contain the maximum number of bitflips per
ECC chunk not per page, so nand_base might return -EUCLEAN while it
should have returned zero in some cases.

Given this new information I'm not sure the HW solution to count
bitflips in erased pages is appropriate.

> +			memset(buf, ~0, nfc_geo->payload_size);
> +			memset(chip->oob_poi, ~0, mtd->oobsize);
> +			mtd->ecc_stats.corrected += flips;
> +		}
> +	}
> +
>  	if (oob_required) {
>  		/*
>  		 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob()

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
