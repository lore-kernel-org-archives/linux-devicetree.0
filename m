From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 1/2] arch/powerpc/platforms/cell/iommu.c: add missing of_node_put
Date: Sun, 21 Aug 2011 18:10:00 +0200
Message-ID: <1313943001-12884-1-git-send-email-julia@diku.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

np is initialized to the result of calling a function that calls
of_node_get, so of_node_put should be called before the pointer is dropped.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1,e2;
@@

* e = \(of_find_node_by_type\|of_find_node_by_name\)(...)
  ... when != of_node_put(e)
      when != true e == NULL
      when != e2 = e
  e = e1
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/platforms/cell/iommu.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index 26a0671..d0c5dfd 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -1038,6 +1038,8 @@ static int __init cell_iommu_fixed_mapping_init(void)
 
 	/* The fixed mapping is only supported on axon machines */
 	np = of_find_node_by_name(NULL, "axon");
+	of_node_put(np);
+
 	if (!np) {
 		pr_debug("iommu: fixed mapping disabled, no axons found\n");
 		return -1;
