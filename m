From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 5/8] Add most of the new IR implementation files.
Date: Wed, 24 Sep 2008 17:25:29 -0500
Message-ID: <48DABE59.6070302@freescale.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>	<1222196652-13811-2-git-send-email-jdl@jdl.com>	<1222196652-13811-3-git-send-email-jdl@jdl.com>	<1222196652-13811-4-git-send-email-jdl@jdl.com>	<1222196652-13811-5-git-send-email-jdl@jdl.com>
	<1222196652-13811-6-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222196652-13811-6-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jon Loeliger wrote:
> Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  ir.c         |  197 +++++++++++++++++++++++
>  ir_builtin.c |  178 +++++++++++++++++++++
>  ir_dump.c    |  220 ++++++++++++++++++++++++++
>  ir_emit.c    |  492 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  ir_scope.c   |  319 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 1406 insertions(+), 0 deletions(-)
>  create mode 100644 ir.c
>  create mode 100644 ir_builtin.c
>  create mode 100644 ir_dump.c
>  create mode 100644 ir_emit.c
>  create mode 100644 ir_scope.c
> 



> +void
> +ir_free(struct ir *ir)
> +{
> +}
> +
> +
> +void
> +ir_free_all(struct ir *ir)
> +{
> +}

Hmm.

> +extern struct ir *
> +ir_alloc_unop(ir_type ir_type, struct ir *ir1, srcpos *pos)
> +{
> +    struct ir *ir;
> +
> +    ir = ir_alloc(ir_type, pos);
> +    ir->ir_expr1 = ir1;
> +
> +    return ir;
> +}
> +
> +
> +extern struct ir *
> +ir_alloc_binop(ir_type ir_type,
> +	       struct ir *ir1, struct ir *ir2,
> +	       srcpos *pos)
> +{
> +    struct ir *ir;
> +
> +    ir = ir_alloc(ir_type, pos);
> +    ir->ir_expr1 = ir1;
> +    ir->ir_expr2 = ir2;
> +
> +    return ir;
> +}
> +
> +
> +extern struct ir *
> +ir_alloc_triop(ir_type ir_type,
> +	       struct ir *ir1, struct ir *ir2, struct ir *ir3,
> +	       srcpos *pos)
> +{
> +    struct ir *ir;
> +
> +    ir = ir_alloc(ir_type, pos);
> +    ir->ir_expr1 = ir1;
> +    ir->ir_expr2 = ir2;
> +    ir->ir_expr3 = ir3;
> +
> +    return ir;
> +}

Yay, constructors in C.

> +	ir_node->ir_prev = ir_list->ir_last;
> +
> +	if (ir_list->ir_last) {
> +		ir_list->ir_last->ir_next = ir_node;
> +	} else {
> +		ir_list->ir_first = ir_node;
> +	}
> +
> +	ir_list->ir_last = ir_node;

Can't we use something a generic linked list implementation, as in the 
kernel?

> +void
> +ir_process(void)
> +{
> +	/*
> +	 * FIXME: Fix leaking the whole orginal IR tree here.
> +	 */
> +	the_ir_tree = ir_simplify(the_ir_tree, IR_EVAL_CTXT_ANY);
> +
> +	ir_emit(the_ir_tree);
> +}

You don't add ir_simplify until the next patch.

> +void
> +ir_warn(struct ir *ir, char const *fmt, ...)
> +{
> +	srcpos *pos;
> +	const char *srcstr;
> +	va_list va;
> +	va_start(va, fmt);
> +
> +	pos = ir ? ir->ir_srcpos : &srcpos_empty;
> +	srcstr = srcpos_string(pos);
> +
> +	fprintf(stderr, "Error: %s ", srcstr);
> +	vfprintf(stderr, fmt, va);
> +	fprintf(stderr, "\n");
> +
> +	va_end(va);
> +}
> +
> +
> +void
> +ir_error(struct ir *ir, char const *fmt, ...)
> +{
> +	srcpos *pos;
> +	const char *srcstr;
> +	va_list va;
> +	va_start(va, fmt);
> +
> +	pos = ir ? ir->ir_srcpos : &srcpos_empty;
> +	srcstr = srcpos_string(pos);
> +
> +	fprintf(stderr, "Warn: %s ", srcstr);
> +	vfprintf(stderr, fmt, va);
> +	fprintf(stderr, "\n");
> +
> +	treesource_error = 1;
> +	va_end(va);
> +}

These should be one function with a parameter distinguishing them.

> diff --git a/ir_builtin.c b/ir_builtin.c
> new file mode 100644
> index 0000000..2f33440
> --- /dev/null
> +++ b/ir_builtin.c
> @@ -0,0 +1,178 @@
> +/*
> + * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + *  General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, write to the Free Software
> + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> + *                                                                   USA
> + */
> +
> +#include <stdio.h>
> +
> +#include "dtc.h"
> +#include "ir.h"
> +
> +struct ir *ir_builtin_join(struct ir *ir_params);
> +struct ir *ir_builtin_hexstr(struct ir *ir_params);
> +
> +static const struct irb_entry irb_builtins[] = {
> +	{ 0, NULL, NULL },
> +	{ 1, "join", ir_builtin_join },
> +	{ 2, "hexstr", ir_builtin_hexstr },
> +};

What purpose does the initial NULL entry serve?

> +#define IRB_NUM_BUILTINS	ARRAY_SIZE(irb_builtins)

...other than changing MAX_BUILTIN to NUM_BUILTINS (or, you could just 
use ARRAY_SIZE in the loop itself).

Or if this weren't C, we could just use an existing dictionary 
implementation without having to do all this crap from scratch every time.

> +struct ir *
> +ir_eval_builtin(struct ir *ir)
> +{
> +	irb_id irb;
> +	const struct irb_entry *irbe;
> +	struct ir *ir_new;
> +
> +	if (ir == NULL)
> +		return NULL;
> +
> +	if (ir->ir_type != IR_BUILTIN)
> +		return NULL;
> +
> +	irb = ir->ir_builtin_id;
> +
> +	if (irb <= IRB_UNDEF || irb >= IRB_NUM_BUILTINS)
> +		return NULL;

Shouldn't we fail rather more loudly if any of these conditions actually 
happens?

> +	ir_new = (*irbe->irb_implementation)(ir);
> +
> +	return ir_new;

Why not just "return irbe->irb_implementation(ir);"?

> +struct ir *
> +ir_builtin_join(struct ir *ir_builtin)
> +{

How does this builtin differ from the concatenation operator, other than 
that in the latter at least one argument must already be a string?  I 
noticed join() wasn't used in either of your example trees, can you give 
an example when you would use it?

> +	struct ir *ir_new;
> +	struct ir *irp;
> +	struct ir *ir;
> +	char *s;
> +	char *str;
> +	int len;
> +	char buf[30];
> +
> +	debug("ir_builtin_impl_join():\n");
> +
> +	irp = ir_builtin->ir_expr1;
> +	if (irp->ir_type == IR_LIST)
> +		irp = irp->ir_first;
> +
> +	len = 1;
> +	str = xmalloc(1);
> +	*str  = 0;
> +
> +	while (irp != NULL) {
> +		ir = ir_eval(irp);
> +
> +		if (ir_is_string(ir)) {
> +			s = ir_eval_for_c_string(ir);
> +		} else if (ir_is_constant(ir)) {
> +			unsigned long long a;
> +			a = ir_eval_for_addr(ir);
> +			snprintf(buf, 30, "%llu", a);
> +			s = buf;

Use sizeof(buf).

> +#include "ir.h"
> +#include "ir_scope.h"
> +#include "nv.h"
> +
> +extern struct boot_info *the_boot_info;

This is already in ir.h.

> +void ir_emit_node(struct ir *ir);

Should either be static, or declared in a header file.

> +void
> +ir_emit_prop_def(struct ir *irp)
> +{
> +	struct ir *ir_lhs;
> +	struct property *p;
> +	char *prop_name;
> +	char *lab;
> +	struct data d;
> +
> +	debug("ir_emit_prop_def(");
> +
> +	lab = ir_eval_for_label(irp->ir_label);
> +	if (lab) {
> +		debug("%s : ", lab);
> +	}
> +
> +	ir_lhs = ir_eval(irp->ir_expr1);
> +	prop_name = ir_eval_for_name(ir_lhs);
> +	debug("%s = <expr>)\n", prop_name);
> +
> +	if (prop_name) {
> +		d = empty_data;
> +		ir_eval_for_data(irp->ir_expr2, &d);

ir_eval_for_data() is also not defined until patch 6.  Breaking patches 
up doesn't aid reviewability if they're not self-contained.

> +		p =  build_property(prop_name, d, lab);
> +		irs_append_property(p);
> +	}
> +
> +	debug("ir_emit_prop_def(): Done\n");
> +}
> +
> +
> +void
> +ir_emit_assign(struct ir *ir_assign)
> +{
> +	char *var_name;
> +	struct ir_symbol *irsym;
> +	struct ir *ir_val;
> +	struct ir *ir_pos;
> +
> +	ir_pos = ir_assign->ir_expr1 ? ir_assign->ir_expr1 : ir_assign;
> +
> +	var_name = ir_eval_for_name(ir_assign->ir_expr1);
> +
> +	debug("ir_emit_assign(%s)\n", var_name);
> +
> +	if (!var_name) {
> +		ir_error(ir_pos, "Can't determine LHS name\n");
> +		return;
> +	}
> +
> +	irsym = irs_lookup_local(var_name);
> +	if (irsym != NULL) {
> +		if (irsym->irsym_type == IRSYM_CONST) {
> +			ir_error(ir_pos,
> +				 "Can't assign to constant \"%s\"\n",
> +				 var_name);
> +		}
> +	} else {
> +		/*
> +		 * FIXME: Debate on-the-fly creation or pre-declaration.
> +		 */
> +		irsym = irs_create_local(var_name, IRSYM_VAR);
> +	}
> +
> +	ir_val = ir_eval(ir_assign->ir_expr2);
> +	irsym->irsym_value = ir_val;
> +}
> +
> +
> +void
> +ir_emit_for(struct ir *ir_for)
> +{
> +	char *var_name;
> +	struct ir_symbol *irsym;
> +	struct ir *ir_id;
> +	struct ir *ir_val;
> +	struct ir *ir_range;
> +	unsigned long long var;
> +	unsigned long long start;
> +	unsigned long long stop;
> +
> +	irs_push_scope(IRS_FOR_LOOP);
> +
> +	/*
> +	 * Introduce for-loop variable into FOR_LOOP scope.
> +	 */
> +	ir_id = ir_for->ir_expr1;
> +	var_name = ir_eval_for_name(ir_id);
> +	irsym = irs_create_local(var_name, IRSYM_VAR);
> +
> +	ir_val = ir_alloc(IR_LIT_ADDR, ir_id->ir_srcpos);
> +	irsym->irsym_value = ir_val;
> +
> +	ir_range = ir_for->ir_expr2;
> +	start = ir_eval_for_addr(ir_range->ir_expr1);
> +	stop = ir_eval_for_addr(ir_range->ir_expr2);
> +
> +	debug("Range appears to be %llu to %llu\n", start, stop);
> +
> +	var = start;
> +	while (var <= stop ) {
> +	    ir_val->ir_literal = var;   
> +	    ir_emit_statement_list(ir_for->ir_statements);
> +	    var++;
> +	}
> +
> +	irs_pop_scope();
> +}
> +
> +
> +void
> +ir_emit_if(struct ir *ir_if)
> +{
> +	uint64_t lit;
> +
> +	debug("ir_if()\n");
> +	lit = ir_eval_for_addr(ir_if->ir_expr1);
> +	if (lit) {
> +		ir_emit_statement_list(ir_if->ir_statements);
> +	} else {
> +		ir_emit_statement_list(ir_if->ir_statements2);
> +	}
> +}
> +
> +
> +void
> +ir_emit_return(struct ir *ir_return)
> +{
> +	struct ir *ir_ret_expr;
> +
> +	ir_ret_expr = ir_eval(ir_return->ir_expr1);
> +	irs_set_return_value(ir_ret_expr);
> +}
> +
> +
> +void
> +ir_emit_func_call(struct ir *ir_func)
> +{
> +	struct ir_scope *irs_scope;
> +
> +	/*
> +	 * Perform function body.
> +	 *
> +	 * Returned scope has node and property "side effects".
> +	 * Function return value is thrown to /dev/null.
> +	 */
> +	irs_scope = ir_eval_func_body(ir_func);
> +
> +	/*
> +	 * Propagate any nodes or properties into parent scope.
> +	 */
> +	irs_scope_append_property_list(irs_scope->irs_prop_list);
> +	irs_scope_append_node_list(irs_scope->irs_node_list);
> +}
> +
> +
> +void
> +ir_emit_statement(struct ir *ir)
> +{
> +	if (ir == NULL)
> +		return;
> +
> +	switch (ir->ir_type) {
> +	case IR_NODE:
> +		ir_emit_node(ir);
> +		break;
> +
> +	case IR_PROP_DEF:
> +		ir_emit_prop_def(ir);
> +		break;
> +
> +	case IR_FOR:
> +		ir_emit_for(ir);
> +		break;
> +
> +	case IR_IF:
> +		ir_emit_if(ir);
> +		break;
> +
> +	case IR_RETURN:
> +		ir_emit_return(ir);
> +		break;
> +
> +	case IR_ASSIGN:
> +		ir_emit_assign(ir);
> +		break;
> +
> +	case IR_FUNC_CALL:
> +		ir_emit_func_call(ir);
> +		break;
> +
> +	case IR_LIST:
> +		/*
> +		 * FIXME: LIST within a LIST.  Optimize out earlier?
> +		 */
> +		ir_emit_statement_list(ir);
> +		break;
> +
> +	default:
> +		ir_error(ir, "Unknown statement with ir_type %s\n",
> +			 ir_type_string(ir->ir_type));
> +	}
> +}
> +
> +
> +void
> +ir_emit_statement_list(struct ir *ir_list)
> +{
> +	struct ir *ir;
> +
> +	if (ir_list == NULL)
> +		return;
> +
> +	if (ir_list->ir_type != IR_LIST)
> +		return;
> +
> +	for (ir = ir_list->ir_first; ir != NULL; ir = ir->ir_next) {
> +		ir_emit_statement(ir);
> +	}
> +}
> +
> +
> +/*
> + * Enter a /define/ function definitin into IRS_ROOT symtab.
> + */
> +void
> +ir_emit_func_def(struct ir *ir_func_def)
> +{
> +	char *func_name;
> +	struct ir_symbol *irsym;
> +	struct ir *ir_pos;
> +
> +	ir_pos = ir_func_def->ir_expr1
> +		? ir_func_def->ir_expr1 : ir_func_def;
> +
> +	func_name = ir_eval_for_name(ir_func_def->ir_name);
> +
> +
> +	irsym = irs_lookup(func_name, IRS_ROOT);
> +	if (irsym != NULL) {
> +		ir_warn(ir_pos,
> +			"Redefinintion of \"%s\" ignored\n",
> +		        func_name);

That seems it should be an error, not a warning.

> +void
> +ir_emit_root(struct ir *ir)
> +{
> +	struct reserve_info *ri_list;
> +	struct node *node_list;
> +
> +	if (ir == NULL)
> +		return;
> +
> +	if (ir->ir_type != IR_ROOT) {
> +		debug("emit: Bad root node\n");
> +		return;
> +	}

Again, this seems too quiet a failure -- you have to have debug messages 
enabled to see that anything's wrong.

> +void
> +irs_free_scope(struct ir_scope *irs)
> +{
> +	free(irs);
> +}

The IRS is never free. :-)

> +/*
> + * Try to find a symbol that is local to the innermost function.
> + *
> + * Look through scope stack finding matching scopes.
> + * Peer into FUNC_CALL, FOR_LOOP and IR_ROOT symbol tables,
> + * but bail at first FUNC_CALL to make them be "local".
> + */

No declaration scoping in if-blocks?

-Scott
