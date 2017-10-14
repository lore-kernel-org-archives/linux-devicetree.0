From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to
 ARMADA370 variants.
Date: Sat, 14 Oct 2017 15:12:33 +0200
Message-ID: <20171014151233.4e9ff319@bbrezillon>
References: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
        <20170928005756.3938-2-kalyan.kinthada@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928005756.3938-2-kalyan.kinthada@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, ezequiel.garcia@free-electrons.com, miquel.raynal@free-electrons.com, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, chris.packham@alliedtelesis.co.nz
List-Id: devicetree@vger.kernel.org

Hi Kalyan,

On Thu, 28 Sep 2017 13:57:56 +1300
Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:

> When the arbitration between NOR and NAND flash is enabled
> the <FORCE_CSX> field bit[21] in the Data Flash Control Register
> needs to be set to 1 according to guidleine GL-5830741 mentioned
> in Marvell Errata document MV-S501377-00, Rev. D.

The real question is, is this patch fixing a real bug or are you just
setting this bit because a guideline says it should be set? As far as I
understand, noone fully understands what this bit does and why it needs
to be set, so if you're not fixing a real bug, I'd prefer keeping the
code unchanged code until someone complains for a good reason.

Regards,

Boris

> 
> This commit sets the FORCE_CSX bit to 1 for all
> ARMADA370 variants as the arbitration is always enabled by default.
> This change does not apply for pxa3xx variants because the FORCE_CSX
> bit does not exist/reserved on the NFCv1.
> 
> The NDCR_ND_MODE conflicts with the new NDCR_FORCE_CSX but is unused so
> remove it along with NDCR_NAND_MODE.
> 
> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 85cff68643e0..a6a7a5af7bed 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -67,8 +67,7 @@
>  #define NDCR_DWIDTH_M		(0x1 << 26)
>  #define NDCR_PAGE_SZ		(0x1 << 24)
>  #define NDCR_NCSX		(0x1 << 23)
> -#define NDCR_ND_MODE		(0x3 << 21)
> -#define NDCR_NAND_MODE   	(0x0)
> +#define NDCR_FORCE_CSX		(0x1 << 21)
>  #define NDCR_CLR_PG_CNT		(0x1 << 20)
>  #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
>  #define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)
> @@ -1464,6 +1463,9 @@ static int pxa3xx_nand_config_ident(struct pxa3xx_nand_info *info)
>  	info->chunk_size = PAGE_CHUNK_SIZE;
>  	info->reg_ndcr = 0x0; /* enable all interrupts */
>  	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741 */
> +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> +		info->reg_ndcr |= NDCR_FORCE_CSX;
>  	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
>  	info->reg_ndcr |= NDCR_SPARE_EN;
>  
> @@ -1498,6 +1500,9 @@ static void pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
>  	info->reg_ndcr = ndcr &
>  		~(NDCR_INT_MASK | NDCR_ND_ARB_EN | NFCV1_NDCR_ARB_CNTL);
>  	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#: GL-5830741 */
> +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> +		info->reg_ndcr |= NDCR_FORCE_CSX;
>  	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
>  	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
>  }
