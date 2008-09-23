From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH 4/8] Add header files for new Internal Representation form.
Date: Tue, 23 Sep 2008 14:04:08 -0500
Message-ID: <1222196652-13811-5-git-send-email-jdl@jdl.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<1222196652-13811-2-git-send-email-jdl@jdl.com>
	<1222196652-13811-3-git-send-email-jdl@jdl.com>
	<1222196652-13811-4-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-4-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
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
 ir.h         |  161 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ir_builtin.h |   41 +++++++++++++++
 ir_scope.h   |  114 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 316 insertions(+), 0 deletions(-)
 create mode 100644 ir.h
 create mode 100644 ir_builtin.h
 create mode 100644 ir_scope.h

diff --git a/ir.h b/ir.h
new file mode 100644
index 0000000..7d27fe7
--- /dev/null
+++ b/ir.h
@@ -0,0 +1,161 @@
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
+#ifndef _IR_H_
+#define _IR_H_
+
+#include "srcpos.h"
+#include "ir_builtin.h"
+
+
+#define IR_UNDEF	0
+#define IR_ROOT		1
+#define IR_MEM_RESERVE	2
+#define IR_ASSIGN	3
+#define IR_PROP_DEF	4
+#define IR_REF_PHANDLE	5
+#define IR_REF_PATH	6
+#define IR_CELL		7
+#define IR_LITERAL	8
+#define IR_LIT_STR	9
+#define IR_LIT_BYTE	10
+#define IR_LABEL	11
+#define IR_LIST		12
+#define IR_INCBIN	13
+#define IR_BUILTIN	14
+#define IR_SELECT	15
+#define IR_OR		16
+#define IR_AND		17
+#define IR_BIT_OR	18
+#define IR_BIT_XOR	19
+#define IR_BIT_AND	20
+#define IR_EQ		21
+#define IR_LT		22
+#define IR_LE		23
+#define IR_GT		24
+#define IR_GE		25
+#define IR_NE		26
+#define IR_LSHIFT	27
+#define IR_RSHIFT	28
+#define IR_ADD		29
+#define IR_MINUS	30
+#define IR_MULT		31
+#define IR_DIV		32
+#define IR_MOD		33
+#define IR_UMINUS	34
+#define IR_BIT_COMPL	35
+#define IR_NOT		36
+#define IR_FUNC_DEF	37
+#define IR_FOR		38
+#define IR_RETURN	39
+#define IR_RANGE	40
+#define IR_ID		41
+#define IR_IF		42
+#define IR_PARAMDECL	43
+#define IR_FUNC_CALL	44
+#define IR_NODE		45
+#define IR_PROPNODENAME	46
+#define IR_LIT_CELL	47
+#define IR_LIT_ADDR	48
+#define IR_CVT_PROPNODENAME	49
+#define IR_CVT_STRING	50
+#define IR_CONST_DEF	51
+
+#define IR_NUM_TYPES	52
+
+
+typedef unsigned int ir_type;
+
+extern char const *ir_type_string(ir_type ir_type);
+
+
+struct ir {
+	ir_type ir_type;
+	srcpos *ir_srcpos;
+
+	long long ir_literal;
+	char *ir_lit_str;
+	char *ir_label_name;
+	irb_id ir_builtin_id;
+
+	struct ir *ir_name;
+	struct ir *ir_label;
+	struct ir *ir_expr1;
+	struct ir *ir_expr2;
+	struct ir *ir_expr3;
+
+	struct ir *ir_mem_reserves;
+	struct ir *ir_statements;
+	struct ir *ir_statements2;
+	struct ir *ir_declarations;
+
+	struct ir *ir_first;
+	struct ir *ir_last;
+	struct ir *ir_prev;
+	struct ir *ir_next;
+};
+
+
+extern struct ir *the_ir_tree;
+
+extern struct ir *ir_alloc(ir_type ir_type, srcpos *);
+extern struct ir *ir_copy(struct ir *ir);	/* shallow copy */
+extern void ir_free(struct ir *ir);
+extern void ir_free_all(struct ir *ir);
+
+extern struct ir *ir_alloc_unop(ir_type ir_type,
+				struct ir *ir1,
+				srcpos *pos);
+extern struct ir *ir_alloc_binop(ir_type ir_type,
+				 struct ir *ir1,
+				 struct ir *ir2,
+				 srcpos *pos);
+extern struct ir *ir_alloc_triop(ir_type ir_type,
+				 struct ir *ir1,
+				 struct ir *ir2,
+				 struct ir *ir3,
+				 srcpos *pos);
+extern struct ir *ir_list_append(struct ir *ir_list, struct ir *ir_node);
+extern void ir_dump(struct ir *ir);
+extern struct ir *ir_eval(struct ir *ir);
+extern struct ir_scope *ir_eval_func_body(struct ir *ir_func);
+
+extern void ir_process(void);
+extern struct ir *ir_simplify(struct ir *ir, unsigned int ctxt);
+extern void ir_emit(struct ir *ir);
+extern void ir_emit_statement_list(struct ir *ir_list);
+
+
+#define IR_EVAL_CTXT_ANY	0
+#define IR_EVAL_CTXT_CELL	1
+
+extern int ir_is_constant(struct ir *ir);
+extern int ir_is_string(struct ir *ir);
+extern char *ir_eval_for_label(struct ir *ir);
+extern char *ir_eval_for_name(struct ir *ir);
+extern uint64_t ir_eval_for_addr(struct ir *ir);
+extern void ir_eval_for_data(struct ir *ir, struct data *d);
+extern char *ir_eval_for_c_string(struct ir *ir);
+
+extern void ir_warn(struct ir *ir, char const *fmt, ...)
+			__attribute__((format(printf, 2, 3)));
+extern void ir_error(struct ir *ir, char const *, ...)
+			__attribute__((format(printf, 2, 3)));
+
+#endif /* _IR_H_ */
diff --git a/ir_builtin.h b/ir_builtin.h
new file mode 100644
index 0000000..c4e1b18
--- /dev/null
+++ b/ir_builtin.h
@@ -0,0 +1,41 @@
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
+#ifndef _IR_BUILTIN_H_
+#define _IR_BUILTIN_H_
+
+
+#define IRB_UNDEF		0
+#define IRB_JOIN		1
+
+typedef unsigned int irb_id;
+
+typedef struct ir * (*irb_impl_func)(struct ir *ir_params);
+
+struct irb_entry {
+	irb_id irb_id;
+	char *irb_name;
+	irb_impl_func irb_implementation;
+};
+
+
+extern irb_id ir_lookup_builtin_by_name(char *str_name);
+extern struct ir *ir_eval_builtin(struct ir *ir);
+
+#endif /* _IR_BUILTIN_H_ */
diff --git a/ir_scope.h b/ir_scope.h
new file mode 100644
index 0000000..4529d50
--- /dev/null
+++ b/ir_scope.h
@@ -0,0 +1,114 @@
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
+#ifndef _IR_SCOPE_H_
+#define _IR_SCOPE_H_
+
+/*
+ * IR Symbols and Symbol Tables
+ *
+ * Each ir_scope structure can have its own Symbol Table, represented
+ * as a simple linked list of symbols.
+ *
+ * As the number of symbols and scopes is expected to be relatively
+ * small (dozens total), and not large (hundreds or more), the
+ * current implementation is a dead-simple brute force linear search
+ * of a Symbol Table.
+ *
+ * Symbol Table operations (add, lookup) are implicitly performed
+ * relative to the IR Scope Stack.
+ *
+ * During evaluation of the IR form, each symbol can have at most
+ * one value, represented as an IR expression.  In the case of
+ * variables (or constants), the IR expression should be a
+ * literal of some type.  For function definitions, the expression
+ * is the complete IR representation of the function definition.
+ */
+
+#define IRSYM_NONE	0
+#define IRSYM_VAR	1
+#define IRSYM_FUNCDEF	2
+#define IRSYM_PARAM	3
+#define IRSYM_CONST	4
+
+#define IRSYM_NUM_TYPES	5
+
+typedef unsigned int irsym_type;
+
+struct ir_symbol {
+	irsym_type irsym_type;
+	char *irsym_name;
+	struct ir *irsym_value;
+	struct ir_symbol *irsym_next;
+};
+
+
+
+/*
+ * IR Evaluation Scope
+ */
+
+#define IRS_NONE	0x00
+#define IRS_ROOT	0x01
+#define IRS_NODE	0x02
+#define IRS_FOR_LOOP	0x04
+#define IRS_FUNC_CALL	0x08
+
+#define IRS_MAX_BIT	IRS_FUNC_CALL
+#define IRS_ANY		0xFF
+
+typedef unsigned int irs_type;
+
+struct ir_scope {
+	irs_type irs_type;
+	struct ir_symbol *irs_symtab;
+	struct ir *irs_expr;
+	struct reserve_info *irs_reserve_list;
+	struct property *irs_prop_list;
+	struct node *irs_node_list;
+
+	struct ir_scope *irs_next;
+};
+
+/*
+ * Each entry on this stack provides an evaluation environment.
+ */
+extern struct ir_scope *irs_scope_stack;
+
+extern void irs_push_scope(irs_type irs_type);
+extern struct ir_scope *irs_pop_scope(void);
+
+extern void irs_append_reserve(struct reserve_info *ri);
+extern void irs_append_property(struct property *p);
+extern void irs_append_node(struct node *n);
+extern void irs_scope_append_node_list(struct node *nl);
+extern void irs_scope_append_property_list(struct property *pl);
+extern void irs_set_return_value(struct ir *ir_ret);
+
+extern struct ir_symbol *irs_alloc_symbol(char *name, irsym_type irsym_type);
+extern struct ir_symbol *irs_lookup_in_scope(struct ir_scope *irs, char *name);
+extern struct ir_symbol *irs_lookup(char *name, irs_type irs_type);
+extern struct ir_symbol *irs_lookup_local(char *name);
+extern struct ir_symbol *irs_create_local(char *name, irsym_type irsym_type);
+extern struct ir_symbol *irs_create_symbol(irs_type irs_type,
+					   char *name,
+					   irsym_type irsym_type);
+extern void irs_dump_symbols(void);
+
+#endif /* _IR_SCOPE_H_ */
-- 
1.6.0.90.g436ed
