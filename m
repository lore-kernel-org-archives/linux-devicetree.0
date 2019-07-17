From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 07/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB
	Mode
Date: Wed, 17 Jul 2019 20:44:19 +0800
Message-ID: <1563367459.31342.34.camel@mhfsdcap03>
References: <1561774167-24141-1-git-send-email-yong.wu@mediatek.com>
	<1561774167-24141-8-git-send-email-yong.wu@mediatek.com>
	<20190710143649.w5dplhzdpi3bxp7e@willie-the-truck>
	<1562846036.31342.10.camel@mhfsdcap03>
	<20190711123129.da4rg35b54u4svfw@willie-the-truck>
	<1563079280.31342.22.camel@mhfsdcap03>
	<20190715095156.xczfkbm6zpjueq32@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190715095156.xczfkbm6zpjueq32@willie-the-truck>
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

On Mon, 2019-07-15 at 10:51 +0100, Will Deacon wrote:
> On Sun, Jul 14, 2019 at 12:41:20PM +0800, Yong Wu wrote:
> > On Thu, 2019-07-11 at 13:31 +0100, Will Deacon wrote:
> > > This looks like the right sort of idea. Basically, I was thinking that you
> > > can use the oas in conjunction with the quirk to specify whether or not
> > > your two magic bits should be set. You could also then cap the oas using
> > > the size of phys_addr_t to deal with my other comment.
> > > 
> > > Finally, I was hoping you could drop the |= BIT_ULL(32) and the &=
> > > ~BIT_ULL(32) bits of the mtk driver if the pgtable code now accepts higher
> > > addresses. Did that not work out?
> > 
> > After the current patch, the pgtable has accepted the higher address.
> > the " |= BIT_ULL(32)" and "& = ~ BIT_ULL(32)" is for a special case(we
> > call it 4GB mode).
> > 
> > Now MediaTek IOMMU support 2 kind memory:
> > 1) normal case: PA is 0x4000_0000 - 0x3_ffff_ffff. the PA won't be
> > remapped. mt8183 and the non-4GB mode of mt8173/mt2712 use this mode.
> > 
> > 2) 4GB Mode: PA is 0x4000_0000 - 0x1_3fff_ffff. But the PA will remapped
> > to 0x1_0000_0000 to 0x1_ffff_ffff. This is for the 4GB mode of
> > mt8173/mt2712. This case is so special that we should change the PA
> > manually(add bit32).
> > (mt2712 and mt8173 have both mode: 4GB and non-4GB.)
> > 
> > If we try to use oas and our quirk to cover this two case. Then I can
> > use "oas == 33" only for this 4GB mode. and "oas == 34" for the normal
> > case even though the PA mayn't reach 34bit. Also I should add some
> > "workaround" for the 4GB mode(oas==33).
> > 
> > I copy the new patch in the mail below(have dropped the "|= BIT_ULL(32)"
> > and the "&= ~BIT_ULL(32)) in mtk iommu". please help have a look if it
> > is ok.
> > (another thing: Current the PA can support over 4GB. So the quirk name
> > "MTK_4GB" looks not suitable, I used a new patch rename to "MTK_EXT").
> 
> Makes sense, thanks. One comment below.
> 
> > @@ -205,7 +216,20 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte
> > pte, int lvl,
> >  	else
> >  		mask = ARM_V7S_LVL_MASK(lvl);
> >  
> > -	return pte & mask;
> > +	paddr = pte & mask;
> > +	if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
> > +	    (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)) {
> > +		/*
> > +		 * Workaround for MTK 4GB Mode:
> > +		 * Add BIT32 only when PA < 0x4000_0000.
> > +		 */
> > +		if ((cfg->oas == 33 && paddr < 0x40000000UL) ||
> > +		    (cfg->oas > 33 && (pte & ARM_V7S_ATTR_MTK_PA_BIT32)))
> > +			paddr |= BIT_ULL(32);
> > +		if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
> > +			paddr |= BIT_ULL(33);
> > +	}
> > +	return paddr;
> >  }
> >  
> >  static arm_v7s_iopte *iopte_deref(arm_v7s_iopte pte, int lvl,
> > @@ -326,9 +350,6 @@ static arm_v7s_iopte arm_v7s_prot_to_pte(int prot,
> > int lvl,
> >  	if (lvl == 1 && (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS))
> >  		pte |= ARM_V7S_ATTR_NS_SECTION;
> >  
> > -	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)
> > -		pte |= ARM_V7S_ATTR_MTK_4GB;
> > -
> >  	return pte;
> >  }
> >  
> > @@ -742,7 +763,9 @@ static struct io_pgtable
> > *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> >  {
> >  	struct arm_v7s_io_pgtable *data;
> >  
> > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> >  		return NULL;
> 
> I think you can rework this to do something like:
> 
> 	if (cfg->ias > ARM_V7S_ADDR_BITS)
> 		return NULL;
> 
> 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
> 		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> 			cfg->oas = min(cfg->oas, ARM_V7S_ADDR_BITS);
> 		else if (cfg->oas > 34)
> 			return NULL;
> 	} else if (cfg->oas > ARM_V7S_ADDR_BITS) {
> 		return NULL;
> 	}
> 
> so that we clamp the oas when phys_addr_t is 32-bit for you. That should
> allow you to remove lots of the checking from iopte_to_paddr() too if you
> check against oas in the map() function.
> 
> Does that make sense?

Of course I'm ok for this. I'm only afraid that this function has
already 3 checking "if (x) return NULL", Here we add a new one and so
many lines... Maybe the user should guarantee the right value of oas.
How about move it into mtk_iommu.c?

About the checking of iopte_to_paddr, I can not remove them. I know it
may be a bit special and not readable. Hmm, I guess I should use a MACRO
instead of the hard code 33 for the special 4GB mode case.

Then the patch would be like:

//=========================
static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 				  struct io_pgtable_cfg *cfg)
 {
 	arm_v7s_iopte mask;
+	phys_addr_t paddr;
 
 	if (ARM_V7S_PTE_IS_TABLE(pte, lvl))
 		mask = ARM_V7S_TABLE_MASK;
@@ -205,7 +216,21 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte
pte, int lvl,
 	else
 		mask = ARM_V7S_LVL_MASK(lvl);
 
-	return pte & mask;
+	paddr = pte & mask;
+	if (cfg->oas > ARM_V7S_ADDR_BITS &&
+	    (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)) {
+		/*
+		 * Workaround for MTK 4GB Mode:
+		 * Add BIT32 only when PA < 0x4000_0000.
+		 */
+		if (cfg->oas == ARM_V7S_MTK_4GB_OAS && paddr < 0x40000000UL)
+			paddr |= BIT_ULL(32);
+		else if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
+			paddr |= BIT_ULL(32);
+		if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
+			paddr |= BIT_ULL(33);
+	}
+	return paddr;
 } 

@@ -741,8 +763,10 @@ static struct io_pgtable
*arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 						void *cookie)
 {
 	struct arm_v7s_io_pgtable *data;
-
-	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
+ 	
+	if (cfg->ias > ARM_V7S_ADDR_BITS ||
+	    (cfg->oas > ARM_V7S_ADDR_BITS &&
+	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
 		return NULL;
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 85e71fb..4efc5a3 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -271,16 +271,20 @@ static int mtk_iommu_domain_finalise(struct
mtk_iommu_domain *dom)
 	dom->cfg = (struct io_pgtable_cfg) {
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
-			IO_PGTABLE_QUIRK_TLBI_ON_MAP,
+			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
+			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = 32,
-		.oas = 32,
 		.tlb = &mtk_iommu_gather_ops,
 		.iommu_dev = data->dev,
 	};
 
-	if (data->enable_4GB)
-		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_EXT;
+	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
+		dom->cfg.oas = 32;
+	else if (data->enable_4GB)
+		dom->cfg.oas = ARM_V7S_MTK_4GB_OAS;
+	else
+		dom->cfg.oas = 34;

--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -117,6 +116,8 @@ struct io_pgtable_cfg {
 	};
 };
 
+#define ARM_V7S_MTK_4GB_OAS			33
+
 /**
  * struct io_pgtable_ops - Page table manipulation API for IOMMU
drivers.
  *
=====================================
> 
> Will
