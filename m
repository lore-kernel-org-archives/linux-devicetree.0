From: Miquel RAYNAL <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to
 ARMADA370 variants.
Date: Wed, 27 Sep 2017 08:53:18 +0200
Message-ID: <20170927085318.0670a849@xps13>
References: <20170927005516.28374-1-kalyan.kinthada@alliedtelesis.co.nz>
        <20170927005516.28374-2-kalyan.kinthada@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927005516.28374-2-kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Kalyan,

On Wed, 27 Sep 2017 13:55:16 +1300
Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:

> When the arbitration between NOR and NAND flash is enabled
> the <FORCE_CSX> field bit[21] in the Data Flash Control Register
> needs to be set to 1 according to guidleine GL-5830741.
> 
> This commit sets the FORCE_CSX bit to 1 for all
> ARMADA370 variants as the arbitration is always enabled by default.

Maybe you could mention here that this does not apply for pxa3xx
variant as this bit does not exist/is reserved on the NFCv1.

> 
> Signed-off-by: Kalyan Kinthada <kalyan.kinthada-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
> b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..b2753eea567c
> 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -68,6 +68,7 @@
>  #define NDCR_PAGE_SZ		(0x1 << 24)
>  #define NDCR_NCSX		(0x1 << 23)
>  #define NDCR_ND_MODE		(0x3 << 21)
> +#define NDCR_FORCE_CSX		(0x1 << 21)
>  #define NDCR_NAND_MODE   	(0x0)

The three lines above seems to have the same purpose.
I had a look to the specs (pxa/370/375/xp/380/390), and I could
not find any reference to a valid bit 22 in NDCR (it is always
reserved). Maybe you could delete NDCR_ND_MODE and
NDCR_NAND_MODE then ?

>  #define NDCR_CLR_PG_CNT		(0x1 << 20)
>  #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
> @@ -1464,6 +1465,9 @@ static int pxa3xx_nand_config_ident(struct
> pxa3xx_nand_info *info) info->chunk_size = PAGE_CHUNK_SIZE;
>  	info->reg_ndcr = 0x0; /* enable all interrupts */
>  	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN :
> 0;
> +	/* Set FORCE_CSX bit for all ARMADAGL-5830741370 Variants.
> Ref#: GL-5830741*/

You miss a space between "GL-5830741" and "*/".

> +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> +		info->reg_ndcr |= NDCR_FORCE_CSX;
>  	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
>  	info->reg_ndcr |= NDCR_SPARE_EN;
>  
> @@ -1498,6 +1502,9 @@ static void pxa3xx_nand_detect_config(struct
> pxa3xx_nand_info *info) info->reg_ndcr = ndcr &
>  		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |
> NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |= (pdata->enable_arbiter) ?
> NDCR_ND_ARB_EN : 0;
> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:
> GL-5830741*/

Same here.

> +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> +		info->reg_ndcr |= NDCR_FORCE_CSX;
>  	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
>  	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
>  }


Thanks,
Miquèl

-- 
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
