From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Patch to improve device tree structure
Date: Wed, 19 Nov 2014 13:56:38 +0000
Message-ID: <CACxGe6u1YwQAivktwmiOZx1K1Ch0F1ofx3EriBi1qEAU99X9PQ@mail.gmail.com>
References: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com>
 <20141118151026.D2D63C40966@trevor.secretlab.ca> <546BF447.6080300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546BF447.6080300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2014 at 1:37 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 11/18/2014 7:10 AM, Grant Likely wrote:
>> On Sun, 16 Nov 2014 20:52:56 -0800
>> , Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>  wrote:
>>> This patch improves the implementation of device tree structure.
>>>
>>> Traditional child and sibling linked list in device tree structure
>>> is removed and is replaced by list_head (i.e. circular doubly linked
>>>  list) already available in Linux kernel.
>>>
>>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Hi Gaurav,
>>
>> So, after you've done this work, I need to you rebase it (and of course
>> it is non-trivial) onto linux-next. I've already got a patch queued up
>> which gets rid of the of_allnodes/allnext list which will have conflicts
>> with this patch.
>>
>> I'll make comments below where still relevant.
>
> Grant,
>
> My first reaction to this patch was that moving to using struct list_head
> made the code less readable plus increased the size of struct device_node.
>
> I reworked the changes to drivers/of/base.c to see if I could make
> it a little more readable.  And I see below that you also have some
> suggestions that make it more readable.
>
> Even after that, I'm still feeling that the gain of moving to a more
> standard list data type might not be greater than the downsides in
> terms of readability and space.  The current list implementation does
> seem like a decent fit to the problem space.

Moving to list_head has a couple of nice benefits. The prime
motification is that using a standard list_head means that the OF code
can be migrated to use the standard rcu operations and get rid of manual
of_node_{get,put} management in the majority of code paths.

A second reason to do this is it becomes easy to add nodes to the end of
the list instead of the beginning. It's a small thing, but it makes
unflattening simpler.

I've also considered switching to a hlist_head/hlist_node to keep the
footprint the same.* With an hlist_head the cost is a wash, but looses
the ability to do O(1) addition to the end of the list.

* Gaurav's patch removes the *child and *sibling pointers, but doesn't
  remove the *next pointer which can also be dropped. So, three pointers
  get dropped from the structure. Using list_head adds 4 pointers (Net
  +1). hlist_head adds 3 (Net 0).

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
