From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dtc: Support character literals in cell lists
Date: Fri, 9 Sep 2011 11:12:21 +1000
Message-ID: <20110909011221.GC30278@yookeroo.fritz.box>
References: <1315517957-3546-1-git-send-email-robotboy@chromium.org>
	<1315517957-3546-3-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1315517957-3546-3-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2011 at 02:39:16PM -0700, Anton Staaf wrote:
> With this patch the following property assignment:
> 
>     property = <0x12345678 'a' '\r' 100>;
> 
> is equivalent to:
> 
>     property = <0x12345678 0x00000061 0x0000000D 0x00000064>

One tiny nit..

[snip]
> diff --git a/dtc-lexer.l b/dtc-lexer.l
> index e866ea5..94151da 100644
> --- a/dtc-lexer.l
> +++ b/dtc-lexer.l
> @@ -29,6 +29,7 @@ PROPNODECHAR	[a-zA-Z0-9,._+*#?@-]
>  PATHCHAR	({PROPNODECHAR}|[/])
>  LABEL		[a-zA-Z_][a-zA-Z0-9_]*
>  STRING		\"([^\\"]|\\.)*\"
> +CHAR_LITERAL	'[^']+'|'\\''

I think this should be
	'([^']|\\')*'

On the same grounds I described before.  That does mean
eval_char_literal() will have to cope with the case of ''.

[snip]
> diff --git a/tests/char_literal.c b/tests/char_literal.c
> new file mode 100644
> index 0000000..150f2a0
> --- /dev/null
> +++ b/tests/char_literal.c
> @@ -0,0 +1,50 @@
> +/*
> + * libfdt - Flat Device Tree manipulation
> + *	Testcase for character literals in dtc
> + * Copyright (C) 2006 David Gibson, IBM Corporation.
> + * Copyright (C) 2011 The Chromium Authors. All rights reserved.
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
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +#include <fdt.h>
> +#include <libfdt.h>
> +
> +#include "tests.h"
> +#include "testdata.h"
> +
> +int main(int argc, char *argv[])
> +{
> +	void *fdt;
> +	uint32_t expected_cells[5];
> +
> +	expected_cells[0] = cpu_to_fdt32((unsigned char)TEST_CHAR1);
> +	expected_cells[1] = cpu_to_fdt32((unsigned char)TEST_CHAR2);
> +	expected_cells[2] = cpu_to_fdt32((unsigned char)TEST_CHAR3);
> +	expected_cells[3] = cpu_to_fdt32((unsigned char)TEST_CHAR4);
> +	expected_cells[4] = cpu_to_fdt32((unsigned char)TEST_CHAR5);
> +
> +	test_init(argc, argv);
> +	fdt = load_blob_arg(argc, argv);
> +
> +	check_getprop(fdt, 0, "char-literal-cells",
> +		      sizeof(expected_cells), expected_cells);
> +
> +	PASS();
> +}

Looks good, this is more or less exactly what I'd enivisaged for a
testcase.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
