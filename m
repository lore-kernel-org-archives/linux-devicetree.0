Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAFCC43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 01:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 927B42077B
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 01:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Psi5FvdB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfLFBwi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 20:52:38 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42099 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfLFBwh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 20:52:37 -0500
Received: by mail-pl1-f195.google.com with SMTP id x13so2008780plr.9
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 17:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fe4SiA6pipbKXVqledUqYWhjVbsNz1/ekbCTXUaHaHY=;
        b=Psi5FvdBQaKptiapA5wQMnY/0aDJtAJUCBOuWAOrk7sCelmE6L8U9lkM/c0ClF/ctw
         JDOnz6Cz+QTs2nQ+I0GuUi+S7COXkaDC4r4APG2FiNp4ecuaItTsfBn5UhN+tUJRCk4W
         BB0SaOVvboYM7Ov4u2py7ZSc1kvCnAh57SoFTQWvksv61j8jhTwsFbZe0KmaMiq2ffa1
         /rbXgV5BXa3+DovMlBXeRRBk66vrMMpLqDEznm5aPfLQdvI+2IEqKkQVuFatQ2c+xRYI
         xxw6lxJACcCFZtQB2psFnUWxpByZuXUXN/uIJtvxXxTZ194Sn+CpEXy18bBU7ECHdMfg
         Xxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fe4SiA6pipbKXVqledUqYWhjVbsNz1/ekbCTXUaHaHY=;
        b=QuLLdHrKCw5yjD0Lo2chQIG5p/xnsEmbTyAT+hscTlfznt/jsW5cBfkPhTfh+uGuP8
         SGSutYwARV/FkYBnEUHjyEOP/hnoFZQyM4FWlmnhKzYpO2/lP/8N/wIP+FhRQpoe95CM
         uX1VFloXHJVVGYDAICqqSQ9lor8f8RZxWXjKCW37EIh3LHkU3EHON1uoTae18wRJOuuV
         afB41JrIpa44R8k2f4u5qPzE0gm9tU89iuvzehuJ4YF8D6iz+XNE9Z2WlZdqyDB8uEh9
         M4r5ONiCaSzi4/keA1/skzj2uJv3dfU1LzfzRbydkckQf7i+H6LRWBQyXPI+pS7ZhIAo
         lHEQ==
X-Gm-Message-State: APjAAAVQQRDvXgGrdZPJqiotth2gJg851a0C3loLcOr6i5w7QHyGJXXT
        ZGExJ06mQjB+iLUSgD6tiws=
X-Google-Smtp-Source: APXvYqzH7BBFneKz6VQ9DQ4Q987JPxsuR/tW/n4Gphk2+ymqDWI5KPeqcXzTXCmt9/8c31Pw7FwpxA==
X-Received: by 2002:a17:90a:ff12:: with SMTP id ce18mr12948361pjb.117.1575597156885;
        Thu, 05 Dec 2019 17:52:36 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:b0a6:2318:ed21:5e5? ([240d:1a:90a:7900:b0a6:2318:ed21:5e5])
        by smtp.gmail.com with ESMTPSA id w11sm12775626pgs.60.2019.12.05.17.52.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 17:52:36 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <d5adf331-bf5a-0582-8bb3-fa35e96b3fd1@gmail.com>
Date:   Thu, 5 Dec 2019 19:52:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/3/19 10:56 AM, Rob Herring wrote:
> On Mon, Dec 2, 2019 at 10:28 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 12/2/19 10:12 PM, Michael Ellerman wrote:
>>> Frank Rowand <frowand.list@gmail.com> writes:
>>>> On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
>>>>> I've been looking at phandle_cache and noticed the following: The raw
>>>>> phandle value as generated by dtc starts at zero and is incremented by
>>>>> one for each phandle entry. The qemu pSeries model is using Slof (which
>>>>> is probably the same thing as used on real hardware) and this looks like
>>>>> a poiner value for the phandle.
>>>>> With
>>>>>     qemu-system-ppc64le -m 16G -machine pseries -smp 8
>>>>>
>>>>> I got the following output:
>>>>> | entries: 64
>>>>> | phandle 7e732468 slot 28 hash c
>>>>> | phandle 7e732ad0 slot 10 hash 27
>>>>> | phandle 7e732ee8 slot 28 hash 3a
>>>>> | phandle 7e734160 slot 20 hash 36
>>>>> | phandle 7e734318 slot 18 hash 3a
>>>>> | phandle 7e734428 slot 28 hash 33
>>>>> | phandle 7e734538 slot 38 hash 2c
>>>>> | phandle 7e734850 slot 10 hash e
>>>>> | phandle 7e735220 slot 20 hash 2d
>>>>> | phandle 7e735bf0 slot 30 hash d
>>>>> | phandle 7e7365c0 slot 0 hash 2d
>>>>> | phandle 7e736f90 slot 10 hash d
>>>>> | phandle 7e737960 slot 20 hash 2d
>>>>> | phandle 7e738330 slot 30 hash d
>>>>> | phandle 7e738d00 slot 0 hash 2d
>>>>> | phandle 7e739730 slot 30 hash 38
>>>>> | phandle 7e73bd08 slot 8 hash 17
>>>>> | phandle 7e73c2e0 slot 20 hash 32
>>>>> | phandle 7e73c7f8 slot 38 hash 37
>>>>> | phandle 7e782420 slot 20 hash 13
>>>>> | phandle 7e782ed8 slot 18 hash 1b
>>>>> | phandle 7e73ce28 slot 28 hash 39
>>>>> | phandle 7e73d390 slot 10 hash 22
>>>>> | phandle 7e73d9a8 slot 28 hash 1a
>>>>> | phandle 7e73dc28 slot 28 hash 37
>>>>> | phandle 7e73de00 slot 0 hash a
>>>>> | phandle 7e73e028 slot 28 hash 0
>>>>> | phandle 7e7621a8 slot 28 hash 36
>>>>> | phandle 7e73e458 slot 18 hash 1e
>>>>> | phandle 7e73e608 slot 8 hash 1e
>>>>> | phandle 7e740078 slot 38 hash 28
>>>>> | phandle 7e740180 slot 0 hash 1d
>>>>> | phandle 7e740240 slot 0 hash 33
>>>>> | phandle 7e740348 slot 8 hash 29
>>>>> | phandle 7e740410 slot 10 hash 2
>>>>> | phandle 7e740eb0 slot 30 hash 3e
>>>>> | phandle 7e745390 slot 10 hash 33
>>>>> | phandle 7e747b08 slot 8 hash c
>>>>> | phandle 7e748528 slot 28 hash f
>>>>> | phandle 7e74a6e0 slot 20 hash 18
>>>>> | phandle 7e74aab0 slot 30 hash b
>>>>> | phandle 7e74f788 slot 8 hash d
>>>>> | Used entries: 8, hashed: 29
>>>>>
>>>>> So the hash array has 64 entries out which only 8 are populated. Using
>>>>> hash_32() populates 29 entries.
>>>>> Could someone with real hardware verify this?
>>>>> I'm not sure how important this performance wise, it looks just like a
>>>>> waste using only 1/8 of the array.
>>>>
>>>> The hash used is based on the assumptions you noted, and as stated in the
>>>> code, that phandle property values are in a contiguous range of 1..n
>>>> (not starting from zero), which is what dtc generates.
>>>
>>>> We knew that for systems that do not match the assumptions that the hash
>>>> will not be optimal.
>>>
>>> If we're going to have the phandle cache it should at least make some
>>> attempt to work across the systems that Linux supports.
>>>
>>>> Unless there is a serious performance problem for
>>>> such systems, I do not want to make the phandle hash code more complicated
>>>> to optimize for these cases.  And the pseries have been performing ok
>>>> without phandle related performance issues that I remember hearing since
>>>> before the cache was added, which could have only helped the performance.
>>>> Yes, if your observations are correct, some memory is being wasted, but
>>>> a 64 entry cache is not very large on a pseries.
>>>
>>> A single line change to use an actual hash function is hardly
>>> complicating it, compared to the amount of code already there.
>>
>> With a dtc generated devicetree, the hash is perfect, with no
>> misses.  That single line change then makes the hash bad for
>> dtc generated devicetrees.
> 
> To quantify that, I did some tests with the hash algo and it's about a
> 10% collision rate using phandle values of 1-$cache_size. There's
> never more than 2 phandles colliding in a slot. The actual impact
> would be less given 100% thrashing seems unlikely.

Thank you for doing the tests.  Actual data helps a lot.

If there is only a 10% collision rate for this case, that does not
sound bad to me.  There is the possibility of current or future
code resulting in ping ponging between two phandle values which
collide in the cache, but that should not be the common case.

However, given a choice between two algorithms, one of which
guarantees no thrashing (the current cache algorithm) and one
which allows a pathologic use case which results in thrashing,
I prefer the first algorithm.  This may seem theoretical, but
I have seen enough pathological code paths in my years of
performance analysis and tuning to be sensitive to this issue.

> 
>> The cache was added to address a problem with a system with a
>> dtc generated devicetree.
> 
> The cache was added to address a problem with a system with a large
> number of nodes and phandles (814 phandles in the reported case). dtc
> happens to be used in that case.

Yes, you stated that in a more general way than I did.  Agreed.


> 
>> I had not heard of any phandle
>> lookup performance issues on ppc systems.  An imperfect hash
>> for ppc should not make the ppc performance worse (unless
>> every single phandle value hashes to a single bucket).  So
>> the ppc performance is likely better than it was before
>> the hash was added, even without an optimal hash algorithm.
>>
>> So the change would not be a single line change.  It would
>> be a change to use different hash algorithms for dtc
>> generated device trees versus other device trees.
>>
>> Another possibility would be to make the cache be dependent
>> upon not CONFIG_PPC.  It might be possible to disable the
>> cache with a minimal code change.
> 
> I'd rather not do that.

I also agree with that.  I threw that out as kind of a nuclear option.
If ppc did not benefit from the cache having been implemented and
perceived a negative impact from the cache, this is simply a way
to remove that negative impact.  Then ppc would be in the same
state as before we implemented the cache.  Again, I also do not
like such a special casing.

> 
> And yes, as mentioned earlier I don't like the complexity. I didn't
> from the start and I'm  I'm still of the opinion we should have a
> fixed or 1 time sized true cache (i.e. smaller than total # of
> phandles). That would solve the RT memory allocation and locking issue
> too.

I could be convinced to go to a one time sized cache, especially now
that the RT issue exists.  If we change to that, it would be documented
as a possible overhead impact that devicetree overlays would have to
accept.

-Frank

> 
> For reference, the performance difference between the current
> implementation (assuming fixes haven't regressed it) was ~400ms vs. a
> ~340ms improvement with a 64 entry cache (using a mask, not a hash).
> IMO, 340ms improvement was good enough.
> 
> Rob
> 

