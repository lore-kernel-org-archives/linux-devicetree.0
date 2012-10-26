From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 03/14] fdt: Add fdtdec_decode_region() to decode memory region
Date: Thu, 25 Oct 2012 19:31:00 -0700
Message-ID: <1351218671-15228-4-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A memory region has a start and a size and is often specified in
a node by a 'reg' property. Add a function to decode this information
from the fdt.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   19 +++++++++++++++++++
 lib/fdtdec.c     |   17 +++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index e828662..341e6a1 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -40,10 +40,12 @@
 typedef u64 fdt_addr_t;
 #define FDT_ADDR_T_NONE (-1ULL)
 #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
+#define fdt_size_to_cpu(reg) be64_to_cpu(reg)
 #else
 typedef u32 fdt_addr_t;
 #define FDT_ADDR_T_NONE (-1U)
 #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
+#define fdt_size_to_cpu(reg) be32_to_cpu(reg)
 #endif
 
 /* Information obtained about memory from the FDT */
@@ -408,4 +410,21 @@ int fdtdec_get_byte_array(const void *blob, int node, const char *prop_name,
  */
 const u8 *fdtdec_locate_byte_array(const void *blob, int node,
 			     const char *prop_name, int count);
+
+/**
+ * Look up a property in a node which contains a memory region address and
+ * size. Then return a pointer to this address.
+ *
+ * The property must hold one address with a length. This is only tested on
+ * 32-bit machines.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param ptrp		returns pointer to region, or NULL if no address
+ * @param size		returns size of region
+ * @return 0 if ok, -1 on error (propery not found)
+ */
+int fdtdec_decode_region(const void *blob, int node,
+		const char *prop_name, void **ptrp, size_t *size);
 #endif
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 2d60c8a..5570972 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -542,3 +542,20 @@ char *fdtdec_get_config_string(const void *blob, const char *prop_name)
 
 	return (char *)nodep;
 }
+
+int fdtdec_decode_region(const void *blob, int node,
+		const char *prop_name, void **ptrp, size_t *size)
+{
+	const fdt_addr_t *cell;
+	int len;
+
+	debug("%s: %s\n", __func__, prop_name);
+	cell = fdt_getprop(blob, node, prop_name, &len);
+	if (!cell || (len != sizeof(fdt_addr_t) * 2))
+		return -1;
+
+	*ptrp = (void *)fdt_addr_to_cpu(*cell);
+	*size = fdt_size_to_cpu(cell[1]);
+	debug("%s: size=%zx\n", __func__, *size);
+	return 0;
+}
-- 
1.7.7.3
