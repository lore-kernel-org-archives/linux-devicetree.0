From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH v3 06/14] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
Date: Wed, 4 Sep 2019 12:07:54 +0800
Message-ID: <1567570074.31301.19.camel@mhfsdcap03>
References: <mailman.21807.1567503573.19300.linux-mediatek@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <mailman.21807.1567503573.19300.linux-mediatek@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, houlong.wei@mediatek.com, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, Matthias Kaehlcke <mka@chromium.org>, linux-mediatek@lists.infradead.org, yong.wu@mediatek.com, minghsiu.tsai@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yong,

I have inline comment below.

> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the mdp device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 38 ---------------------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 --
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>  3 files changed, 41 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 9afe816..5985a9b 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -9,7 +9,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_mdp_comp.h"
>  
> @@ -58,14 +57,6 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>  {
>  	int i, err;
>  
> -	if (comp->larb_dev) {
> -		err = mtk_smi_larb_get(comp->larb_dev);
> -		if (err)
> -			dev_err(dev,
> -				"failed to get larb, err %d. type:%d id:%d\n",
> -				err, comp->type, comp->id);
> -	}

In previous design,mtk_mdp_comp_clock_on() is called by each MDP
hardware component, and mtk_smi_larb_get() is also called for each MDP
hardware component which accesses DRAM via SMI larb.

Since mdp device only contains mdp_rdma component, so
pm_runtime_get_sync() will ignore other smi-larb clock. We need consider
how to enable clocks of other smi-larb associated with other mdp
component, e.g. mdp_wdma, mdp_wrot.


>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		if (IS_ERR(comp->clk[i]))
>  			continue;
> @@ -86,16 +77,11 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
>  			continue;
>  		clk_disable_unprepare(comp->clk[i]);
>  	}
> -
> -	if (comp->larb_dev)
> -		mtk_smi_larb_put(comp->larb_dev);
>  }
>  
>  int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  		      struct mtk_mdp_comp *comp, enum mtk_mdp_comp_id comp_id)
>  {
> -	struct device_node *larb_node;
> -	struct platform_device *larb_pdev;
>  	int i;
>  
>  	if (comp_id < 0 || comp_id >= MTK_MDP_COMP_ID_MAX) {
> @@ -116,30 +102,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  			break;
>  	}
>  
> -	/* Only DMA capable components need the LARB property */
> -	comp->larb_dev = NULL;
> -	if (comp->type != MTK_MDP_RDMA &&
> -	    comp->type != MTK_MDP_WDMA &&
> -	    comp->type != MTK_MDP_WROT)
> -		return 0;
> -
> -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> -	if (!larb_node) {
> -		dev_err(dev,
> -			"Missing mediadek,larb phandle in %pOF node\n", node);
> -		return -EINVAL;
> -	}
> -
> -	larb_pdev = of_find_device_by_node(larb_node);
> -	if (!larb_pdev) {
> -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> -		of_node_put(larb_node);
> -		return -EPROBE_DEFER;
> -	}
> -	of_node_put(larb_node);
> -
> -	comp->larb_dev = &larb_pdev->dev;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 998a4b9..a2da8df 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -39,7 +39,6 @@ enum mtk_mdp_comp_id {
>   * @dev_node:	component device node
>   * @clk:	clocks required for component
>   * @regs:	Mapped address of component registers.
> - * @larb_dev:	SMI device required for component
>   * @type:	component type
>   * @id:		component ID
>   */
> @@ -47,7 +46,6 @@ struct mtk_mdp_comp {
>  	struct device_node	*dev_node;
>  	struct clk		*clk[2];
>  	void __iomem		*regs;
> -	struct device		*larb_dev;
>  	enum mtk_mdp_comp_type	type;
>  	enum mtk_mdp_comp_id	id;
>  };
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index fc9faec..c237ed9 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -17,7 +17,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/workqueue.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_mdp_core.h"
>  #include "mtk_mdp_m2m.h"
