From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v10 09/23] iommu/io-pgtable-arm-v7s: Extend to support
 PA[33:32] for MediaTek
Date: Thu, 22 Aug 2019 11:08:13 +0100
Message-ID: <20190822100812.ketlgxxu64cy2bsk@willie-the-truck>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
 <1566395606-7975-10-git-send-email-yong.wu@mediatek.com>
 <20190821152448.qmoqjh5zznfpdi6n@willie-the-truck>
 <1566464186.11621.7.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566464186.11621.7.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 04:56:26PM +0800, Yong Wu wrote:
> On Wed, 2019-08-21 at 16:24 +0100, Will Deacon wrote:
> > On Wed, Aug 21, 2019 at 09:53:12PM +0800, Yong Wu wrote:
> > > MediaTek extend the arm v7s descriptor to support up to 34 bits PA where
> > > the bit32 and bit33 are encoded in the bit9 and bit4 of the PTE
> > > respectively. Meanwhile the iova still is 32bits.
> > > 
> > > Regarding whether the pagetable address could be over 4GB, the mt8183
> > > support it while the previous mt8173 don't, thus keep it as is.
> > > 
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  drivers/iommu/io-pgtable-arm-v7s.c | 32 +++++++++++++++++++++++++-------
> > >  include/linux/io-pgtable.h         |  7 +++----
> > >  2 files changed, 28 insertions(+), 11 deletions(-)
> > 
> > [...]
> > 
> > > @@ -731,7 +747,9 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> > >  {
> > >  	struct arm_v7s_io_pgtable *data;
> > >  
> > > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> > 
> > Please can you instead change arm_v7s_alloc_pgtable() so that it allows an
> > ias of up to 34 when the IO_PGTABLE_QUIRK_ARM_MTK_EXT is set?
> 
> Here I only simply skip the oas checking for our case. then which way do
> your prefer?  something like you commented before:?
> 
> 
> 	if (cfg->ias > ARM_V7S_ADDR_BITS)
> 		return NULL;
> 
> 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
> 		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> 			cfg->oas = min(cfg->oas, ARM_V7S_ADDR_BITS);

Isn't this always 32 for your IOMMUs?

> 		else if (cfg->oas > 34)
> 			return NULL;
> 	} else if (cfg->oas > ARM_V7S_ADDR_BITS) {
> 		return NULL;
> 	}

How about:

	unsigned int oas_max = ARM_V7S_ADDR_BITS;

	if (cfg->ias > ARM_V7S_ADDR_BITS)
		return NULL;

	if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
	    cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)
		oas_max = 34;

	if (cfg->oas > oas_max)
		return NULL;

Will
