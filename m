From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] of: Custom printk format specifier for device node
Date: Thu, 15 Jun 2017 07:30:02 -0500
Message-ID: <CAL_JsqJ_cc46Hf2XdZoXkgZyOh+0KXVXfeWYe1100E9vuRt12A@mail.gmail.com>
References: <20170614203025.7581-1-robh@kernel.org> <20170614203025.7581-4-robh@kernel.org>
 <1497473808.18751.70.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497473808.18751.70.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 14, 2017 at 3:56 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Wed, 2017-06-14 at 15:30 -0500, Rob Herring wrote:
>> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>
> I think the commit subject is wrong.
> It adds an "of" specific bit to vsprintf.c.
> The subject should be
> 'vsprintf:  Add %p extension "%pO" for device tree'

Okay, but it was good enough for the 2-3 versions Pantelis did before...

>> 90% of the usage of device node's full_name is printing it out
>> in a kernel message. Preparing for the eventual delayed allocation
>> introduce a custom printk format specifier that is both more
>> compact and more pleasant to the eye.
>>
>> For instance typical use is:
>>       pr_info("Frobbing node %s\n", node->full_name);
>>
>> Which can be written now as:
>>       pr_info("Frobbing node %pOF\n", node);
>
> Somehow I think this example is poor as node->full_name
> is a pretty obvious to read use.  %pOF requires you to
> look up or know what the output is going to be.

So %pOFfullname? We've beat this one to death IMO.

>
>> More fine-grained control of formatting includes printing the name,
>> flag, path-spec name, reference count and others, explained in the
>> documentation entry.
>>
>> Originally written by Pantelis, but pretty much rewrote the core
>> function using existing string/number functions. The 2 passes were
>> unnecessary and have been removed. Also, updated the checkpatch.pl
>> check.
>
> Some comments about the code.
>
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>> []
>> @@ -1470,6 +1471,123 @@ char *flags_string(char *buf, char *end, void *flags_ptr, const char *fmt)
>>       return format_flags(buf, end, flags, names);
>>  }
>>
>> +static noinline_for_stack
>> +char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
>> +{
>> +     int len, ret;
>> +
>> +     if (!np || !np->parent)
>> +             return buf;
>> +
>> +     buf = device_node_gen_full_name(np->parent, buf, end);
>
> This is recursive.  How many levels of parents could there be?
> Perhaps there should be a recursion limit.

2-6 I'd say is typical. The FDT unflattening code limits things to 64
(which is probably way more than needed).

I could re-write it to be non-recursive, but then I'll just have the
max sized array of pointers on the stack.

>
>> +
>> +     if (buf < end)
>> +             len = end - buf;
>> +     else
>> +             len = 0;
>> +     ret = snprintf(buf, len, "/%s", kbasename(np->full_name));

I can replace this one too with a strcat and save some stack space.

>> +     if (ret <= 0)
>> +             return buf;
>> +     else if (len == 0 || ret < len)
>> +             return buf + ret;
>> +     return buf + len;
>> +}
>
> Does this work with %p<len>OF for a right justified or padded
> length string?  Perhaps widen_string should be added.

widen_string is called at the end of device_node_string.

>> +static noinline_for_stack
>> +char *device_node_string(char *buf, char *end, struct device_node *dn,
>> +                      struct printf_spec spec, const char *fmt)
>> +{
>> +     char tbuf[sizeof("xxxxxxxxxx") + 1];
>> +     const char *fmtp, *p;
>> +     int ret;
>> +     char *buf_start = buf;
>> +     struct property *prop;
>> +     bool has_mult, pass;
>> +     const struct printf_spec num_spec = {
>> +             .flags = SMALL,
>> +             .field_width = -1,
>> +             .precision = -1,
>> +             .base = 10,
>> +     };
>> +
>> +     struct printf_spec str_spec = spec;
>> +     str_spec.field_width = -1;
>> +
>> +     if (!IS_ENABLED(CONFIG_OF))
>> +             return string(buf, end, "(!OF)", spec);
>> +
>> +     if ((unsigned long)dn < PAGE_SIZE)
>> +             return string(buf, end, "(null)", spec);
>> +
>> +     /* simple case without anything any more format specifiers */
>> +     if (fmt[1] == '\0' || strcspn(fmt + 1,"fnpPFcCr") > 0)
>> +             fmt = "Ff";
>> +
>> +     for (fmtp = fmt + 1, pass = false; strspn(fmtp,"fnpPFcCr"); fmtp++, pass = true) {
>
> why not
>         while (isalpha(*++fmt))
> like ip6 or isalnum like FORMAT_TYPE_PTR uses?

Okay.

>
>> +             if (pass && (*fmtp != 'f')) {
>> +                     if (buf < end)
>> +                             *buf = '|';
>> +                     buf++;
>> +             }
>> +
>> +             switch (*fmtp) {
>> +             case 'f':       /* full_name */
>> +                     if (pass) {
>> +                             if (buf < end)
>> +                                     *buf = ':';
>> +                             buf++;
>> +                     }
>> +                     buf = device_node_gen_full_name(dn, buf, end);
>> +                     break;
>> +             case 'n':       /* name */
>> +                     buf = string(buf, end, dn->name, str_spec);
>> +                     break;
>> +             case 'p':       /* phandle */
>> +                     buf = number(buf, end, (unsigned int)dn->phandle, num_spec);
>> +                     break;
>> +             case 'P':       /* path-spec */
>> +                     buf = string(buf, end, kbasename(of_node_full_name(dn)), str_spec);
>> +                     break;
>> +             case 'F':       /* flags */
>> +                     snprintf(tbuf, sizeof(tbuf), "%c%c%c%c",
>> +                             of_node_check_flag(dn, OF_DYNAMIC) ?
>> +                                     'D' : '-',
>> +                             of_node_check_flag(dn, OF_DETACHED) ?
>> +                                     'd' : '-',
>> +                             of_node_check_flag(dn, OF_POPULATED) ?
>> +                                     'P' : '-',
>> +                             of_node_check_flag(dn,
>> +                                     OF_POPULATED_BUS) ?  'B' : '-');
>
> I'd try to avoid all uses of snprintf as it's effectively
> another fairly
> large stack frame.

Okay.

> It's probably better to avoid more recursion stack depth use
> and just use *buf++ as appropriate.

You can't use *buf++ as this code must work and increment buf even
when buf is NULL.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
