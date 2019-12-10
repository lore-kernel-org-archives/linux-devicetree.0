Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0F1C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 12:46:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 379AB2073B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 12:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGaM03rJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfLJMqS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 07:46:18 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37250 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfLJMqS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 07:46:18 -0500
Received: by mail-pg1-f195.google.com with SMTP id q127so8866698pga.4
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 04:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0RJ9gOA6O4Gv2PmI1ZeznCe4B5gXlbgOZ+kRt1JJlWA=;
        b=AGaM03rJG2HvZgtroua9DONqlW0TCJEGAn0tgzJ1p3K/e6c66dn+mLz1bNWOpnlsNi
         ield6vWnLrPrMHs6r6xtSTkFNCe8/FdKZzPIL9R4f7upA8GkkhcZ8DqvVb/zE8fkJXRM
         tXQt97dpECuSIZW1sPWumefp9f4PrPDw/qfYyJcPyLCPprlrP5EfWl2/uQH0luALQlrf
         J7JLJoqTZmbmwff339HV5oS0dMv3I+GVIWfglx/1yn7H+UMUCsumcSY5FpXbD2wkQeN2
         4r8/5j4VbHT0SPjA4aFsZxhp3v/2dE1Wq3jyoeKmwSY2EGKRDaW/FjIlFqJve6UEfFul
         gKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0RJ9gOA6O4Gv2PmI1ZeznCe4B5gXlbgOZ+kRt1JJlWA=;
        b=FX28eg9E2RHaKv7gAtJvMO2bIBjv5QoEr9OYixmGT3Mop/V8JqjwAoHl9mQI3aDEu6
         9I6bT9Oh8acSb84gwB/LohxG0PUFx+T7EUy/Khlj0S7IZP6pduHTGu783tJv78eEAt1o
         MR0eNeQY7nyP6n+ccfo5cXtNjjj+H5KBsYmvzd2NG5X6eyc0j70E8/OqI2IIlO1TfkBs
         tOy6ceKUvpgHCgCj03bY+FUTKd98SjiVd3wCJ65SqhOf74yW9JOqQ8iD7+s1Z1/Bb8F0
         LFNnIJVyOkLEA5s2kufdFVTAzTF7kX8VEYm3M524G2PeSKwzMFLttIcidvDsDJYeVSzb
         RD8A==
X-Gm-Message-State: APjAAAWlOTCCw39ZbX/RhzozREThGGYlzadsfgwn+2d0LRbzQttKPeLU
        fS+pKCie+F0TVvOXSXy8b90=
X-Google-Smtp-Source: APXvYqyWc0ec2Q8xLT/YvvzRe07Ppkdx7eIhxEjhKuJDc2LYUl4PMRFYdR2r0ioGM2RVNhMyvu8tRg==
X-Received: by 2002:a63:604:: with SMTP id 4mr25213550pgg.406.1575981977596;
        Tue, 10 Dec 2019 04:46:17 -0800 (PST)
Received: from [10.231.110.95] ([125.29.25.186])
        by smtp.gmail.com with ESMTPSA id s18sm3315511pfh.47.2019.12.10.04.46.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 04:46:17 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
From:   Frank Rowand <frowand.list@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de>
 <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
 <20191209133531.ykkknqmeeb36rv7l@linutronix.de>
 <CAL_JsqLVJi_v9yD5khLUvJHDEXFj=eXFf-CHXz30y0mYojt-Yg@mail.gmail.com>
 <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
Message-ID: <174936b9-bd2c-8850-aa8f-f4c605b0f1d5@gmail.com>
Date:   Tue, 10 Dec 2019 06:46:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/10/19 2:17 AM, Frank Rowand wrote:
> On 12/9/19 7:51 PM, Rob Herring wrote:
>> On Mon, Dec 9, 2019 at 7:35 AM Sebastian Andrzej Siewior
>> <bigeasy@linutronix.de> wrote:
>>>
>>> On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
>>>> Is there a memory usage issue for the systems that led to this thread?
>>>
>>> No, no memory issue led to this thread. I was just testing my patch and
>>> I assumed that I did something wrong in the counting/lock drop/lock
>>> acquire/allocate path because the array was hardly used. So I started to
>>> look deeper…
>>> Once I figured out everything was fine, I was curious if everyone is
>>> aware of the different phandle creation by dtc vs POWER. And I posted
>>> the mail in the thread.
>>> Once you confirmed that everything is "known / not an issue" I was ready
>>> to take off [0].
>>>
>>> Later more replies came in such as one mail [1] from Rob describing the
>>> original reason with 814 phandles. _Here_ I was just surprised that 1024
>>> were used over 64 entries for a benefit of 60ms. I understand that this
>>> is low concern for you because that memory is released if modules are
>>> not enabled. I usually see that module support is left enabled.
>>>
>>> However, Rob suggested / asked about the fixed size array (this is how I
>>> understood it):
>>> |And yes, as mentioned earlier I don't like the complexity. I didn't
>>> |from the start and I'm  I'm still of the opinion we should have a
>>> |fixed or 1 time sized true cache (i.e. smaller than total # of
>>> |phandles). That would solve the RT memory allocation and locking issue
>>> |too.
>>>
>>> so I attempted to ask if we should have the fixed size array maybe
>>> with the hash_32() instead the mask. This would make my other patch
>>> obsolete because the fixed size array should not have a RT issue. The
>>> hash_32() part here would address the POWER issue where the cache is
>>> currently not used efficiently.
>>>
>>> If you want instead to keep things as-is then this is okay from my side.
>>> If you want to keep this cache off on POWER then I could contribute a
>>> patch doing so.
>>
>> It turns out there's actually a bug in the current implementation. If
>> we have multiple phandles with the same mask, then we leak node
>> references if we miss in the cache and re-assign the cache entry.
> 
> Aaargh.  Patch sent.
> 
>> Easily fixed I suppose, but holding a ref count for a cached entry
>> seems wrong. That means we never have a ref count of 0 on every node
>> with a phandle.
> 
> It will go to zero when the cache is freed.
> 
> My memory is that we free the cache as part of removing an overlay.  I'll
> verify whether my memory is correct.

And I'll look at non-overlay use of dynamic devicetree too.

-Frank

> 
> -Frank
> 
> 
>>
>> I've done some more experiments with the performance. I've come to the
>> conclusion that just measuring boot time is not a good way at least if
>> the time is not a significant percentage of the total. I couldn't get
>> any measurable data. I'm using a RK3399 Rock960 board. It has 190
>> phandles. I get about 1500 calls to of_find_node_by_phandle() during
>> boot. Note that about the first 300 are before we have any timekeeping
>> (the prior measurements also would not account for this). Those calls
>> have no cache in the current implementation and are cached in my
>> implementation.
>>
>> no cache:  20124 us
>> current cache: 819 us
>>
>> new cache (64 entry): 4342 us
>> new cache (128 entry): 2875 us
>> new cache (256 entry): 1235 us
>>
>> To get some idea on the time spent before timekeeping is up, if we
>> take the avg miss time is ~17us (20124/1200), then we're spending
>> about ~5ms on lookups before the cache is enabled. I'd estimate the
>> new cache takes ~400us before timekeeping is up as there's 11 misses
>> early.
>>
>> >From these numbers, it seems the miss rate has a significant impact on
>> performance for the different sizes. But taken from the original 20+
>> ms, they all look like good improvement.
>>
>> Rob
>>
> 
> 

