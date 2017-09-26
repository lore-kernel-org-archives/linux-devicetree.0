From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: nand: pxa3xx: Handle "marvell, nand-force-csx"
 compatible string
Date: Tue, 26 Sep 2017 09:18:52 +0200
Message-ID: <20170926091852.196f647d@xps13>
References: <20170926041700.22663-1-kalyan.kinthada@alliedtelesis.co.nz>
        <20170926041700.22663-3-kalyan.kinthada@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926041700.22663-3-kalyan.kinthada@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, ezequiel.garcia@free-electrons.com, devicetree@vger.kernel.org, chris.packham@alliedtelesis.co.nz, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kalyan,

On Tue, 26 Sep 2017 17:17:00 +1300
Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:

> When the arbitration between NOR and NAND flash is enabled
> the <FORCE_CSX> field bit[21] in the Data Flash Control Register
> needs to be set to 1 according to guidleine GL-5830741.

I do agree, the driver lacks the support of this bit, which
looks important when you effectively use the arbiter.
Nevertheless:

- On PXA (marvell,pxa3xx-nand compatible), there is a ND_ARB_EN bit to
  enable or disable the arbiter, but there is no FORCE_CSX bit (bit 21
  of NDCR, the so called Control Register, is reserved).
- On Armada (marvell,armada370-nand), there is a FORCE_CSX bit, but
  there is no ND_ARB_EN bit in the NDCR (moved to system registers) and
  the arbitration is always enabled by default.

I guess you should always set the FORCE_CSX bit when using the armada
compatible, because it is harmless, right? Thus, you could get rid
of the new DT property.

Thank you,
Miquèl

> 
> This commit sets the FORCE_CSX bit to 1 if the compatible
> string "marvell,nand-force-csx" is enabled in the device tree
> of the corresponding boards.
> 
> Signed-off-by: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c                | 6 ++++++
>  include/linux/platform_data/mtd-nand-pxa3xx.h | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
> b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..4ad1f0601930
> 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -68,6 +68,7 @@
>  #define NDCR_PAGE_SZ		(0x1 << 24)
>  #define NDCR_NCSX		(0x1 << 23)
>  #define NDCR_ND_MODE		(0x3 << 21)
> +#define NDCR_FORCE_CSX		(0x1 << 21)
>  #define NDCR_NAND_MODE   	(0x0)
>  #define NDCR_CLR_PG_CNT		(0x1 << 20)
>  #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
> @@ -1464,6 +1465,7 @@ static int pxa3xx_nand_config_ident(struct
> pxa3xx_nand_info *info) info->chunk_size = PAGE_CHUNK_SIZE;
>  	info->reg_ndcr = 0x0; /* enable all interrupts */
>  	info->reg_ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN :
> 0;
> +	info->reg_ndcr |= (pdata->force_csx) ? NDCR_FORCE_CSX : 0;
>  	info->reg_ndcr |= NDCR_RD_ID_CNT(READ_ID_BYTES);
>  	info->reg_ndcr |= NDCR_SPARE_EN;
>  
> @@ -1498,6 +1500,7 @@ static void pxa3xx_nand_detect_config(struct
> pxa3xx_nand_info *info) info->reg_ndcr = ndcr &
>  		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |
> NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |= (pdata->enable_arbiter) ?
> NDCR_ND_ARB_EN : 0;
> +	info->reg_ndcr |= (pdata->force_csx) ? NDCR_FORCE_CSX : 0;
>  	info->ndtr0cs0 = nand_readl(info, NDTR0CS0);
>  	info->ndtr1cs0 = nand_readl(info, NDTR1CS0);
>  }
> @@ -1936,6 +1939,9 @@ static int pxa3xx_nand_probe_dt(struct
> platform_device *pdev) pdata->enable_arbiter = 1;
>  	if (of_get_property(np, "marvell,nand-keep-config", NULL))
>  		pdata->keep_config = 1;
> +	if (of_get_property(np, "marvell,nand-force-csx", NULL))
> +		/* Ref#: GL-5830741 */
> +		pdata->force_csx = 1;
>  	of_property_read_u32(np, "num-cs", &pdata->num_cs);
>  
>  	pdev->dev.platform_data = pdata;
> diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h
> b/include/linux/platform_data/mtd-nand-pxa3xx.h index
> 394d15597dc7..e7f2c8647c0e 100644 ---
> a/include/linux/platform_data/mtd-nand-pxa3xx.h +++
> b/include/linux/platform_data/mtd-nand-pxa3xx.h @@ -28,6 +28,9 @@
> struct pxa3xx_nand_platform_data { /* allow platform code to keep
> OBM/bootloader defined NFC config */ int	keep_config;
>  
> +	/* Force chip select false on busy */
> +	int	force_csx;
> +
>  	/* indicate how many chip selects will be used */
>  	int	num_cs;
>  



-- 
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
