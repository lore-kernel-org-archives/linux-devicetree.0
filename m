From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 03/21] mips: xlp: copy built-in DTB out of init section
Date: Tue, 22 Apr 2014 20:18:03 -0500
Message-ID: <1398215901-25609-4-git-send-email-robherring2@gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

The existing code is buggy because built-in DTBs are in init memory.
It is also broken because the reserved bootmem was then freed after
unflattening, but the unflattened tree points to data in the flat tree.
Fix this by using the unflatten_and_copy_device_tree function.

This removes all accesses to FDT header data by the arch code.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
v2: no change

 arch/mips/netlogic/xlp/dt.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/mips/netlogic/xlp/dt.c b/arch/mips/netlogic/xlp/dt.c
index 5754097..7f9615a 100644
--- a/arch/mips/netlogic/xlp/dt.c
+++ b/arch/mips/netlogic/xlp/dt.c
@@ -87,22 +87,7 @@ void __init xlp_early_init_devtree(void)
 
 void __init device_tree_init(void)
 {
-	unsigned long base, size;
-	struct boot_param_header *fdtp = xlp_fdt_blob;
-
-	if (!fdtp)
-		return;
-
-	base = virt_to_phys(fdtp);
-	size = be32_to_cpu(fdtp->totalsize);
-
-	/* Before we do anything, lets reserve the dt blob */
-	reserve_bootmem(base, size, BOOTMEM_DEFAULT);
-
-	unflatten_device_tree();
-
-	/* free the space reserved for the dt blob */
-	free_bootmem(base, size);
+	unflatten_and_copy_device_tree();
 }
 
 static struct of_device_id __initdata xlp_ids[] = {
-- 
1.9.1
