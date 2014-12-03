From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Patch to improve device tree structure
Date: Wed, 3 Dec 2014 15:09:43 +0000
Message-ID: <CACxGe6v-=nWamWbbe0EBk_X5D1M3LSo_CZ_w95NSVS5jcio=NA@mail.gmail.com>
References: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com>
 <20141118151026.D2D63C40966@trevor.secretlab.ca> <546BF447.6080300@gmail.com>
 <CACxGe6u1YwQAivktwmiOZx1K1Ch0F1ofx3EriBi1qEAU99X9PQ@mail.gmail.com>
 <546CEFC4.805@gmail.com> <20141128164829.CC876C40884@trevor.secretlab.ca> <547E85DF.5000200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547E85DF.5000200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 3, 2014 at 3:39 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 11/28/2014 8:48 AM, Grant Likely wrote:
>> On Wed, 19 Nov 2014 11:30:12 -0800
>> , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>  wrote:
>>> On 11/19/2014 5:56 AM, Grant Likely wrote:
>>>> On Wed, Nov 19, 2014 at 1:37 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> On 11/18/2014 7:10 AM, Grant Likely wrote:
>>>>>> On Sun, 16 Nov 2014 20:52:56 -0800
>>>>>> , Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>  wrote:
>>>>>>> This patch improves the implementation of device tree structure.
>>>>>>>
>>>>>>> Traditional child and sibling linked list in device tree structure
>>>>>>> is removed and is replaced by list_head (i.e. circular doubly linked
>>>>>>>  list) already available in Linux kernel.
>>>>>>>
>>>>>>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>
>>>>>> Hi Gaurav,
>>>>>>
>>>>>> So, after you've done this work, I need to you rebase it (and of course
>>>>>> it is non-trivial) onto linux-next. I've already got a patch queued up
>>>>>> which gets rid of the of_allnodes/allnext list which will have conflicts
>>>>>> with this patch.
>>>>>>
>>>>>> I'll make comments below where still relevant.
>>>>>
>>>>> Grant,
>>>>>
>>>>> My first reaction to this patch was that moving to using struct list_head
>>>>> made the code less readable plus increased the size of struct device_node.
>>>>>
>>>>> I reworked the changes to drivers/of/base.c to see if I could make
>>>>> it a little more readable.  And I see below that you also have some
>>>>> suggestions that make it more readable.
>>>>>
>>>>> Even after that, I'm still feeling that the gain of moving to a more
>>>>> standard list data type might not be greater than the downsides in
>>>>> terms of readability and space.  The current list implementation does
>>>>> seem like a decent fit to the problem space.
>>>>
>>>> Moving to list_head has a couple of nice benefits. The prime
>>>> motification is that using a standard list_head means that the OF code
>>>> can be migrated to use the standard rcu operations and get rid of manual
>>>> of_node_{get,put} management in the majority of code paths.
>>>
>>> Oh yeah, I remember you mentioning that before.  That is what was missing
>>> from Gaurav's patch header, explaining the value of the change.  If this
>>> is the end goal, then I think it would be valuable to add a second patch
>>> to the series that shows what the actual changes for rcu will be so that
>>> the cost vs benefit of the end result can be evaluated.
>>>
>>>
>>>> A second reason to do this is it becomes easy to add nodes to the end of
>>>> the list instead of the beginning. It's a small thing, but it makes
>>>> unflattening simpler.
>>>
>>> Not a big change.  In the unflatten_dt_node() part of the patch, the
>>> result was 4 lines deleted, 3 lines added.  With my attached patch to
>>> remove the next field, it would have been 8 lines deleted, 3 lines
>>> added -- thus list_head is an even greater simplification.  But still
>>> tiny.
>>>
>>>
>>>> I've also considered switching to a hlist_head/hlist_node to keep the
>>>> footprint the same.* With an hlist_head the cost is a wash, but looses
>>>> the ability to do O(1) addition to the end of the list.
>>>>
>>>> * Gaurav's patch removes the *child and *sibling pointers, but doesn't
>>>>   remove the *next pointer which can also be dropped. So, three pointers
>>>>   get dropped from the structure. Using list_head adds 4 pointers (Net
>>>>   +1). hlist_head adds 3 (Net 0).
>>>
>>> I include a patch below to also drop the *next pointer.  Not to actually
>>> propose submitting the patch, but to suggest that Gaurav's patch should be
>>> counted as a net of +2 pointers.  I expect that you will accept either a
>>> list_head of an hlist_head patch, but if you do not then I will submit the
>>> below patch to remove *next or a patch to rename *next to match the actual
>>> usage of the field.
>>>
>>> I still do not have a strong opinion, but I am still feeling that the gain
>>> probably does not outweigh the cost.
>>>
>>> -Frank
>>>
>>>>
>>>> g.
>>>>
>>>
>>> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>>
>>> Decrease size of struct device_node by one pointer.
>>> The pointer is only used during the unflattening of the
>>> device tree at boot.
>>>
>>> The cost of removing the pointer is chasing through the
>>> sibling list to add new nodes instead of using the
>>> cached 'last_child'.  The cost is expected to be in the
>>> noise level.
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>>> ---
>>>  drivers/of/fdt.c   |   14 +++++++++-----
>>>  include/linux/of.h |    1 -
>>>  2 files changed, 9 insertions(+), 6 deletions(-)
>>>
>>> Index: b/include/linux/of.h
>>> ===================================================================
>>> --- a/include/linux/of.h
>>> +++ b/include/linux/of.h
>>> @@ -55,7 +55,6 @@ struct device_node {
>>>      struct  device_node *parent;
>>>      struct  device_node *child;
>>>      struct  device_node *sibling;
>>> -    struct  device_node *next;      /* next device of same type */
>>>      struct  device_node *allnext;   /* next in list of all nodes */
>>>      struct  kobject kobj;
>>>      unsigned long _flags;
>>> Index: b/drivers/of/fdt.c
>>> ===================================================================
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -226,12 +226,16 @@ static void * unflatten_dt_node(void *bl
>>>              *allnextpp = &np->allnext;
>>>              if (dad != NULL) {
>>>                      np->parent = dad;
>>> -                    /* we temporarily use the next field as `last_child'*/
>>> -                    if (dad->next == NULL)
>>> +                    if (dad->child == NULL)
>>>                              dad->child = np;
>>> -                    else
>>> -                            dad->next->sibling = np;
>>> -                    dad->next = np;
>>> +                    else {
>>> +                            struct device_node *next;
>>> +
>>> +                            next = dad->child;
>>> +                            while (next->sibling)
>>> +                                    next = next->sibling;
>>> +                            next->sibling = np;
>>> +                    }
>>>              }
>>>      }
>>>      /* process properties */
>>
>> Instead of keeping it always in order, what about reordering the whole
>> list after all the nodes at a given level are unflattened? That would
>> avoid traversing the entire sibling list on every node addition. Like
>> this:
>
> Seems pretty close to a wash to me.  Either one would work.  Though
> mine would benefit from the comment you added in yours.
>
> -Frank

Okay, if I can take that as an 'acked-by' from you then I'll merge my
version of the patch. I prefer doing the post processing to sort the
list because it is theoretically less costly.

g.

>>
>> g.
>>
>>>From de46de766eb4d2240208bf83fdae955361069352 Mon Sep 17 00:00:00 2001
>> From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Date: Fri, 28 Nov 2014 16:03:33 +0000
>> Subject: [PATCH] of: Drop ->next pointer from struct device_node
>>
>> The ->next pointer in struct device_node is a hanger-on from when it was
>> used to iterate over the whole tree by a particular device_type property
>> value. Those days are long over, but the fdt unflattening code still
>> uses it to put nodes in the unflattened tree into the same order as node
>> in the flat tree. By reworking the unflattening code to reverse the list
>> after unflattening all the children of a node, the pointer can be
>> dropped which gives a small amount of memory savings.
>>
>> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/of/fdt.c   | 24 ++++++++++++++++++------
>>  include/linux/of.h |  1 -
>>  2 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 7f6ee31d5650..a41f9fdb1aa0 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -226,12 +226,8 @@ static void * unflatten_dt_node(void *blob,
>>               prev_pp = &np->properties;
>>               if (dad != NULL) {
>>                       np->parent = dad;
>> -                     /* we temporarily use the next field as `last_child'*/
>> -                     if (dad->next == NULL)
>> -                             dad->child = np;
>> -                     else
>> -                             dad->next->sibling = np;
>> -                     dad->next = np;
>> +                     np->sibling = dad->child;
>> +                     dad->child = np;
>>               }
>>       }
>>       /* process properties */
>> @@ -329,6 +325,22 @@ static void * unflatten_dt_node(void *blob,
>>
>>       if (*poffset < 0 && *poffset != -FDT_ERR_NOTFOUND)
>>               pr_err("unflatten: error %d processing FDT\n", *poffset);
>> +
>> +     /*
>> +      * Reverse the child list. Some drivers assumes node order matches .dts
>> +      * node order
>> +      */
>> +     if (!dryrun && np->child) {
>> +             struct device_node *child = np->child;
>> +             np->child = NULL;
>> +             while (child) {
>> +                     struct device_node *next = child->sibling;
>> +                     child->sibling = np->child;
>> +                     np->child = child;
>> +                     child = next;
>> +             }
>> +     }
>> +
>>       if (nodepp)
>>               *nodepp = np;
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 8b021db3e16e..3f0f0ffbd5e5 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -56,7 +56,6 @@ struct device_node {
>>       struct  device_node *parent;
>>       struct  device_node *child;
>>       struct  device_node *sibling;
>> -     struct  device_node *next;      /* next device of same type */
>>       struct  kobject kobj;
>>       unsigned long _flags;
>>       void    *data;
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
