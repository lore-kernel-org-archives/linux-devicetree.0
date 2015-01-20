From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] of: Custom printk format specifier for device node
Date: Tue, 20 Jan 2015 16:52:11 +0200
Message-ID: <E7065DB3-DD6B-4110-A066-8C7268186831@konsulko.com>
References: <1421764441-11928-1-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLVJjq3Ov=J-5LtXiTQPLvR5Y=+tB1i16k_rN3j5dODFQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@secretlab.ca>, Randy Dunlap <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Jan 20, 2015, at 16:47 , Rob Herring <robherring2@gmail.com> wrote=
:
>=20
> On Tue, Jan 20, 2015 at 8:34 AM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> 90% of the usage of device node's full_name is printing it out
>> in a kernel message. Preparing for the eventual delayed allocation
>> introduce a custom printk format specifier that is both more
>> compact and more pleasant to the eye.
>=20
> What a great idea. ;)
>=20

It was a stroke of genius I tell you=E2=80=A6 :)

>> For instance typical use is:
>>        pr_info("Frobbing node %s\n", node->full_name);
>>=20
>> Which can be written now as:
>>        pr_info("Frobbing node %pO\n", node);
>>=20
>> A verbose format specifier (1-2) can be used to print extra
>> information about the node like its phandle and node flags.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> Documentation/printk-formats.txt | 18 +++++++++++
>> lib/vsprintf.c                   | 67 ++++++++++++++++++++++++++++++=
++++++++++
>> 2 files changed, 85 insertions(+)
>>=20
>> diff --git a/Documentation/printk-formats.txt b/Documentation/printk=
-formats.txt
>> index 5a615c1..6ad199f 100644
>> --- a/Documentation/printk-formats.txt
>> +++ b/Documentation/printk-formats.txt
>> @@ -231,6 +231,24 @@ struct va_format:
>>        Do not use this feature without some mechanism to verify the
>>        correctness of the format string and va_list arguments.
>>=20
>> +Device tree nodes:
>> +
>> +       %pO{,1,2}
>=20
> 'O' is not very obvious, but I imagine we are somewhat limted in our
> choice here?
>=20

All the good women are married, all the handsome men are gay, all the o=
bvious
format specifiers are taken.

>> +
>> +       For printing device tree nodes. The (optional) number is the=
 verbosity
>> +       level.
>> +
>> +       Examples:
>> +
>> +       %pO     /foo/bar@0              - Node full name
>> +       %pO0    /foo/bar@0              - Same as above
>> +       %pO1    /foo/bar@0[10]          - Node full name + phandle
>> +       %pO2    /foo/bar@0[10:DdPB]     - Node full name + phandle +=
 node flags
>> +                                        D - dynamic
>> +                                        d - detached
>> +                                        P - Populated
>> +                                        B - Populated bus
>=20
> We should think about what else we want to print for a node. Perhaps
> 'On' for name, 'Oc' for compatible, etc.
>=20

The verbosity argument is something simple that works, but I take reque=
sts...

>> +
>> u64 SHOULD be printed with %llu/%llx:
>>=20
>>        printk("%llu", u64_var);
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>> index ec337f6..72896cc 100644
>> --- a/lib/vsprintf.c
>> +++ b/lib/vsprintf.c
>> @@ -29,6 +29,7 @@
>> #include <linux/dcache.h>
>> #include <linux/cred.h>
>> #include <net/addrconf.h>
>> +#include <linux/of.h>
>>=20
>> #include <asm/page.h>          /* for PAGE_SIZE */
>> #include <asm/sections.h>      /* for dereference_function_descripto=
r() */
>> @@ -1240,6 +1241,68 @@ char *address_val(char *buf, char *end, const=
 void *addr,
>>        return number(buf, end, num, spec);
>> }
>>=20
>> +#if IS_ENABLED(CONFIG_OF)
>=20
> You can move this into the function:
>=20
> if (!IS_ENABLED(CONFIG_OF)
>  return NULL;
>=20
> Looks like you'll need the patch for empty of_node_check_flag as well=
=2E
>=20

Yes, I tried to avoid that.

>> +static noinline_for_stack
>> +char *device_node_string(char *buf, char *end, struct device_node *=
dn,
>> +                        struct printf_spec spec, const char *fmt)
>> +{
>> +       char tbuf[sizeof("[xxxxxxxxxx:xxxx]") + 1];
>> +       const char *full_name;
>> +       int verbosity, len, flen, i;
>> +
>> +       if ((unsigned long)dn < PAGE_SIZE)
>> +               return string(buf, end, "(null)", spec);
>> +
>> +       full_name =3D of_node_full_name(dn);
>> +       verbosity =3D 0;
>> +       if (fmt[1] >=3D '0' && fmt[1] <=3D '2')
>> +               verbosity =3D fmt[1] - '0';
>> +
>> +       /* fast and simple case */
>> +       switch (verbosity) {
>> +       default:
>> +       case 0:
>> +               tbuf[0] =3D '\0';
>> +               break;
>> +       case 1:
>> +               snprintf(tbuf, sizeof(tbuf), "[%u]",
>> +                       (u32)dn->phandle);
>> +               break;
>> +       case 2:
>> +               snprintf(tbuf, sizeof(tbuf), "[%u:%c%c%c%c]",
>> +                       (u32)dn->phandle,
>> +                       of_node_check_flag(dn, OF_DYNAMIC) ? 'D' : '=
-',
>> +                       of_node_check_flag(dn, OF_DETACHED) ? 'd' : =
'-',
>> +                       of_node_check_flag(dn, OF_POPULATED) ? 'P' :=
 '-',
>> +                       of_node_check_flag(dn, OF_POPULATED_BUS) ? '=
B' : '-');
>> +               break;
>> +       }
>> +       flen =3D strlen(full_name);
>> +       len =3D flen + strlen(tbuf);
>> +       if (spec.precision > 0 && len > spec.precision)
>> +               len =3D spec.precision;
>> +
>> +       if (!(spec.flags & LEFT)) {
>> +               while (len < spec.field_width--) {
>> +                       if (buf < end)
>> +                               *buf =3D ' ';
>> +                       ++buf;
>> +               }
>> +       }
>> +       for (i =3D 0; i < len; ++i) {
>> +               if (buf < end)
>> +                       *buf =3D i < flen ? full_name[i] : tbuf[i - =
flen];
>> +               ++buf;
>> +       }
>> +       while (len < spec.field_width--) {
>> +               if (buf < end)
>> +                       *buf =3D ' ';
>> +               ++buf;
>> +       }
>> +       return buf;
>> +}
>> +#endif
>> +
>> int kptr_restrict __read_mostly;
>>=20
>> /*
>> @@ -1459,6 +1522,10 @@ char *pointer(const char *fmt, char *buf, cha=
r *end, void *ptr,
>>                return dentry_name(buf, end,
>>                                   ((const struct file *)ptr)->f_path=
=2Edentry,
>>                                   spec, fmt);
>> +#if IS_ENABLED(CONFIG_OF)
>=20
> With the above, then this ifdef should not be needed.
>=20

Yes

>> +       case 'O':
>> +               return device_node_string(buf, end, ptr, spec, fmt);
>> +#endif
>>        }
>>        spec.flags |=3D SMALL;
>>        if (spec.field_width =3D=3D -1) {
>> --
>> 1.7.12
>>=20

OK, I=E2=80=99ll prepare the empty flag accessors patch and I=E2=80=99l=
l repost with the requested changes.

Regards

=E2=80=94 Pantelis

