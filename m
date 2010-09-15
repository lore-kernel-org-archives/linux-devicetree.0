From: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: [PATCH 13/15] ppc/pseries: iommu cleanup
Date: Wed, 15 Sep 2010 11:05:56 -0700
Message-ID: <1284573958-8397-14-git-send-email-nacc@us.ibm.com>
References: <1284573958-8397-1-git-send-email-nacc@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1284573958-8397-1-git-send-email-nacc@us.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: nacc@us.ibm.com
Cc: devicetree-discuss@lists.ozlabs.org, Milton Miller <miltonm@bga.com>, Paul Mackerras <paulus@samba.org>, Anton Blanchard <anton@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

No need to initialize per-cpu pointer to NULL, it is the default.

Direct dma ops and no setup are the defaults, no need to set for
iommu-off.

Signed-off-by: Milton Miller <miltonm@bga.com>
Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index a77bcae..9184db3 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -140,7 +140,7 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	return ret;
 }
 
-static DEFINE_PER_CPU(u64 *, tce_page) = NULL;
+static DEFINE_PER_CPU(u64 *, tce_page);
 
 static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 				     long npages, unsigned long uaddr,
@@ -589,13 +589,8 @@ static struct notifier_block iommu_reconfig_nb = {
 /* These are called very early. */
 void iommu_init_early_pSeries(void)
 {
-	if (of_chosen && of_get_property(of_chosen, "linux,iommu-off", NULL)) {
-		/* Direct I/O, IOMMU off */
-		ppc_md.pci_dma_dev_setup = NULL;
-		ppc_md.pci_dma_bus_setup = NULL;
-		set_pci_dma_ops(&dma_direct_ops);
+	if (of_chosen && of_get_property(of_chosen, "linux,iommu-off", NULL))
 		return;
-	}
 
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
 		if (firmware_has_feature(FW_FEATURE_MULTITCE)) {
-- 
1.7.0.4
