From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Start adding checks for reg property and unit name
Date: Mon, 30 Aug 2010 14:03:05 +1000
Message-ID: <20100830040305.GB5210@yookeroo>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

In device trees, the unit name portion of any node (the part after the
"@") is supposed to be derived from the value of the node's 'reg'
property.  However, this is not enforced by the structure of a dtb
file, nor is it checked by dtc.  Checking is non-trivial, because the
manned in which the 'reg' property is encoded into a unit address can
vary from bus to bus.

This patch starts adding the infrastructure for making such checks to
dtc.  At present, it will only check the unit addresses on immediate
children of the root bus (which is assumed to have a unit addresses
encoded in plain hex) and that any other node has a unit address if
and only if it has a 'reg' property.  However, it should be relatively
straightforward to add more detailed checking for other sorts of
busses from this point.

In addition we add another small prerequisite check, that the root
node should never have either a 'reg' or 'ranges' property.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/checks.c
===================================================================
--- dtc.orig/checks.c	2010-08-30 13:54:58.101764963 +1000
+++ dtc/checks.c	2010-08-30 13:55:02.577766011 +1000
@@ -261,7 +261,9 @@ NODE_CHECK(node_name_chars, PROPNODECHAR
 static void check_node_name_format(struct check *c, struct node *dt,
 				   struct node *node)
 {
-	if (strchr(get_unitname(node), '@'))
+	const char *unitname = get_unitname(node);
+
+	if (unitname && strchr(unitname, '@'))
 		FAIL(c, "Node %s has multiple '@' characters in name",
 		     node->fullpath);
 }
@@ -581,6 +583,90 @@ static void check_ranges_format(struct c
 }
 NODE_CHECK(ranges_format, NULL, WARN, &addr_size_cells);
 
+typedef char *(*unit_address_check)(struct node *, struct node *,
+				  const char *, int, cell_t *);
+
+struct bus_info {
+	int (*match)(struct node *, struct node *);
+	int must_have_reg;
+	unit_address_check uac;
+};
+
+static int root_bus_match(struct node *dt, struct node *bus)
+{
+	return !(bus->parent);
+}
+
+static char *plain_hex_uac(struct node *dt, struct node *node,
+			   const char *unitname, int n_addr, cell_t *addr)
+{
+	char *buf, *p;
+	int i = 0;
+
+	p = buf = xmalloc((8 * n_addr) + 1);
+
+	while ((i < (n_addr - 1) && (addr[i] == 0)))
+		i++;
+	p += sprintf(p, "%x", fdt32_to_cpu(addr[i++]));
+	for (; i < n_addr; i++)
+		p += sprintf(p, "%08x", fdt32_to_cpu(addr[i]));
+
+	if (!streq(buf, unitname))
+		return buf;
+
+	free(buf);
+	return NULL;
+}
+
+static struct bus_info bus_table[] = {
+	{root_bus_match, 0, plain_hex_uac},
+	{NULL, 0, NULL},
+};
+
+static void check_unitname_matches_reg(struct check *c, struct node *dt,
+				       struct node *node)
+{
+	int addr_cells;
+	struct property *reg;
+	const char *unitname;
+	struct bus_info *b;
+
+	if (!node->parent)
+		return;
+
+	addr_cells = node_addr_cells(node->parent);
+	reg = get_property(node, "reg");
+	unitname = get_unitname(node);
+
+	if (reg && !unitname)
+		FAIL(c, "%s has a 'reg' property but no unit address",
+		     node->fullpath);
+	else if (!reg && unitname)
+		FAIL(c, "%s has a unit address but no 'reg' property",
+		     node->fullpath);
+
+	for (b = bus_table; b < bus_table + ARRAY_SIZE(bus_table); b++)
+		if (!b->match || b->match(dt, node->parent))
+			break;
+
+	assert(b < (bus_table + ARRAY_SIZE(bus_table)));
+
+	if (b->must_have_reg && !reg)
+		FAIL(c, "%s must have a 'reg' property", node->fullpath);
+
+	if (b->uac && reg && unitname) {
+		char *err = (b->uac)(dt, node, unitname, addr_cells,
+				   reg ? (cell_t *)reg->val.val : NULL);
+		if (err) {
+			FAIL(c, "Unit address on \"%s\" should be"
+			     " \"%s\" to match 'reg'",
+			     node->fullpath, err);
+			free(err);
+		}
+	}
+}
+NODE_CHECK(unitname_matches_reg, NULL, WARN, &reg_format, &node_name_format);
+
 /*
  * Style checks
  */
@@ -608,6 +694,15 @@ static void check_avoid_default_addr_siz
 }
 NODE_CHECK(avoid_default_addr_size, NULL, WARN, &addr_size_cells);
 
+static void check_no_root_reg_ranges(struct check *c, struct node *dt)
+{
+	if (get_property(dt, "reg"))
+		FAIL(c, "Root node has 'reg' property");
+	if (get_property(dt, "ranges"))
+		FAIL(c, "Root node has 'ranges' property");
+}
+TREE_CHECK(no_root_reg_ranges, NULL, ERROR);
+
 static void check_obsolete_chosen_interrupt_controller(struct check *c,
 						       struct node *dt)
 {
@@ -639,8 +734,10 @@ static struct check *check_table[] = {
 	&device_type_is_string, &model_is_string, &status_is_string,
 
 	&addr_size_cells, &reg_format, &ranges_format,
+	&unitname_matches_reg,
 
 	&avoid_default_addr_size,
+	&no_root_reg_ranges,
 	&obsolete_chosen_interrupt_controller,
 };
 
Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2010-08-30 13:54:58.129765731 +1000
+++ dtc/livetree.c	2010-08-30 13:55:02.577766011 +1000
@@ -261,7 +261,7 @@ struct boot_info *build_boot_info(struct
 const char *get_unitname(struct node *node)
 {
 	if (node->name[node->basenamelen] == '\0')
-		return "";
+		return NULL;
 	else
 		return node->name + node->basenamelen + 1;
 }
@@ -283,6 +283,41 @@ cell_t propval_cell(struct property *pro
 	return fdt32_to_cpu(*((cell_t *)prop->val.val));
 }
 
+int node_has_name(struct node *node, const char *str)
+{
+	if (node->basenamelen != strlen(str))
+		return 0;
+	else
+		return (memcmp(node->name, str, node->basenamelen) == 0);
+}
+
+int node_is_compatible(struct node *node, const char *str)
+{
+	int len = strlen(str);
+	struct property *prop;
+	int left;
+	const char *compat, *p;
+
+	prop = get_property(node, "compatible");
+	if (!prop)
+		return 0;
+
+	compat = prop->val.val;
+	left = prop->val.len;
+
+	while (left >= len) {
+		if (memcmp(str, compat, len+1) == 0)
+			return 1;
+		p = memchr(compat, '\0', left);
+		if (!p)
+			return 0; /* malformed compat.. */
+		left -= (p-compat) + 1;
+		compat = p + 1;
+	}
+	return 0;
+
+}
+
 struct property *get_property_by_label(struct node *tree, const char *label,
 				       struct node **node)
 {
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2010-08-30 13:54:58.117765173 +1000
+++ dtc/dtc.h	2010-08-30 13:55:02.577766011 +1000
@@ -182,6 +182,9 @@ void add_child(struct node *parent, stru
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
 cell_t propval_cell(struct property *prop);
+int node_has_name(struct node *node, const char *str);
+int node_is_compatible(struct node *node, const char *str);
+
 struct property *get_property_by_label(struct node *tree, const char *label,
 				       struct node **node);
 struct marker *get_marker_label(struct node *tree, const char *label,
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-08-30 13:54:58.357785566 +1000
+++ dtc/tests/run_tests.sh	2010-08-30 13:55:02.581763706 +1000
@@ -332,6 +332,17 @@ dtc_tests () {
     run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label5.dts
     run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label6.dts
 
+    # Tests for the unitname/reg checkicking logic
+
+    # Check sample trees that should trigger an error do, and that
+    # samples which shouldn't don't
+    for tree in name-reg-mismatch*.dts; do
+	check_tests $tree unitname_matches_reg
+    done
+    for tree in name-reg-match*.dts; do
+	run_sh_test dtc-nowarnings.sh $tree
+    done
+
     # Check for proper behaviour reading from stdin
     run_dtc_test -I dts -O dtb -o stdin_dtc_tree1.test.dtb - < test_tree1.dts
     run_wrap_test cmp stdin_dtc_tree1.test.dtb dtc_tree1.test.dtb
Index: dtc/tests/dtc-nowarnings.sh
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/dtc-nowarnings.sh	2010-08-30 13:55:02.581763706 +1000
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+. ./tests.sh
+
+LOG="tmp.log.$$"
+
+rm -f $LOG
+
+verbose_run_log "$LOG" $VALGRIND "$DTC" -o /dev/null "$@"
+ret="$?"
+
+if [ "$ret" -gt 127 ]; then
+    signame=$(kill -l $((ret - 128)))
+    FAIL "Killed by SIG$signame"
+fi
+
+if grep -E "^(ERROR)|(Warning) \([^)]*\):" $LOG > /dev/null; then
+    true
+    FAIL "Generated warnings"
+fi
+
+rm -f $LOG
+
+PASS
Index: dtc/tests/name-reg-match0.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/name-reg-match0.dts	2010-08-30 13:55:02.581763706 +1000
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	strange-bus@0 {
+		compatible = "strange-bus";
+		reg = <0x0 0x0 0x0 0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		strange-device@A {
+			compatible = "strange-device";
+			reg = <1>;
+		};
+	};
+};
Index: dtc/tests/name-reg-mismatch0.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/name-reg-mismatch0.dts	2010-08-30 13:55:02.581763706 +1000
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	badnode@abcd00000000 {
+		reg = <0xabce 0x00000000 0x0 0x1000>;
+	};
+};


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
