From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [RFC,PATCH 1/2] of: use __be32 for cell value accessors
Date: Mon, 14 Dec 2009 11:37:13 +0800
Message-ID: <1260761833.381896.199211490986.1.gpush@pororo>
References: <1260761833.381500.196217689909.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1260761833.381500.196217689909.0.gpush@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, we're using u32 for cell values, and hence assuming
host-endian device trees.

As we'd like to support little-endian platforms, use a __be32 for cell
values, and convert in the cell accessors.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/of/fdt.c       |    4 ++--
 include/linux/of.h     |    8 +++++---
 include/linux/of_fdt.h |    2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4d089a1..04a90ca 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -528,9 +528,9 @@ static int __init early_init_dt_scan_memory(unsigned long node,
 	return 0;
 }
 
-u64 __init dt_mem_next_cell(int s, u32 **cellp)
+u64 __init dt_mem_next_cell(int s, __be32 **cellp)
 {
-	u32 *p = *cellp;
+	__be32 *p = *cellp;
 
 	*cellp = p + s;
 	return of_read_number(p, s);
diff --git a/include/linux/of.h b/include/linux/of.h
index bbf0e58..67c9206 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -20,6 +20,8 @@
 #include <linux/kref.h>
 #include <linux/mod_devicetable.h>
 
+#include <asm/byteorder.h>
+
 typedef u32 phandle;
 typedef u32 ihandle;
 
@@ -101,16 +103,16 @@ extern void of_node_put(struct device_node *node);
  */
 
 /* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 of_read_number(const u32 *cell, int size)
+static inline u64 of_read_number(const __be32 *cell, int size)
 {
 	u64 r = 0;
 	while (size--)
-		r = (r << 32) | *(cell++);
+		r = (r << 32) | be32_to_cpu(*(cell++));
 	return r;
 }
 
 /* Like of_read_number, but we want an unsigned long result */
-static inline unsigned long of_read_ulong(const u32 *cell, int size)
+static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 {
 	/* toss away upper bits if unsigned long is smaller than u64 */
 	return of_read_number(cell, size);
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 088a9c5..0177e36 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -79,7 +79,7 @@ extern int early_init_dt_scan_memory_arch(unsigned long node, const char *uname,
 					  int depth, void *data);
 extern void early_reserve_mem(void);
 extern void early_init_devtree_arch(void);
-extern u64 dt_mem_next_cell(int s, u32 **cellp);
+extern u64 dt_mem_next_cell(int s, __be32 **cellp);
 
 /* With CONFIG_HAVE_LMB, we can just use the lmb_ functions to add & allocate
  * memory; otherwise, the arch has to provide its own functions to do this.
