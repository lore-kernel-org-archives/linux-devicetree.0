From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 4/4] fdtget: Add -d to provide a default value
Date: Tue,  6 Mar 2012 16:41:47 -0800
Message-ID: <1331080907-7230-4-git-send-email-sjg@chromium.org>
References: <1331080907-7230-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331080907-7230-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Sometimes the requested node or property is not present in the device
tree. This option provides a way of reporting a default value in this
case, rather than halting with an error.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
Changes in v2:
- Rebased on top of changes to the -l patch

 fdtget.c           |   20 +++++++++++++++++---
 tests/run_tests.sh |    6 ++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 2c7d238..c2fbab2 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -45,6 +45,7 @@ struct display_info {
 	int type;		/* data type (s/i/u/x or 0 for default) */
 	int size;		/* data size (1/2/4) */
 	enum display_mode mode;	/* display mode that we are using */
+	const char *default_val; /* default value if node/property not found */
 };
 
 static void report_error(const char *where, int err)
@@ -225,6 +226,8 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
 				err = -1;
 			else
 				printf("\n");
+		} else if (disp->default_val) {
+			puts(disp->default_val);
 		} else {
 			report_error(property, len);
 			err = -1;
@@ -258,8 +261,13 @@ static int do_fdtget(struct display_info *disp, const char *filename,
 	for (i = 0; i + args_per_step <= arg_count; i += args_per_step) {
 		node = fdt_path_offset(blob, arg[i]);
 		if (node < 0) {
-			report_error(arg[i], node);
-			return -1;
+			if (disp->default_val) {
+				puts(disp->default_val);
+				continue;
+			} else {
+				report_error(arg[i], node);
+				return -1;
+			}
 		}
 		prop = args_per_step == 1 ? NULL : arg[i + 1];
 
@@ -280,6 +288,8 @@ static const char *usage_msg =
 	"\t-t <type>\tType of data\n"
 	"\t-p\t\tList properties for each node\n"
 	"\t-l\t\tList subnodes for each node\n"
+	"\t-d\t\tDefault value to display when the property is "
+			"missing\n"
 	"\t-h\t\tPrint this help\n\n"
 	USAGE_TYPE_MSG;
 
@@ -303,7 +313,7 @@ int main(int argc, char *argv[])
 	disp.size = -1;
 	disp.mode = MODE_SHOW_VALUE;
 	for (;;) {
-		int c = getopt(argc, argv, "hlpt:");
+		int c = getopt(argc, argv, "d:hlpt:");
 		if (c == -1)
 			break;
 
@@ -327,6 +337,10 @@ int main(int argc, char *argv[])
 			disp.mode = MODE_LIST_SUBNODES;
 			args_per_step = 1;
 			break;
+
+		case 'd':
+			disp.default_val = optarg;
+			break;
 		}
 	}
 
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ac6fa17..deffae3 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -478,6 +478,12 @@ fdtget_tests () {
 
     # Test multiple arguments
     run_fdtget_test "MyBoardName\nmemory" -ts $dtb / model /memory device_type
+
+    # Test defaults
+    run_wrap_error_test $DTGET -tx $dtb /randomnode doctor-who
+    run_fdtget_test "<the dead silence>" -tx \
+	-d "<the dead silence>" $dtb /randomnode doctor-who
+    run_fdtget_test "<blink>" -tx -d "<blink>" $dtb /memory doctor-who
 }
 
 fdtput_tests () {
-- 
1.7.7.3
