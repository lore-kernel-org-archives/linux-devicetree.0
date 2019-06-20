From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 20/21] iommu/mediatek: Fix iova_to_phys PA start for
	4GB mode
Date: Thu, 20 Jun 2019 22:00:51 +0800
Message-ID: <1561039251.4021.24.camel@mhfsdcap03>
References: <1560169080-27134-1-git-send-email-yong.wu@mediatek.com>
	<1560169080-27134-21-git-send-email-yong.wu@mediatek.com>
	<db9b3b2f-3206-01bf-f0f9-67251e5ff756@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <db9b3b2f-3206-01bf-f0f9-67251e5ff756-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Tue, 2019-06-18 at 18:35 +0200, Matthias Brugger wrote:
> 
> On 10/06/2019 14:17, Yong Wu wrote:
> > In the 4GB mode, the physical address is remapped,
> > 
> > Here is the detailed remap relationship.
> > CPU PA         ->    HW PA
> > 0x4000_0000          0x1_4000_0000 (Add bit32)
> > 0x8000_0000          0x1_8000_0000 ...
> > 0xc000_0000          0x1_c000_0000 ...
> > 0x1_0000_0000        0x1_0000_0000 (No change)
> > 
> > Thus, we always add bit32 for PA when entering mtk_iommu_map.
> > But in the iova_to_phys, the CPU don't need this bit32 if the
> > PA is from 0x1_4000_0000 to 0x1_ffff_ffff.
> > This patch discards the bit32 in this iova_to_phys in the 4GB mode.
> > 
> > Fixes: 30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range
> > for 4GB mode")
> > Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/iommu/mtk_iommu.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 67cab2d..34f2e40 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -119,6 +119,19 @@ struct mtk_iommu_domain {
> >  
> >  static const struct iommu_ops mtk_iommu_ops;
> >  
> > +/*
> > + * In M4U 4GB mode, the physical address is remapped as below:
> > + *  CPU PA         ->   M4U HW PA
> > + *  0x4000_0000         0x1_4000_0000 (Add bit32)
> > + *  0x8000_0000         0x1_8000_0000 ...
> > + *  0xc000_0000         0x1_c000_0000 ...
> > + *  0x1_0000_0000       0x1_0000_0000 (No change)
> > + *
> > + * Thus, We always add BIT32 in the iommu_map and disable BIT32 if PA is >=
> > + * 0x1_4000_0000 in the iova_to_phys.
> > + */
> > +#define MTK_IOMMU_4GB_MODE_PA_140000000     0x140000000UL
> > +
> >  static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
> >  
> >  #define for_each_m4u(data)	list_for_each_entry(data, &m4ulist, list)
> > @@ -415,6 +428,7 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
> >  					  dma_addr_t iova)
> >  {
> >  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> > +	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
> >  	unsigned long flags;
> >  	phys_addr_t pa;
> >  
> > @@ -422,6 +436,10 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
> >  	pa = dom->iop->iova_to_phys(dom->iop, iova);
> >  	spin_unlock_irqrestore(&dom->pgtlock, flags);
> >  
> > +	if (data->plat_data->has_4gb_mode && data->dram_is_4gb &&
> > +	    pa >= MTK_IOMMU_4GB_MODE_PA_140000000)
> > +		pa &= ~BIT_ULL(32);
> > +
> 
> Hm, I wonder if we could fix this as first patch in the series, especially before:
> "[PATCH 06/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB Mode"

OK.

> 
> This would make it easier for the stable maintainer to cherry-pick the fix.
> Without 100% understanding the code, it seems suspicious to me, that you first
> move the setting of the bit32 and bit33 into v7s and later explicitly clean the
> bits here.
> 
> So my take on this is, that patch 6/21 introduced the regression you are trying
> to fix here. As said that is speculation as I don't understand the code in its
> whole.
> 
> Any clarification would be useful.

I guess the commit message in [06/21] will be helpful.

In the previous mt8173 and mt2712, the M4U HW support "4GB mode" in
which the range of dram is from 0x4000_0000 to 0x1_3fff_ffff and it was
remapped to 0x1_0000_0000 ~0x1_ffff_ffff(For readable, I have wrote the
re-map relationship into the code in this patch.). but mt8183 don't need
remap the dram address(0x4000_0000 ~ 0x3_ffff_ffff).

In order to unify the code, we add bit32 for "4GB mode". But actually
the PA doesn't always have bit32, thus, I have to remove bit32 when PA >
0x1_4000_0000.

So sorry that the "4GB mode" is a little unreadable and special, And the
4GB patch(30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range
for 4GB mode") has introduced several fix patches.

> 
> Regards,
> Matthias
> 
> >  	return pa;
> >  }
> >  
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
