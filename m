From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Enabling OF selftest to run without machine's devicetree
Date: Mon, 28 Jul 2014 10:00:20 -0500
Message-ID: <CAL_JsqKG2a=8zvRfjuP_VEM_+W8wfnmjK8PUqW6w_cZsA7dvDQ@mail.gmail.com>
References: <1406404130-27289-1-git-send-email-gaurav.minocha.os@gmail.com>
 <CAL_JsqJXqoyCRcMdS83zPr7prY52GgbAd1y+tgVn5f6Q+=CwxQ@mail.gmail.com>
 <CA+rpMb+pPZykJ7-XurVSSOaTPGNji9zG7FtVB+m6-gNiOHM4Jw@mail.gmail.com> <CA+rpMbJmCQ7YfJ7c+hjOmdfAdTHtTuH34mEWGH9Xo=rYJFDgKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMbJmCQ7YfJ7c+hjOmdfAdTHtTuH34mEWGH9Xo=rYJFDgKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 27, 2014 at 10:28 PM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Jul 26, 2014 at 3:17 PM, Gaurav Minocha
> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Sat, Jul 26, 2014 at 2:11 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Sat, Jul 26, 2014 at 2:48 PM, Gaurav Minocha
>>> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> If there is no devicetree present, this patch adds the selftest
>>>> data as a live devicetree. It also removes the same after the
>>>> testcase execution is complete.

[...]

>>>> @@ -614,10 +616,31 @@ static int __init selftest_data_add(void)
>>>>                         "not running tests\n", __func__);
>>>>                 return -ENOMEM;
>>>>         }
>>>> -       of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
>>>
>>> Can't you keep this factored out and just do "of_allnodes =
>>> selftest_data_node;"?
>>>
>> I tried to do that in first place, but of_alias_scan() called from
>> of_fdt_unflatten_tree(..)
>> needs of_allnodes. So, had to call it separately.

No, it is not or I'm missing some change. Or it is a bug? It is called
from unflatten_device_tree which is the early boot version.

> Actually, it's possible if rather than calling of_alias_scan from
> of_fdt_unflatten_tree, I write a wrapper and export it as below.
> So, I will be able to call of_fdt_alias_scan explicitly.
>
> of_fdt_alias_scan()
> {
>      of_alias_scan(&kernel_tree_alloc);
> }
> EXPORT_SYMBOL(of_fdt_alias_scan)

I prefer to keep this internal to the DT code. Plus of_fdt_* functions
operate on a flat tree and of_alias_scan operates on unflattened tree.

>
> OR
>
> directly export of_alias_scan() and
> kernel_tree_alloc(u64 size, u64 align)
>
> please let me know if I should follow either of the above
> approach in my next patch.

Perhaps as you had it is fine.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
