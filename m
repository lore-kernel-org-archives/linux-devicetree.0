From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: for_each_xxx_of_node() - lots of refcounting bugs
Date: Thu, 03 Sep 2015 11:26:59 -0700
Message-ID: <55E890F3.3030505@gmail.com>
References: <20150901110743.GJ21084@n2100.arm.linux.org.uk> <CAL_JsqJE5seB=5-9_QJBFG1=ipDr_osQJusOSk00VZzwhs=CDA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJE5seB=5-9_QJBFG1=ipDr_osQJusOSk00VZzwhs=CDA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9/1/2015 3:00 PM, Rob Herring wrote:
> On Tue, Sep 1, 2015 at 6:07 AM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>> Consider the following loop:
>>
>>         for_each_child_of_node(&pdev->dev.of_node, child) {
>>                 if (some_condition)
>>                         break;
>>         }
>>
>> The use of for_each_..._of_node() leads people to believe that it's
>> like other for_each_...() loops - the continue and break statements
>> can be used.
>>
>> However, with OF, "break" can't be used without disrupting the
>> reference counting on the nodes.  This is because:

< snip - nice explanation of the situation >

>> We could go around and fix all these sites, but that's not going to
>> stop this continuing to happen into the future.  So, fixing the
>> existing bugs is not a fix at all, it's a papering over of a more
>> fundamental problem here.
> 
> Yes, the ref counting for DT in general is difficult to get right and
> needs to be redesigned. Geert did a checker and even the core and
> unittests have 44 errors[1]. However, it is a nop in most cases, and
> it only really matters on IBM pSeries and only for certain nodes on
> those AIUI. We've had some discussions about it before, but no one has
> come up with a solution. Managing this at a node level is probably too
> fine grained when most nodes don't need ref counting. The implicit get
> and explicit put are also a problem IMO. We need to be able to look at
> code and see the calls are balanced.
> 
> Rob
> 
> [1] https://lkml.org/lkml/2015/1/23/437

I agree with all of the above.  I do not think that chasing after all
the broken sites is a long term solution.

But I have been poking at this a little bit this year.  I have some run
time debug data that collects where the refcounts are modified and what
the resulting values are.  In the unlikely case that someone has a short
term refcount issue and needs to fix the broken refcount of a specific
DT object as a temporary work around, I can share my hack tools.

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
