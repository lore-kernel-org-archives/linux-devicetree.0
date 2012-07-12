From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 3/5] fdtput: Add -c option to create nodes
Date: Thu, 12 Jul 2012 08:52:49 -0700
Message-ID: <1342108371-15616-3-git-send-email-sjg@chromium.org>
References: <1342108371-15616-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1342108371-15616-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This option allows the creation of new nodes in a dtb file. The syntax
is:

   fdtput -c <dtb_file> <node_path>

The node_path contains the path of the node to be created. All path
components up to the final one must exist already. The final one must
not exist already.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Update -c help message slightly

 fdtput.c           |   52 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 tests/run_tests.sh |   13 +++++++++++++
 2 files changed, 64 insertions(+), 1 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index da63539..a414fe9 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -31,6 +31,7 @@
 /* These are the operations we support */
 enum oper_type {
 	OPER_WRITE_PROP,		/* Write a property in a node */
+	OPER_CREATE_NODE,		/* Create a new node */
 };
 
 struct display_info {
@@ -138,6 +139,46 @@ static int store_key_value(void *blob, const char *node_name,
 	return 0;
 }
 
+/**
+ * Create a new node in the fdt.
+ *
+ * This will overwrite the node_name string. Any error is reported.
+ *
+ * TODO: Perhaps create fdt_path_offset_namelen() so we don't need to do this.
+ *
+ * @param blob		FDT blob to write into
+ * @param node_name	Name of node to create
+ * @return new node offset if found, or -1 on failure
+ */
+static int create_node(void *blob, const char *node_name)
+{
+	int node = 0;
+	char *p;
+
+	p = strrchr(node_name, '/');
+	if (!p) {
+		report_error(node_name, -FDT_ERR_BADPATH);
+		return -1;
+	}
+	*p = '\0';
+
+	if (p > node_name) {
+		node = fdt_path_offset(blob, node_name);
+		if (node < 0) {
+			report_error(node_name, node);
+			return -1;
+		}
+	}
+
+	node = fdt_add_subnode(blob, node, p + 1);
+	if (node < 0) {
+		report_error(p + 1, node);
+		return -1;
+	}
+
+	return 0;
+}
+
 static int do_fdtput(struct display_info *disp, const char *filename,
 		    char **arg, int arg_count)
 {
@@ -160,6 +201,10 @@ static int do_fdtput(struct display_info *disp, const char *filename,
 			store_key_value(blob, *arg, arg[1], value, len))
 			ret = -1;
 		break;
+	case OPER_CREATE_NODE:
+		for (; ret >= 0 && arg_count--; arg++)
+			ret = create_node(blob, *arg);
+		break;
 	}
 	if (ret >= 0)
 		ret = utilfdt_write(filename, blob);
@@ -175,7 +220,9 @@ static const char *usage_msg =
 	"\n"
 	"Usage:\n"
 	"	fdtput <options> <dt file> <node> <property> [<value>...]\n"
+	"	fdtput -c <options> <dt file> [<node>...]\n"
 	"Options:\n"
+	"\t-c\t\tCreate nodes if they don't already exist\n"
 	"\t-t <type>\tType of data\n"
 	"\t-v\t\tVerbose: display each value decoded from command line\n"
 	"\t-h\t\tPrint this help\n\n"
@@ -199,7 +246,7 @@ int main(int argc, char *argv[])
 	disp.size = -1;
 	disp.oper = OPER_WRITE_PROP;
 	for (;;) {
-		int c = getopt(argc, argv, "ht:v");
+		int c = getopt(argc, argv, "cht:v");
 		if (c == -1)
 			break;
 
@@ -213,6 +260,9 @@ int main(int argc, char *argv[])
 		 * - expand fdt if value doesn't fit
 		 */
 		switch (c) {
+		case 'c':
+			disp.oper = OPER_CREATE_NODE;
+			break;
 		case 'h':
 		case '?':
 			usage(NULL);
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 073a833..acec2a5 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -539,6 +539,19 @@ fdtput_tests () {
     # This should be larger than available space in the fdt
     run_wrap_error_test $DTPUT $dtb /randomnode blob -ts "$(cat $text $text)"
 
+    # Start again with a fresh dtb
+    run_dtc_test -O dtb -p $(stat -c %s $text) -o $dtb $dts
+
+    # Node creation
+    run_wrap_error_test $DTPUT $dtb -c /baldrick sod
+    run_wrap_test $DTPUT $dtb -c /chosen/son /chosen/daughter
+    run_fdtput_test "eva" $dtb /chosen/daughter name "" -ts "eva"
+    run_fdtput_test "adam" $dtb /chosen/son name "" -ts "adam"
+
+    # Not allowed to create an existing node
+    run_wrap_error_test $DTPUT $dtb -c /chosen
+    run_wrap_error_test $DTPUT $dtb -c /chosen/son
+
     # TODO: Add tests for verbose mode?
 }
 
-- 
1.7.7.3
