From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 09/23] iommu/io-pgtable-arm-v7s: Extend to support
	PA[33:32] for MediaTek
Date: Thu, 22 Aug 2019 20:05:33 +0800
Message-ID: <1566475533.11621.18.camel@mhfsdcap03>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
	<1566395606-7975-10-git-send-email-yong.wu@mediatek.com>
	<20190821152448.qmoqjh5zznfpdi6n@willie-the-truck>
	<1566464186.11621.7.camel@mhfsdcap03>
	<10d5122d-3375-161b-9356-2ddfc1c835bd@arm.com>
	<20190822101749.3kwzd5lb7zinsord@willie-the-truck>
	<e6652176-763d-5298-9e10-8c1fbe1b3c0d@arm.com>
	<20190822112836.efodtwu3souq3uwa@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190822112836.efodtwu3souq3uwa@willie-the-truck>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ming-fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


Thanks very much for viewing this so quickly.

On Thu, 2019-08-22 at 12:28 +0100, Will Deacon wrote:
> On Thu, Aug 22, 2019 at 11:57:11AM +0100, Robin Murphy wrote:
> > On 2019-08-22 11:17 am, Will Deacon wrote:
> > > On Thu, Aug 22, 2019 at 11:08:58AM +0100, Robin Murphy wrote:
> > > > On 2019-08-22 9:56 am, Yong Wu wrote:
> > > > > On Wed, 2019-08-21 at 16:24 +0100, Will Deacon wrote:
> > > > > > On Wed, Aug 21, 2019 at 09:53:12PM +0800, Yong Wu wrote:
> > > > > > > MediaTek extend the arm v7s descriptor to support up to 34 bits PA where
> > > > > > > the bit32 and bit33 are encoded in the bit9 and bit4 of the PTE
> > > > > > > respectively. Meanwhile the iova still is 32bits.
> > > > > > > 
> > > > > > > Regarding whether the pagetable address could be over 4GB, the mt8183
> > > > > > > support it while the previous mt8173 don't, thus keep it as is.
> > > > > > > 
> > > > > > > Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > > > > ---
> > > > > > >    drivers/iommu/io-pgtable-arm-v7s.c | 32 +++++++++++++++++++++++++-------
> > > > > > >    include/linux/io-pgtable.h         |  7 +++----
> > > > > > >    2 files changed, 28 insertions(+), 11 deletions(-)
> > > > > > 
> > > > > > [...]
> > > > > > 
> > > > > > > @@ -731,7 +747,9 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
> > > > > > >    {
> > > > > > >    	struct arm_v7s_io_pgtable *data;
> > > > > > > -	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
> > > > > > > +	if (cfg->ias > ARM_V7S_ADDR_BITS ||
> > > > > > > +	    (cfg->oas > ARM_V7S_ADDR_BITS &&
> > > > > > > +	     !(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)))
> > > > > > 
> > > > > > Please can you instead change arm_v7s_alloc_pgtable() so that it allows an
> > > > > > ias of up to 34 when the IO_PGTABLE_QUIRK_ARM_MTK_EXT is set?
> > > > > 
> > > > > Here I only simply skip the oas checking for our case. then which way do
> > > > > your prefer?  something like you commented before:?
> > > > > 
> > > > > 
> > > > > 	if (cfg->ias > ARM_V7S_ADDR_BITS)
> > > > > 		return NULL;
> > > > > 
> > > > > 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT) {
> > > > > 		if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> > > > > 			cfg->oas = min(cfg->oas, ARM_V7S_ADDR_BITS);
> > > > > 		else if (cfg->oas > 34)
> > > > > 			return NULL;
> > > > > 	} else if (cfg->oas > ARM_V7S_ADDR_BITS) {
> > > > > 		return NULL;
> > > > > 	}
> > > > 
> > > > All it should take is something like:
> > > > 
> > > > 	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)
> > > > 		max_oas = 34;
> > > > 	else
> > > > 		max_oas = 32;
> > > > 	if (cfg->oas > max_oas)
> > > > 		return NULL;
> > > > 
> > > > or even just:
> > > > 
> > > > 	if (cfg->oas > 32 ||
> > > > 	    (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT && cfg->oas > 34))
> > > > 		return NULL;
> > > > 
> > > > (and if we prefer the latter style, perhaps we could introduce some kind of
> > > > "is_mtk_4gb()" helper to save on verbosity)
> > > 
> > > I wondered the same thing, but another place we'd want the check is in
> > > iopte_to_paddr() which probably needs the PHYS_ADDR_T check to avoid GCC
> > > warnings, although I didn't try it.
> > 
> > I'm pretty sure I confirmed that "paddr |= BIT_ULL(32)" doesn't warn when
> > phys_addt_t is 32-bit - it's well-defined unsigned integer truncation after
> > all, and if GCC starts warning about all the valid no-op code it optimises
> > away then it's going to run up against IS_ENABLED() first and foremost ;)
> 
> You're quite right, although we live in a world where GCC shouts at us about
> missing comments in switch statements so I think my worry was justified!
> 
> > > So if we did:
> > > 
> > > static bool cfg_mtk_ext_enabled(struct io_pgtable_cfg *cfg)
> > > {
> > > 	return IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
> > > 	       cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT;
> > > }
> > > 
> > > Then I suppose we could do this in _alloc():
> > > 
> > > 	if (cfg->oas > cfg_mtk_ext_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS)
> > > 		return NULL;
> 
> ^^ Apparantly, I left the bracketting here as an exercise to the reader.
> 
> > > 
> > > and then this in iopte_to_paddr():
> > > 
> > > 	[...]
> > > 
> > > 	paddr = pte & mask;
> > > 	if (!cfg_mtk_ext_enabled(cfg))
> > > 		return paddr;
> > > 
> > > 	if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
> > > 		paddr |= ...
> > > 
> > > 	[...]
> > > 
> > > What do you reckon?
> > 
> > Yeah, that's the general shape of things I was picturing - I'm not that
> > fussed about the PHYS_ADDR_T_64BIT thing, especially if it's wrapped up in
> > just one place, so if you do want to keep it as belt-and-braces I'll just
> > consider it a slight code size optimisation for 32-bit builds.
> 
> Ok, great. Yong Wu -- are you ok respinning with the above + missing
> brackets?

Of course I can.

NearlyAll the interface in this file is prefixed with "arm_v7s_", so
does the new interface also need it?, like arm_v7s_is_mtk_enabled. And
keep the iopte_to_paddr and paddr_to_iopte symmetrical.


Then the final patch would looks like below, is it ok?

 
+static bool arm_v7s_is_mtk_enabled(struct io_pgtable_cfg *cfg)
+{
+	return IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
+		(cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT);
+}
+
 static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
 				    struct io_pgtable_cfg *cfg)
 {
-	return paddr & ARM_V7S_LVL_MASK(lvl);
+	arm_v7s_iopte pte = paddr & ARM_V7S_LVL_MASK(lvl);
+
+	if (!arm_v7s_is_mtk_enabled(cfg))
+		return pte;
+
+	if (paddr & BIT_ULL(32))
+		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
+	if (paddr & BIT_ULL(33))
+		pte |= ARM_V7S_ATTR_MTK_PA_BIT33;
+	return pte;
 }
 
 static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 				  struct io_pgtable_cfg *cfg)
 {
 	arm_v7s_iopte mask;
+	phys_addr_t paddr;
 
 	if (ARM_V7S_PTE_IS_TABLE(pte, lvl))
 		mask = ARM_V7S_TABLE_MASK;
@@ -194,7 +212,15 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte
pte, int lvl,
 	else
 		mask = ARM_V7S_LVL_MASK(lvl);
 
-	return pte & mask;
+	paddr = pte & mask;
+	if (!arm_v7s_is_mtk_enabled(cfg))
+		return paddr;
+
+	if (pte & ARM_V7S_ATTR_MTK_PA_BIT32)
+		paddr |= BIT_ULL(32);
+	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
+		paddr |= BIT_ULL(33);
+	return paddr;
 }
 
 static arm_v7s_iopte *iopte_deref(arm_v7s_iopte pte, int lvl,
@@ -315,9 +341,6 @@ static arm_v7s_iopte arm_v7s_prot_to_pte(int prot,
int lvl,
 	if (lvl == 1 && (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS))
 		pte |= ARM_V7S_ATTR_NS_SECTION;
 
-	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)
-		pte |= ARM_V7S_ATTR_MTK_4GB;
-
 	return pte;
 }
 
@@ -731,7 +754,10 @@ static struct io_pgtable
*arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 {
 	struct arm_v7s_io_pgtable *data;
 
-	if (cfg->ias > ARM_V7S_ADDR_BITS || cfg->oas > ARM_V7S_ADDR_BITS)
+	if (cfg->ias > ARM_V7S_ADDR_BITS)
+		return NULL;
+
+	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
 		return NULL;
 


> 
> Will
