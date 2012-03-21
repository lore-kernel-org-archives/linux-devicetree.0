From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: Basic cell expressions
Date: Wed, 21 Mar 2012 15:00:36 +1100
Message-ID: <20120321040036.GD15997@truffala.fritz.box>
References: <1332296951-19797-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332296951-19797-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 08:29:11PM -0600, Stephen Warren wrote:
> Written by David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>. Ported to ToT
> dtc by me. Added >> test. Commented a couple of failing tests.

Thanks for doing this port.  Some recommendations below, though.

First, "cell expressions" was a term that made sense when I first
wrote this, since cell lists which were always 32-bit were the only
real use case.  Since then, however, cell lists have become arrays and
can have different sizes.

So, I'd like to see pretty much a s/cell/integer/g change to this.

> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> This is a port of David's cell expressions patch to ToT. It passes all
> enabled tests, but a few fail and are commented out.
>  dtc-lexer.l              |    9 +++
>  dtc-parser.y             |  119 +++++++++++++++++++++++++++++++++++++++++---
>  tests/Makefile.tests     |    3 +-
>  tests/cell-expressions.c |  123 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/run_tests.sh       |    5 ++
>  5 files changed, 249 insertions(+), 10 deletions(-)
>  create mode 100644 tests/cell-expressions.c
> 
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index 73d190c..c7d31cc 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -164,6 +164,15 @@ static int pop_input_file(void);
>  <*>{COMMENT}+	/* eat C-style comments */
>  <*>{LINECOMMENT}+ /* eat C++-style comments */
>  
> +<*>"<<"		{ return DT_LSHIFT; };
> +<*>">>"		{ return DT_RSHIFT; };
> +<*>"<="		{ return DT_LE; };
> +<*>">="		{ return DT_GE; };
> +<*>"=="		{ return DT_EQ; };
> +<*>"!="		{ return DT_NE; };
> +<*>"&&"		{ return DT_AND; };
> +<*>"||"		{ return DT_OR; };
> +
>  <*>.		{
>  			DPRINT("Char: %c (\\x%02x)\n", yytext[0],
>  				(unsigned)yytext[0]);
> diff --git a/dtc-parser.y b/dtc-parser.y
> index 348616b..39bef4b 100644
> --- a/dtc-parser.y
> +++ b/dtc-parser.y
> @@ -56,10 +56,12 @@ static unsigned char eval_char_literal(const char *s);
>  	struct node *node;
>  	struct node *nodelist;
>  	struct reserve_info *re;
> +	uint64_t cell;
>  }
>  
>  %token DT_V1
>  %token DT_MEMRESERVE
> +%token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
>  %token DT_BITS
>  %token <propnodename> DT_PROPNODENAME
>  %token <literal> DT_LITERAL
> @@ -86,6 +88,21 @@ static unsigned char eval_char_literal(const char *s);
>  %type <node> subnode
>  %type <nodelist> subnodes
>  
> +%type <cell> cell_prim
> +%type <cell> cell_unary
> +%type <cell> cell_mul
> +%type <cell> cell_add
> +%type <cell> cell_shift
> +%type <cell> cell_rela
> +%type <cell> cell_eq
> +%type <cell> cell_bitand
> +%type <cell> cell_bitxor
> +%type <cell> cell_bitor
> +%type <cell> cell_and
> +%type <cell> cell_or
> +%type <cell> cell_trinary
> +%type <cell> cell_expr
> +
>  %%
>  
>  sourcefile:
> @@ -267,17 +284,12 @@ arrayprefix:
>  			$$.data = empty_data;
>  			$$.bits = 32;
>  		}
> -	| arrayprefix DT_LITERAL
> -		{
> -			uint64_t val = eval_literal($2, 0, $1.bits);
> -
> -			$$.data = data_append_integer($1.data, val, $1.bits);
> -		}
> -	| arrayprefix DT_CHAR_LITERAL
> +	| arrayprefix cell_prim
>  		{
> -			uint64_t val = eval_char_literal($2);
> +			if (($1.bits < 64) && ($2 >= (1ULL << $1.bits)))
> +				print_error("cell value out of range");

Ok, so all internal arithmetic in 64-bit, then an error if that leads
to truncation here.  Sounds reasonable, although I do worry slightly
if people might expect wraparound arithmetic for 32-bit integers.
Meh, it's easy enough for them to add an explicit mask.  It is a
little inconsistent that final step overflows are trapped, but
overflows in intermediate steps are not.

> -			$$.data = data_append_integer($1.data, val, $1.bits);
> +			$$.data = data_append_integer($1.data, $2, $1.bits);
>  		}
>  	| arrayprefix DT_REF
>  		{
> @@ -299,6 +311,95 @@ arrayprefix:
>  		}
>  	;
>  
> +cell_prim:
> +	  DT_LITERAL
> +		{
> +			$$ = eval_literal($1, 0, 64);
> +		}
> +	| DT_CHAR_LITERAL
> +		{
> +			$$ = eval_char_literal($1);
> +		}
> +	| '(' cell_expr ')'
> +		{
> +			$$ = $2;
> +		}
> +	;
> +
> +cell_expr:
> +	cell_trinary
> +	;
> +
> +cell_trinary:
> +	  cell_or
> +	| cell_or '?' cell_expr ':' cell_trinary { $$ = $1 ? $3 : $5 }
> +	;
> +
> +cell_or:
> +	  cell_and
> +	| cell_or DT_OR cell_and { $$ = $1 || $3 };
> +	;
> +
> +cell_and:
> +	  cell_bitor
> +	| cell_and DT_AND cell_bitor { $$ = $1 && $3 };
> +	;
> +
> +cell_bitor:
> +	  cell_bitxor
> +	| cell_bitor '|' cell_bitxor { $$ = $1 | $3 };
> +	;
> +
> +cell_bitxor:
> +	  cell_bitand
> +	| cell_bitxor '^' cell_bitand { $$ = $1 ^ $3 };
> +	;
> +
> +cell_bitand:
> +	  cell_eq
> +	| cell_bitand '&' cell_eq { $$ = $1 & $3 };
> +	;
> +
> +cell_eq:
> +	  cell_rela
> +	| cell_eq DT_EQ cell_rela { $$ = $1 == $3; }
> +	| cell_eq DT_NE cell_rela { $$ = $1 != $3; }
> +	;
> +
> +cell_rela:
> +	  cell_shift
> +	| cell_rela '<' cell_shift { $$ = $1 < $3; }
> +	| cell_rela '>' cell_shift { $$ = $1 > $3; }
> +	| cell_rela DT_LE cell_shift { $$ = $1 <= $3; }
> +	| cell_rela DT_GE cell_shift { $$ = $1 >= $3; }
> +	;
> +
> +cell_shift:
> +	  cell_shift DT_LSHIFT cell_add { $$ = $1 << $3; }
> +	| cell_shift DT_RSHIFT cell_add { $$ = $1 >> $3; }
> +	| cell_add
> +	;
> +
> +cell_add:
> +	  cell_add '+' cell_mul { $$ = $1 + $3; }
> +	| cell_add '-' cell_mul { $$ = $1 - $3; }
> +	| cell_mul
> +	;
> +
> +cell_mul:
> +	  cell_mul '*' cell_unary { $$ = $1 * $3; }
> +	| cell_mul '/' cell_unary { $$ = $1 / $3; }
> +	| cell_mul '%' cell_unary { $$ = $1 % $3; }
> +	| cell_unary
> +	;
> +
> +cell_unary:
> +	  cell_prim
> +	| '-' cell_unary { $$ = -$2; }
> +	| '~' cell_unary { $$ = ~$2; }
> +	| '!' cell_unary { $$ = !$2; }
> +	;
> +
>  bytestring:
>  	  /* empty */
>  		{
> diff --git a/tests/Makefile.tests b/tests/Makefile.tests
> index 2eee708..930d1a5 100644
> --- a/tests/Makefile.tests
> +++ b/tests/Makefile.tests
> @@ -19,7 +19,8 @@ LIB_TESTS_L = get_mem_rsv \
>  	dtbs_equal_ordered \
>  	dtb_reverse dtbs_equal_unordered \
>  	add_subnode_with_nops path_offset_aliases \
> -	utilfdt_test
> +	utilfdt_test \
> +	cell-expressions
>  LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREFIX)%)
>  
>  LIBTREE_TESTS_L = truncated_property
> diff --git a/tests/cell-expressions.c b/tests/cell-expressions.c
> new file mode 100644
> index 0000000..17b601a
> --- /dev/null
> +++ b/tests/cell-expressions.c
> @@ -0,0 +1,123 @@
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for dtc expression support
> + * Copyright (C) 2008 David Gibson, IBM Corporation.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public License
> + * as published by the Free Software Foundation; either version 2.1 of
> + * the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
> + */
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +#include <errno.h>
> +
> +
> +#include <fdt.h>
> +#include <libfdt.h>
> +
> +#include "tests.h"
> +#include "testdata.h"
> +
> +struct test_expr {
> +	const char *expr;
> +	uint32_t result;
> +} expr_table[] = {
> +#define TE(expr)	{ #expr, (expr) }
> +	TE(0xdeadbeef),
> +	// Fails: Probably because cell values can't be negative
> +	//TE(-0x21524111),

So, the curly thing is, I think this would work if you specified
64-bit array elements.  In the original, the idea was that although
the cell values would be treated as unsigned, you could specify a
signed value and the correct two's complement thing would go in.  In
your version the check for truncation when we cut the 64-bit
intermediate down to 32-bits is defeating that.

> +	TE(1+1),
> +	TE(2*3),
> +	TE(4/2),
> +	TE(10/3),
> +	TE(19%4),
> +	TE(1 << 13),
> +	TE(0x1000 >> 4),
> +	TE(3*2+1), TE(3*(2+1)),
> +	TE(1+2*3), TE((1+2)*3),
> +	TE(1 < 2), TE(2 < 1), TE(1 < 1),
> +	TE(1 <= 2), TE(2 <= 1), TE(1 <= 1),
> +	TE(1 > 2), TE(2 > 1), TE(1 > 1),
> +	TE(1 >= 2), TE(2 >= 1), TE(1 >= 1),
> +	TE(1 == 1), TE(1 == 2),
> +	TE(1 != 1), TE(1 != 2),> +	TE(0xabcdabcd & 0xffff0000),
> +	TE(0xdead4110 ^ 0xf0f0f0f0),
> +	TE(0xabcd0000 | 0x0000abcd),
> +	// Fails: Probably related to MSB being set implying negative?
> +	//TE(~0x21524110),

Not exactly, it's the truncation thing again - the ~ sets the high
32-bits, which the truncation check then objects to.

> +	TE(~~0xdeadbeef),
> +	TE(0 && 0), TE(17 && 0), TE(0 && 17), TE(17 && 17),
> +	TE(0 || 0), TE(17 || 0), TE(0 || 17), TE(17 || 17),
> +	TE(!0), TE(!1), TE(!17), TE(!!0), TE(!!17),
> +	TE(0 ? 17 : 39), TE(1 ? 17 : 39), TE(17 ? 0xdeadbeef : 0xabcd1234),
> +	// Fails:
> +	// tests/cell-expressions.c:69:2: error: integer overflow in expression [-Werror=overflow]
> +	// Can be fixed by adding ULL to a constant below, but dtc doesn't
> +	// support that, so dtc errors out.
> +	//TE(11 * 257 * 1321517),

Hrm, yes.  Might be worth making dtc accept the C int literal
suffixes, even if it basically ignores them.

On a tangent, that reminds me of an argument for using actual cpp with
hacks for the # problem, rather than our own preprocessor - it lets
defines be easily shared between C and dts files in a big project.

> +	TE(123456790 - 4/2 + 17%4),
> +};
> +
> +#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
> +
> +int main(int argc, char *argv[])
> +{
> +	void *fdt;
> +	const uint32_t *res;
> +	int reslen;
> +	int i;
> +
> +	test_init(argc, argv);
> +
> +	if ((argc == 3) && (strcmp(argv[1], "-g") == 0)) {
> +		FILE *f = fopen(argv[2], "w");
> +
> +		if (!f)
> +			FAIL("Couldn't open \"%s\" for output: %s\n",
> +			     argv[2], strerror(errno));
> +
> +		fprintf(f, "/dts-v1/;\n");
> +		fprintf(f, "/ {\n");
> +		fprintf(f, "\texpressions = <\n");
> +		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
> +			fprintf(f, "\t\t(%s)\n", expr_table[i].expr);
> +		fprintf(f, "\t>;\n");
> +		fprintf(f, "};\n");
> +		fclose(f);
> +	} else {
> +		fdt = load_blob_arg(argc, argv);
> +
> +		res = fdt_getprop(fdt, 0, "expressions", &reslen);
> +
> +		if (!res)
> +			FAIL("Error retreiving expression results: %s\n",
> +		     fdt_strerror(reslen));
> +
> +		if (reslen != (ARRAY_SIZE(expr_table) * sizeof(uint32_t)))
> +			FAIL("Unexpected length of results %d instead of %ld\n",
> +			     reslen, ARRAY_SIZE(expr_table) * sizeof(uint32_t));
> +
> +		for (i = 0; i < ARRAY_SIZE(expr_table); i++)
> +			if (fdt32_to_cpu(res[i]) != expr_table[i].result)
> +				FAIL("Incorrect result for expression \"%s\","
> +				     " 0x%x instead of 0x%x\n",
> +				     expr_table[i].expr, fdt32_to_cpu(res[i]),
> +				     expr_table[i].result);
> +	}
> +
> +	PASS();
> +}
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index e470b82..16af5ee 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -404,6 +404,11 @@ dtc_tests () {
>      run_dtc_test -I dtb -O dts -o stdin_odts_test_tree1.dtb.test.dts - < test_tree1.dtb
>      run_wrap_test cmp stdin_odts_test_tree1.dtb.test.dts odts_test_tree1.dtb.test.dts
>  
> +    # Check integer expresisons
> +    run_test cell-expressions -g cell-expressions.test.dts
> +    run_dtc_test -I dts -O dtb -o cell-expressions.test.dtb cell-expressions.test.dts
> +    run_test cell-expressions cell-expressions.test.dtb
> +
>      # Check for graceful failure in some error conditions
>      run_sh_test dtc-fatal.sh -I dts -O dtb nosuchfile.dts
>      run_sh_test dtc-fatal.sh -I dtb -O dtb nosuchfile.dtb

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
