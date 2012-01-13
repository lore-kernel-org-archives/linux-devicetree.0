From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 01/20] fdt: Add function to locate an array in the device
 tree
Date: Fri, 13 Jan 2012 13:35:16 -0800
Message-ID: <1326490535-3461-2-git-send-email-sjg@chromium.org>
References: <1326490535-3461-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326490535-3461-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

fdtdec_locate_array() locates an integer array but does not copy it. This
saves the caller having to allocated wasted space.

Access to array elements should be through the fdt32_to_cpu() macro.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Add new fdtdec_locate_array() function

 include/fdtdec.h |   19 +++++++++++++++++++
 lib/fdtdec.c     |   11 +++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 82264d4..42744f9 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -251,6 +251,25 @@ int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
 		u32 *array, int count);
 
 /**
+ * Look up a property in a node and return a pointer to its contents as a
+ * unsigned int array of given length. The property must have at least enough
+ * data for the array ('count' cells). It may have more, but this will be
+ * ignored. The data is not copied.
+ *
+ * Note that you must access elements of the array with fdt32_to_cpu(),
+ * since the elements will be big endian even on a little endian machine.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @param count		number of array elements
+ * @return pointer to array if found, or NULL if the property is not
+ *		found or there is not enough data
+ */
+const u32 *fdtdec_locate_array(const void *blob, int node,
+			       const char *prop_name, int count);
+
+/**
  * Look up a boolean property in a node and return it.
  *
  * A boolean properly is true if present in the device tree and false if not
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 3330edf..f1af878 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -341,6 +341,17 @@ int fdtdec_get_int_array(const void *blob, int node, const char *prop_name,
 	return err;
 }
 
+const u32 *fdtdec_locate_array(const void *blob, int node,
+			       const char *prop_name, int count)
+{
+	const u32 *cell;
+	int err;
+
+	cell = get_prop_check_min_len(blob, node, prop_name,
+				      sizeof(u32) * count, &err);
+	return err ? NULL : cell;
+}
+
 int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
 {
 	const s32 *cell;
-- 
1.7.7.3
