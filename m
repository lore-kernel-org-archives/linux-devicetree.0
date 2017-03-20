From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 3/3] checks: Warn on node name unit-addresses with '0x' or leading 0s
Date: Mon, 20 Mar 2017 09:44:18 -0500
Message-ID: <20170320144418.5021-4-robh@kernel.org>
References: <20170320144418.5021-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170320144418.5021-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Node name unit-addresses should generally never begin with 0x or leading
0s. Add warnings to check for these cases, but only for nodes without a
known bus type as there should be better bus specific checks of the
unit address in those cases. Any unit addresses that don't follow the
general rule will need to add a new bus type. There aren't any known
ones ATM.

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v4:
- Rebase to 1.4.4

v3:
- Only run check if bus type is not set (moving to the end of the series
  as a result). The bus bridge checks also must be a dependency.

v2:
- Split into separate check from unit_address_vs_reg

 checks.c                       | 25 +++++++++++++++++++++++++
 tests/run_tests.sh             |  2 ++
 tests/unit-addr-leading-0s.dts | 12 ++++++++++++
 tests/unit-addr-leading-0x.dts | 12 ++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts

diff --git a/checks.c b/checks.c
index 33036b8dbbc2..7f9232158dd9 100644
--- a/checks.c
+++ b/checks.c
@@ -880,6 +880,30 @@ static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct no
 }
 WARNING(simple_bus_reg, check_simple_bus_reg, NULL, &reg_format, &simple_bus_bridge);
 
+static void check_unit_address_format(struct check *c, struct dt_info *dti,
+				      struct node *node)
+{
+	const char *unitname = get_unitname(node);
+
+	if (node->parent && node->parent->bus)
+		return;
+
+	if (!unitname[0])
+		return;
+
+	if (!strncmp(unitname, "0x", 2)) {
+		FAIL(c, dti, "Node %s unit name should not have leading \"0x\"",
+		    node->fullpath);
+		/* skip over 0x for next test */
+		unitname += 2;
+	}
+	if (unitname[0] == '0' && isxdigit(unitname[1]))
+		FAIL(c, dti, "Node %s unit name should not have leading 0s",
+		    node->fullpath);
+}
+WARNING(unit_address_format, check_unit_address_format, NULL,
+	&node_name_format, &pci_bridge, &simple_bus_bridge);
+
 /*
  * Style checks
  */
@@ -951,6 +975,7 @@ static struct check *check_table[] = {
 	&addr_size_cells, &reg_format, &ranges_format,
 
 	&unit_address_vs_reg,
+	&unit_address_format,
 
 	&pci_bridge,
 	&pci_device_reg,
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
index 000000000000..cc017e9431a2
--- /dev/null
+++ b/tests/unit-addr-leading-0s.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	bus {
+		node@001 {
+			reg = <1 0>;
+		};
+	};
+};
diff --git a/tests/unit-addr-leading-0x.dts b/tests/unit-addr-leading-0x.dts
new file mode 100644
index 000000000000..74f19678c98c
--- /dev/null
+++ b/tests/unit-addr-leading-0x.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	bus {
+		node@0x1 {
+			reg = <1 0>;
+		};
+	};
+};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
