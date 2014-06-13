From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] OF: fix of_find_node_by_path() assumption that
 of_allnodes is root
Date: Fri, 13 Jun 2014 16:12:55 -0500
Message-ID: <CAL_JsqLs7m_ouruWzjq6rnEwWamsDgNMmE+WAo-+W9DMLMUXAQ@mail.gmail.com>
References: <539A91E2.7000606@gmail.com> <CAL_JsqJ+f0CjwGnqTzXjMOAvbDOf0O3BZgcQwrzaWBy9Gwiw8A@mail.gmail.com>
 <539B2B7F.8010900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539B2B7F.8010900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 11:49 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 6/13/2014 6:52 AM, Rob Herring wrote:
>> On Fri, Jun 13, 2014 at 12:53 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>>
>>> Pantelis Antoniou reports that of_find_node_by_path() is borked because
>>> of_allnodes is not guaranteed to contain the root of the tree after using
>>> any of the dynamic update functions because some other nodes ends up as
>>> of_allnodes.
>>>
>>> Fixes: c22e650e66b8 of: Make of_find_node_by_path() handle /aliases
>>
>> Is it not possible to do a fix in of_find_node_by_path instead? I just
>
> Yes, the code for that is in https://lkml.org/lkml/2014/5/20/758
>
> Or as Grant said in his reply, just use the fix in of_attach_node() for
> now since he is going to replace the custom list.

Okay, I've applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
