From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 08/21] iommu/mediatek: Add larb-id remapped support
Date: Mon, 17 Jun 2019 11:25:07 +0200
Message-ID: <3dec887b-06b5-1aeb-8bd8-924999addd53@gmail.com>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
 <1560169080-27134-9-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560169080-27134-9-git-send-email-yong.wu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yingjoe.chen@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org



On 10/06/2019 14:17, Yong Wu wrote:
> The larb-id may be remapped in the smi-common, this means the
> larb-id reported in the mtk_iommu_isr isn't the real larb-id,
> 
> Take mt8183 as a example:
>                        M4U
>                         |
> ---------------------------------------------
> |               SMI common                  |
> -0-----7-----5-----6-----1-----2------3-----4- <- Id remapped
>  |     |     |     |     |     |      |     |
> larb0 larb1 IPU0  IPU1 larb4 larb5  larb6  CCU
> disp  vdec  img   cam   venc  img    cam
> As above, larb0 connects with the id 0 in smi-common.
>           larb1 connects with the id 7 in smi-common.
>           ...
> If the larb-id reported in the isr is 7, actually it's larb1(vdec).
> In order to output the right larb-id in the isr, we add a larb-id
> remapping relationship in this patch.
> 
> If there is no this larb-id remapping in some SoCs, use the linear
> mapping array instead.
> 
> This also is a preparing patch for mt8183.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reviewed-by: Evan Green <evgreen@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/iommu/mtk_iommu.c | 4 ++++
>  drivers/iommu/mtk_iommu.h | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 264dda4..ad838b9 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -220,6 +220,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
>  	fault_larb = F_MMU0_INT_ID_LARB_ID(regval);
>  	fault_port = F_MMU0_INT_ID_PORT_ID(regval);
>  
> +	fault_larb = data->plat_data->larbid_remap[fault_larb];
> +
>  	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
>  			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
>  		dev_err_ratelimited(
> @@ -744,12 +746,14 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
>  	.m4u_plat     = M4U_MT2712,
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
> +	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.has_4gb_mode = true,
>  	.has_bclk     = true,
> +	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
>  };
>  
>  static const struct of_device_id mtk_iommu_of_ids[] = {
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 63e235e..61fd5d6 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -46,6 +46,8 @@ struct mtk_iommu_plat_data {
>  
>  	/* HW will use the EMI clock if there isn't the "bclk". */
>  	bool                has_bclk;
> +
> +	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
>  };
>  
>  struct mtk_iommu_domain;
> 
