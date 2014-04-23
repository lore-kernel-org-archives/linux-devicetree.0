From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 04/21] mips: ralink: convert to use unflatten_and_copy_device_tree
Date: Tue, 22 Apr 2014 20:18:04 -0500
Message-ID: <1398215901-25609-5-git-send-email-robherring2@gmail.com>
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

The ralink FDT code can be simplified by using
unflatten_and_copy_device_tree function. This removes all accesses to
FDT header data by the arch code.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
v2: no change

 arch/mips/ralink/of.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index eccc552..0170d82 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -52,30 +52,7 @@ __iomem void *plat_of_remap_node(const char *node)
 
 void __init device_tree_init(void)
 {
-	unsigned long base, size;
-	void *fdt_copy;
-
-	if (!initial_boot_params)
-		return;
-
-	base = virt_to_phys((void *)initial_boot_params);
-	size = be32_to_cpu(initial_boot_params->totalsize);
-
-	/* Before we do anything, lets reserve the dt blob */
-	reserve_bootmem(base, size, BOOTMEM_DEFAULT);
-
-	/* The strings in the flattened tree are referenced directly by the
-	 * device tree, so copy the flattened device tree from init memory
-	 * to regular memory.
-	 */
-	fdt_copy = alloc_bootmem(size);
-	memcpy(fdt_copy, initial_boot_params, size);
-	initial_boot_params = fdt_copy;
-
-	unflatten_device_tree();
-
-	/* free the space reserved for the dt blob */
-	free_bootmem(base, size);
+	unflatten_and_copy_device_tree();
 }
 
 void __init plat_mem_setup(void)
-- 
1.9.1
