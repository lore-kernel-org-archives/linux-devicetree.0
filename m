From: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 06/14] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
Date: Thu, 5 Sep 2019 13:56:39 +0800
Message-ID: <1567662999.18702.28.camel@mhfsdcap03>
References: <mailman.21807.1567503573.19300.linux-mediatek@lists.infradead.org>
         <1567570074.31301.19.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567570074.31301.19.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: houlong wei <houlong.wei@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, Will Deacon <will.deacon@arm.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com, cui.zhang@mediatek.com, chao.hao@mediatek.com, ming-fan.chen@mediatek.com, minghsiu.tsai@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 2019-09-04 at 12:07 +0800, houlong wei wrote:
> Hi, Yong,
> 
> I have inline comment below.

Thanks for your review.

> 
> > MediaTek IOMMU has already added the device_link between the consumer
> > and smi-larb device. If the mdp device call the pm_runtime_get_sync,
> > the smi-larb's pm_runtime_get_sync also be called automatically.
> > 
> > CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> > ---
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 38 ---------------------------
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 --
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
> >  3 files changed, 41 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > index 9afe816..5985a9b 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > @@ -9,7 +9,6 @@
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_platform.h>
> > -#include <soc/mediatek/smi.h>
> >  
> >  #include "mtk_mdp_comp.h"
> >  
> > @@ -58,14 +57,6 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> >  {
> >  	int i, err;
> >  
> > -	if (comp->larb_dev) {
> > -		err = mtk_smi_larb_get(comp->larb_dev);
> > -		if (err)
> > -			dev_err(dev,
> > -				"failed to get larb, err %d. type:%d id:%d\n",
> > -				err, comp->type, comp->id);
> > -	}
> 
> In previous design,mtk_mdp_comp_clock_on() is called by each MDP
> hardware component, and mtk_smi_larb_get() is also called for each MDP
> hardware component which accesses DRAM via SMI larb.
> 
> Since mdp device only contains mdp_rdma component, so
> pm_runtime_get_sync() will ignore other smi-larb clock. We need consider
> how to enable clocks of other smi-larb associated with other mdp
> component, e.g. mdp_wdma, mdp_wrot.
> 

Sorry, I'm not so familiar with mdp, thus, for MDP part, the test and
reviewing from Minghsiu or you is expected.

This patch only delete the smi interface literally. In my understanding,
mdp should call pm_runtime_get with the corresponding device, no matter
mdp_wdma or mdp_wrot device.

Of course I am not sure the mdp flow, If this patch affect its function,
please tell me. Also, If mdp driver need change correspondingly, I will
put it into this series like [12/14] of this patchset which is from
display.

[snip]
