From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Wed, 21 Jan 2015 19:39:44 +0200
Message-ID: <D84576D1-27F5-44F9-83DA-347C26F593FE@antoniou-consulting.com>
References: <1421859974-24507-1-git-send-email-pantelis.antoniou@konsulko.com> <1421861843.10574.23.camel@perches.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1421861843.10574.23.camel@perches.com>
Sender: linux-doc-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joe,

> On Jan 21, 2015, at 19:37 , Joe Perches <joe@perches.com> wrote:
>=20
> On Wed, 2015-01-21 at 19:06 +0200, Pantelis Antoniou wrote:
>> 90% of the usage of device node's full_name is printing it out
>> in a kernel message. Preparing for the eventual delayed allocation
>> introduce a custom printk format specifier that is both more
>> compact and more pleasant to the eye.
>>=20
>> For instance typical use is:
>> 	pr_info("Frobbing node %s\n", node->full_name);
>>=20
>> Which can be written now as:
>> 	pr_info("Frobbing node %pO\n", node);
>=20
> Still disliking use of %p0.
>=20

Choices are limited. And it=92s pO not p0.

>> More fine-grained control of formatting includes printing the name,
>> flag, path-spec name, reference count and others, explained in the
>> documentation entry.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>>=20
>> dt-print
>> ---
>> Documentation/printk-formats.txt |  29 ++++++++
>> lib/vsprintf.c                   | 151 +++++++++++++++++++++++++++++=
++++++++++
>> 2 files changed, 180 insertions(+)
>>=20
>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk=
-formats.txt
>> index 5a615c1..2d42c04 100644
>> --- a/Documentation/printk-formats.txt
>> +++ b/Documentation/printk-formats.txt
>> @@ -231,6 +231,35 @@ struct va_format:
>> 	Do not use this feature without some mechanism to verify the
>> 	correctness of the format string and va_list arguments.
>>=20
>> +Device tree nodes:
>> +
>> +	%pO[fnpPcCFr]
>> +
>> +	For printing device tree nodes. The optional arguments are:
>> +            f device node full_name
>> +            n device node name
>> +            p device node phandle
>> +            P device node path spec (name + @unit)
>> +            F device node flags
>> +            c major compatible string
>> +            C full compatible string
>> +            r node reference count
>> +	Without any arguments prints full_name (same as %pOf)
>> +	The separator when using multiple arguments is '|'
>> +
>> +	Examples:
>> +
>> +	%pO	/foo/bar@0			- Node full name
>> +	%pOf	/foo/bar@0			- Same as above
>> +	%pOfp	/foo/bar@0|10			- Node full name + phandle
>> +	%pOfcF	/foo/bar@0|foo,device|--P-	- Node full name +
>> +	                                          major compatible string =
+
>> +						  node flags
>> +							D - dynamic
>> +							d - detached
>> +							P - Populated
>> +							B - Populated bus
>> +
>> u64 SHOULD be printed with %llu/%llx:
>>=20
>> 	printk("%llu", u64_var);
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> []
>=20
> Add #ifdef back ?
>=20
>> +static noinline_for_stack
>> +char *device_node_string(char *buf, char *end, struct device_node *=
dn,
>> +			 struct printf_spec spec, const char *fmt)
>> +{
>> +	char tbuf[sizeof("xxxxxxxxxx") + 1];
>> +	const char *fmtp, *p;
>> +	int len, ret, i, j, pass;
>> +	char c;
>> +
>> +	if (!IS_ENABLED(CONFIG_OF))
>> +		return string(buf, end, "(!OF)", spec);
>=20
> Not very descriptive output, maybe the address would be better.
>=20
>> +
>> +	if ((unsigned long)dn < PAGE_SIZE)
>> +		return string(buf, end, "(null)", spec);
>> +
>> +	/* simple case without anything any more format specifiers */
>> +	if (fmt[1] =3D=3D '\0' || isspace(fmt[1]))
>> +		fmt =3D "Of";
>=20
> why lower case here but upper case above?
>=20
>> +
>> +	len =3D 0;
>> +
>> +	/* two passes; the first calculates length, the second fills in */
>> +	for (pass =3D 1; pass <=3D 2; pass++) {
>> +		if (pass =3D=3D 2 && !(spec.flags & LEFT)) {
>> +			/* padding */
>> +			while (len < spec.field_width--) {
>> +				if (buf < end)
>> +					*buf =3D ' ';
>> +				++buf;
>> +			}
>> +		}
>> +#undef _HANDLE_CH
>> +#define _HANDLE_CH(_ch) \
>> +	do { \
>> +		if (pass =3D=3D 1) \
>> +			len++; \
>> +		else \
>> +			if (buf < end) \
>> +				*buf++ =3D (_ch); \
>> +	} while (0)
>> +#undef _HANDLE_STR
>> +#define _HANDLE_STR(_str) \
>> +	do { \
>> +		const char *str =3D (_str); \
>> +		if (pass =3D=3D 1) \
>> +			len +=3D strlen(str); \
>> +		else \
>> +			while (*str && buf < end) \
>> +				*buf++ =3D *str++; \
>> +	} while (0)
>=20
> This isn't pretty.  Perhaps there's a better way?
>=20

No there isn=92t.

>> +
>> +		for (fmtp =3D fmt + 1, j =3D 0; (c =3D *fmtp++) !=3D '\0'; ) {
>> +			switch (c) {
>> +			case 'f':	/* full_name */
>> +				if (j++ > 0)
>> +					_HANDLE_CH(':');
>> +				_HANDLE_STR(of_node_full_name(dn));
>> +				break;
>> +			case 'n':	/* name */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				_HANDLE_STR(dn->name);
>> +				break;
>> +			case 'p':	/* phandle */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				snprintf(tbuf, sizeof(tbuf), "%u",
>> +						(unsigned int)dn->phandle);
>> +				_HANDLE_STR(tbuf);
>> +				break;
>> +			case 'P':	/* path-spec */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				_HANDLE_STR(dn->name);
>> +				/* need to tack on the @ postfix */
>> +				p =3D strchr(of_node_full_name(dn), '@');
>> +				if (p)
>> +					_HANDLE_STR(p);
>> +				break;
>> +			case 'F':	/* flags */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				snprintf(tbuf, sizeof(tbuf), "%c%c%c%c",
>> +					of_node_check_flag(dn, OF_DYNAMIC) ?
>> +						'D' : '-',
>> +					of_node_check_flag(dn, OF_DETACHED) ?
>> +						'd' : '-',
>> +					of_node_check_flag(dn, OF_POPULATED) ?
>> +						'P' : '-',
>> +					of_node_check_flag(dn,
>> +						OF_POPULATED_BUS) ?  'B' : '-');
>> +				_HANDLE_STR(tbuf);
>> +				break;
>> +			case 'c':	/* major compatible string */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				ret =3D of_property_read_string(dn, "compatible",
>> +						&p);
>> +				if (ret =3D=3D 0)
>> +					_HANDLE_STR(p);
>> +				break;
>> +			case 'C':	/* full compatible string */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				i =3D 0;
>> +				while (of_property_read_string_index(dn,
>> +						"compatible", i, &p) =3D=3D 0) {
>> +					if (i =3D=3D 0)
>> +						_HANDLE_STR("\"");
>> +					else
>> +						_HANDLE_STR("\",\"");
>> +					_HANDLE_STR(p);
>> +					i++;
>> +				}
>> +				if (i > 0)
>> +					_HANDLE_STR("\"");
>> +				break;
>> +			case 'r':	/* node reference count */
>> +				if (j++ > 0)
>> +					_HANDLE_CH('|');
>> +				snprintf(tbuf, sizeof(tbuf), "%u",
>> +					atomic_read(&dn->kobj.kref.refcount));
>> +				_HANDLE_STR(tbuf);
>> +				break;
>> +			default:
>> +				break;
>> +			}
>> +		}
>> +	}
>> +	/* finish up */
>> +	while (buf < end && len < spec.field_width--)
>> +		*buf++ =3D ' ';
>> +#undef _HANDLE_CH
>> +#undef _HANDLE_STR

>=20

Regards

=97 Pantelis

