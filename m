From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: base: Export symbol of __of_find_all_nodes()
Date: Thu, 3 Nov 2016 09:16:12 -0500
Message-ID: <CAL_JsqLMfKNUxgYLSePAD7msW+nVdze3LgNrUMXMY1BfYkzs0A@mail.gmail.com>
References: <1477654092-12406-1-git-send-email-ldewangan@nvidia.com>
 <CAL_JsqJnAzJDeTS1Sr2H66++78zF+8wJfN8iYAQ3sbxJw1Axdw@mail.gmail.com> <581ACA0B.3010107@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <581ACA0B.3010107-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 3, 2016 at 12:24 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Thursday 03 November 2016 09:09 AM, Rob Herring wrote:
>>
>> On Fri, Oct 28, 2016 at 6:28 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> wrote:
>>>
>>> The function __of_find_all_nodes() is used in the public header
>>> linux/of.h and if any driver developed using this API then
>>> it reports error as unknown symbol if compiled as module.
>>>
>>> Export this APIs using EXPORT_SYMBOL() so that it can be used
>>> from driver compiled as module.
>>
>> What driver needs this? This isn't really a function I'd expect drivers to
>> use.
>>
>
> I am using the for loop for each node using the macro
> for_each_of_allnodes_from() which is define as
>
> #define for_each_of_allnodes_from(from, dn) \
>         for (dn = __of_find_all_nodes(from); dn; dn =
> __of_find_all_nodes(dn))
>
> and this is using the above APIs.

And then what driver is using this define?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
