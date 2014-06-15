From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] OF: fix of_find_node_by_path() assumption that of_allnodes
 is root
Date: Sat, 14 Jun 2014 20:36:42 -0700
Message-ID: <539D14CA.1060105@gmail.com>
References: <539A91E2.7000606@gmail.com> <CAL_JsqJ+f0CjwGnqTzXjMOAvbDOf0O3BZgcQwrzaWBy9Gwiw8A@mail.gmail.com> <CACxGe6sG+h7j9Npd-xR4-E13i=_p8OtbisgJv1PUzf981nGHUw@mail.gmail.com> <CACxGe6tv8H8yUYCs9N959T3KKDUDiDqJQ1LRfO5RJE3bxw5r5A@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tv8H8yUYCs9N959T3KKDUDiDqJQ1LRfO5RJE3bxw5r5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/14/2014 8:00 AM, Grant Likely wrote:
> On Fri, Jun 13, 2014 at 4:06 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Jun 13, 2014 at 2:52 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Fri, Jun 13, 2014 at 12:53 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>>>
>>>> Pantelis Antoniou reports that of_find_node_by_path() is borked because
>>>> of_allnodes is not guaranteed to contain the root of the tree after using
>>>> any of the dynamic update functions because some other nodes ends up as
>>>> of_allnodes.
>>>>
>>>> Fixes: c22e650e66b8 of: Make of_find_node_by_path() handle /aliases
>>>
>>> Is it not possible to do a fix in of_find_node_by_path instead? I just
>>> wonder if this could have any other unintended side-effects on
>>> of_attach_node's behavior.
>>
>> Given that I'm going to replace the custom list with list_head which
>> makes this problem go away, I think this solution is fine.
>>
>> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> That said, the following might be better because it would guarantee
> that children always appear after parents...

< snip >

I agree, I like that better.  Patch respun, v2 will be sent as a reply
to this email.

Pantelis, can you test v2 please?

Thanks,

Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
