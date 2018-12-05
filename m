From: Rob Herring <robh@kernel.org>
Subject: [PATCH] powerpc: pseries: pmem: Convert to using %pOFn instead of device_node.name
Date: Wed,  5 Dec 2018 13:50:17 -0600
Message-ID: <20181205195050.4759-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier. pmem.c was
recently added and missed the initial conversion.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/platforms/pseries/pmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
index a27f40eb57b1..27f0a915c8a9 100644
--- a/arch/powerpc/platforms/pseries/pmem.c
+++ b/arch/powerpc/platforms/pseries/pmem.c
@@ -52,8 +52,8 @@ static ssize_t pmem_drc_add_node(u32 drc_index)
 	/* NB: The of reconfig notifier creates platform device from the node */
 	rc = dlpar_attach_node(dn, pmem_node);
 	if (rc) {
-		pr_err("Failed to attach node %s, rc: %d, drc index: %x\n",
-			dn->name, rc, drc_index);
+		pr_err("Failed to attach node %pOF, rc: %d, drc index: %x\n",
+			dn, rc, drc_index);
 
 		if (dlpar_release_drc(drc_index))
 			dlpar_free_cc_nodes(dn);
@@ -93,8 +93,8 @@ static ssize_t pmem_drc_remove_node(u32 drc_index)
 
 	rc = dlpar_release_drc(drc_index);
 	if (rc) {
-		pr_err("Failed to release drc (%x) for CPU %s, rc: %d\n",
-			drc_index, dn->name, rc);
+		pr_err("Failed to release drc (%x) for CPU %pOFn, rc: %d\n",
+			drc_index, dn, rc);
 		dlpar_attach_node(dn, pmem_node);
 		return rc;
 	}
-- 
2.19.1
