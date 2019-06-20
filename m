From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 17/21] memory: mtk-smi: Get rid of need_larbid
Date: Thu, 20 Jun 2019 21:59:36 +0800
Message-ID: <1561039176.4021.21.camel@mhfsdcap03>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
	<1560169080-27134-18-git-send-email-yong.wu@mediatek.com>
	<1af7b67a-b73a-efb9-e1f8-5701f05a4af0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1af7b67a-b73a-efb9-e1f8-5701f05a4af0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-18 at 15:45 +0200, Matthias Brugger wrote:
> 
> On 10/06/2019 14:17, Yong Wu wrote:
> > The "mediatek,larb-id" has already been parsed in MTK IOMMU driver.
> > It's no need to parse it again in SMI driver. Only clean some codes.
> > This patch is fit for all the current mt2701, mt2712, mt7623, mt8173
> > and mt8183.
> > 
> > After this patch, the "mediatek,larb-id" only be needed for mt2712
> > which have 2 M4Us. In the other SoCs, we can get the larb-id from M4U
> > in which the larbs in the "mediatek,larbs" always are ordered.
> > 
> > Correspondingly, the larb_nr in the "struct mtk_smi_iommu" could also
> > be deleted.
> > 
> 
> I think we can get rid of struct mtk_smi_iommu and just add the
> struct mtk_smi_larb_iommu larb_imu[MTK_LARB_NR_MAX] directly to mtk_iommu_data,
> passing just that array to the components bind function.

Thanks. I will try this in a new patch.

> 
> Never the less this patch looks fine:
> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Really appreciate for reviewing so many patches.

> 
> > CC: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> >  drivers/iommu/mtk_iommu.c    |  1 -
> >  drivers/iommu/mtk_iommu_v1.c |  2 --
> >  drivers/memory/mtk-smi.c     | 26 ++------------------------
> >  include/soc/mediatek/smi.h   |  1 -
> >  4 files changed, 2 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index ec4ce74..6053b8b 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -634,7 +634,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  					     "mediatek,larbs", NULL);
> >  	if (larb_nr < 0)
> >  		return larb_nr;
> > -	data->smi_imu.larb_nr = larb_nr;
> >  
> >  	for (i = 0; i < larb_nr; i++) {
> >  		struct device_node *larbnode;
> > diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> > index 52b01e3..73308ad 100644
> > --- a/drivers/iommu/mtk_iommu_v1.c
> > +++ b/drivers/iommu/mtk_iommu_v1.c
> > @@ -624,8 +624,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
> >  		larb_nr++;
> >  	}
> >  
> > -	data->smi_imu.larb_nr = larb_nr;
> > -
> >  	platform_set_drvdata(pdev, data);
> >  
> >  	ret = mtk_iommu_hw_init(data);
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index 08cf40d..10e6493 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -67,7 +67,6 @@ struct mtk_smi_common_plat {
> >  };
> >  
> >  struct mtk_smi_larb_gen {
> > -	bool need_larbid;
> >  	int port_in_larb[MTK_LARB_NR_MAX + 1];
> >  	void (*config_port)(struct device *);
> >  	unsigned int larb_direct_to_common_mask;
> > @@ -153,18 +152,9 @@ void mtk_smi_larb_put(struct device *larbdev)
> >  	struct mtk_smi_iommu *smi_iommu = data;
> >  	unsigned int         i;
> >  
> > -	if (larb->larb_gen->need_larbid) {
> > -		larb->mmu = &smi_iommu->larb_imu[larb->larbid].mmu;
> > -		return 0;
> > -	}
> > -
> > -	/*
> > -	 * If there is no larbid property, Loop to find the corresponding
> > -	 * iommu information.
> > -	 */
> > -	for (i = 0; i < smi_iommu->larb_nr; i++) {
> > +	for (i = 0; i < MTK_LARB_NR_MAX; i++) {
> >  		if (dev == smi_iommu->larb_imu[i].dev) {
> > -			/* The 'mmu' may be updated in iommu-attach/detach. */
> > +			larb->larbid = i;
> >  			larb->mmu = &smi_iommu->larb_imu[i].mmu;
> >  			return 0;
> >  		}
> > @@ -243,7 +233,6 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
> >  };
> >  
> >  static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
> > -	.need_larbid = true,
> >  	.port_in_larb = {
> >  		LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
> >  		LARB2_PORT_OFFSET, LARB3_PORT_OFFSET
> > @@ -252,7 +241,6 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
> >  };
> >  
> >  static const struct mtk_smi_larb_gen mtk_smi_larb_mt2712 = {
> > -	.need_larbid = true,
> >  	.config_port                = mtk_smi_larb_config_port_gen2_general,
> >  	.larb_direct_to_common_mask = BIT(8) | BIT(9),      /* bdpsys */
> >  };
> > @@ -291,7 +279,6 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *smi_node;
> >  	struct platform_device *smi_pdev;
> > -	int err;
> >  
> >  	larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
> >  	if (!larb)
> > @@ -321,15 +308,6 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
> >  	}
> >  	larb->smi.dev = dev;
> >  
> > -	if (larb->larb_gen->need_larbid) {
> > -		err = of_property_read_u32(dev->of_node, "mediatek,larb-id",
> > -					   &larb->larbid);
> > -		if (err) {
> > -			dev_err(dev, "missing larbid property\n");
> > -			return err;
> > -		}
> > -	}
> > -
> >  	smi_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
> >  	if (!smi_node)
> >  		return -EINVAL;
> > diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> > index 5201e90..a65324d 100644
> > --- a/include/soc/mediatek/smi.h
> > +++ b/include/soc/mediatek/smi.h
> > @@ -29,7 +29,6 @@ struct mtk_smi_larb_iommu {
> >  };
> >  
> >  struct mtk_smi_iommu {
> > -	unsigned int larb_nr;
> >  	struct mtk_smi_larb_iommu larb_imu[MTK_LARB_NR_MAX];
> >  };
> >  
> > 
