From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/4] fdtget: Add -l to list the subnodes of a node
Date: Tue,  6 Mar 2012 16:41:46 -0800
Message-ID: <1331080907-7230-3-git-send-email-sjg@chromium.org>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This option lists the subnodes of each node given as a parameter, one
subnode per line.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Change the term 'child' to 'subnode'

 fdtget.c |   96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 874bcbf..2c7d238 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -37,6 +37,7 @@
 enum display_mode {
 	MODE_SHOW_VALUE,	/* show values for node properties */
 	MODE_LIST_PROPS,	/* list the properties for a node */
+	MODE_LIST_SUBNODES,	/* list the subnodes of a node */
 };
 
 /* Holds information which controls our output and options */
@@ -136,6 +137,61 @@ static int list_properties(const void *blob, int node)
 	} while (1);
 }
 
+#define MAX_LEVEL	32		/* how deeply nested we will go */
+
+/**
+ * List all subnodes in a node, one per line
+ *
+ * @param blob		FDT blob
+ * @param node		Node to display
+ * @return 0 if ok, or FDT_ERR... if not.
+ */
+static int list_subnodes(const void *blob, int node)
+{
+	int nextoffset;		/* next node offset from libfdt */
+	uint32_t tag;		/* current tag */
+	int level = 0;		/* keep track of nesting level */
+	const char *pathp;
+	int depth = 1;		/* the assumed depth of this node */
+
+	while (level >= 0) {
+		tag = fdt_next_tag(blob, node, &nextoffset);
+		switch (tag) {
+		case FDT_BEGIN_NODE:
+			pathp = fdt_get_name(blob, node, NULL);
+			if (level <= depth) {
+				if (pathp == NULL)
+					pathp = "/* NULL pointer error */";
+				if (*pathp == '\0')
+					pathp = "/";	/* root is nameless */
+				if (level == 1)
+					puts(pathp);
+			}
+			level++;
+			if (level >= MAX_LEVEL) {
+				printf("Nested too deep, aborting.\n");
+				return 1;
+			}
+			break;
+		case FDT_END_NODE:
+			level--;
+			if (level == 0)
+				level = -1;		/* exit the loop */
+			break;
+		case FDT_END:
+			return 1;
+		case FDT_PROP:
+			break;
+		default:
+			if (level <= depth)
+				printf("Unknown tag 0x%08X\n", tag);
+			return 1;
+		}
+		node = nextoffset;
+	}
+	return 0;
+}
+
 /**
  * Show the data for a given node (and perhaps property) according to the
  * display option provided.
@@ -152,20 +208,30 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
 	const void *value = NULL;
 	int len, err = 0;
 
-	if (disp->mode == MODE_LIST_PROPS)
-		return list_properties(blob, node);
+	switch (disp->mode) {
+	case MODE_LIST_PROPS:
+		err = list_properties(blob, node);
+		break;
+
+	case MODE_LIST_SUBNODES:
+		err = list_subnodes(blob, node);
+		break;
 
-	assert(property);
-	value = fdt_getprop(blob, node, property, &len);
-	if (value) {
-		if (show_data(disp, value, len))
+	default:
+		assert(property);
+		value = fdt_getprop(blob, node, property, &len);
+		if (value) {
+			if (show_data(disp, value, len))
+				err = -1;
+			else
+				printf("\n");
+		} else {
+			report_error(property, len);
 			err = -1;
-		else
-			printf("\n");
-	} else {
-		report_error(property, len);
-		err = -1;
+		}
+		break;
 	}
+
 	return err;
 }
 
@@ -213,6 +279,7 @@ static const char *usage_msg =
 	"Options:\n"
 	"\t-t <type>\tType of data\n"
 	"\t-p\t\tList properties for each node\n"
+	"\t-l\t\tList subnodes for each node\n"
 	"\t-h\t\tPrint this help\n\n"
 	USAGE_TYPE_MSG;
 
@@ -236,7 +303,7 @@ int main(int argc, char *argv[])
 	disp.size = -1;
 	disp.mode = MODE_SHOW_VALUE;
 	for (;;) {
-		int c = getopt(argc, argv, "hpt:");
+		int c = getopt(argc, argv, "hlpt:");
 		if (c == -1)
 			break;
 
@@ -255,6 +322,11 @@ int main(int argc, char *argv[])
 			disp.mode = MODE_LIST_PROPS;
 			args_per_step = 1;
 			break;
+
+		case 'l':
+			disp.mode = MODE_LIST_SUBNODES;
+			args_per_step = 1;
+			break;
 		}
 	}
 
-- 
1.7.7.3
