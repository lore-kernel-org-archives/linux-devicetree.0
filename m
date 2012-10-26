From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 08/14] fdt: Add fdtdec_get_uint64 to decode a 64-bit value
 from a property
Date: Thu, 25 Oct 2012 19:31:05 -0700
Message-ID: <1351218671-15228-9-git-send-email-sjg@chromium.org>
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
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Che-Liang Chiou <clchiou-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Che-Liang Chiou <clchiou-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

It decodes a 64-bit value from a property that is at least 8 bytes long.

Signed-off-by: Che-Liang Chiou <clchiou-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   15 +++++++++++++++
 lib/fdtdec.c     |   13 +++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 82fdb99..12f73a7 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -191,6 +191,21 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
 		s32 default_val);
 
 /**
+ * Look up a 64-bit integer property in a node and return it. The property
+ * must have at least 8 bytes of data (2 cells). The first two cells are
+ * concatenated to form a 8 bytes value, where the first cell is top half and
+ * the second cell is bottom half.
+ *
+ * @param blob	FDT blob
+ * @param node	node to examine
+ * @param prop_name	name of property to find
+ * @param default_val	default value to return if the property is not found
+ * @return integer value, if found, or default_val if not
+ */
+uint64_t fdtdec_get_uint64(const void *blob, int node, const char *prop_name,
+		uint64_t default_val);
+
+/**
  * Checks whether a node is enabled.
  * This looks for a 'status' property. If this exists, then returns 1 if
  * the status is 'ok' and 0 otherwise. If there is no status property,
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index fbb2827..6c417d2 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -111,6 +111,19 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
 	return default_val;
 }
 
+uint64_t fdtdec_get_uint64(const void *blob, int node, const char *prop_name,
+		uint64_t default_val)
+{
+	const uint64_t *cell64;
+	int length;
+
+	cell64 = fdt_getprop(blob, node, prop_name, &length);
+	if (!cell64 || length < sizeof(*cell64))
+		return default_val;
+
+	return fdt64_to_cpu(*cell64);
+}
+
 int fdtdec_get_is_enabled(const void *blob, int node)
 {
 	const char *cell;
-- 
1.7.7.3
