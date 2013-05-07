From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 06/19] libfdt: Add fdt_next_subnode() to permit easy
 subnode iteration
Date: Tue,  7 May 2013 09:11:50 -0700
Message-ID: <1367943123-16013-7-git-send-email-sjg@chromium.org>
References: <1367943123-16013-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367943123-16013-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Iterating through subnodes with libfdt is a little painful to write as we
need something like this:

for (depth = 0, count = 0,
	offset = fdt_next_node(fdt, parent_offset, &depth);
     (offset >= 0) && (depth > 0);
     offset = fdt_next_node(fdt, offset, &depth)) {
	if (depth == 1) {
		/* code body */
	}
}

Using fdt_next_subnode() we can instead write this, which is shorter and
easier to get right:

for (offset = fdt_first_subnode(fdt, parent_offset);
     offset >= 0;
     offset = fdt_next_subnode(fdt, offset)) {
	/* code body */
}

Also, it doesn't require two levels of indentation for the loop body.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
(Cherry-picked from dtc commit 4e76ec79)
---
Changes in v4:
- Bring in upstream version of fdt_first/next_subnode()

Changes in v3: None
Changes in v2: None

 include/libfdt.h | 22 ++++++++++++++++++++++
 lib/libfdt/fdt.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/libfdt.h b/include/libfdt.h
index fc7f75b..3721a90 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -136,6 +136,28 @@ uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
 int fdt_next_node(const void *fdt, int offset, int *depth);
 
+/**
+ * fdt_first_subnode() - get offset of first direct subnode
+ *
+ * @fdt:	FDT blob
+ * @offset:	Offset of node to check
+ * @return offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
+ */
+int fdt_first_subnode(const void *fdt, int offset);
+
+/**
+ * fdt_next_subnode() - get offset of next direct subnode
+ *
+ * After first calling fdt_first_subnode(), call this function repeatedly to
+ * get direct subnodes of a parent node.
+ *
+ * @fdt:	FDT blob
+ * @offset:	Offset of previous subnode
+ * @return offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
+ * subnodes
+ */
+int fdt_next_subnode(const void *fdt, int offset);
+
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
diff --git a/lib/libfdt/fdt.c b/lib/libfdt/fdt.c
index 387e354..154e9a4 100644
--- a/lib/libfdt/fdt.c
+++ b/lib/libfdt/fdt.c
@@ -202,6 +202,34 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 	return offset;
 }
 
+int fdt_first_subnode(const void *fdt, int offset)
+{
+	int depth = 0;
+
+	offset = fdt_next_node(fdt, offset, &depth);
+	if (offset < 0 || depth != 1)
+		return -FDT_ERR_NOTFOUND;
+
+	return offset;
+}
+
+int fdt_next_subnode(const void *fdt, int offset)
+{
+	int depth = 1;
+
+	/*
+	 * With respect to the parent, the depth of the next subnode will be
+	 * the same as the last.
+	 */
+	do {
+		offset = fdt_next_node(fdt, offset, &depth);
+		if (offset < 0 || depth < 1)
+			return -FDT_ERR_NOTFOUND;
+	} while (depth > 1);
+
+	return offset;
+}
+
 const char *_fdt_find_string(const char *strtab, int tabsize, const char *s)
 {
 	int len = strlen(s) + 1;
-- 
1.8.2.1
