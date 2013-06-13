From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 09/12] libfdt: Add fdt_find_regions()
Date: Thu, 13 Jun 2013 15:10:08 -0700
Message-ID: <1371161411-2834-10-git-send-email-sjg@chromium.org>
References: <1371161411-2834-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371161411-2834-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Joel A Fernandes <joelagnel-l0cyMroinI0@public.gmane.org>, Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Bill Richardson <wfrichar-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Randall Spangler <rspangler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Vadim Bendebury <vbendeb-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Andreas=20B=C3=A4ck?= <andreas.back778-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to find regions in device tree given a list of nodes to
include and properties to exclude.

See the header file for full documentation.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3: None
Changes in v2:
- Fix checkpatch checks about parenthesis alignment

 include/libfdt.h     |  64 +++++++++++++++++++++++++
 lib/libfdt/fdt_wip.c | 129 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)

diff --git a/include/libfdt.h b/include/libfdt.h
index c5ec2ac..765d84f 100644
--- a/include/libfdt.h
+++ b/include/libfdt.h
@@ -1511,4 +1511,68 @@ int fdt_del_node(void *fdt, int nodeoffset);
 
 const char *fdt_strerror(int errval);
 
+struct fdt_region {
+	int offset;
+	int size;
+};
+
+/**
+ * fdt_find_regions() - find regions in device tree
+ *
+ * Given a list of nodes to include and properties to exclude, find
+ * the regions of the device tree which describe those included parts.
+ *
+ * The intent is to get a list of regions which will be invariant provided
+ * those parts are invariant. For example, if you request a list of regions
+ * for all nodes but exclude the property "data", then you will get the
+ * same region contents regardless of any change to "data" properties.
+ *
+ * This function can be used to produce a byte-stream to send to a hashing
+ * function to verify that critical parts of the FDT have not changed.
+ *
+ * Nodes which are given in 'inc' are included in the region list, as
+ * are the names of the immediate subnodes nodes (but not the properties
+ * or subnodes of those subnodes).
+ *
+ * For eaxample "/" means to include the root node, all root properties
+ * and the FDT_BEGIN_NODE and FDT_END_NODE of all subnodes of /. The latter
+ * ensures that we capture the names of the subnodes. In a hashing situation
+ * it prevents the root node from changing at all Any change to non-excluded
+ * properties, names of subnodes or number of subnodes would be detected.
+ *
+ * When used with FITs this provides the ability to hash and sign parts of
+ * the FIT based on different configurations in the FIT. Then it is
+ * impossible to change anything about that configuration (include images
+ * attached to the configuration), but it may be possible to add new
+ * configurations, new images or new signatures within the existing
+ * framework.
+ *
+ * Adding new properties to a device tree may result in the string table
+ * being extended (if the new property names are different from those
+ * already added). This function can optionally include a region for
+ * the string table so that this can be part of the hash too.
+ *
+ * The device tree header is not included in the list.
+ *
+ * @fdt:	Device tree to check
+ * @inc:	List of node paths to included
+ * @inc_count:	Number of node paths in list
+ * @exc_prop:	List of properties names to exclude
+ * @exc_prop_count:	Number of properties in exclude list
+ * @region:	Returns list of regions
+ * @max_region:	Maximum length of region list
+ * @path:	Pointer to a temporary string for the function to use for
+ *		building path names
+ * @path_len:	Length of path, must be large enough to hold the longest
+ *		path in the tree
+ * @add_string_tab:	1 to add a region for the string table
+ * @return number of regions in list. If this is >max_regions then the
+ * region array was exhausted. You should increase max_regions and try
+ * the call again.
+ */
+int fdt_find_regions(const void *fdt, char * const inc[], int inc_count,
+		     char * const exc_prop[], int exc_prop_count,
+		     struct fdt_region region[], int max_regions,
+		     char *path, int path_len, int add_string_tab);
+
 #endif /* _LIBFDT_H */
diff --git a/lib/libfdt/fdt_wip.c b/lib/libfdt/fdt_wip.c
index 63e67b7..b9e3c4a 100644
--- a/lib/libfdt/fdt_wip.c
+++ b/lib/libfdt/fdt_wip.c
@@ -120,3 +120,132 @@ int fdt_nop_node(void *fdt, int nodeoffset)
 			endoffset - nodeoffset);
 	return 0;
 }
+
+#define FDT_MAX_DEPTH	32
+
+static int str_in_list(const char *str, char * const list[], int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		if (!strcmp(list[i], str))
+			return 1;
+
+	return 0;
+}
+
+int fdt_find_regions(const void *fdt, char * const inc[], int inc_count,
+		     char * const exc_prop[], int exc_prop_count,
+		     struct fdt_region region[], int max_regions,
+		     char *path, int path_len, int add_string_tab)
+{
+	int stack[FDT_MAX_DEPTH];
+	char *end;
+	int nextoffset = 0;
+	uint32_t tag;
+	int count = 0;
+	int start = -1;
+	int depth = -1;
+	int want = 0;
+	int base = fdt_off_dt_struct(fdt);
+
+	end = path;
+	*end = '\0';
+	do {
+		const struct fdt_property *prop;
+		const char *name;
+		const char *str;
+		int include = 0;
+		int stop_at = 0;
+		int offset;
+		int len;
+
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+		stop_at = nextoffset;
+
+		switch (tag) {
+		case FDT_PROP:
+			include = want >= 2;
+			stop_at = offset;
+			prop = fdt_get_property_by_offset(fdt, offset, NULL);
+			str = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+			if (str_in_list(str, exc_prop, exc_prop_count))
+				include = 0;
+			break;
+
+		case FDT_NOP:
+			include = want >= 2;
+			stop_at = offset;
+			break;
+
+		case FDT_BEGIN_NODE:
+			depth++;
+			if (depth == FDT_MAX_DEPTH)
+				return -FDT_ERR_BADSTRUCTURE;
+			name = fdt_get_name(fdt, offset, &len);
+			if (end - path + 2 + len >= path_len)
+				return -FDT_ERR_NOSPACE;
+			if (end != path + 1)
+				*end++ = '/';
+			strcpy(end, name);
+			end += len;
+			stack[depth] = want;
+			if (want == 1)
+				stop_at = offset;
+			if (str_in_list(path, inc, inc_count))
+				want = 2;
+			else if (want)
+				want--;
+			else
+				stop_at = offset;
+			include = want;
+			break;
+
+		case FDT_END_NODE:
+			include = want;
+			want = stack[depth--];
+			while (end > path && *--end != '/')
+				;
+			*end = '\0';
+			break;
+
+		case FDT_END:
+			include = 1;
+			break;
+		}
+
+		if (include && start == -1) {
+			/* Should we merge with previous? */
+			if (count && count <= max_regions &&
+			    offset == region[count - 1].offset +
+					region[count - 1].size - base)
+				start = region[--count].offset - base;
+			else
+				start = offset;
+		}
+
+		if (!include && start != -1) {
+			if (count < max_regions) {
+				region[count].offset = base + start;
+				region[count].size = stop_at - start;
+			}
+			count++;
+			start = -1;
+		}
+	} while (tag != FDT_END);
+
+	if (nextoffset != fdt_size_dt_struct(fdt))
+		return -FDT_ERR_BADLAYOUT;
+
+	/* Add a region for the END tag and the string table */
+	if (count < max_regions) {
+		region[count].offset = base + start;
+		region[count].size = nextoffset - start;
+		if (add_string_tab)
+			region[count].size += fdt_size_dt_strings(fdt);
+	}
+	count++;
+
+	return count;
+}
-- 
1.8.3
