From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 07/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB
	Mode
Date: Thu, 18 Jul 2019 13:37:23 +0800
Message-ID: <1563428243.31342.39.camel@mhfsdcap03>
References: <1561774167-24141-1-git-send-email-yong.wu@mediatek.com>
	<1561774167-24141-8-git-send-email-yong.wu@mediatek.com>
	<20190710143649.w5dplhzdpi3bxp7e@willie-the-truck>
	<1562846036.31342.10.camel@mhfsdcap03>
	<20190711123129.da4rg35b54u4svfw@willie-the-truck>
	<1563079280.31342.22.camel@mhfsdcap03>
	<20190715095156.xczfkbm6zpjueq32@willie-the-truck>
	<1563367459.31342.34.camel@mhfsdcap03>
	<20190717142339.wltamw6wktwixqqn@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190717142339.wltamw6wktwixqqn@willie-the-truck>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-07-17 at 15:23 +0100, Will Deacon wrote:
> On Wed, Jul 17, 2019 at 08:44:19PM +0800, Yong Wu wrote:
> > On Mon, 2019-07-15 at 10:51 +0100, Will Deacon wrote:
> > > On Sun, Jul 14, 2019 at 12:41:20PM +0800, Yong Wu wrote:
> > > > @@ -742,7 +763,9 @@ static struct io_pgtable
> > > > *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> > > >  {
> > > >  	struct arm_v7s_io_pgtable *data;
> > > >  
> > > > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > > > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > > > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > > > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> > > >  		return NULL;
> > > 
> > > I think you can rework this to do something like:
> > > 
> > > 	if (cfg->ias > ARM_V7S_ADDR_BITS)
> > > 		return NULL;
> > > 
> > > 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
> > > 		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> > > 			cfg->oas = min(cfg->oas, ARM_V7S_ADDR_BITS);
> > > 		else if (cfg->oas > 34)
> > > 			return NULL;
> > > 	} else if (cfg->oas > ARM_V7S_ADDR_BITS) {
> > > 		return NULL;
> > > 	}
> > > 
> > > so that we clamp the oas when phys_addr_t is 32-bit for you. That should
> > > allow you to remove lots of the checking from iopte_to_paddr() too if you
> > > check against oas in the map() function.
> > > 
> > > Does that make sense?
> > 
> > Of course I'm ok for this. I'm only afraid that this function has
> > already 3 checking "if (x) return NULL", Here we add a new one and so
> > many lines... Maybe the user should guarantee the right value of oas.
> > How about move it into mtk_iommu.c?
> > 
> > About the checking of iopte_to_paddr, I can not remove them. I know it
> > may be a bit special and not readable. Hmm, I guess I should use a MACRO
> > instead of the hard code 33 for the special 4GB mode case.
> 
> Why can't you just do something like:
> 
> 	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT))
> 		return paddr;
> 
> 	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
> 		paddr |= BIT_ULL(33);

OK here.

> 
> 	if (pte & ARM_V&S_ATTR_MTK_PA_BIT32)
> 		paddr |= BIT_ULL(32);

No here, The flow is a bit special for 4GB mode here.

This is the detailed remap relationship for our 4GB mode.
           CPU PA               ->    HW PA
register: 0x0 ~ 0x3fff_ffff
dram 1G:0x4000_0000~0x7fff_ffff ->0x1_4000_0000~0x1_7fff_ffff(Add bit32)
dram 2G:0x8000_0000~0xbfff_ffff ->0x1_8000_0000~0x1_bfff_ffff(Add bit32)
dram 3G:0xc000_0000~0xffff_ffff ->0x1_c000_0000~0x1_ffff_ffff(Add bit32)
dram 4G:0x1_0000_0000~0x1_3fff_ffff->0x1_0000_0000~0x1_3fff_ffff

Thus, in the 4GB mode, we should add always add bit9 in pte(for bit32
PA). But we can not always add bit32 in the iova_to_phys. The valid PA
range should be 0x4000_0000 - 0x1_3fff_ffff. Thus, we can only add bit32
when the PA in pte < 0x4000_0000, keep it as-is if the PA in pte located
from 0x4000_0000 to 0xffff_ffff.

This issue exist all the time after we added 4GB mode for mt8173.

Thus, I have to add a special flow for 4gb mode here:

	/* Workaround for MTK 4GB Mode: Add BIT32 only when PA < 0x4000_0000.*/
	if (cfg->oas == ARM_V7S_MTK_4GB_OAS && paddr < 0x40000000UL)
		paddr |= BIT_ULL(32);
	else if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
		paddr |= BIT_ULL(32);

> 
> 	return paddr;
> 
> The diff I sent previously sanitises the oas at init time, and then you
> can just enforce it in map().
> 
> Will
