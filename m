From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] vsprintf: Add %p extension "%pOF" for device tree
Date: Fri, 23 Jun 2017 09:13:38 -0500
Message-ID: <CAL_JsqLDd7e888JzrJw_af62umPgyRee91oZ47EKd9Wyxz6pBw@mail.gmail.com>
References: <20170614203025.7581-4-robh@kernel.org> <20170622204445.14930-1-robh@kernel.org>
 <1498186912.24295.9.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498186912.24295.9.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 10:01 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> On Thu, 2017-06-22 at 15:44 -0500, Rob Herring wrote:
>> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>
>> 90% of the usage of device node's full_name is printing it out in a
>> kernel message. However, storing the full path for every node is
>> wasteful and redundant. With a custom format specifier, we can generate
>> the full path at run-time and eventually remove the full path from every
>> node.
>>
>> For instance typical use is:
>>       pr_info("Frobbing node %s\n", node->full_name);
>>
>> Which can be written now as:
>>       pr_info("Frobbing node %pOF\n", node);
>
> I still think this should use another identifier like
> %pO for object then another letter for type of object
> maybe N for node.

It is. O is for kobj and F is for device node. It doesn't make a much
sense separately, but OF together makes sense as Open Firmware.

>
> And F is flags, f is name
>
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> []
>> @@ -1470,6 +1471,131 @@ char *flags_string(char *buf, char *end, void *flags_ptr, const char *fmt)
>>       return format_flags(buf, end, flags, names);
>>  }
>>
>> +static int device_node_calc_depth(const struct device_node *np)
>> +{
>> +     int d;
>> +
>> +     for (d = 0; np; d++)
>> +             np = np->parent;
>> +
>> +     return d;
>> +}
>> +
>> +static noinline_for_stack
>> +char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
>> +{
>> +     int i;
>> +     int depth = device_node_calc_depth(np);
>> +     static const struct printf_spec strspec = {
>> +             .field_width = -1,
>> +             .precision = -1,
>> +     };
>> +     const struct device_node *nodes[depth];
>> +
>> +     if (!depth)
>> +             returnuf;
>> +     /* special case for root node */
>> +     if (depth == 1)
>> +             return string(buf, end, "/", strspec);
>> +
>> +     depth--;
>> +     for (i = depth - 1; i >= 0; i--) {
>> +             nodes[i] = np;
>> +             np = np->parent;
>> +     }
>> +     for (i = 0; i < depth; i++) {
>> +             buf = string(buf, end, "/", strspec);
>> +             buf = string(buf, end, kbasename(nodes[i]->full_name), strspec);
>> +     }
>> +     return buf;
>> +}
>
> I think there should be another function to get
> a particular struct device_node * at a particular
> depth to avoid all the pointers on stack.
>
> Basically, adapt the for (i = depth - 1 loop to
> a function that returns nodes[i]

Okay.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
