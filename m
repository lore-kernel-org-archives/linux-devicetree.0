From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v10 23/23] iommu/mediatek: Clean up struct mtk_smi_iommu
Date: Thu, 22 Aug 2019 16:07:11 +0200
Message-ID: <81864691-62f3-4e9a-eca0-c68000328f33@gmail.com>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
 <1566395606-7975-24-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566395606-7975-24-git-send-email-yong.wu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>, cui.zhang@mediatek.com, chao.hao@mediatek.com, ming-fan.chen@mediatek.com
List-Id: devicetree@vger.kernel.org



On 21/08/2019 15:53, Yong Wu wrote:
> Remove the "struct mtk_smi_iommu" to simplify the code since it has only
> one item in it right now.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/iommu/mtk_iommu.c    | 4 ++--
>  drivers/iommu/mtk_iommu.h    | 6 +++---
>  drivers/iommu/mtk_iommu_v1.c | 4 ++--
>  drivers/memory/mtk-smi.c     | 6 +++---
>  include/soc/mediatek/smi.h   | 4 ----
>  5 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index cc81de2..400066d 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -278,7 +278,7 @@ static void mtk_iommu_config(struct mtk_iommu_data *data,
>  	for (i = 0; i < fwspec->num_ids; ++i) {
>  		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
>  		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
> -		larb_mmu = &data->smi_imu.larb_imu[larbid];
> +		larb_mmu = &data->larb_imu[larbid];
>  
>  		dev_dbg(dev, "%s iommu port: %d\n",
>  			enable ? "enable" : "disable", portid);
> @@ -680,7 +680,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  			of_node_put(larbnode);
>  			return -EPROBE_DEFER;
>  		}
> -		data->smi_imu.larb_imu[id].dev = &plarbdev->dev;
> +		data->larb_imu[id].dev = &plarbdev->dev;
>  
>  		component_match_add_release(dev, &match, release_of,
>  					    compare_of, larbnode);
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 56b579c..fc0f16e 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -56,7 +56,6 @@ struct mtk_iommu_data {
>  	struct mtk_iommu_suspend_reg	reg;
>  	struct mtk_iommu_domain		*m4u_dom;
>  	struct iommu_group		*m4u_group;
> -	struct mtk_smi_iommu		smi_imu;      /* SMI larb iommu info */
>  	bool                            enable_4GB;
>  	bool				tlb_flush_active;
>  
> @@ -64,6 +63,7 @@ struct mtk_iommu_data {
>  	const struct mtk_iommu_plat_data *plat_data;
>  
>  	struct list_head		list;
> +	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
>  };
>  
>  static inline int compare_of(struct device *dev, void *data)
> @@ -80,14 +80,14 @@ static inline int mtk_iommu_bind(struct device *dev)
>  {
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  
> -	return component_bind_all(dev, &data->smi_imu);
> +	return component_bind_all(dev, &data->larb_imu);
>  }
>  
>  static inline void mtk_iommu_unbind(struct device *dev)
>  {
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  
> -	component_unbind_all(dev, &data->smi_imu);
> +	component_unbind_all(dev, &data->larb_imu);
>  }
>  
>  #endif
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 3922358..860926c 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -206,7 +206,7 @@ static void mtk_iommu_config(struct mtk_iommu_data *data,
>  	for (i = 0; i < fwspec->num_ids; ++i) {
>  		larbid = mt2701_m4u_to_larb(fwspec->ids[i]);
>  		portid = mt2701_m4u_to_port(fwspec->ids[i]);
> -		larb_mmu = &data->smi_imu.larb_imu[larbid];
> +		larb_mmu = &data->larb_imu[larbid];
>  
>  		dev_dbg(dev, "%s iommu port: %d\n",
>  			enable ? "enable" : "disable", portid);
> @@ -610,7 +610,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> -		data->smi_imu.larb_imu[larb_nr].dev = &plarbdev->dev;
> +		data->larb_imu[larb_nr].dev = &plarbdev->dev;
>  		component_match_add_release(dev, &match, release_of,
>  					    compare_of, larb_spec.np);
>  		larb_nr++;
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index d6dc62f..439d7d8 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -143,13 +143,13 @@ void mtk_smi_larb_put(struct device *larbdev)
>  mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> -	struct mtk_smi_iommu *smi_iommu = data;
> +	struct mtk_smi_larb_iommu *larb_mmu = data;
>  	unsigned int         i;
>  
>  	for (i = 0; i < MTK_LARB_NR_MAX; i++) {
> -		if (dev == smi_iommu->larb_imu[i].dev) {
> +		if (dev == larb_mmu[i].dev) {
>  			larb->larbid = i;
> -			larb->mmu = &smi_iommu->larb_imu[i].mmu;
> +			larb->mmu = &larb_mmu[i].mmu;
>  			return 0;
>  		}
>  	}
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 6f0b00c..5a34b87 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -20,10 +20,6 @@ struct mtk_smi_larb_iommu {
>  	unsigned int   mmu;
>  };
>  
> -struct mtk_smi_iommu {
> -	struct mtk_smi_larb_iommu larb_imu[MTK_LARB_NR_MAX];
> -};
> -
>  /*
>   * mtk_smi_larb_get: Enable the power domain and clocks for this local arbiter.
>   *                   It also initialize some basic setting(like iommu).
> 
