From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Patch to improve device tree structure
Date: Tue, 18 Nov 2014 17:37:11 -0800
Message-ID: <546BF447.6080300@gmail.com>
References: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com> <20141118151026.D2D63C40966@trevor.secretlab.ca>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141118151026.D2D63C40966-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/18/2014 7:10 AM, Grant Likely wrote:
> On Sun, 16 Nov 2014 20:52:56 -0800
> , Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  wrote:
>> This patch improves the implementation of device tree structure.
>>
>> Traditional child and sibling linked list in device tree structure
>> is removed and is replaced by list_head (i.e. circular doubly linked
>>  list) already available in Linux kernel.
>>
>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Hi Gaurav,
> 
> So, after you've done this work, I need to you rebase it (and of course
> it is non-trivial) onto linux-next. I've already got a patch queued up
> which gets rid of the of_allnodes/allnext list which will have conflicts
> with this patch.
> 
> I'll make comments below where still relevant.

Grant,

My first reaction to this patch was that moving to using struct list_head
made the code less readable plus increased the size of struct device_node.

I reworked the changes to drivers/of/base.c to see if I could make
it a little more readable.  And I see below that you also have some
suggestions that make it more readable.

Even after that, I'm still feeling that the gain of moving to a more
standard list data type might not be greater than the downsides in
terms of readability and space.  The current list implementation does
seem like a decent fit to the problem space.

</ opinion, take it for what it is worth >

-Frank


< snip - original patch, plus Grant's comments >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
