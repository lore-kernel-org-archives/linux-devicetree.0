From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() / pr_err()
Date: Wed, 9 Dec 2015 22:02:26 +0200
Message-ID: <CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA@mail.gmail.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	<1449591386.3315.2.camel@perches.com>
	<1449594231.13275.2.camel@perches.com>
	<CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	<1449619439.18646.20.camel@perches.com>
	<CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
	<1449689319.25389.28.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449689319.25389.28.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2015 at 9:28 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Wed, 2015-12-09 at 14:03 +0200, Andy Shevchenko wrote:
>> On Wed, Dec 9, 2015 at 2:03 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>> > On Tue, 2015-12-08 at 15:28 -0600, Rob Herring wrote:
>> > > On Tue, Dec 8, 2015 at 11:03 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> w=
rote:
>> > > > On Tue, 2015-12-08 at 08:16 -0800, Joe Perches wrote:
>> > > > > On Wed, 2015-12-09 at 01:07 +0900, Masahiro Yamada wrote:
>> > > > > > Trivial changes suggested by checkpatch.pl.
>> > > > > []
>> > > > > > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> > > > > []
>> > > > > > @@ -23,7 +23,7 @@ static int __of_address_to_resource(stru=
ct device_node *dev,
>> > > > > >  #ifdef DEBUG
>> > > > > >  static void of_dump_addr(const char *s, const __be32 *add=
r, int na)
>> > > > > >  {
>> > > > > > -   printk(KERN_DEBUG "%s", s);
>> > > > > > +   pr_debug("%s", s);
>> > > > > >     while (na--)
>> > > > > >             printk(" %08x", be32_to_cpu(*(addr++)));
>> > > > > >     printk("\n");
>> > []
>> > > > static void of_dumpaddr(const char *s, const __be32 *addr, int=
 na)
>> > > > {
>> > > >         print_hex_dump_debug(s, DUMP_PREFIX_NONE, 16, 1,
>> > > >                              addr, na * sizeof(__be32), false)=
;
>> > > > }
>> > >
>> > > Except that it doesn't do the endian swapping. Looking closer at=
 this,
>> > > we should just drop this hunk. So I will take v1.
>> >
>> > Maybe endian conversions should be added to hex_dump_debug like:
>> > (probably doesn't apply.  Evolution 3.18 is horrible)
>>
>> Overall the idea is not bad I think, though few comments below.
>> Besides that, please, update test_hexdump (wrt my update to the test
>> suite [1]) to go through BE test cases.
>>
>> [1] http://www.spinics.net/lists/kernel/msg2139337.html
>
> I don't want to have to learn that code as it seems a bit tricky.
> Maybe you could do it.

Okay, I'm fine if it at least passes existing test cases. Good to
mention this in commit message then.

>
>> > diff --git a/lib/hexdump.c b/lib/hexdump.c
>> > index 992457b..49113aa 100644
>> > --- a/lib/hexdump.c
>> > +++ b/lib/hexdump.c
>> > @@ -81,6 +81,7 @@ EXPORT_SYMBOL(bin2hex);
>> >   * @len: number of bytes in the @buf
>> >   * @rowsize: number of bytes to print per line; must be 16 or 32
>> >   * @groupsize: number of bytes to print at a time (1, 2, 4, 8; de=
fault =3D 1)
>> > + *             OR'd with DUMP_TYPE_BE or DUMP_TYPE_LE for endian =
conversions
>> >   * @linebuf: where to put the converted data
>> >   * @linebuflen: total size of @linebuf, including space for termi=
nating NUL
>> >   * @ascii: include ASCII after the hex output
>> > @@ -114,19 +115,20 @@ int hex_dump_to_buffer(const void *buf, size=
_t len, int rowsize, int groupsize,
>> >         int j, lx =3D 0;
>> >         int ascii_column;
>> >         int ret;
>> > +       int actual_groupsize =3D groupsize & ~(DUMP_TYPE_LE | DUMP=
_TYPE_BE);
>>
>> I would rather prefer to have function parameter to be renamed.
>>
>> E.g. gsflags ?
>>
>
> Well, it's a bit simpler changelog.

Generally I'm fine with this version, though take into account above an=
d below.

> ---
>  include/linux/printk.h |  7 +++++++
>  lib/hexdump.c          | 39 +++++++++++++++++++++++++++++++--------
>  2 files changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index 9729565..4be190c 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -424,6 +424,13 @@ enum {
>         DUMP_PREFIX_ADDRESS,
>         DUMP_PREFIX_OFFSET
>  };
> +
> +enum {
> +       DUMP_TYPE_CPU =3D 0,

And still open this, do we need it? I think you may just mention in
the documentation that default behaviour is CPU like.

> +       DUMP_TYPE_LE =3D BIT(30),
> +       DUMP_TYPE_BE =3D BIT(31)
> +};
> +
>  extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsi=
ze,
>                               int groupsize, char *linebuf, size_t li=
nebuflen,

Here as well to change.

>                               bool ascii);
> diff --git a/lib/hexdump.c b/lib/hexdump.c
> index 992457b..5b1eda70 100644
> --- a/lib/hexdump.c
> +++ b/lib/hexdump.c
> @@ -80,7 +80,8 @@ EXPORT_SYMBOL(bin2hex);
>   * @buf: data blob to dump
>   * @len: number of bytes in the @buf
>   * @rowsize: number of bytes to print per line; must be 16 or 32
> - * @groupsize: number of bytes to print at a time (1, 2, 4, 8; defau=
lt =3D 1)
> + * @groupflags: number of bytes to print at a time (1, 2, 4, 8; defa=
ult =3D 1)
> + *              OR with DUMP_TYPE_BE or DUMP_TYPE_LE for endian conv=
ersions

Maybe specify "bitwise OR with.." ?

%DUMP_=E2=80=A6

>   * @linebuf: where to put the converted data
>   * @linebuflen: total size of @linebuf, including space for terminat=
ing NUL
>   * @ascii: include ASCII after the hex output
> @@ -105,7 +106,7 @@ EXPORT_SYMBOL(bin2hex);
>   * (excluding the terminating NUL) which would have been written to =
the final
>   * string if enough space had been available.
>   */
> -int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int=
 groupsize,
> +int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int=
 groupflags,
>                        char *linebuf, size_t linebuflen, bool ascii)
>  {
>         const u8 *ptr =3D buf;
> @@ -114,6 +115,7 @@ int hex_dump_to_buffer(const void *buf, size_t le=
n, int rowsize, int groupsize,
>         int j, lx =3D 0;
>         int ascii_column;
>         int ret;
> +       int groupsize =3D groupflags & ~(DUMP_TYPE_LE | DUMP_TYPE_BE)=
;
>
>         if (rowsize !=3D 16 && rowsize !=3D 32)
>                 rowsize =3D 16;
> @@ -138,9 +140,16 @@ int hex_dump_to_buffer(const void *buf, size_t l=
en, int rowsize, int groupsize,
>                 const u64 *ptr8 =3D buf;
>
>                 for (j =3D 0; j < ngroups; j++) {
> +                       u64 val;
> +
> +                       if (groupflags & DUMP_TYPE_LE)
> +                               val =3D get_unaligned_le64(ptr8 + j);
> +                       else if (groupflags & DUMP_TYPE_BE)
> +                               val =3D get_unaligned_be64(ptr8 + j);
> +                       else
> +                               val =3D get_unaligned(ptr8 + j);
>                         ret =3D snprintf(linebuf + lx, linebuflen - l=
x,
> -                                      "%s%16.16llx", j ? " " : "",
> -                                      get_unaligned(ptr8 + j));
> +                                      "%s%16.16llx", j ? " " : "", v=
al);
>                         if (ret >=3D linebuflen - lx)
>                                 goto overflow1;
>                         lx +=3D ret;
> @@ -149,9 +158,16 @@ int hex_dump_to_buffer(const void *buf, size_t l=
en, int rowsize, int groupsize,
>                 const u32 *ptr4 =3D buf;
>
>                 for (j =3D 0; j < ngroups; j++) {
> +                       u32 val;
> +
> +                       if (groupflags & DUMP_TYPE_LE)
> +                               val =3D get_unaligned_le32(ptr4 + j);
> +                       else if (groupflags & DUMP_TYPE_BE)
> +                               val =3D get_unaligned_be32(ptr4 + j);
> +                       else
> +                               val =3D get_unaligned(ptr4 + j);
>                         ret =3D snprintf(linebuf + lx, linebuflen - l=
x,
> -                                      "%s%8.8x", j ? " " : "",
> -                                      get_unaligned(ptr4 + j));
> +                                      "%s%8.8x", j ? " " : "", val);
>                         if (ret >=3D linebuflen - lx)
>                                 goto overflow1;
>                         lx +=3D ret;
> @@ -160,9 +176,16 @@ int hex_dump_to_buffer(const void *buf, size_t l=
en, int rowsize, int groupsize,
>                 const u16 *ptr2 =3D buf;
>
>                 for (j =3D 0; j < ngroups; j++) {
> +                       u16 val;
> +
> +                       if (groupflags & DUMP_TYPE_LE)
> +                               val =3D get_unaligned_le16(ptr2 + j);
> +                       else if (groupflags & DUMP_TYPE_BE)
> +                               val =3D get_unaligned_be16(ptr2 + j);
> +                       else
> +                               val =3D get_unaligned(ptr2 + j);
>                         ret =3D snprintf(linebuf + lx, linebuflen - l=
x,
> -                                      "%s%4.4x", j ? " " : "",
> -                                      get_unaligned(ptr2 + j));
> +                                      "%s%4.4x", j ? " " : "", val);



--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
