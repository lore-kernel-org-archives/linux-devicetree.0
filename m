From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 20/21] iommu/mediatek: Fix iova_to_phys PA start for
 4GB mode
Date: Tue, 18 Jun 2019 18:35:54 +0200
Message-ID: <db9b3b2f-3206-01bf-f0f9-67251e5ff756@gmail.com>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
 <1560169080-27134-21-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560169080-27134-21-git-send-email-yong.wu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yingjoe.chen@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org



On 10/06/2019 14:17, Yong Wu wrote:
> In the 4GB mode, the physical address is remapped,
> 
> Here is the detailed remap relationship.
> CPU PA         ->    HW PA
> 0x4000_0000          0x1_4000_0000 (Add bit32)
> 0x8000_0000          0x1_8000_0000 ...
> 0xc000_0000          0x1_c000_0000 ...
> 0x1_0000_0000        0x1_0000_0000 (No change)
> 
> Thus, we always add bit32 for PA when entering mtk_iommu_map.
> But in the iova_to_phys, the CPU don't need this bit32 if the
> PA is from 0x1_4000_0000 to 0x1_ffff_ffff.
> This patch discards the bit32 in this iova_to_phys in the 4GB mode.
> 
> Fixes: 30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range
> for 4GB mode")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 67cab2d..34f2e40 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -119,6 +119,19 @@ struct mtk_iommu_domain {
>  
>  static const struct iommu_ops mtk_iommu_ops;
>  
> +/*
> + * In M4U 4GB mode, the physical address is remapped as below:
> + *  CPU PA         ->   M4U HW PA
> + *  0x4000_0000         0x1_4000_0000 (Add bit32)
> + *  0x8000_0000         0x1_8000_0000 ...
> + *  0xc000_0000         0x1_c000_0000 ...
> + *  0x1_0000_0000       0x1_0000_0000 (No change)
> + *
> + * Thus, We always add BIT32 in the iommu_map and disable BIT32 if PA is >=
> + * 0x1_4000_0000 in the iova_to_phys.
> + */
> +#define MTK_IOMMU_4GB_MODE_PA_140000000     0x140000000UL
> +
>  static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
>  
>  #define for_each_m4u(data)	list_for_each_entry(data, &m4ulist, list)
> @@ -415,6 +428,7 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
>  					  dma_addr_t iova)
>  {
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
>  	unsigned long flags;
>  	phys_addr_t pa;
>  
> @@ -422,6 +436,10 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
>  	pa = dom->iop->iova_to_phys(dom->iop, iova);
>  	spin_unlock_irqrestore(&dom->pgtlock, flags);
>  
> +	if (data->plat_data->has_4gb_mode && data->dram_is_4gb &&
> +	    pa >= MTK_IOMMU_4GB_MODE_PA_140000000)
> +		pa &= ~BIT_ULL(32);
> +

Hm, I wonder if we could fix this as first patch in the series, especially before:
"[PATCH 06/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB Mode"

This would make it easier for the stable maintainer to cherry-pick the fix.
Without 100% understanding the code, it seems suspicious to me, that you first
move the setting of the bit32 and bit33 into v7s and later explicitly clean the
bits here.

So my take on this is, that patch 6/21 introduced the regression you are trying
to fix here. As said that is speculation as I don't understand the code in its
whole.

Any clarification would be useful.

Regards,
Matthias

>  	return pa;
>  }
>  
> 
