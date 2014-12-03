From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Patch to improve device tree structure
Date: Wed, 03 Dec 2014 11:42:57 -0800
Message-ID: <547F67C1.2060605@gmail.com>
References: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com> <20141118151026.D2D63C40966@trevor.secretlab.ca> <546BF447.6080300@gmail.com> <CACxGe6u1YwQAivktwmiOZx1K1Ch0F1ofx3EriBi1qEAU99X9PQ@mail.gmail.com> <546CEFC4.805@gmail.com> <20141128164829.CC876C40884@trevor.secretlab.ca> <547E85DF.5000200@gmail.com> <CACxGe6v-=nWamWbbe0EBk_X5D1M3LSo_CZ_w95NSVS5jcio=NA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6v-=nWamWbbe0EBk_X5D1M3LSo_CZ_w95NSVS5jcio=NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/3/2014 7:09 AM, Grant Likely wrote:
> On Wed, Dec 3, 2014 at 3:39 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 11/28/2014 8:48 AM, Grant Likely wrote:

< snip >

>>> Instead of keeping it always in order, what about reordering the whole
>>> list after all the nodes at a given level are unflattened? That would
>>> avoid traversing the entire sibling list on every node addition. Like
>>> this:
>>
>> Seems pretty close to a wash to me.  Either one would work.  Though
>> mine would benefit from the comment you added in yours.
>>
>> -Frank
> 
> Okay, if I can take that as an 'acked-by' from you then I'll merge my
> version of the patch. I prefer doing the post processing to sort the
> list because it is theoretically less costly.

Yes, that would be fine.

Acked-by:  Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

> 
> g.
> 
>>>
>>> g.
>>>
>>> >From de46de766eb4d2240208bf83fdae955361069352 Mon Sep 17 00:00:00 2001
>>> From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Date: Fri, 28 Nov 2014 16:03:33 +0000
>>> Subject: [PATCH] of: Drop ->next pointer from struct device_node
>>>
>>> The ->next pointer in struct device_node is a hanger-on from when it was
>>> used to iterate over the whole tree by a particular device_type property
>>> value. Those days are long over, but the fdt unflattening code still
>>> uses it to put nodes in the unflattened tree into the same order as node
>>> in the flat tree. By reworking the unflattening code to reverse the list
>>> after unflattening all the children of a node, the pointer can be
>>> dropped which gives a small amount of memory savings.
>>>
>>> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/of/fdt.c   | 24 ++++++++++++++++++------
>>>  include/linux/of.h |  1 -
>>>  2 files changed, 18 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>> index 7f6ee31d5650..a41f9fdb1aa0 100644
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -226,12 +226,8 @@ static void * unflatten_dt_node(void *blob,
>>>               prev_pp = &np->properties;
>>>               if (dad != NULL) {
>>>                       np->parent = dad;
>>> -                     /* we temporarily use the next field as `last_child'*/
>>> -                     if (dad->next == NULL)
>>> -                             dad->child = np;
>>> -                     else
>>> -                             dad->next->sibling = np;
>>> -                     dad->next = np;
>>> +                     np->sibling = dad->child;
>>> +                     dad->child = np;
>>>               }
>>>       }
>>>       /* process properties */
>>> @@ -329,6 +325,22 @@ static void * unflatten_dt_node(void *blob,
>>>
>>>       if (*poffset < 0 && *poffset != -FDT_ERR_NOTFOUND)
>>>               pr_err("unflatten: error %d processing FDT\n", *poffset);
>>> +
>>> +     /*
>>> +      * Reverse the child list. Some drivers assumes node order matches .dts
>>> +      * node order
>>> +      */
>>> +     if (!dryrun && np->child) {
>>> +             struct device_node *child = np->child;
>>> +             np->child = NULL;
>>> +             while (child) {
>>> +                     struct device_node *next = child->sibling;
>>> +                     child->sibling = np->child;
>>> +                     np->child = child;
>>> +                     child = next;
>>> +             }
>>> +     }
>>> +
>>>       if (nodepp)
>>>               *nodepp = np;
>>>
>>> diff --git a/include/linux/of.h b/include/linux/of.h
>>> index 8b021db3e16e..3f0f0ffbd5e5 100644
>>> --- a/include/linux/of.h
>>> +++ b/include/linux/of.h
>>> @@ -56,7 +56,6 @@ struct device_node {
>>>       struct  device_node *parent;
>>>       struct  device_node *child;
>>>       struct  device_node *sibling;
>>> -     struct  device_node *next;      /* next device of same type */
>>>       struct  kobject kobj;
>>>       unsigned long _flags;
>>>       void    *data;
>>>
>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
