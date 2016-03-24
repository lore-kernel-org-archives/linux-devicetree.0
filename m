From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC 2/3] checks: Add unit-address checks for simple-bus and default
Date: Wed, 23 Mar 2016 19:40:20 -0500
Message-ID: <1458780021-5052-2-git-send-email-robh@kernel.org>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458780021-5052-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c                                    | 87 +++++++++++++++++++++++++++--
 tests/run_tests.sh                          |  4 ++
 tests/unit-addr-leading-0s.dts              | 10 ++++
 tests/unit-addr-leading-0x.dts              | 10 ++++
 tests/unit-addr-simple-bus-comma.dts        | 18 ++++++
 tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++
 6 files changed, 142 insertions(+), 5 deletions(-)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts
 create mode 100644 tests/unit-addr-simple-bus-comma.dts
 create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts

diff --git a/checks.c b/checks.c
index 48e926e..82a7f38 100644
--- a/checks.c
+++ b/checks.c
@@ -20,6 +20,11 @@
 
 #include "dtc.h"
 
+#define node_addr_cells(n) \
+	(((n)->addr_cells == -1) ? 2 : (n)->addr_cells)
+#define node_size_cells(n) \
+	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
+
 #ifdef TRACE_CHECKS
 #define TRACE(c, ...) \
 	do { \
@@ -578,12 +583,88 @@ static bool is_simple_bridge(struct node *node)
 	return false;
 }
 
+static void default_unit_addr(struct check *c, struct node *dt, struct node *node)
+{
+	const char *unitname = get_unitname(node);
+
+	if (strstr(unitname, "0x") == unitname) {
+		FAIL(c, "Node %s unit address should not have leading \"0x\"",
+		     node->fullpath);
+		/* skip over 0x for next test */
+		unitname += 2;
+	}
+	if (unitname[0] == '0' && isxdigit(unitname[1]))
+		FAIL(c, "Node %s unit address should not have leading 0s",
+		     node->fullpath);
+}
+
+static void simple_bus_unit_addr(struct check *c, struct node *dt, struct node *node)
+{
+	const char *unitname = get_unitname(node);
+	struct property *prop;
+	uint64_t unitaddr, regaddr = 0;
+	int n, addr_cells;
+	cell_t *cell;
+
+	default_unit_addr(c, dt, node);
+
+	n = strspn(unitname, DIGITS "abcedf");
+	if (n != strlen(unitname))
+		FAIL(c, "Node %s unit address should have only lower case hex digits",
+		     node->fullpath);
+
+	unitaddr = strtoll(unitname, NULL, 16);
+
+	prop = get_property(node, "reg");
+	if (!prop) {
+		prop = get_property(node, "ranges");
+		if (!prop || !prop->val.len)
+			return;
+
+		cell = (cell_t *)prop->val.val;
+		cell += node_addr_cells(node);
+	} else
+		cell = (cell_t *)prop->val.val;
+
+	addr_cells = node_addr_cells(node->parent);
+	while (addr_cells--)
+		regaddr = (regaddr << 32) | fdt32_to_cpu(*cell++);
+
+	if (regaddr != unitaddr)
+		FAIL(c, "Node %s unit address does not match reg address (%zx != %zx)",
+		     node->fullpath, regaddr, unitaddr);
+}
+
 struct bus_type simple_bus_type = {
 	.expected_addr_cells = -1, /* For don't care */
 	.expected_size_cells = -1,
 	.is_type = is_simple_bridge,
+	.check_unit_addr = simple_bus_unit_addr,
+};
+
+struct bus_type default_bus_type = {
+	.expected_addr_cells = -1, /* For don't care */
+	.expected_size_cells = -1,
+	.check_unit_addr = default_unit_addr,
 };
 
+static void check_unit_address_format(struct check *c, struct node *dt,
+				      struct node *node)
+{
+	struct bus_type *bt;
+
+	if (!node->parent)
+		return;
+
+	bt = node->parent->bus_type;
+	if (!bt)
+		bt = &default_bus_type;
+
+	if (bt->check_unit_addr)
+		bt->check_unit_addr(c, dt, node);
+}
+NODE_WARNING(unit_address_format, NULL);
+
 struct bus_type *bus_types[] = {
 	&pci_bus_type,
 	&simple_bus_type,
@@ -635,11 +716,6 @@ static void fixup_addr_size_cells(struct check *c, struct node *dt,
 WARNING(addr_size_cells, NULL, fixup_addr_size_cells, NULL, NULL,
 	&address_cells_is_cell, &size_cells_is_cell);
 
-#define node_addr_cells(n) \
-	(((n)->addr_cells == -1) ? 2 : (n)->addr_cells)
-#define node_size_cells(n) \
-	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
-
 static void check_reg_format(struct check *c, struct node *dt,
 			     struct node *node)
 {
@@ -771,6 +847,7 @@ static struct check *check_table[] = {
 	&addr_size_cells, &reg_format, &ranges_format,
 
 	&unit_address_vs_reg,
+	&unit_address_format,
 
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 7eb9b3d..4adc704 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -447,6 +447,10 @@ dtc_tests () {
     check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen_interrupt_controller
     check_tests reg-without-unit-addr.dts unit_address_vs_reg
     check_tests unit-addr-without-reg.dts unit_address_vs_reg
+    check_tests unit-addr-leading-0x.dts unit_address_format
+    check_tests unit-addr-leading-0s.dts unit_address_format
+    check_tests unit-addr-simple-bus-comma.dts unit_address_format
+    check_tests unit-addr-simple-bus-reg-mismatch.dts unit_address_format
     run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
diff --git a/tests/unit-addr-leading-0s.dts b/tests/unit-addr-leading-0s.dts
new file mode 100644
index 0000000..7c8e2ce
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
index 0000000..7ed7254
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
diff --git a/tests/unit-addr-simple-bus-comma.dts b/tests/unit-addr-simple-bus-comma.dts
new file mode 100644
index 0000000..ea6f769
--- /dev/null
+++ b/tests/unit-addr-simple-bus-comma.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	bus@10000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <0x0 0x10000000 0x10000>;
+
+		node@0,1000 {
+			reg = <0x1000 1>;
+		};
+	};
+
+};
diff --git a/tests/unit-addr-simple-bus-reg-mismatch.dts b/tests/unit-addr-simple-bus-reg-mismatch.dts
new file mode 100644
index 0000000..2823377
--- /dev/null
+++ b/tests/unit-addr-simple-bus-reg-mismatch.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	bus@10000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <0x0 0x10000000 0x10000>;
+
+		node@100 {
+			reg = <0x1000 1>;
+		};
+	};
+
+};
-- 
2.5.0
