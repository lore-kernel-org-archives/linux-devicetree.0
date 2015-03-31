From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 31 Mar 2015 13:03:05 +0300
Message-ID: <8421E7C5-C0D9-4C86-AA37-F6507B3BCC57@konsulko.com>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com> <1421861843.10574.23.camel@perches.com> <7EBFDD59-156A-42FB-AAF0-CE4A88219794@antoniou-consulting.com> <20150330190432.42192C40A67@trevor.secretlab.ca>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150330190432.42192C40A67@trevor.secretlab.ca>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robherring2@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Mar 30, 2015, at 22:04 , Grant Likely <grant.likely@secretlab.ca> =
wrote:
>=20
> On Thu, 22 Jan 2015 22:31:46 +0200
> , Pantelis Antoniou <panto@antoniou-consulting.com>
> wrote:
>> Hi Joe,
>>=20
>>> On Jan 21, 2015, at 19:37 , Joe Perches <joe@perches.com> wrote:
>>>=20
>>> On Wed, 2015-01-21 at 19:06 +0200, Pantelis Antoniou wrote:
>>>> 90% of the usage of device node's full_name is printing it out
>>>> in a kernel message. Preparing for the eventual delayed allocation
>>>> introduce a custom printk format specifier that is both more
>>>> compact and more pleasant to the eye.
>>>>=20
>>>> For instance typical use is:
>>>> 	pr_info("Frobbing node %s\n", node->full_name);
>>>>=20
>>>> Which can be written now as:
>>>> 	pr_info("Frobbing node %pO\n", node);
>>=20
>>> Still disliking use of %p0.
>>>=20
>>=20
>> pO - Open Firmware
>>=20
>> pT for tree is bad, cause we plan to use a tree type in the future i=
n OF.
>=20
> So, here's a radical thought. How about we reserve '%pO' for objects,=
 as
> in kobjects.  We'll use extra flags to narrow down specifically to
> device tree nodes, but we could teach vsprintf() to treat a plain '%p=
O'
> as plain kobject pointer, and if it is able to recognize the kobj_typ=
e,
> then run a specific decoder to format it.
>=20
> This also gives us a namespace for various kinds of firmware data
> output. %Od could be a struct device, %On for device tree node, %Oa f=
or
> an ACPI node, etc.
>=20

I=E2=80=99m fine with this. I also have a patch to turn an overlay to a=
 kobj
so this fits naturally.

OTOH if we do this, I would expect to rework the custom printk infrastr=
ucture
to be more generic.

IMHO having the format specifier and the format print methods in lib/vs=
printf.c
is not very nice.

How about having a way to register object printk handlers with somethin=
g like that?
We could put that in a special linker section and have the printk metho=
d pass control
there.

PRINTK_OBJFMT(=E2=80=99n=E2=80=99, printk_objfmt_device_node);

We might have to make a few printk methods public however.

>>=20
>>>> More fine-grained control of formatting includes printing the name=
,
>>>> flag, path-spec name, reference count and others, explained in the
>>>> documentation entry.
>>>>=20
>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>>>>=20
>>>> dt-print
>>>> ---
>>>> Documentation/printk-formats.txt |  29 ++++++++
>>>> lib/vsprintf.c                   | 151 +++++++++++++++++++++++++++=
++++++++++++
>>>> 2 files changed, 180 insertions(+)
>>>>=20
>>>> diff --git a/Documentation/printk-formats.txt b/Documentation/prin=
tk-formats.txt
>>>> index 5a615c1..2d42c04 100644
>>>> --- a/Documentation/printk-formats.txt
>>>> +++ b/Documentation/printk-formats.txt
>>>> @@ -231,6 +231,35 @@ struct va_format:
>>>> 	Do not use this feature without some mechanism to verify the
>>>> 	correctness of the format string and va_list arguments.
>>>>=20
>>>> +Device tree nodes:
>>>> +
>>>> +	%pO[fnpPcCFr]
>>>> +
>>>> +	For printing device tree nodes. The optional arguments are:
>>>> +            f device node full_name
>>>> +            n device node name
>>>> +            p device node phandle
>>>> +            P device node path spec (name + @unit)
>>>> +            F device node flags
>>>> +            c major compatible string
>>>> +            C full compatible string
>>>> +            r node reference count
>>>> +	Without any arguments prints full_name (same as %pOf)
>>>> +	The separator when using multiple arguments is '|'
>>>> +
>>>> +	Examples:
>>>> +
>>>> +	%pO	/foo/bar@0			- Node full name
>>>> +	%pOf	/foo/bar@0			- Same as above
>>>> +	%pOfp	/foo/bar@0|10			- Node full name + phandle
>>>> +	%pOfcF	/foo/bar@0|foo,device|--P-	- Node full name +
>>>> +	                                          major compatible strin=
g +
>>>> +						  node flags
>>>> +							D - dynamic
>>>> +							d - detached
>>>> +							P - Populated
>>>> +							B - Populated bus
>>>> +
>>>> u64 SHOULD be printed with %llu/%llx:
>>>>=20
>>>> 	printk("%llu", u64_var);
>>>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>>> []
>>>=20
>>> Add #ifdef back ?
>>>=20
>>=20
>> The whole thing is optimized away when CONFIG_OF is not defined, lea=
ving only
>> the return statement.
>>=20
>>>> +static noinline_for_stack
>>>> +char *device_node_string(char *buf, char *end, struct device_node=
 *dn,
>>>> +			 struct printf_spec spec, const char *fmt)
>>>> +{
>>>> +	char tbuf[sizeof("xxxxxxxxxx") + 1];
>>>> +	const char *fmtp, *p;
>>>> +	int len, ret, i, j, pass;
>>>> +	char c;
>>>> +
>>>> +	if (!IS_ENABLED(CONFIG_OF))
>>>> +		return string(buf, end, "(!OF)", spec);
>>>=20
>>> Not very descriptive output, maybe the address would be better.
>>>=20
>>=20
>> OK
>>=20
>>>> +
>>>> +	if ((unsigned long)dn < PAGE_SIZE)
>>>> +		return string(buf, end, "(null)", spec);
>>>> +
>>>> +	/* simple case without anything any more format specifiers */
>>>> +	if (fmt[1] =3D=3D '\0' || isspace(fmt[1]))
>>>> +		fmt =3D "Of";
>=20
> s/isspace()/!isalnum() to match with what the pointer() function does
> when finding the end of a format string.
>=20
>>>=20
>>> why lower case here but upper case above?
>>>=20
>>=20
>> Cause '(null)' is what=E2=80=99s printed in string() when null is pa=
ssed as a pointer.
>>=20
>>>> +
>>>> +	len =3D 0;
>>>> +
>>>> +	/* two passes; the first calculates length, the second fills in =
*/
>>>> +	for (pass =3D 1; pass <=3D 2; pass++) {
>>>> +		if (pass =3D=3D 2 && !(spec.flags & LEFT)) {
>>>> +			/* padding */
>>>> +			while (len < spec.field_width--) {
>>>> +				if (buf < end)
>>>> +					*buf =3D ' ';
>>>> +				++buf;
>>>> +			}
>>>> +		}
>>>> +#undef _HANDLE_CH
>>>> +#define _HANDLE_CH(_ch) \
>>>> +	do { \
>>>> +		if (pass =3D=3D 1) \
>>>> +			len++; \
>>>> +		else \
>>>> +			if (buf < end) \
>>>> +				*buf++ =3D (_ch); \
>>>> +	} while (0)
>>>> +#undef _HANDLE_STR
>>>> +#define _HANDLE_STR(_str) \
>>>> +	do { \
>>>> +		const char *str =3D (_str); \
>>>> +		if (pass =3D=3D 1) \
>>>> +			len +=3D strlen(str); \
>>>> +		else \
>>>> +			while (*str && buf < end) \
>>>> +				*buf++ =3D *str++; \
>>>> +	} while (0)
>>>=20
>>> This isn't pretty.  Perhaps there's a better way?
>>>=20
>>=20
>> It=E2=80=99s the simplest way to do the different operations for the=
 two passes, without
>> bloating the code or adding superfluous methods.
>>=20
>> We don=E2=80=99t want to allocate memory, we don=E2=80=99t want to u=
se stack space. We=E2=80=99re probably
>> printing in atomic context too since device nodes don=E2=80=99t usua=
lly printed out
>> during normal operation.
>=20
> As far as I can tell from the code, the only thing that 2 passes is u=
sed
> for is when the LEFT spec.flags value is not set. Instead of doing tw=
o,
> what if the code generated the string right-aligned, and then if the
> LEFT flag is set, shift it over the required amount, ' ' padding as
> necessary? In fact, that's exactly what the dentry_name() helper does=
=2E
>=20

Hmm, that might work.

> This is a complicated enough block of code, that I'd like to see
> unittests for it added at the same time.
>=20
> ...
>=20
> So, I'm keen enough on this feature that I've just gone ahead and pla=
yed
> with it this morning. The following is what I've come up with. I got =
rid
> of the two passes, fixed up the boundary conditions, and added
> unittests. I've also switched the format key to %pOn, and the separat=
or
> to ':'. ':' is never a valid character in a node name, so it should b=
e
> safe to use as a delimiter.

OK.

>=20
> I've dropped the refcount decoder. I know it is useful for debugging =
the
> core DT code, but it isn't something that will be used generally. Plu=
s
> the returned value cannot be relied upon to be stable because there m=
ay
> be other code currently iterating over the tree.
>=20

Yeah, I know it=E2=80=99s not something to rely on. If we do %pOk to be=
 kobj
debug I can add it back in.

> ---
>=20
> of: Custom printk format specifier for device node
>=20
> 90% of the usage of device node's full_name is printing it out
> in a kernel message. Preparing for the eventual delayed allocation
> introduce a custom printk format specifier that is both more
> compact and more pleasant to the eye.
>=20
> For instance typical use is:
> 	pr_info("Frobbing node %s\n", node->full_name);
>=20
> Which can be written now as:
> 	pr_info("Frobbing node %pOn\n", node);
>=20
> More fine-grained control of formatting includes printing the name,
> flag, path-spec name, reference count and others, explained in the
> documentation entry.
>=20

Remove reference count comment?

> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> [grant.likely: Rework to be simpler]
> Signed-off-by: Grant Likely <grant.likely@linaro.org>
> ---
> Documentation/printk-formats.txt             |  28 ++++++++
> drivers/of/unittest-data/tests-platform.dtsi |   4 +-
> drivers/of/unittest.c                        |  58 +++++++++++++++
> lib/vsprintf.c                               | 101 ++++++++++++++++++=
+++++++++
> 4 files changed, 190 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-=
formats.txt
> index 5a615c14f75d..f0dc2fd229e4 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -192,6 +192,34 @@ IPv4/IPv6 addresses (generic, with port, flowinf=
o, scope):
> 	%pISsc		1.2.3.4		or [1:2:3:4:5:6:7:8]%1234567890
> 	%pISpfc		1.2.3.4:12345	or [1:2:3:4:5:6:7:8]:12345/123456789
>=20
> +Device tree nodes:
> +
> +	%pOn[fnpPcCFr]
> +
> +	For printing device tree nodes. The optional arguments are:
> +	    f device node full_name
> +	    n device node name
> +	    p device node phandle
> +	    P device node path spec (name + @unit)
> +	    F device node flags
> +	    c major compatible string
> +	    C full compatible string
> +	Without any arguments prints full_name (same as %pOnf)
> +	The separator when using multiple arguments is =E2=80=98:=E2=80=99
^ separator is =E2=80=98.'
> +

> +	Examples:
> +
> +	%pOn	/foo/bar@0			- Node full name
> +	%pOnf	/foo/bar@0			- Same as above
> +	%pOnfp	/foo/bar@0:10			- Node full name + phandle
> +	%pOnfcF	/foo/bar@0:foo,device:--P-	- Node full name +
> +	                                          major compatible string +
> +						  node flags
> +							D - dynamic
> +							d - detached
> +							P - Populated
> +							B - Populated bus
> +

Same here.

> UUID/GUID addresses:
>=20
> 	%pUb	00010203-0405-0607-0809-0a0b0c0d0e0f
> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/o=
f/unittest-data/tests-platform.dtsi
> index eb20eeb2b062..a0c93822aee3 100644
> --- a/drivers/of/unittest-data/tests-platform.dtsi
> +++ b/drivers/of/unittest-data/tests-platform.dtsi
> @@ -26,7 +26,9 @@
> 				#size-cells =3D <0>;
>=20
> 				dev@100 {
> -					compatible =3D "test-sub-device";
> +					compatible =3D "test-sub-device",
> +						     "test-compat2",
> +						     "test-compat3";
> 					reg =3D <0x100>;
> 				};
> 			};
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index e844907c9efa..dc43209f2064 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -234,6 +234,63 @@ static void __init of_unittest_check_tree_linkag=
e(void)
> 	pr_debug("allnodes list size (%i); sibling lists size (%i)\n", allno=
de_count, child_count);
> }
>=20
> +static void __init of_unittest_printf_one(struct device_node *np, co=
nst char *fmt,
> +					  const char *expected)
> +{
> +	char buf[strlen(expected)+10];
> +	int size, i;
> +
> +	/* Baseline; check conversion with a large size limit */
> +	memset(buf, 0xff, sizeof(buf));
> +	size =3D snprintf(buf, sizeof(buf) - 2, fmt, np);
> +
> +	/* use strcmp() instead of strncmp() here to be absolutely sure str=
ings match */
> +	unittest((strcmp(buf, expected) =3D=3D 0) && (buf[size+1] =3D=3D 0x=
ff),
> +		"sprintf failed; fmt=3D'%s' expected=3D'%s' rslt=3D'%s'\n",
> +		fmt, expected, buf);
> +
> +	/* Make sure length limits work */
> +	size++;
> +	for (i =3D 0; i < 2; i++, size--) {
> +		/* Clear the buffer, and make sure it works correctly still */
> +		memset(buf, 0xff, sizeof(buf));
> +		snprintf(buf, size+1, fmt, np);
> +		unittest(strncmp(buf, expected, size) =3D=3D 0 && (buf[size+1] =3D=
=3D 0xff),
> +			"snprintf failed; size=3D%i fmt=3D'%s' expected=3D'%s' rslt=3D'%s=
'\n",
> +			size, fmt, expected, buf);
> +	}
> +}
> +
> +static void __init of_unittest_printf(void)
> +{
> +	struct device_node *np;
> +	const char *full_name =3D "/testcase-data/platform-tests/test-devic=
e@1/dev@100";
> +	char phandle_str[16] =3D "";
> +
> +	np =3D of_find_node_by_path(full_name);
> +	if (!np) {
> +		unittest(np, "testcase data missing\n");
> +		return;
> +	}
> +
> +	num_to_str(phandle_str, sizeof(phandle_str), np->phandle);
> +
> +	of_unittest_printf_one(np, "%pOn",  full_name);
> +	of_unittest_printf_one(np, "%pOnf", full_name);
> +	of_unittest_printf_one(np, "%pOnp", phandle_str);
> +	of_unittest_printf_one(np, "%pOnP", "dev@100");
> +	of_unittest_printf_one(np, "ABC %pOnP ABC", "ABC dev@100 ABC");
> +	of_unittest_printf_one(np, "%10pOnP", "   dev@100");
> +	of_unittest_printf_one(np, "%-10pOnP", "dev@100   ");
> +	of_unittest_printf_one(of_root, "%pOnP", "/");
> +	of_unittest_printf_one(np, "%pOnF", "----");
> +	of_unittest_printf_one(np, "%pOnPF", "dev@100:----");
> +	of_unittest_printf_one(np, "%pOnPFPc", "dev@100:----:dev@100:test-s=
ub-device");
> +	of_unittest_printf_one(np, "%pOnc", "test-sub-device");
> +	of_unittest_printf_one(np, "%pOnC",
> +			"\"test-sub-device\",\"test-compat2\",\"test-compat3\"");
> +}
> +
> struct node_hash {
> 	struct hlist_node node;
> 	struct device_node *np;
> @@ -1888,6 +1945,7 @@ static int __init of_unittest(void)
> 	of_unittest_find_node_by_name();
> 	of_unittest_dynamic();
> 	of_unittest_parse_phandle_with_args();
> +	of_unittest_printf();
> 	of_unittest_property_string();
> 	of_unittest_property_copy();
> 	of_unittest_changeset();
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index b235c96167d3..8a793a4560c2 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -29,6 +29,7 @@
> #include <linux/dcache.h>
> #include <linux/cred.h>
> #include <net/addrconf.h>
> +#include <linux/of.h>
>=20
> #include <asm/page.h>		/* for PAGE_SIZE */
> #include <asm/sections.h>	/* for dereference_function_descriptor() */
> @@ -1322,6 +1323,91 @@ char *address_val(char *buf, char *end, const =
void *addr,
> 	return number(buf, end, num, spec);
> }
>=20
> +static noinline_for_stack
> +char *device_node_string(char *buf, char *end, struct device_node *d=
n,
> +			 struct printf_spec spec, const char *fmt)
> +{
> +	char tbuf[] =3D "----";
> +	struct property *prop;
> +	const char *p;
> +	int ret, i, j, n;
> +	char c, *start =3D buf;
> +	struct printf_spec str_spec =3D
> +		{ .precision =3D -1, .field_width =3D 0, .base =3D 10, .flags =3D =
LEFT };
> +
> +	if (!IS_ENABLED(CONFIG_OF))
> +		return string(buf, end, "(!OF)", spec);
> +
> +	if ((unsigned long)dn < PAGE_SIZE)
> +		return string(buf, end, "(null)", spec);
> +
> +	/* simple case without anything any more format specifiers */
> +	if (!isalnum(fmt[2]))
> +		fmt =3D "Onf";
> +
> +	fmt +=3D 2;
> +	for (j =3D 0; isalnum((c =3D *fmt)); j++, fmt++) {
> +		if (j)
> +			buf =3D string(buf, end, ":", str_spec);
> +
^ separator is =E2=80=98.=E2=80=99 now?

> +		switch (c) {
> +		case 'f':	/* full_name */
> +			buf =3D string(buf, end, of_node_full_name(dn), str_spec);
> +			break;
> +		case 'n':	/* name */
> +			buf =3D string(buf, end, dn->name, str_spec);
> +			break;
> +		case 'p':	/* phandle */
> +			buf =3D number(buf, end, dn->phandle, str_spec);
> +			break;
> +		case 'P':	/* path-spec */
> +			p =3D strrchr(of_node_full_name(dn), '/');
> +			if (p[1]) /* Root node name is just "/" */
> +				p++;
> +			buf =3D string(buf, end, p, str_spec);
> +			break;
> +		case 'F':	/* flags */
> +			snprintf(tbuf, sizeof(tbuf), "%c%c%c%c",
> +				of_node_check_flag(dn, OF_DYNAMIC) ?  'D' : '-',
> +				of_node_check_flag(dn, OF_DETACHED) ?  'd' : '-',
> +				of_node_check_flag(dn, OF_POPULATED) ?  'P' : '-',
> +				of_node_check_flag(dn, OF_POPULATED_BUS) ?  'B' : '-');
> +			buf =3D string(buf, end, tbuf, str_spec);
> +			break;
> +		case 'c':	/* first compatible string */
> +			ret =3D of_property_read_string(dn, "compatible", &p);
> +			if (ret =3D=3D 0)
> +				buf =3D string(buf, end, p, str_spec);
> +			break;
> +		case 'C':	/* full compatible string list */
> +			i =3D 0;
> +			of_property_for_each_string(dn, "compatible", prop, p) {
> +				buf =3D string(buf, end, i ? "\",\"" : "\"", str_spec);
> +				buf =3D string(buf, end, p, str_spec);
> +				i++;
> +			}
> +			buf =3D string(buf, end, "\"", str_spec);
> +			break;
> +		}
> +	}
> +
> +	/* Pad out at the front or back if field_width is specified */
> +	n =3D buf - start;
> +	if (n < spec.field_width) {
> +		unsigned spaces =3D spec.field_width - n;
> +		if (!(spec.flags & LEFT)) {
> +			widen(start, end, n, spaces);
> +			return buf + spaces;
> +		}
> +		while (spaces-- && (buf < end)) {
> +			if (buf < end)
> +				*buf =3D ' ';
> +			++buf;
> +		}
> +	}
> +	return buf;
> +}
> +
> int kptr_restrict __read_mostly;
>=20
> /*
> @@ -1393,6 +1479,15 @@ int kptr_restrict __read_mostly;
>  *       correctness of the format string and va_list arguments.
>  * - 'K' For a kernel pointer that should be hidden from unprivileged=
 users
>  * - 'NF' For a netdev_features_t
> + * - 'On[fnpPcCF]' For a device tree object
> + *                Without any optional arguments prints the full_nam=
e
> + *                f device node full_name
> + *                n device node name
> + *                p device node phandle
> + *                P device node path spec (name + @unit)
> + *                F device node flags
> + *                c major compatible string
> + *                C full compatible string
>  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex str=
ing with
>  *            a certain separator (' ' by default):
>  *              C colon
> @@ -1544,6 +1639,12 @@ char *pointer(const char *fmt, char *buf, char=
 *end, void *ptr,
> 			return netdev_feature_string(buf, end, ptr, spec);
> 		}
> 		break;
> +	case 'O':
> +		switch (fmt[1]) {
> +		case 'n':
> +			return device_node_string(buf, end, ptr, spec, fmt);
> +		}
> +		break;
> 	case 'a':
> 		return address_val(buf, end, ptr, spec, fmt);
> 	case 'd':
> --=20
> 2.1.0
>=20
>=20

Regards

=E2=80=94 Pantelis

