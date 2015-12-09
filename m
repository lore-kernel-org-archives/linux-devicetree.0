From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() / pr_err()
Date: Wed, 9 Dec 2015 14:03:16 +0200
Message-ID: <CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	<1449591386.3315.2.camel@perches.com>
	<1449594231.13275.2.camel@perches.com>
	<CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	<1449619439.18646.20.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449619439.18646.20.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2015 at 2:03 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Tue, 2015-12-08 at 15:28 -0600, Rob Herring wrote:
>> On Tue, Dec 8, 2015 at 11:03 AM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>> > On Tue, 2015-12-08 at 08:16 -0800, Joe Perches wrote:
>> > > On Wed, 2015-12-09 at 01:07 +0900, Masahiro Yamada wrote:
>> > > > Trivial changes suggested by checkpatch.pl.
>> > > []
>> > > > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> > > []
>> > > > @@ -23,7 +23,7 @@ static int __of_address_to_resource(struct device_node *dev,
>> > > >  #ifdef DEBUG
>> > > >  static void of_dump_addr(const char *s, const __be32 *addr, int na)
>> > > >  {
>> > > > -   printk(KERN_DEBUG "%s", s);
>> > > > +   pr_debug("%s", s);
>> > > >     while (na--)
>> > > >             printk(" %08x", be32_to_cpu(*(addr++)));
>> > > >     printk("\n");
> []
>> > static void of_dumpaddr(const char *s, const __be32 *addr, int na)
>> > {
>> >         print_hex_dump_debug(s, DUMP_PREFIX_NONE, 16, 1,
>> >                              addr, na * sizeof(__be32), false);
>> > }
>>
>> Except that it doesn't do the endian swapping. Looking closer at this,
>> we should just drop this hunk. So I will take v1.
>
> Maybe endian conversions should be added to hex_dump_debug like:
> (probably doesn't apply.  Evolution 3.18 is horrible)

Overall the idea is not bad I think, though few comments below.
Besides that, please, update test_hexdump (wrt my update to the test
suite [1]) to go through BE test cases.

[1] http://www.spinics.net/lists/kernel/msg2139337.html

> ---
>  include/linux/printk.h |  7 +++++++
>  lib/hexdump.c          | 56 +++++++++++++++++++++++++++++++++++---------------
>  2 files changed, 47 insertions(+), 16 deletions(-)
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
> +       DUMP_TYPE_CPU = 0,

Do we need explicit enum for that? Documentation update anyway is required.

> +       DUMP_TYPE_LE = BIT(30),
> +       DUMP_TYPE_BE = BIT(31)
> +};
> +
>  extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsize,
>                               int groupsize, char *linebuf, size_t linebuflen,
>                               bool ascii);
> diff --git a/lib/hexdump.c b/lib/hexdump.c
> index 992457b..49113aa 100644
> --- a/lib/hexdump.c
> +++ b/lib/hexdump.c
> @@ -81,6 +81,7 @@ EXPORT_SYMBOL(bin2hex);
>   * @len: number of bytes in the @buf
>   * @rowsize: number of bytes to print per line; must be 16 or 32
>   * @groupsize: number of bytes to print at a time (1, 2, 4, 8; default = 1)
> + *             OR'd with DUMP_TYPE_BE or DUMP_TYPE_LE for endian conversions
>   * @linebuf: where to put the converted data
>   * @linebuflen: total size of @linebuf, including space for terminating NUL
>   * @ascii: include ASCII after the hex output
> @@ -114,19 +115,20 @@ int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int groupsize,
>         int j, lx = 0;
>         int ascii_column;
>         int ret;
> +       int actual_groupsize = groupsize & ~(DUMP_TYPE_LE | DUMP_TYPE_BE);

I would rather prefer to have function parameter to be renamed.

E.g. gsflags ?

>
>         if (rowsize != 16 && rowsize != 32)
>                 rowsize = 16;
>
>         if (len > rowsize)              /* limit to one line at a time */
>                 len = rowsize;
> -       if (!is_power_of_2(groupsize) || groupsize > 8)
> -               groupsize = 1;
> -       if ((len % groupsize) != 0)     /* no mixed size output */
> -               groupsize = 1;
> +       if (!is_power_of_2(actual_groupsize) || actual_groupsize > 8)
> +               actual_groupsize = 1;
> +       if ((len % actual_groupsize) != 0)      /* no mixed size output */
> +               actual_groupsize = 1;
>
> -       ngroups = len / groupsize;
> -       ascii_column = rowsize * 2 + rowsize / groupsize + 1;
> +       ngroups = len / actual_groupsize;
> +       ascii_column = rowsize * 2 + rowsize / actual_groupsize + 1;
>
>         if (!linebuflen)
>                 goto overflow1;
> @@ -134,35 +136,56 @@ int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int groupsize,
>         if (!len)
>                 goto nil;
>
> -       if (groupsize == 8) {
> +       if (actual_groupsize == 8) {
>                 const u64 *ptr8 = buf;
>
>                 for (j = 0; j < ngroups; j++) {
> +                       u64 val;
> +
> +                       if (groupsize & DUMP_TYPE_LE)
> +                               val = get_unaligned_le64(ptr8 + j);
> +                       else if (groupsize & DUMP_TYPE_BE)
> +                               val = get_unaligned_be64(ptr8 + j);
> +                       else
> +                               val = get_unaligned(ptr8 + j);
>                         ret = snprintf(linebuf + lx, linebuflen - lx,
> -                                      "%s%16.16llx", j ? " " : "",
> -                                      get_unaligned(ptr8 + j));
> +                                      "%s%16.16llx", j ? " " : "", val);
>                         if (ret >= linebuflen - lx)
>                                 goto overflow1;
>                         lx += ret;
>                 }
> -       } else if (groupsize == 4) {
> +       } else if (actual_groupsize == 4) {
>                 const u32 *ptr4 = buf;
>
>                 for (j = 0; j < ngroups; j++) {
> +                       u32 val;
> +
> +                       if (groupsize & DUMP_TYPE_LE)
> +                               val = get_unaligned_le32(ptr4 + j);
> +                       else if (groupsize & DUMP_TYPE_BE)
> +                               val = get_unaligned_be32(ptr4 + j);
> +                       else
> +                               val = get_unaligned(ptr4 + j);
>                         ret = snprintf(linebuf + lx, linebuflen - lx,
> -                                      "%s%8.8x", j ? " " : "",
> -                                      get_unaligned(ptr4 + j));
> +                                      "%s%8.8x", j ? " " : "", val);
>                         if (ret >= linebuflen - lx)
>                                 goto overflow1;
>                         lx += ret;
>                 }
> -       } else if (groupsize == 2) {
> +       } else if (actual_groupsize == 2) {
>                 const u16 *ptr2 = buf;
>
>                 for (j = 0; j < ngroups; j++) {
> +                       u16 val;
> +
> +                       if (groupsize & DUMP_TYPE_LE)
> +                               val = get_unaligned_le16(ptr2 + j);
> +                       else if (groupsize & DUMP_TYPE_BE)
> +                               val = get_unaligned_be16(ptr2 + j);
> +                       else
> +                               val = get_unaligned(ptr2 + j);
>                         ret = snprintf(linebuf + lx, linebuflen - lx,
> -                                      "%s%4.4x", j ? " " : "",
> -                                      get_unaligned(ptr2 + j));
> +                                      "%s%4.4x", j ? " " : "", val);
>                         if (ret >= linebuflen - lx)
>                                 goto overflow1;
>                         lx += ret;
> @@ -203,7 +226,8 @@ nil:
>  overflow2:
>         linebuf[lx++] = '\0';
>  overflow1:
> -       return ascii ? ascii_column + len : (groupsize * 2 + 1) * ngroups - 1;
> +       return ascii ? ascii_column + len
> +                    : (actual_groupsize * 2 + 1) * ngroups - 1;
>  }
>  EXPORT_SYMBOL(hex_dump_to_buffer);
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
