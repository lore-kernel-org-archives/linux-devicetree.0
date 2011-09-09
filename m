From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dtc: Support character literals in cell lists
Date: Thu, 8 Sep 2011 23:40:59 -0700
Message-ID: <CAF6FioVRJoNzUtVe7z67ujgxbZxEJfLprtw9MdnEJnoSQjTVtA@mail.gmail.com>
References: <1315517957-3546-1-git-send-email-robotboy@chromium.org>
	<1315517957-3546-3-git-send-email-robotboy@chromium.org>
	<20110909011221.GC30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110909011221.GC30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2011 at 6:12 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Sep 08, 2011 at 02:39:16PM -0700, Anton Staaf wrote:
>> With this patch the following property assignment:
>>
>> =A0 =A0 property =3D <0x12345678 'a' '\r' 100>;
>>
>> is equivalent to:
>>
>> =A0 =A0 property =3D <0x12345678 0x00000061 0x0000000D 0x00000064>
>
> One tiny nit..
>
> [snip]
>> diff --git a/dtc-lexer.l b/dtc-lexer.l
>> index e866ea5..94151da 100644
>> --- a/dtc-lexer.l
>> +++ b/dtc-lexer.l
>> @@ -29,6 +29,7 @@ PROPNODECHAR =A0 =A0 =A0 =A0[a-zA-Z0-9,._+*#?@-]
>> =A0PATHCHAR =A0 =A0 ({PROPNODECHAR}|[/])
>> =A0LABEL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[a-zA-Z_][a-zA-Z0-9_]*
>> =A0STRING =A0 =A0 =A0 =A0 =A0 =A0 =A0 \"([^\\"]|\\.)*\"
>> +CHAR_LITERAL '[^']+'|'\\''
>
> I think this should be
> =A0 =A0 =A0 =A0'([^']|\\')*'
>
> On the same grounds I described before. =A0That does mean
> eval_char_literal() will have to cope with the case of ''.

OK, I could also make it '([^']|\\')+'

That way the empty character literal wouldn't be allowed and it still
allows all of the cases we care about.

> [snip]
>> diff --git a/tests/char_literal.c b/tests/char_literal.c
>> new file mode 100644
>> index 0000000..150f2a0
>> --- /dev/null
>> +++ b/tests/char_literal.c
>> @@ -0,0 +1,50 @@
>> +/*
>> + * libfdt - Flat Device Tree manipulation
>> + * =A0 Testcase for character literals in dtc
>> + * Copyright (C) 2006 David Gibson, IBM Corporation.
>> + * Copyright (C) 2011 The Chromium Authors. All rights reserved.
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public License
>> + * as published by the Free Software Foundation; either version 2.1 of
>> + * the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful, but
>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, write to the Free Software
>> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301=
 USA
>> + */
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <stdint.h>
>> +
>> +#include <fdt.h>
>> +#include <libfdt.h>
>> +
>> +#include "tests.h"
>> +#include "testdata.h"
>> +
>> +int main(int argc, char *argv[])
>> +{
>> + =A0 =A0 void *fdt;
>> + =A0 =A0 uint32_t expected_cells[5];
>> +
>> + =A0 =A0 expected_cells[0] =3D cpu_to_fdt32((unsigned char)TEST_CHAR1);
>> + =A0 =A0 expected_cells[1] =3D cpu_to_fdt32((unsigned char)TEST_CHAR2);
>> + =A0 =A0 expected_cells[2] =3D cpu_to_fdt32((unsigned char)TEST_CHAR3);
>> + =A0 =A0 expected_cells[3] =3D cpu_to_fdt32((unsigned char)TEST_CHAR4);
>> + =A0 =A0 expected_cells[4] =3D cpu_to_fdt32((unsigned char)TEST_CHAR5);
>> +
>> + =A0 =A0 test_init(argc, argv);
>> + =A0 =A0 fdt =3D load_blob_arg(argc, argv);
>> +
>> + =A0 =A0 check_getprop(fdt, 0, "char-literal-cells",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(expected_cells), expected_c=
ells);
>> +
>> + =A0 =A0 PASS();
>> +}
>
> Looks good, this is more or less exactly what I'd enivisaged for a
> testcase.

Glad to hear it.

Thanks,
    Anton

> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
