From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/4] checks: Warn on node name unit-addresses with '0x' or leading 0s
Date: Fri, 10 Feb 2017 10:47:16 -0600
Message-ID: <20170210164717.1234-4-robh@kernel.org>
References: <20170210164717.1234-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170210164717.1234-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Node name unit-addresses should never begin with 0x or leading 0s
regardless of whether they have a bus specific address (i.e. one with
commas) or not. Add warnings to check for these cases.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Split into separate check from unit_address_vs_reg

 checks.c                       | 21 +++++++++++++++++++++
 tests/run_tests.sh             |  2 ++
 tests/unit-addr-leading-0s.dts | 10 ++++++++++
 tests/unit-addr-leading-0x.dts | 10 ++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts

diff --git a/checks.c b/checks.c
index 67237ffe594e..16d17d20caec 100644
--- a/checks.c
+++ b/checks.c
@@ -296,6 +296,26 @@ static void check_unit_address_vs_reg(struct check *c, struct dt_info *dti,
 }
 WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
 
+static void check_unit_address_format(struct check *c, struct dt_info *dti,
+				      struct node *node)
+{
+	const char *unitname = get_unitname(node);
+
+	if (!unitname[0])
+		return;
+
+	if (!strncmp(unitname, "0x", 2)) {
+		FAIL(c, "Node %s unit name should not have leading \"0x\"",
+		    node->fullpath);
+		/* skip over 0x for next test */
+		unitname += 2;
+	}
+	if (unitname[0] == '0' && isxdigit(unitname[1]))
+		FAIL(c, "Node %s unit name should not have leading 0s",
+		    node->fullpath);
+}
+WARNING(unit_address_format, check_unit_address_format, NULL, &node_name_format);
+
 static void check_property_name_chars(struct check *c, struct dt_info *dti,
 				      struct node *node)
 {
@@ -753,6 +773,7 @@ static struct check *check_table[] = {
 	&addr_size_cells, &reg_format, &ranges_format,
 
 	&unit_address_vs_reg,
+	&unit_address_format,
 
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index ed489dbdd269..0f5c3db79b80 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -540,6 +540,8 @@ dtc_tests () {
     check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen_interrupt_controller
     check_tests reg-without-unit-addr.dts unit_address_vs_reg
     check_tests unit-addr-without-reg.dts unit_address_vs_reg
+    check_tests unit-addr-leading-0x.dts unit_address_format
+    check_tests unit-addr-leading-0s.dts unit_address_format
     run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
diff --git a/tests/unit-addr-leading-0s.dts b/tests/unit-addr-leading-0s.dts
new file mode 100644
index 000000000000..7c8e2cebbc84
--- /dev/null
+++ b/tests/unit-addr-leading-0s.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	node@001 {
+		reg = <1 0>;
+	};
+};
diff --git a/tests/unit-addr-leading-0x.dts b/tests/unit-addr-leading-0x.dts
new file mode 100644
index 000000000000..7ed7254e8dc2
--- /dev/null
+++ b/tests/unit-addr-leading-0x.dts
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	node@0x1 {
+		reg = <1 0>;
+	};
+};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
