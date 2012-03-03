From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/4] fdtget: Fix multiple arg bug and add test for it
Date: Fri,  2 Mar 2012 17:12:07 -0800
Message-ID: <1330737130-29600-1-git-send-email-sjg@chromium.org>
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

There is a rather unfortunate bug in fdtget in that if multiple argument
sets are provided, it just repeats displaying the first set ones for
each set.

Fix this bug and add a test for it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 fdtget.c                |    6 +++---
 tests/fdtget-runtest.sh |    2 +-
 tests/run_tests.sh      |    3 +++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 2c384b6..9783e04 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -146,13 +146,13 @@ static int do_fdtget(struct display_info *disp, const char *filename,
 		return -1;
 
 	for (i = 0; i + 2 <= arg_count; i += 2) {
-		node = fdt_path_offset(blob, arg[0]);
+		node = fdt_path_offset(blob, arg[i]);
 		if (node < 0) {
-			report_error(arg[0], node);
+			report_error(arg[i], node);
 			return -1;
 		}
 
-		if (show_data_for_item(blob, disp, node, arg[1]))
+		if (show_data_for_item(blob, disp, node, arg[i + 1]))
 			return -1;
 	}
 	return 0;
diff --git a/tests/fdtget-runtest.sh b/tests/fdtget-runtest.sh
index dac7f9a..982fbe1 100755
--- a/tests/fdtget-runtest.sh
+++ b/tests/fdtget-runtest.sh
@@ -8,7 +8,7 @@ rm -f $LOG $EXPECT
 trap "rm -f $LOG $EXPECT" 0
 
 expect="$1"
-echo $expect >$EXPECT
+echo -e $expect >$EXPECT
 shift
 
 verbose_run_log_check "$LOG" $VALGRIND $DTGET "$@"
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index a561433..ac6fa17 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -475,6 +475,9 @@ fdtget_tests () {
     run_fdtget_test "61 62 63 0 12 34 0 0 0 a 0 0 0 b 0 0 0 c" \
 	-thhx $dtb /randomnode mixed
     run_wrap_error_test $DTGET -ts $dtb /randomnode doctor-who
+
+    # Test multiple arguments
+    run_fdtget_test "MyBoardName\nmemory" -ts $dtb / model /memory device_type
 }
 
 fdtput_tests () {
-- 
1.7.7.3
