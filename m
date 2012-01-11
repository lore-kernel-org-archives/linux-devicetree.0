From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: libfdt: Activate testcase for appending properties
Date: Wed, 11 Jan 2012 23:41:32 +1100
Message-ID: <20120111124132.GJ4935@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit a31e3ef83bfce62d07695355e5f06cd4d0e44b86 introduced new libfdt
functions to append to existing properties.  It also included a test case
for this, but neglected to update the Makefile and run_tests.sh script
to actually build and execute this testcase.

This patch corrects the oversight.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---
 tests/Makefile.tests |    1 +
 tests/run_tests.sh   |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 215a8c5..3f92074 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -12,6 +12,7 @@ LIB_TESTS_L = get_mem_rsv \
 	sw_tree1 \
 	move_and_save mangle-layout nopulate \
 	open_pack rw_tree1 set_name setprop del_property del_node \
+	appendprop1 appendprop2 \
 	string_escapes references path-references phandle_format \
 	boot-cpuid incbin \
 	extra-terminating-null \
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index da6f970..c72b9d2 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -178,6 +178,10 @@ libfdt_tests () {
     run_test rw_tree1
     tree1_tests rw_tree1.test.dtb
     tree1_tests_rw rw_tree1.test.dtb
+    run_test appendprop1
+    run_test appendprop2 appendprop1.test.dtb
+    run_dtc_test -I dts -O dtb -o appendprop.test.dtb appendprop.dts
+    run_test dtbs_equal_ordered appendprop2.test.dtb appendprop.test.dtb
 
     for basetree in test_tree1.dtb sw_tree1.test.dtb rw_tree1.test.dtb; do
 	run_test nopulate $basetree
-- 
1.7.7.3


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
