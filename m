From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] checks: add string list check
Date: Fri, 17 Nov 2017 08:45:12 -0600
Message-ID: <20171117144515.10870-3-robh@kernel.org>
References: <20171117144515.10870-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117144515.10870-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a check for string list properties with compatible being the first
check.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c                   | 34 ++++++++++++++++++++++++++++++++++
 tests/bad-string-props.dts |  8 ++++++++
 tests/run_tests.sh         |  2 +-
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index a4a9d37ca19b..4e23f29486bb 100644
--- a/checks.c
+++ b/checks.c
@@ -179,6 +179,36 @@ static void check_is_string(struct check *c, struct dt_info *dti,
 #define ERROR_IF_NOT_STRING(nm, propname) \
 	ERROR(nm, check_is_string, (propname))
 
+static void check_is_string_list(struct check *c, struct dt_info *dti,
+				 struct node *node)
+{
+	int rem, l;
+	struct property *prop;
+	char *propname = c->data;
+	char *str;
+
+	prop = get_property(node, propname);
+	if (!prop)
+		return; /* Not present, assumed ok */
+
+	str = prop->val.val;
+	rem = prop->val.len;
+	while (rem > 0) {
+		l = strnlen(str, rem);
+		if (l == rem) {
+			FAIL(c, dti, "\"%s\" property in %s is not a string list",
+			     propname, node->fullpath);
+			break;
+		}
+		rem -= l + 1;
+		str += l + 1;
+	}
+}
+#define WARNING_IF_NOT_STRING_LIST(nm, propname) \
+	WARNING(nm, check_is_string_list, (propname))
+#define ERROR_IF_NOT_STRING_LIST(nm, propname) \
+	ERROR(nm, check_is_string_list, (propname))
+
 static void check_is_cell(struct check *c, struct dt_info *dti,
 			  struct node *node)
 {
@@ -590,6 +620,8 @@ WARNING_IF_NOT_STRING(label_is_string, "label");
 WARNING_IF_NOT_STRING(bootargs_is_string, "bootargs");
 WARNING_IF_NOT_STRING(stdout_path_is_string, "stdout-path");
 
+WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
+
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
@@ -1241,6 +1273,8 @@ static struct check *check_table[] = {
 	&device_type_is_string, &model_is_string, &status_is_string,
 	&label_is_string, &bootargs_is_string, &stdout_path_is_string,
 
+	&compatible_is_string_list,
+
 	&property_name_chars_strict,
 	&node_name_chars_strict,
 
diff --git a/tests/bad-string-props.dts b/tests/bad-string-props.dts
index 9b5a7a1736ee..5e226ce0c736 100644
--- a/tests/bad-string-props.dts
+++ b/tests/bad-string-props.dts
@@ -7,4 +7,12 @@
 	bootargs = <0xdeadbeef>;
 	stdout-path = <0xdeadbeef>;
 	label = <0xdeadbeef>;
+
+	node1 {
+		compatible = <0xdeadbeef>;
+	};
+
+	node2 {
+		compatible = "good", <0xdeadbeef>;
+	};
 };
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index c610aaeb053e..f492cf78ae84 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -546,7 +546,7 @@ dtc_tests () {
     check_tests bad-name-property.dts name_properties
 
     check_tests bad-ncells.dts address_cells_is_cell size_cells_is_cell interrupt_cells_is_cell
-    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string bootargs_is_string stdout_path_is_string label_is_string
+    check_tests bad-string-props.dts device_type_is_string model_is_string status_is_string bootargs_is_string stdout_path_is_string label_is_string compatible_is_string_list
     check_tests bad-reg-ranges.dts reg_format ranges_format
     check_tests bad-empty-ranges.dts ranges_format
     check_tests reg-ranges-root.dts reg_format ranges_format
-- 
2.14.1
