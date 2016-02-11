From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] Warn on node name unit-address presence/absence mismatch
Date: Thu, 11 Feb 2016 14:46:58 -0600
Message-ID: <1455223619-16052-2-git-send-email-robh@kernel.org>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455223619-16052-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
node that has a reg property must include a unit address in its name
with value matching the first entry in its reg property. Conversely, if
a node does not have a reg property, the node name must not include a
unit address. Also allow ranges property as it is deemed valid, but ePAPR
is not clear about it.

Implement a check for this. The code doesn't validate the format of the
unit address; ePAPR implies this may vary from (containing bus) binding
to binding, so doing so would be much more complex.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[robh: also allow non-empty ranges]
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c                        | 28 ++++++++++++++++++++++++++--
 tests/reg-without-unit-addr.dts | 10 ++++++++++
 tests/run_tests.sh              |  2 ++
 tests/unit-addr-without-reg.dts |  9 +++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 tests/reg-without-unit-addr.dts
 create mode 100644 tests/unit-addr-without-reg.dts

diff --git a/checks.c b/checks.c
index 0c03ac9..4001b8c 100644
--- a/checks.c
+++ b/checks.c
@@ -294,6 +294,30 @@ static void check_node_name_format(struct check *c, struct node *dt,
 }
 NODE_ERROR(node_name_format, NULL, &node_name_chars);
 
+static void check_unit_address_vs_reg(struct check *c, struct node *dt,
+			     struct node *node)
+{
+	const char *unitname = get_unitname(node);
+	struct property *prop = get_property(node, "reg");
+
+	if (!prop) {
+		prop = get_property(node, "ranges");
+		if (prop && !prop->val.len)
+			prop = NULL;
+	}
+
+	if (prop) {
+		if (!unitname[0])
+			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
+			    node->fullpath);
+	} else {
+		if (unitname[0])
+			FAIL(c, "Node %s has a unit name, but no reg property",
+			    node->fullpath);
+	}
+}
+NODE_WARNING(unit_address_vs_reg, NULL);
+
 static void check_property_name_chars(struct check *c, struct node *dt,
 				      struct node *node, struct property *prop)
 {
@@ -654,8 +678,8 @@ TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
 
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
-	&node_name_chars, &node_name_format, &property_name_chars,
-	&name_is_string, &name_properties,
+	&node_name_chars, &node_name_format, &unit_address_vs_reg,
+	&property_name_chars, &name_is_string, &name_properties,
 
 	&duplicate_label,
 
diff --git a/tests/reg-without-unit-addr.dts b/tests/reg-without-unit-addr.dts
new file mode 100644
index 0000000..aaf8af7
--- /dev/null
+++ b/tests/reg-without-unit-addr.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	node {
+		reg = <0 1>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 8863c9a..4b7a131 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -443,6 +443,8 @@ dtc_tests () {
     check_tests reg-ranges-root.dts reg_format ranges_format
     check_tests default-addr-size.dts avoid_default_addr_size
     check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen_interrupt_controller
+    check_tests reg-without-unit-addr.dts unit_address_vs_reg
+    check_tests unit-addr-without-reg.dts unit_address_vs_reg
     run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
diff --git a/tests/unit-addr-without-reg.dts b/tests/unit-addr-without-reg.dts
new file mode 100644
index 0000000..ac786eb
--- /dev/null
+++ b/tests/unit-addr-without-reg.dts
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	node@1 {
+	};
+};
-- 
2.5.0
