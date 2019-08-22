From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v10 09/23] iommu/io-pgtable-arm-v7s: Extend to support
 PA[33:32] for MediaTek
Date: Thu, 22 Aug 2019 11:17:50 +0100
Message-ID: <20190822101749.3kwzd5lb7zinsord@willie-the-truck>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
 <1566395606-7975-10-git-send-email-yong.wu@mediatek.com>
 <20190821152448.qmoqjh5zznfpdi6n@willie-the-truck>
 <1566464186.11621.7.camel@mhfsdcap03>
 <10d5122d-3375-161b-9356-2ddfc1c835bd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10d5122d-3375-161b-9356-2ddfc1c835bd@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Yong Wu <yong.wu@mediatek.com>, youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 11:08:58AM +0100, Robin Murphy wrote:
> On 2019-08-22 9:56 am, Yong Wu wrote:
> > On Wed, 2019-08-21 at 16:24 +0100, Will Deacon wrote:
> > > On Wed, Aug 21, 2019 at 09:53:12PM +0800, Yong Wu wrote:
> > > > MediaTek extend the arm v7s descriptor to support up to 34 bits PA where
> > > > the bit32 and bit33 are encoded in the bit9 and bit4 of the PTE
> > > > respectively. Meanwhile the iova still is 32bits.
> > > > 
> > > > Regarding whether the pagetable address could be over 4GB, the mt8183
> > > > support it while the previous mt8173 don't, thus keep it as is.
> > > > 
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > >   drivers/iommu/io-pgtable-arm-v7s.c | 32 +++++++++++++++++++++++++-------
> > > >   include/linux/io-pgtable.h         |  7 +++----
> > > >   2 files changed, 28 insertions(+), 11 deletions(-)
> > > 
> > > [...]
> > > 
> > > > @@ -731,7 +747,9 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> > > >   {
> > > >   	struct arm_v7s_io_pgtable *data;
> > > > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > > > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > > > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > > > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> > > 
> > > Please can you instead change arm_v7s_alloc_pgtable() so that it allows an
> > > ias of up to 34 when the IO_PGTABLE_QUIRK_ARM_MTK_EXT is set?
> > 
> > Here I only simply skip the oas checking for our case. then which way do
> > your prefer?  something like you commented before:?
> > 
> > 
> > 	if (cfg->ias > ARM_V7S_ADDR_BITS)
> > 		return NULL;
> > 
> > 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
> > 		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> > 			cfg->oas = min(cfg->oas, ARM_V7S_ADDR_BITS);
> > 		else if (cfg->oas > 34)
> > 			return NULL;
> > 	} else if (cfg->oas > ARM_V7S_ADDR_BITS) {
> > 		return NULL;
> > 	}
> 
> All it should take is something like:
> 
> 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)
> 		max_oas = 34;
> 	else
> 		max_oas = 32;
> 	if (cfg->oas > max_oas)
> 		return NULL;
> 
> or even just:
> 
> 	if (cfg->oas > 32 ||
> 	    (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT && cfg->oas > 34))
> 		return NULL;
> 
> (and if we prefer the latter style, perhaps we could introduce some kind of
> "is_mtk_4gb()" helper to save on verbosity)

I wondered the same thing, but another place we'd want the check is in
iopte_to_paddr() which probably needs the PHYS_ADDR_T check to avoid GCC
warnings, although I didn't try it.

So if we did:

static bool cfg_mtk_ext_enabled(struct io_pgtable_cfg *cfg)
{
	return IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
	       cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT;
}

Then I suppose we could do this in _alloc():

	if (cfg->oas > cfg_mtk_ext_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS)
		return NULL;

and then this in iopte_to_paddr():

	[...]

	paddr = pte & mask;
	if (!cfg_mtk_ext_enabled(cfg))
		return paddr;

	if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
		paddr |= ...

	[...]

What do you reckon?

Will
