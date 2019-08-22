From: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v10 09/23] iommu/io-pgtable-arm-v7s: Extend to support
 PA[33:32] for MediaTek
Date: Thu, 22 Aug 2019 16:59:35 +0800
Message-ID: <1566464375.11621.10.camel@mhfsdcap03>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
         <1566395606-7975-10-git-send-email-yong.wu@mediatek.com>
         <20190821152448.qmoqjh5zznfpdi6n@willie-the-truck>
         <22a79977-5074-7af1-97b8-8a3e549b23c1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22a79977-5074-7af1-97b8-8a3e549b23c1@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-21 at 16:34 +0100, Robin Murphy wrote:
> On 21/08/2019 16:24, Will Deacon wrote:
> > On Wed, Aug 21, 2019 at 09:53:12PM +0800, Yong Wu wrote:
> >> MediaTek extend the arm v7s descriptor to support up to 34 bits PA where
> >> the bit32 and bit33 are encoded in the bit9 and bit4 of the PTE
> >> respectively. Meanwhile the iova still is 32bits.
> >>
> >> Regarding whether the pagetable address could be over 4GB, the mt8183
> >> support it while the previous mt8173 don't, thus keep it as is.
> >>
> >> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >> ---
> >>   drivers/iommu/io-pgtable-arm-v7s.c | 32 +++++++++++++++++++++++++-------
> >>   include/linux/io-pgtable.h         |  7 +++----
> >>   2 files changed, 28 insertions(+), 11 deletions(-)
> > 
> > [...]
> > 
> >> @@ -731,7 +747,9 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> >>   {
> >>   	struct arm_v7s_io_pgtable *data;
> >>   
> >> -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> >> +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> >> +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> >> +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> > 
> > Please can you instead change arm_v7s_alloc_pgtable() so that it allows an
> > ias of up to 34 when the IO_PGTABLE_QUIRK_ARM_MTK_EXT is set?
> 
> You mean oas, right? I believe the hardware *does* actually support a 
> 32-bit ias as well, but we shouldn't pretend to support that while 
> __arm_v7s_alloc_table() still only knows how to allocate normal-sized 
> tables.

Yes. The HW double the lvl1 pgtable, thus it supports 33bit iova
actually. We may extend ias in the future.

> 
> Robin.
> 
> > 
> > With that change:
> > 
> > Acked-by: Will Deacon <will@kernel.org>
> > 
> > Will
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
