From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [dtc PATCH V2] Warn on node name unit-address presence/absence mismatch
Date: Thu, 19 Sep 2013 11:54:23 -0600
Message-ID: <1379613263-32080-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
node that has a reg property must include a unit address in its name
with value matching the first entry in its reg property. Conversely, if
a node does not have a reg property, the node name must not include a
unit address.

Implement a check for this. The code doesn't validate the format of the
unit address; ePAPR implies this may vary from (containing bus) binding
to binding, so doing so would be much more complex.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Implement the new checks separately, rather than as part of existing
    checkes. downgrade from errors to warnings. Add tests.

Question: Do I need to make a special exception for the /memory node? I
assume we do want to fix that too, so the answer is no. That will require
removing the /memory node from skeleton.dtsi in the kernel though.
---
 checks.c                        | 22 ++++++++++++++++++++--
 tests/reg-without-unit-addr.dts | 10 ++++++++++
 tests/run_tests.sh              |  2 ++
 tests/unit-addr-without-reg.dts |  9 +++++++++
 4 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 tests/reg-without-unit-addr.dts
 create mode 100644 tests/unit-addr-without-reg.dts

diff --git a/checks.c b/checks.c
index ee96a25..8d2ccc5 100644
--- a/checks.c
+++ b/checks.c
@@ -293,6 +293,24 @@ static void check_node_name_format(struct check *c, struct node *dt,
 }
 NODE_ERROR(node_name_format, NULL, &node_name_chars);
 
+static void check_unit_address_vs_reg(struct check *c, struct node *dt,
+			     struct node *node)
+{
+	const char *unitname = get_unitname(node);
+	struct property *prop = get_property(node, "reg");
+
+	if (prop) {
+		if (!unitname[0])
+			FAIL(c, "Node %s has a reg property, but no unit name",
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
@@ -653,8 +671,8 @@ TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
 
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
index c0a136b..8a95bec 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -400,6 +400,8 @@ dtc_tests () {
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
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
