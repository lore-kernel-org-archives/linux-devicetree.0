From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v11 08/23] iommu/io-pgtable-arm-v7s: Rename the quirk from
 MTK_4GB to MTK_EXT
Date: Sat, 24 Aug 2019 11:01:53 +0800
Message-ID: <1566615728-26388-9-git-send-email-yong.wu@mediatek.com>
References: <1566615728-26388-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1566615728-26388-1-git-send-email-yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, ming-fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

In previous mt2712/mt8173, MediaTek extend the v7s to support 4GB dram.
But in the latest mt8183, We extend it to support the PA up to 34bit.
Then the "MTK_4GB" name is not so fit, This patch only change the quirk
name to "MTK_EXT".

Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 6 +++---
 drivers/iommu/mtk_iommu.c          | 2 +-
 include/linux/io-pgtable.h         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index fa1b38f..77cc1eb 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -315,7 +315,7 @@ static arm_v7s_iopte arm_v7s_prot_to_pte(int prot, int lvl,
 	if (lvl == 1 && (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS))
 		pte |= ARM_V7S_ATTR_NS_SECTION;
 
-	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_4GB)
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT)
 		pte |= ARM_V7S_ATTR_MTK_4GB;
 
 	return pte;
@@ -737,12 +737,12 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_NO_PERMS |
 			    IO_PGTABLE_QUIRK_TLBI_ON_MAP |
-			    IO_PGTABLE_QUIRK_ARM_MTK_4GB |
+			    IO_PGTABLE_QUIRK_ARM_MTK_EXT |
 			    IO_PGTABLE_QUIRK_NON_STRICT))
 		return NULL;
 
 	/* If ARM_MTK_4GB is enabled, the NO_PERMS is also expected. */
-	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_4GB &&
+	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_MTK_EXT &&
 	    !(cfg->quirks & IO_PGTABLE_QUIRK_NO_PERMS))
 			return NULL;
 
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9ba2706..62edce7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -296,7 +296,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 	};
 
 	if (data->enable_4GB)
-		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_4GB;
+		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_EXT;
 
 	dom->iop = alloc_io_pgtable_ops(ARM_V7S, &dom->cfg, data);
 	if (!dom->iop) {
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b5a450a..915fb73 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -65,7 +65,7 @@ struct io_pgtable_cfg {
 	 *	(unmapped) entries but the hardware might do so anyway, perform
 	 *	TLB maintenance when mapping as well as when unmapping.
 	 *
-	 * IO_PGTABLE_QUIRK_ARM_MTK_4GB: (ARM v7s format) Set bit 9 in all
+	 * IO_PGTABLE_QUIRK_ARM_MTK_EXT: (ARM v7s format) Set bit 9 in all
 	 *	PTEs, for Mediatek IOMMUs which treat it as a 33rd address bit
 	 *	when the SoC is in "4GB mode" and they can only access the high
 	 *	remap of DRAM (0x1_00000000 to 0x1_ffffffff).
@@ -77,7 +77,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
 	#define IO_PGTABLE_QUIRK_TLBI_ON_MAP	BIT(2)
-	#define IO_PGTABLE_QUIRK_ARM_MTK_4GB	BIT(3)
+	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
 	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
-- 
1.9.1
