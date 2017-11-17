From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/5] checks: add a string checks for label, bootargs and stdout-path
Date: Fri, 17 Nov 2017 08:45:11 -0600
Message-ID: <20171117144515.10870-2-robh@kernel.org>
References: <20171117144515.10870-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117144515.10870-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add more string property checks for label, bootargs, and stdout-path.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c                   | 4 ++++
 tests/bad-string-props.dts | 3 +++
 tests/run_tests.sh         | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index f5bf5f97a3ad..a4a9d37ca19b 100644
--- a/checks.c
+++ b/checks.c
@@ -586,6 +586,9 @@ WARNING_IF_NOT_CELL(interrupt_cells_is_cell, "#interrupt-cells");
 WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
 WARNING_IF_NOT_STRING(model_is_string, "model");
 WARNING_IF_NOT_STRING(status_is_string, "status");
+WARNING_IF_NOT_STRING(label_is_string, "label");
+WARNING_IF_NOT_STRING(bootargs_is_string, "bootargs");
+WARNING_IF_NOT_STRING(stdout_path_is_string, "stdout-path");
 
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
@@ -1236,6 +1239,7 @@ static struct check *check_table[] = {
 
 	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
 	&device_type_is_string, &model_is_string, &status_is_string,
+	&label_is_string, &bootargs_is_string, &stdout_path_is_string,
 
 	&property_name_chars_strict,
 	&node_name_chars_strict,
diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
index 396f82069cf7..9b5a7a1736ee 100644
--- a/tests/bad-string-props.dts
+++ b/tests/bad-string-props.dts
@@ -4,4 +4,7 @@
 	device_type = <0xdeadbeef>;
 	model = <0xdeadbeef>;
 	status = <0xdeadbeef>;
+	bootargs = <0xdeadbeef>;
+	stdout-path = <0xdeadbeef>;
+	label = <0xdeadbeef>;
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 850bc165e757..c610aaeb053e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -546,7 +546,7 @@ dtc_tests () {
     check_tests bad-name-property.dts name_properties
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
-    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string
+    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string bootargs_is_string stdout_path_is_string label_is_string
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
