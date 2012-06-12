From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] Add test for re-defining an identical label
Date: Tue, 12 Jun 2012 14:48:40 -0600
Message-ID: <1339534120-27414-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When merging one device tree over the top of a previous tree, it is
possible to define a duplicate label that has the same name and points
to the same property or node. This is currently allowed by the duplicate
label checking code. However, alternative duplicate label checking
algorithms might not allow this. Add an explicit test to ensure this
capability is maintained.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tests/label_repeated.dts |   15 +++++++++++++++
 tests/run_tests.sh       |    2 ++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 tests/label_repeated.dts

diff --git a/tests/label_repeated.dts b/tests/label_repeated.dts
new file mode 100644
index 0000000..34225d3
--- /dev/null
+++ b/tests/label_repeated.dts
@@ -0,0 +1,15 @@
+/dts-v1/;
+
+/ {
+	l0: prop = "foo";
+
+	l1: node {
+	};
+};
+
+/ {
+	l0: prop = "foo";
+
+	l1: node {
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 9a2a7d9..e0299e3 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -281,6 +281,8 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o multilabel.test.dtb multilabel.dts
     run_test references multilabel.test.dtb
 
+    run_dtc_test -I dts -O dtb -o label_repeated.test.dtb label_repeated.dts
+
     run_dtc_test -I dts -O dtb -o dtc_comments.test.dtb comments.dts
     run_dtc_test -I dts -O dtb -o dtc_comments-cmp.test.dtb comments-cmp.dts
     run_test dtbs_equal_ordered dtc_comments.test.dtb dtc_comments-cmp.test.dtb
-- 
1.7.0.4
