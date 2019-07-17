From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v8 07/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB
 Mode
Date: Wed, 17 Jul 2019 15:23:40 +0100
Message-ID: <20190717142339.wltamw6wktwixqqn@willie-the-truck>
References: <1561774167-24141-1-git-send-email-yong.wu@mediatek.com>
 <1561774167-24141-8-git-send-email-yong.wu@mediatek.com>
 <20190710143649.w5dplhzdpi3bxp7e@willie-the-truck>
 <1562846036.31342.10.camel@mhfsdcap03>
 <20190711123129.da4rg35b54u4svfw@willie-the-truck>
 <1563079280.31342.22.camel@mhfsdcap03>
 <20190715095156.xczfkbm6zpjueq32@willie-the-truck>
 <1563367459.31342.34.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1563367459.31342.34.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Wu <yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 08:44:19PM +0800, Yong Wu wrote:
> On Mon, 2019-07-15 at 10:51 +0100, Will Deacon wrote:
> > On Sun, Jul 14, 2019 at 12:41:20PM +0800, Yong Wu wrote:
> > > @@ -742,7 +763,9 @@ static struct io_pgtable
> > > *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> > >  {
> > >  	struct arm_v7s_io_pgtable *data;
> > >  
> > > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> > >  		return NULL;
> > 
> > I think you can rework this to do something like:
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
> > 
> > so that we clamp the oas when phys_addr_t is 32-bit for you. That should
> > allow you to remove lots of the checking from iopte_to_paddr() too if you
> > check against oas in the map() function.
> > 
> > Does that make sense?
> 
> Of course I'm ok for this. I'm only afraid that this function has
> already 3 checking "if (x) return NULL", Here we add a new one and so
> many lines... Maybe the user should guarantee the right value of oas.
> How about move it into mtk_iommu.c?
> 
> About the checking of iopte_to_paddr, I can not remove them. I know it
> may be a bit special and not readable. Hmm, I guess I should use a MACRO
> instead of the hard code 33 for the special 4GB mode case.

Why can't you just do something like:

	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT))
		return paddr;

	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
		paddr |= BIT_ULL(33);

	if (pte & ARM_V&S_ATTR_MTK_PA_BIT32)
		paddr |= BIT_ULL(32);

	return paddr;

The diff I sent previously sanitises the oas at init time, and then you
can just enforce it in map().

Will
