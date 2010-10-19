From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of/mips: Cleanup some include directives/files.
Date: Tue, 19 Oct 2010 15:50:31 -0700
Message-ID: <1287528631-31797-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The __init directives should go on the definitions of things, not the
declaration, also __init is meaningless for inline functions, so
remove it from prom.h.  This allows us to get rid of a useless
#include, but most of the rest of them are useless too, so kill them
as well.

If of_i2c.c needs irq definitions, it should include linux/irq.h
directly, not assume indirect inclusion via asm/prom.h.

Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 arch/mips/include/asm/prom.h |    8 ++------
 drivers/of/of_i2c.c          |    1 +
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/prom.h b/arch/mips/include/asm/prom.h
index 23f8237..f29b862 100644
--- a/arch/mips/include/asm/prom.h
+++ b/arch/mips/include/asm/prom.h
@@ -12,10 +12,6 @@
 #define __ASM_MIPS_PROM_H
 
 #ifdef CONFIG_OF
-#include <linux/init.h>
-
-#include <asm/setup.h>
-#include <asm/irq.h>
 #include <asm/bootinfo.h>
 
 /* which is compatible with the flattened device tree (FDT) */
@@ -27,9 +23,9 @@ extern int early_init_dt_scan_memory_arch(unsigned long node,
 extern int reserve_mem_mach(unsigned long addr, unsigned long size);
 extern void free_mem_mach(unsigned long addr, unsigned long size);
 
-extern void __init device_tree_init(void);
+extern void device_tree_init(void);
 #else /* CONFIG_OF */
-static inline void __init device_tree_init(void) { }
+static inline void device_tree_init(void) { }
 #endif /* CONFIG_OF */
 
 #endif /* _ASM_MIPS_PROM_H */
diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
index 0a694de..c85d3c7 100644
--- a/drivers/of/of_i2c.c
+++ b/drivers/of/of_i2c.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/i2c.h>
+#include <linux/irq.h>
 #include <linux/of.h>
 #include <linux/of_i2c.h>
 #include <linux/of_irq.h>
-- 
1.7.2.3
