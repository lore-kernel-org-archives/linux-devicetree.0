From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH 5/8] Add most of the new IR implementation files.
Date: Tue, 23 Sep 2008 14:04:09 -0500
Message-ID: <1222196652-13811-6-git-send-email-jdl@jdl.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<1222196652-13811-2-git-send-email-jdl@jdl.com>
	<1222196652-13811-3-git-send-email-jdl@jdl.com>
	<1222196652-13811-4-git-send-email-jdl@jdl.com>
	<1222196652-13811-5-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-5-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 ir.c         |  197 +++++++++++++++++++++++
 ir_builtin.c |  178 +++++++++++++++++++++
 ir_dump.c    |  220 ++++++++++++++++++++++++++
 ir_emit.c    |  492 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ir_scope.c   |  319 +++++++++++++++++++++++++++++++++++++
 5 files changed, 1406 insertions(+), 0 deletions(-)
 create mode 100644 ir.c
 create mode 100644 ir_builtin.c
 create mode 100644 ir_dump.c
 create mode 100644 ir_emit.c
 create mode 100644 ir_scope.c

diff --git a/ir.c b/ir.c
new file mode 100644
index 0000000..7e5fce6
--- /dev/null
+++ b/ir.c
@@ -0,0 +1,197 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include "dtc.h"
+#include "ir.h"
+
+extern int treesource_error;
+
+
+struct ir *the_ir_tree;
+
+
+extern struct ir *
+ir_alloc(ir_type ir_type, srcpos *pos)
+{
+	struct ir *ir;
+
+	ir = xmalloc(sizeof(struct ir));
+	memset(ir, 0, sizeof(struct ir));
+
+	ir->ir_type = ir_type;
+	ir->ir_srcpos = srcpos_copy(pos);
+
+	return ir;
+}
+
+
+/*
+ * Shallow copy, mostly.
+ *
+ * Note that things like the immediate strings and source position
+ * are copied, but the sub-IR-expressions are not.
+ */
+extern struct ir *
+ir_copy(struct ir *ir)
+{
+	struct ir *ir_new;
+
+	if (!ir)
+		return NULL;
+
+	ir_new = ir_alloc(ir->ir_type, ir->ir_srcpos);
+	ir_new->ir_literal = ir->ir_literal;
+	if (ir->ir_lit_str)
+		ir_new->ir_lit_str = strdup(ir->ir_lit_str);
+	if (ir->ir_label_name)
+		ir_new->ir_label_name = strdup(ir->ir_label_name);
+
+	return ir_new;
+}
+
+
+void
+ir_free(struct ir *ir)
+{
+}
+
+
+void
+ir_free_all(struct ir *ir)
+{
+}
+
+
+extern struct ir *
+ir_alloc_unop(ir_type ir_type, struct ir *ir1, srcpos *pos)
+{
+    struct ir *ir;
+
+    ir = ir_alloc(ir_type, pos);
+    ir->ir_expr1 = ir1;
+
+    return ir;
+}
+
+
+extern struct ir *
+ir_alloc_binop(ir_type ir_type,
+	       struct ir *ir1, struct ir *ir2,
+	       srcpos *pos)
+{
+    struct ir *ir;
+
+    ir = ir_alloc(ir_type, pos);
+    ir->ir_expr1 = ir1;
+    ir->ir_expr2 = ir2;
+
+    return ir;
+}
+
+
+extern struct ir *
+ir_alloc_triop(ir_type ir_type,
+	       struct ir *ir1, struct ir *ir2, struct ir *ir3,
+	       srcpos *pos)
+{
+    struct ir *ir;
+
+    ir = ir_alloc(ir_type, pos);
+    ir->ir_expr1 = ir1;
+    ir->ir_expr2 = ir2;
+    ir->ir_expr3 = ir3;
+
+    return ir;
+}
+
+
+extern struct ir *
+ir_list_append(struct ir *ir_list, struct ir *ir_node)
+{
+	if (ir_node == NULL) {
+		return ir_list;
+	}
+
+	if (ir_list == NULL) {
+		ir_list = ir_alloc(IR_LIST, ir_node->ir_srcpos);
+	}
+
+	ir_node->ir_prev = ir_list->ir_last;
+
+	if (ir_list->ir_last) {
+		ir_list->ir_last->ir_next = ir_node;
+	} else {
+		ir_list->ir_first = ir_node;
+	}
+
+	ir_list->ir_last = ir_node;
+
+	return ir_list;
+}
+
+
+void
+ir_process(void)
+{
+	/*
+	 * FIXME: Fix leaking the whole orginal IR tree here.
+	 */
+	the_ir_tree = ir_simplify(the_ir_tree, IR_EVAL_CTXT_ANY);
+
+	ir_emit(the_ir_tree);
+}
+
+
+void
+ir_warn(struct ir *ir, char const *fmt, ...)
+{
+	srcpos *pos;
+	const char *srcstr;
+	va_list va;
+	va_start(va, fmt);
+
+	pos = ir ? ir->ir_srcpos : &srcpos_empty;
+	srcstr = srcpos_string(pos);
+
+	fprintf(stderr, "Error: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
+
+	va_end(va);
+}
+
+
+void
+ir_error(struct ir *ir, char const *fmt, ...)
+{
+	srcpos *pos;
+	const char *srcstr;
+	va_list va;
+	va_start(va, fmt);
+
+	pos = ir ? ir->ir_srcpos : &srcpos_empty;
+	srcstr = srcpos_string(pos);
+
+	fprintf(stderr, "Warn: %s ", srcstr);
+	vfprintf(stderr, fmt, va);
+	fprintf(stderr, "\n");
+
+	treesource_error = 1;
+	va_end(va);
+}
diff --git a/ir_builtin.c b/ir_builtin.c
new file mode 100644
index 0000000..2f33440
--- /dev/null
+++ b/ir_builtin.c
@@ -0,0 +1,178 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include <stdio.h>
+
+#include "dtc.h"
+#include "ir.h"
+
+struct ir *ir_builtin_join(struct ir *ir_params);
+struct ir *ir_builtin_hexstr(struct ir *ir_params);
+
+static const struct irb_entry irb_builtins[] = {
+	{ 0, NULL, NULL },
+	{ 1, "join", ir_builtin_join },
+	{ 2, "hexstr", ir_builtin_hexstr },
+};
+
+#define IRB_NUM_BUILTINS	ARRAY_SIZE(irb_builtins)
+
+
+irb_id
+ir_lookup_builtin_by_name(char *str_name)
+{
+	irb_id irb;
+
+	for (irb = 1; irb < IRB_NUM_BUILTINS; irb++) {
+		if (strcmp(irb_builtins[irb].irb_name, str_name) == 0) {
+			return irb;
+		}
+	}
+
+	return IRB_UNDEF;
+}
+
+
+struct ir *
+ir_eval_builtin(struct ir *ir)
+{
+	irb_id irb;
+	const struct irb_entry *irbe;
+	struct ir *ir_new;
+
+	if (ir == NULL)
+		return NULL;
+
+	if (ir->ir_type != IR_BUILTIN)
+		return NULL;
+
+	irb = ir->ir_builtin_id;
+
+	if (irb <= IRB_UNDEF || irb >= IRB_NUM_BUILTINS)
+		return NULL;
+
+	irbe = &irb_builtins[irb];
+
+	ir_new = (*irbe->irb_implementation)(ir);
+
+	return ir_new;
+}
+
+
+struct ir *
+ir_builtin_join(struct ir *ir_builtin)
+{
+	struct ir *ir_new;
+	struct ir *irp;
+	struct ir *ir;
+	char *s;
+	char *str;
+	int len;
+	char buf[30];
+
+	debug("ir_builtin_impl_join():\n");
+
+	irp = ir_builtin->ir_expr1;
+	if (irp->ir_type == IR_LIST)
+		irp = irp->ir_first;
+
+	len = 1;
+	str = xmalloc(1);
+	*str  = 0;
+
+	while (irp != NULL) {
+		ir = ir_eval(irp);
+
+		if (ir_is_string(ir)) {
+			s = ir_eval_for_c_string(ir);
+		} else if (ir_is_constant(ir)) {
+			unsigned long long a;
+			a = ir_eval_for_addr(ir);
+			snprintf(buf, 30, "%llu", a);
+			s = buf;
+		} else {
+			ir_error(ir,
+				 "Can't handle %s in join()\n",
+				 ir_type_string(ir->ir_type));
+			s = 0;
+		}
+
+		len += strlen(s);
+
+		str = xrealloc(str, len);
+		strcat(str, s);
+
+		irp = irp->ir_next;
+	}
+
+	ir_new = ir_alloc(IR_LIT_STR, ir_builtin->ir_srcpos);
+	ir_new->ir_lit_str = str;
+
+	return ir_new;
+}
+
+
+
+struct ir *
+ir_builtin_hexstr(struct ir *ir_builtin)
+{
+	struct ir *ir_new;
+	struct ir *irp;
+	struct ir *ir;
+	char *s;
+	char *str;
+	int len;
+	char buf[30];
+
+	irp = ir_builtin->ir_expr1;
+	if (irp->ir_type == IR_LIST)
+		irp = irp->ir_first;
+
+	len = 1;
+	str = xmalloc(1);
+	*str  = 0;
+
+	while (irp != NULL) {
+		ir = ir_eval(irp);
+		if (ir_is_constant(ir)) {
+			unsigned long long a;
+			a = ir_eval_for_addr(ir);
+			snprintf(buf, 30, "%llx", a);
+			s = buf;
+		} else {
+			ir_error(ir,
+				 "Can't handle %s in hexstr()\n",
+				 ir_type_string(ir->ir_type));
+			s = 0;
+		}
+		len += strlen(s);
+
+		str = xrealloc(str, len);
+		strcat(str, s);
+
+		irp = irp->ir_next;
+	}
+
+	ir_new = ir_alloc(IR_LIT_STR, ir_builtin->ir_srcpos);
+	ir_new->ir_lit_str = str;
+
+	return ir_new;
+}
+
+
diff --git a/ir_dump.c b/ir_dump.c
new file mode 100644
index 0000000..c818e2a
--- /dev/null
+++ b/ir_dump.c
@@ -0,0 +1,220 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include <stdio.h>
+
+#include "dtc.h"
+#include "ir.h"
+
+
+static const char *ir_type_str[IR_NUM_TYPES] = {
+	"IR_UNDEF",
+	"IR_ROOT",
+	"IR_MEM_RESERVE",
+	"IR_ASSIGN",
+	"IR_PROP_DEF",
+	"IR_REF_PHANDLE",
+	"IR_REF_PATH",
+	"IR_CELL",
+	"IR_LITERAL",
+	"IR_LIT_STR",
+	"IR_LIT_BYTE",
+	"IR_LABEL",
+	"IR_LIST",
+	"IR_INCBIN",
+	"IR_BUILTIN",
+	"IR_SELECT",
+	"IR_OR",
+	"IR_AND",
+	"IR_BIT_OR",
+	"IR_BIT_XOR",
+	"IR_BIT_AND",
+	"IR_EQ",
+	"IR_LT",
+	"IR_LE",
+	"IR_GT",
+	"IR_GE",
+	"IR_NE",
+	"IR_LSHIFT",
+	"IR_RSHIFT",
+	"IR_ADD",
+	"IR_MINUS",
+	"IR_MULT",
+	"IR_DIV",
+	"IR_MOD",
+	"IR_UMINUS",
+	"IR_BIT_COMPL",
+	"IR_NOT",
+	"IR_FUNC_DEF",
+	"IR_FOR",
+	"IR_RETURN",
+	"IR_RANGE",
+	"IR_ID",
+	"IR_IF",
+	"IR_PARAMDECL",
+	"IR_FUNC_CALL",
+	"IR_NODE",
+	"IR_PROPNODENAME",
+	"IR_LIT_CELL",
+	"IR_LIT_ADDR",
+	"IR_CVT_PROPNODENAME",
+	"IR_CVT_STRING",
+	"IR_CONST_DEF",
+};
+
+
+const char *
+ir_type_string(ir_type ir_type)
+{
+	if (0 <= ir_type && ir_type < IR_NUM_TYPES)
+		return ir_type_str[ir_type];
+	else
+		return "<unknown>";
+}
+
+
+static void
+ir_dump_node(struct ir *ir, unsigned int level)
+{
+	int indent = 4 * level;
+	struct ir *iri;
+
+	if (ir == NULL)
+		return;
+
+	/*
+	 * Print node values
+	 */
+	printf("%*sNODE       : %p\n",
+	       indent, "", ir);
+
+	printf("%*sir_type    : %s\n",
+	       indent, "", ir_type_string(ir->ir_type));
+
+	printf("%*sir_srcpos : %s\n",
+	       indent, "", srcpos_string(ir->ir_srcpos));
+
+
+	printf("%*sir_literal : %lld\n", indent, "", ir->ir_literal);
+
+	if (ir->ir_builtin_id != IRB_UNDEF) {
+		printf("%*sir_builtin_id : %d\n",
+		       indent, "", ir->ir_builtin_id);
+	}
+	if (ir->ir_lit_str) {
+		printf("%*sir_lit_str : %s\n",
+		       indent, "", ir->ir_lit_str);
+	}
+	if (ir->ir_label_name) {
+		printf("%*sir_label_name : %s\n",
+		       indent, "", ir->ir_label_name);
+	}
+
+	if (ir->ir_name) {
+		printf("%*sir_name   : %p\n",
+		       indent, "", ir->ir_name);
+		ir_dump_node(ir->ir_name, level + 1);
+	}
+
+	if (ir->ir_label) {
+		printf("%*sir_label   : %p\n",
+		       indent, "", ir->ir_label);
+		ir_dump_node(ir->ir_label, level + 1);
+	}
+
+	if (ir->ir_first)
+		printf("%*sir_first   : %p\n",
+		       indent, "", ir->ir_first);
+	if (ir->ir_last)
+		printf("%*sir_last    : %p\n",
+		       indent, "", ir->ir_last);
+	if (ir->ir_next)
+		printf("%*sir_next    : %p\n",
+		       indent, "", ir->ir_next);
+	if (ir->ir_prev)
+		printf("%*sir_prev    : %p\n",
+		       indent, "", ir->ir_prev);
+	
+	/*
+	 * Dump mem-reserves.
+	 */
+	if (ir->ir_mem_reserves) {
+		printf("%*sir_mem_reserves: %p\n",
+		       indent, "", ir->ir_mem_reserves);
+		ir_dump_node(ir->ir_mem_reserves, level + 1);
+	}
+
+	/*
+	 * Dump sub-expressions
+	 */
+	if (ir->ir_expr1) {
+		printf("%*sir_expr1   : %p\n",
+		       indent, "", ir->ir_expr1);
+		ir_dump_node(ir->ir_expr1, level + 1);
+	}
+
+	if (ir->ir_expr2) {
+		printf("%*sir_expr2   : %p\n",
+		       indent, "", ir->ir_expr2);
+		ir_dump_node(ir->ir_expr2, level + 1);
+	}
+
+	if (ir->ir_expr3) {
+		printf("%*sir_expr3   : %p\n",
+		       indent, "", ir->ir_expr3);
+		ir_dump_node(ir->ir_expr3, level + 1);
+	}
+
+	/*
+	 * Recursively dump declarations.
+	 */
+	if (ir->ir_declarations) {
+		printf("%*sir_declarations: %p\n",
+		       indent, "", ir->ir_declarations);
+		ir_dump_node(ir->ir_declarations, level + 1);
+	}
+
+	/*
+	 * Recursively dump statements.
+	 */
+	if (ir->ir_statements) {
+		printf("%*sir_statements: %p\n",
+		       indent, "", ir->ir_statements);
+		ir_dump_node(ir->ir_statements, level + 1);
+	}
+	if (ir->ir_statements2) {
+		printf("%*sir_statements2: %p\n",
+		       indent, "", ir->ir_statements2);
+		ir_dump_node(ir->ir_statements2, level + 1);
+	}
+
+	/*
+	 * Recursively dump LIST chain.
+	 */
+	for (iri = ir->ir_first; iri != NULL; iri = iri->ir_next) {
+		ir_dump_node(iri, level + 1);
+	}
+}
+
+
+extern void
+ir_dump(struct ir *ir)
+{
+	ir_dump_node(ir, 0);
+}
diff --git a/ir_emit.c b/ir_emit.c
new file mode 100644
index 0000000..dc94c71
--- /dev/null
+++ b/ir_emit.c
@@ -0,0 +1,492 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include <stdio.h>
+
+#include "dtc.h"
+#include "srcpos.h"
+#include "ir.h"
+#include "ir_scope.h"
+#include "nv.h"
+
+extern struct boot_info *the_boot_info;
+
+
+void ir_emit_node(struct ir *ir);
+
+
+void
+ir_emit_prop_def(struct ir *irp)
+{
+	struct ir *ir_lhs;
+	struct property *p;
+	char *prop_name;
+	char *lab;
+	struct data d;
+
+	debug("ir_emit_prop_def(");
+
+	lab = ir_eval_for_label(irp->ir_label);
+	if (lab) {
+		debug("%s : ", lab);
+	}
+
+	ir_lhs = ir_eval(irp->ir_expr1);
+	prop_name = ir_eval_for_name(ir_lhs);
+	debug("%s = <expr>)\n", prop_name);
+
+	if (prop_name) {
+		d = empty_data;
+		ir_eval_for_data(irp->ir_expr2, &d);
+		p =  build_property(prop_name, d, lab);
+		irs_append_property(p);
+	}
+
+	debug("ir_emit_prop_def(): Done\n");
+}
+
+
+void
+ir_emit_assign(struct ir *ir_assign)
+{
+	char *var_name;
+	struct ir_symbol *irsym;
+	struct ir *ir_val;
+	struct ir *ir_pos;
+
+	ir_pos = ir_assign->ir_expr1 ? ir_assign->ir_expr1 : ir_assign;
+
+	var_name = ir_eval_for_name(ir_assign->ir_expr1);
+
+	debug("ir_emit_assign(%s)\n", var_name);
+
+	if (!var_name) {
+		ir_error(ir_pos, "Can't determine LHS name\n");
+		return;
+	}
+
+	irsym = irs_lookup_local(var_name);
+	if (irsym != NULL) {
+		if (irsym->irsym_type == IRSYM_CONST) {
+			ir_error(ir_pos,
+				 "Can't assign to constant \"%s\"\n",
+				 var_name);
+		}
+	} else {
+		/*
+		 * FIXME: Debate on-the-fly creation or pre-declaration.
+		 */
+		irsym = irs_create_local(var_name, IRSYM_VAR);
+	}
+
+	ir_val = ir_eval(ir_assign->ir_expr2);
+	irsym->irsym_value = ir_val;
+}
+
+
+void
+ir_emit_for(struct ir *ir_for)
+{
+	char *var_name;
+	struct ir_symbol *irsym;
+	struct ir *ir_id;
+	struct ir *ir_val;
+	struct ir *ir_range;
+	unsigned long long var;
+	unsigned long long start;
+	unsigned long long stop;
+
+	irs_push_scope(IRS_FOR_LOOP);
+
+	/*
+	 * Introduce for-loop variable into FOR_LOOP scope.
+	 */
+	ir_id = ir_for->ir_expr1;
+	var_name = ir_eval_for_name(ir_id);
+	irsym = irs_create_local(var_name, IRSYM_VAR);
+
+	ir_val = ir_alloc(IR_LIT_ADDR, ir_id->ir_srcpos);
+	irsym->irsym_value = ir_val;
+
+	ir_range = ir_for->ir_expr2;
+	start = ir_eval_for_addr(ir_range->ir_expr1);
+	stop = ir_eval_for_addr(ir_range->ir_expr2);
+
+	debug("Range appears to be %llu to %llu\n", start, stop);
+
+	var = start;
+	while (var <= stop ) {
+	    ir_val->ir_literal = var;   
+	    ir_emit_statement_list(ir_for->ir_statements);
+	    var++;
+	}
+
+	irs_pop_scope();
+}
+
+
+void
+ir_emit_if(struct ir *ir_if)
+{
+	uint64_t lit;
+
+	debug("ir_if()\n");
+	lit = ir_eval_for_addr(ir_if->ir_expr1);
+	if (lit) {
+		ir_emit_statement_list(ir_if->ir_statements);
+	} else {
+		ir_emit_statement_list(ir_if->ir_statements2);
+	}
+}
+
+
+void
+ir_emit_return(struct ir *ir_return)
+{
+	struct ir *ir_ret_expr;
+
+	ir_ret_expr = ir_eval(ir_return->ir_expr1);
+	irs_set_return_value(ir_ret_expr);
+}
+
+
+void
+ir_emit_func_call(struct ir *ir_func)
+{
+	struct ir_scope *irs_scope;
+
+	/*
+	 * Perform function body.
+	 *
+	 * Returned scope has node and property "side effects".
+	 * Function return value is thrown to /dev/null.
+	 */
+	irs_scope = ir_eval_func_body(ir_func);
+
+	/*
+	 * Propagate any nodes or properties into parent scope.
+	 */
+	irs_scope_append_property_list(irs_scope->irs_prop_list);
+	irs_scope_append_node_list(irs_scope->irs_node_list);
+}
+
+
+void
+ir_emit_statement(struct ir *ir)
+{
+	if (ir == NULL)
+		return;
+
+	switch (ir->ir_type) {
+	case IR_NODE:
+		ir_emit_node(ir);
+		break;
+
+	case IR_PROP_DEF:
+		ir_emit_prop_def(ir);
+		break;
+
+	case IR_FOR:
+		ir_emit_for(ir);
+		break;
+
+	case IR_IF:
+		ir_emit_if(ir);
+		break;
+
+	case IR_RETURN:
+		ir_emit_return(ir);
+		break;
+
+	case IR_ASSIGN:
+		ir_emit_assign(ir);
+		break;
+
+	case IR_FUNC_CALL:
+		ir_emit_func_call(ir);
+		break;
+
+	case IR_LIST:
+		/*
+		 * FIXME: LIST within a LIST.  Optimize out earlier?
+		 */
+		ir_emit_statement_list(ir);
+		break;
+
+	default:
+		ir_error(ir, "Unknown statement with ir_type %s\n",
+			 ir_type_string(ir->ir_type));
+	}
+}
+
+
+void
+ir_emit_statement_list(struct ir *ir_list)
+{
+	struct ir *ir;
+
+	if (ir_list == NULL)
+		return;
+
+	if (ir_list->ir_type != IR_LIST)
+		return;
+
+	for (ir = ir_list->ir_first; ir != NULL; ir = ir->ir_next) {
+		ir_emit_statement(ir);
+	}
+}
+
+
+/*
+ * Enter a /define/ function definitin into IRS_ROOT symtab.
+ */
+void
+ir_emit_func_def(struct ir *ir_func_def)
+{
+	char *func_name;
+	struct ir_symbol *irsym;
+	struct ir *ir_pos;
+
+	ir_pos = ir_func_def->ir_expr1
+		? ir_func_def->ir_expr1 : ir_func_def;
+
+	func_name = ir_eval_for_name(ir_func_def->ir_name);
+
+
+	irsym = irs_lookup(func_name, IRS_ROOT);
+	if (irsym != NULL) {
+		ir_warn(ir_pos,
+			"Redefinintion of \"%s\" ignored\n",
+		        func_name);
+		return;
+	}
+
+	irsym = irs_create_symbol(IRS_ROOT, func_name, IRSYM_FUNCDEF);
+
+	irsym->irsym_value = ir_func_def;
+
+	debug("ir_emit_func_def(): Defined %s\n", func_name);
+}
+
+
+/*
+ * Enter a /define/ function definitin into IRS_ROOT symtab.
+ */
+void
+ir_emit_const_def(struct ir *ir_const_def)
+{
+	char *const_name;
+	struct ir_symbol *irsym;
+	struct ir *ir_val;
+	struct ir *ir_pos;
+
+	ir_pos = ir_const_def->ir_expr1
+		? ir_const_def->ir_expr1 : ir_const_def;
+
+	const_name = ir_eval_for_name(ir_const_def->ir_expr1);
+
+	debug("ir_const_def(%s)\n", const_name);
+
+	if (!const_name) {
+		ir_error(ir_pos, "Can't determine LHS constant name\n");
+		return;
+	}
+
+	irsym = irs_lookup(const_name, IRS_ANY);
+	if (irsym != NULL) {
+		ir_warn(ir_pos,
+			"Redefinintion of \"%s\" ignored\n",
+		        const_name);
+		return;
+	}
+
+	irsym = irs_create_symbol(IRS_ROOT, const_name, IRSYM_CONST);
+
+	ir_val = ir_eval(ir_const_def->ir_expr2);
+	irsym->irsym_value = ir_val;
+}
+
+
+void
+ir_emit_declaration_list(struct ir *ir_list)
+{
+	struct ir *ir;
+
+	if (ir_list == NULL)
+		return;
+
+	if (ir_list->ir_type != IR_LIST)
+		return;
+
+	for (ir = ir_list->ir_first; ir != NULL; ir = ir->ir_next) {
+		switch (ir->ir_type) {
+		case IR_CONST_DEF:
+			ir_emit_const_def(ir);
+			break;
+
+		case IR_FUNC_DEF:
+			ir_emit_func_def(ir);
+			break;
+
+		default:
+			ir_error(ir,
+				 "Unknown devlaration type %s\n",
+				 ir_type_string(ir->ir_type));
+			break;
+		}
+	}
+}
+
+
+void
+ir_emit_node(struct ir *ir)
+{
+	struct ir *ir_name;
+	struct ir *ir_label;
+	char *name;
+	char *label;
+	struct node *node;
+	struct node *node_list;
+	struct ir_scope *irs_scope;
+
+	if (ir == NULL)
+		return;
+
+	if (ir->ir_type != IR_NODE)
+		return;
+
+	ir_name = ir_eval(ir->ir_name);
+	name = ir_eval_for_name(ir_name);
+
+	ir_label = ir_eval(ir->ir_label);
+	label = ir_eval_for_label(ir_label);
+
+	debug("ir_emit_node(): Making node %s : %s\n", label, name);
+
+	irs_push_scope(IRS_NODE);
+	ir_emit_statement_list(ir->ir_statements);
+	irs_scope = irs_pop_scope();
+
+	node_list = reverse_nodes(irs_scope->irs_node_list);
+	node = build_node(irs_scope->irs_prop_list, node_list);
+	name_node(node, name, label);
+
+	irs_append_node(node);
+}
+
+
+void
+ir_emit_mem_reserves(struct ir *ir_mem)
+{
+	struct ir *ir;
+	struct reserve_info *ri;
+	uint64_t addr;
+	uint64_t size;
+	char *lab;
+
+	if (ir_mem == NULL)
+		return;
+
+	for (ir = ir_mem->ir_first; ir != NULL; ir = ir->ir_next) {
+		addr = ir_eval_for_addr(ir->ir_expr1);
+		size = ir_eval_for_addr(ir->ir_expr2);
+		lab = ir_eval_for_label(ir->ir_label);
+
+		debug("emit: build_reserve_entry(0x%llx, 0x%llx, ",
+		      (unsigned long long)addr, (unsigned long long)size);
+		if (lab) {
+			debug("%s)\n", lab);
+		} else {
+			debug("<no-label>)\n");
+		}
+
+		ri = build_reserve_entry(addr, size, lab);
+		irs_append_reserve(ri);
+	}
+}
+
+
+void
+ir_add_cmd_line_constant_defs(void)
+{
+	struct nv_pair *nv;
+	struct ir_symbol *irsym;
+	struct ir *ir_const;
+
+	for (nv = nv_list; nv != NULL; nv = nv->nv_next) {
+		irsym = irs_create_symbol(IRS_ROOT, nv->nv_name, IRSYM_CONST);
+		if (nv->nv_value) {
+			ir_const = ir_alloc(IR_LITERAL, &srcpos_empty);
+			ir_const->ir_lit_str = strdup(nv->nv_value);
+			irsym->irsym_value = ir_const;
+		}
+	}
+}
+
+
+void
+ir_emit_root(struct ir *ir)
+{
+	struct reserve_info *ri_list;
+	struct node *node_list;
+
+	if (ir == NULL)
+		return;
+
+	if (ir->ir_type != IR_ROOT) {
+		debug("emit: Bad root node\n");
+		return;
+	}
+
+	irs_push_scope(IRS_ROOT);
+
+	/*
+	 * Establish constant definitions from command line.
+	 */
+	ir_add_cmd_line_constant_defs();
+
+	ir_emit_mem_reserves(ir->ir_mem_reserves);
+
+	/*
+	 * Fast-and-loose... These are definitions, not declarations!
+	 */
+	ir_emit_declaration_list(ir->ir_declarations);
+
+	/*
+	 * Emit the root IR_NODE.
+	 */
+	ir_emit_node(ir->ir_statements);
+
+	/*
+	 * Build the_boot_info.
+	 */
+	ri_list = irs_scope_stack->irs_reserve_list;
+	node_list = irs_scope_stack->irs_node_list;
+	the_boot_info = build_boot_info(ri_list, node_list, 0);
+
+	irs_pop_scope();
+}
+
+
+extern void
+ir_emit(struct ir *ir)
+{
+	ir_emit_root(ir);
+	fflush(stdout);
+}
diff --git a/ir_scope.c b/ir_scope.c
new file mode 100644
index 0000000..c9a52e8
--- /dev/null
+++ b/ir_scope.c
@@ -0,0 +1,319 @@
+/*
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ *  General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
+ *                                                                   USA
+ */
+
+#include <stdio.h>
+
+#include "dtc.h"
+#include "srcpos.h"
+#include "ir.h"
+#include "ir_scope.h"
+
+
+struct ir_scope *irs_scope_stack;
+
+static const char *irs_scope_bits_str[] = {
+	"ROOT",
+	"NODE",
+	"FOR_LOOP",
+	"FUNC_CALL",
+};
+
+
+static const char *irsym_type_str[IRSYM_NUM_TYPES] = {
+	"NONE",
+	"VAR",
+	"FUNCDEF",
+	"PARAM",
+	"CONST",
+};
+
+
+void
+irs_push_scope(irs_type irs_type)
+{
+	struct ir_scope *irs_new;
+
+	irs_new = xmalloc(sizeof(struct ir_scope));
+	memset(irs_new, 0, sizeof(struct ir_scope));
+
+	irs_new->irs_type = irs_type;
+	irs_new->irs_next = irs_scope_stack;
+
+	irs_scope_stack = irs_new;
+}
+
+
+struct ir_scope *
+irs_pop_scope()
+{
+	struct ir_scope *irs_top = irs_scope_stack;
+
+	irs_scope_stack = irs_top->irs_next;
+	irs_top->irs_next = NULL;
+
+	return irs_top;
+}
+
+
+void
+irs_free_scope(struct ir_scope *irs)
+{
+	free(irs);
+}
+
+
+struct ir_scope *
+irs_find_scope(irs_type irs_match)
+{
+	struct ir_scope *irs;
+
+	for (irs = irs_scope_stack; irs != NULL; irs = irs->irs_next) {
+		if (irs->irs_type & irs_match)
+			return irs;
+	}
+	return NULL;
+}
+
+
+void
+irs_append_reserve(struct reserve_info *ri)
+{
+	struct ir_scope *irs;
+
+	irs = irs_find_scope(IRS_ROOT);
+	irs->irs_reserve_list = chain_reserve_entry(ri,
+						    irs->irs_reserve_list);
+}
+
+
+void
+irs_scope_append_property_list(struct property *pl)
+{
+	struct ir_scope *irs;
+	struct property *p;
+
+	irs = irs_find_scope(IRS_NODE);
+	for (p = pl; p != NULL; p = p->next) {
+		irs->irs_prop_list = chain_property(p, irs->irs_prop_list);
+	}
+}
+
+void
+irs_scope_append_node_list(struct node *nl)
+{
+	struct ir_scope *irs;
+	struct node *n;
+
+	irs = irs_find_scope(IRS_NODE);
+	for (n = nl; n != NULL; n = n->parent) {
+		irs->irs_node_list = chain_node(n, irs->irs_node_list);
+	}
+}
+
+
+void
+irs_append_property(struct property *p)
+{
+	struct ir_scope *irs;
+
+	irs = irs_find_scope(IRS_NODE);
+	irs->irs_prop_list = chain_property(p, irs->irs_prop_list);
+}
+
+
+void
+irs_append_node(struct node *n)
+{
+	struct ir_scope *irs;
+
+	irs = irs_find_scope(IRS_NODE | IRS_ROOT);
+	irs->irs_node_list = chain_node(n, irs->irs_node_list);
+}
+
+
+void
+irs_set_return_value(struct ir *ir_ret)
+{
+	struct ir_scope *irs;
+
+	/*
+	 * FIXME: If a  previous irs_expr existed, it just leaked.
+	 */
+	irs = irs_find_scope(IRS_FUNC_CALL);
+	irs->irs_expr = ir_ret;
+}
+
+
+
+struct ir_symbol *
+irs_alloc_symbol(char *name, irsym_type irsym_type)
+{
+	struct ir_symbol *irsym;
+
+	irsym = xmalloc(sizeof(struct ir_symbol));
+	memset(irsym, 0, sizeof(struct ir_symbol));
+
+	irsym->irsym_type = irsym_type;
+	irsym->irsym_name = strdup(name);
+
+	return irsym;
+}
+
+
+void
+irs_add_symbol(struct ir_scope *irs, struct ir_symbol *irsym)
+{
+	irsym->irsym_next = irs->irs_symtab;
+	irs->irs_symtab = irsym;
+}
+
+
+struct ir_symbol *
+irs_lookup_in_scope(struct ir_scope *irs, char *name)
+{
+	struct ir_symbol *irsym;
+
+	for (irsym = irs->irs_symtab; irsym; irsym = irsym->irsym_next)
+		if (strcmp(irsym->irsym_name, name) == 0)
+			return irsym;
+
+	return NULL;
+}
+
+
+struct ir_symbol *
+irs_lookup(char *name, irs_type irs_type)
+{
+	struct ir_scope *irs;
+	struct ir_symbol *irsym;
+
+	/*
+	 * Look through scope stack finding matching scopes.
+	 */
+	for (irs = irs_scope_stack; irs != NULL; irs = irs->irs_next)
+		if (irs->irs_type & irs_type) {
+			irsym = irs_lookup_in_scope(irs, name);
+			if (irsym != NULL)
+				return irsym;
+		}
+
+	return NULL;
+}
+
+
+/*
+ * Try to find a symbol that is local to the innermost function.
+ *
+ * Look through scope stack finding matching scopes.
+ * Peer into FUNC_CALL, FOR_LOOP and IR_ROOT symbol tables,
+ * but bail at first FUNC_CALL to make them be "local".
+ */
+struct ir_symbol *
+irs_lookup_local(char *name)
+{
+	struct ir_scope *irs;
+	struct ir_symbol *irsym;
+
+	for (irs = irs_scope_stack; irs != NULL; irs = irs->irs_next) {
+		if (irs->irs_type & (IRS_FUNC_CALL|IRS_FOR_LOOP|IRS_ROOT)) {
+			irsym = irs_lookup_in_scope(irs, name);
+			if (irsym != NULL)
+				return irsym;
+			if (irs->irs_type & IRS_FUNC_CALL)
+				return NULL;
+		}
+	}
+
+	return NULL;
+}
+
+
+struct ir_symbol *
+irs_create_local(char *name, irsym_type irsym_type)
+{
+	struct ir_scope *irs;
+	struct ir_symbol *irsym;
+
+	for (irs = irs_scope_stack; irs != NULL; irs = irs->irs_next) {
+		if (irs->irs_type & (IRS_FUNC_CALL|IRS_ROOT)) {
+			break;
+		}
+	}
+
+	irsym = irs_alloc_symbol(name, irsym_type);
+	irs_add_symbol(irs_scope_stack, irsym);
+
+	return irsym;
+}
+
+
+struct ir_symbol *
+irs_create_symbol(irs_type irs_type, char *name, irsym_type irsym_type)
+{
+	struct ir_scope *irs;
+	struct ir_symbol *irsym;
+
+	/*
+	 * Check for prior existence of symbol first.
+	 */
+	irsym = irs_lookup(name, irs_type);
+	if (irsym != NULL)
+		return irsym;
+
+	/*
+	 * Create the symbol.
+	 */
+	irsym = irs_alloc_symbol(name, irsym_type);
+
+	/*
+	 * Locate the right scope and add symbol.
+	 */
+	irs = irs_find_scope(irs_type);
+	irs_add_symbol(irs, irsym);
+
+	return irsym;
+}
+
+
+void
+irs_dump_symbols(void)
+{
+	struct ir_scope *irs;
+	struct ir_symbol *irsym;
+	int i;
+
+	/*
+	 * Look through scope stack.
+	 */
+	for (irs = irs_scope_stack; irs != NULL; irs = irs->irs_next) {
+		printf("Type: 0x%02x : ", irs->irs_type);
+		for (i = 0; i < IRS_MAX_BIT; i++) {
+			if (irs->irs_type & (1 << i))
+				printf("%s ", irs_scope_bits_str[i]);
+		}
+		printf("\n");
+		for (irsym = irs->irs_symtab;
+		     irsym != NULL;
+		     irsym = irsym->irsym_next) {
+			printf("    %s : %s\n",
+			       irsym_type_str[irsym->irsym_type],
+			       irsym->irsym_name);
+		}
+	}
+}
-- 
1.6.0.90.g436ed
