From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/3] checks: add interrupts property check
Date: Tue, 22 Aug 2017 18:02:08 -0500
Message-ID: <20170822230208.20987-4-robh@kernel.org>
References: <20170822230208.20987-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170822230208.20987-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a check for nodes with interrupts property that they have a valid
parent, the parent has #interrupt-cells property, and the size is a
valid multiple of #interrupt-cells.

This may not handle every possible case and doesn't deal with
translation thru interrupt-map properties, but should be enough for
modern dts files.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Add a test
- Check for interrupt-map when looking for interrupt parent.
- Check that explicit interrupt-parent node has an interrupt-controller or 
  interrupt-map property.

 checks.c                      | 76 +++++++++++++++++++++++++++++++++++++++++++
 tests/bad-interrupt-cells.dts | 12 +++++++
 tests/run_tests.sh            |  1 +
 3 files changed, 89 insertions(+)
 create mode 100644 tests/bad-interrupt-cells.dts

diff --git a/checks.c b/checks.c
index 3315a4646497..6b505e9c49d8 100644
--- a/checks.c
+++ b/checks.c
@@ -1113,6 +1113,81 @@ static void check_deprecated_gpio_property(struct check *c,
 }
 CHECK(deprecated_gpio_property, check_deprecated_gpio_property, NULL);
 
+static bool node_is_interrupt_provider(struct node *node)
+{
+	struct property *prop;
+
+	prop = get_property(node, "interrupt-controller");
+	if (prop)
+		return true;
+
+	prop = get_property(node, "interrupt-map");
+	if (prop)
+		return true;
+
+	return false;
+}
+static void check_interrupts_property(struct check *c,
+				      struct dt_info *dti,
+				      struct node *node)
+{
+	struct node *root = dti->dt;
+	struct node *irq_node = NULL, *parent = node;
+	struct property *irq_prop, *prop = NULL;
+	int irq_cells, phandle;
+
+	irq_prop = get_property(node, "interrupts");
+	if (!irq_prop)
+		return;
+
+	while (parent && !prop) {
+		if (parent != node && node_is_interrupt_provider(parent)) {
+			irq_node = parent;
+			break;
+		}
+
+		prop = get_property(parent, "interrupt-parent");
+		if (prop) {
+			phandle = propval_cell(prop);
+			irq_node = get_node_by_phandle(root, phandle);
+			if (!irq_node) {
+				FAIL(c, dti, "Bad interrupt-parent phandle for %s",
+				     node->fullpath);
+				return;
+			}
+			if (!node_is_interrupt_provider(irq_node))
+				FAIL(c, dti,
+				     "Missing interrupt-controller or interrupt-map property in %s",
+				     irq_node->fullpath);
+
+			break;
+		}
+
+		parent = parent->parent;
+	}
+
+	if (!irq_node) {
+		FAIL(c, dti, "Missing interrupt-parent for %s", node->fullpath);
+		return;
+	}
+
+	prop = get_property(irq_node, "#interrupt-cells");
+	if (!prop) {
+		FAIL(c, dti, "Missing #interrupt-cells in interrupt-parent %s",
+		     irq_node->fullpath);
+		return;
+	}
+
+	irq_cells = propval_cell(prop);
+	if (irq_prop->val.len % (irq_cells * sizeof(cell_t))) {
+		FAIL(c, dti,
+		     "interrupts size is (%d), expected multiple of %d in %s",
+		     irq_prop->val.len, (int)(irq_cells * sizeof(cell_t)),
+		     node->fullpath);
+	}
+}
+WARNING(interrupts_property, check_interrupts_property, &phandle_references);
+
 static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
@@ -1163,6 +1238,7 @@ static struct check *check_table[] = {
 
 	&deprecated_gpio_property,
 	&gpios_property,
+	&interrupts_property,
 
 	&always_fail,
 };
diff --git a/tests/bad-interrupt-cells.dts b/tests/bad-interrupt-cells.dts
new file mode 100644
index 000000000000..39fc78fdc11d
--- /dev/null
+++ b/tests/bad-interrupt-cells.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+/ {
+	interrupt-parent = <&intc>;
+	intc: interrupt-controller {
+		#interrupt-cells = <3>;
+	};
+
+	node {
+		interrupts = <1>;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 2a29fa4ee451..cc35205f5768 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -553,6 +553,7 @@ dtc_tests () {
     check_tests bad-phandle-cells.dts interrupts_extended_property
     check_tests bad-gpio.dts gpios_property
     run_sh_test dtc-checkfails.sh deprecated_gpio_property -- -Wdeprecated_gpio_property -I dts -O dtb bad-gpio.dts
+    check_tests bad-interrupt-cells.dts interrupts_property
     run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_node_char.dtb
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
