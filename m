From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 01/13] of: Remove comments that state the obvious
Date: Thu, 27 Oct 2016 09:02:11 -0700
Message-ID: <58122503.2070201@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
 <1477429146-27039-2-git-send-email-frowand.list@gmail.com>
 <CAL_JsqL1aPq3rJLngvpQav-4-AKBd+u=+GX5NNpP9Kbc4zehpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL1aPq3rJLngvpQav-4-AKBd+u=+GX5NNpP9Kbc4zehpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/27/16 05:18, Rob Herring wrote:
> On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> Remove comments that state the obvious, to reduce clutter
> 
> I'm probably not the best reviewer, have you ever seen a comment in my code. :)
> 
>>
>> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/of/resolver.c | 31 ++-----------------------------
>>  1 file changed, 2 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>> index 46325d6394cf..4ff0220d7aa2 100644
>> --- a/drivers/of/resolver.c
>> +++ b/drivers/of/resolver.c
> 
>> @@ -75,8 +73,6 @@ static phandle of_get_tree_max_phandle(void)
>>
>>  /*
>>   * Adjust a subtree's phandle values by a given delta.
>> - * Makes sure not to just adjust the device node's phandle value,
>> - * but modify the phandle properties values as well.
> 
> What's missing here is the why? Why do we adjust phandle values?

Yes!  I will add that.

> 
>>   */
>>  static void __of_adjust_tree_phandles(struct device_node *node,
>>                 int phandle_delta)
>> @@ -85,32 +81,25 @@ static void __of_adjust_tree_phandles(struct device_node *node,
>>         struct property *prop;
>>         phandle phandle;
>>
>> -       /* first adjust the node's phandle direct value */
> 
> Seems somewhat useful.

ok

> 
>>         if (node->phandle != 0 && node->phandle != OF_PHANDLE_ILLEGAL)
>>                 node->phandle += phandle_delta;
>>
>> -       /* now adjust phandle & linux,phandle values */
> 
> Seems somewhat useful.

ok

> 
>>         for_each_property_of_node(node, prop) {
>>
>> -               /* only look for these two */
>>                 if (of_prop_cmp(prop->name, "phandle") != 0 &&
>>                     of_prop_cmp(prop->name, "linux,phandle") != 0)
>>                         continue;
>>
>> -               /* must be big enough */
>>                 if (prop->length < 4)
>>                         continue;
>>
>> -               /* read phandle value */
>>                 phandle = be32_to_cpup(prop->value);
>> -               if (phandle == OF_PHANDLE_ILLEGAL)      /* unresolved */
>> +               if (phandle == OF_PHANDLE_ILLEGAL)
>>                         continue;
>>
>> -               /* adjust */
>>                 *(uint32_t *)prop->value = cpu_to_be32(node->phandle);
>>         }
>>
>> -       /* now do the children recursively */
>>         for_each_child_of_node(node, child)
>>                 __of_adjust_tree_phandles(child, phandle_delta);
>>  }
> 
>> @@ -254,7 +239,6 @@ static int __of_adjust_tree_phandle_references(struct device_node *node,
>>
>>                 for (i = 0; i < count; i++) {
>>                         off = be32_to_cpu(((__be32 *)rprop->value)[i]);
>> -                       /* make sure the offset doesn't overstep (even wrap) */
> 
> Seems somewhat useful.

Seems obvious to me, but if others disagree I will leave it.  (I was somewhat
aggressive in removing comments).

> 
>>                         if (off >= sprop->length ||
>>                                         (off + 4) > sprop->length) {
>>                                 pr_err("%s: Illegal property '%s' @%s\n",
> 
>> @@ -349,10 +328,8 @@ int of_resolve_phandles(struct device_node *resolve)
>>         resolve_sym = NULL;
>>         resolve_fix = NULL;
>>
>> -       /* this may fail (if no fixups are required) */
> 
> Seem somewhat useful.

A later patch moves the "root_sym = ..." to just above the use of
root_sym.  At that location a failed of_find_node_by_path() is a
real failure.

> 
>>         root_sym = of_find_node_by_path("/__symbols__");
>>
>> -       /* locate the symbols & fixups nodes on resolve */
>>         for_each_child_of_node(resolve, child) {
>>
>>                 if (!resolve_sym &&
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
