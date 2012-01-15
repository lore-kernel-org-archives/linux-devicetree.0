From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 01/17] fdt: Add function to look up a phandle's register
 address
Date: Sat, 14 Jan 2012 16:47:13 -0800
Message-ID: <1326588449-1794-2-git-send-email-sjg@chromium.org>
References: <1326588449-1794-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326588449-1794-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This is a commonly-used requirement, so add a function to support it
easily.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |   13 +++++++++++++
 lib/fdtdec.c     |   11 +++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index e705124..81ce3f6 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -239,6 +239,19 @@ const char *fdtdec_get_compatible(enum fdt_compat_id id);
 int fdtdec_lookup_phandle(const void *blob, int node, const char *prop_name);
 
 /**
+ * Look up a phandle and follow it to its node. Then return the register
+ * address of that node as a pointer. This can be used to access the
+ * peripheral directly.
+ *
+ * @param blob		FDT blob
+ * @param node		node to examine
+ * @param prop_name	name of property to find
+ * @return pointer to node's register address
+ */
+void *fdtdec_lookup_phandle_reg(const void *blob, int node,
+		const char *prop_name);
+
+/**
  * Look up a property in a node and return its contents in an integer
  * array of given length. The property must have at least enough data for
  * the array (4*count bytes). It may have more, but this will be ignored.
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 48abf02..bcb2343 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -311,6 +311,17 @@ int fdtdec_lookup_phandle(const void *blob, int node, const char *prop_name)
 	return lookup;
 }
 
+void *fdtdec_lookup_phandle_reg(const void *blob, int node,
+		const char *prop_name)
+{
+	int lookup;
+
+	lookup = fdtdec_lookup_phandle(blob, node, prop_name);
+	if (lookup < 0)
+		return NULL;
+	return (void *)fdtdec_get_addr(blob, lookup, "reg");
+}
+
 /**
  * Look up a property in a node and check that it has a minimum length.
  *
-- 
1.7.7.3
