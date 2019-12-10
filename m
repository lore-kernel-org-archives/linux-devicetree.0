Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CC9C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 08:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E004A20663
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 08:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqJGo95y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLJIRh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 03:17:37 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41024 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbfLJIRh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 03:17:37 -0500
Received: by mail-pf1-f193.google.com with SMTP id s18so8667693pfd.8
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vr9KieBaPTGPrNLzjfejQ2FZzjA00zWd0juLdIYB5Wc=;
        b=qqJGo95yVqOfDz2IMkN1eRmG6IVDD49GFkROvfk+3AHp/Yu/q8u/ZaIdsXZ1Cb+RIw
         XQ9rhxPbMpfor7rDBzgV9+S+M6F/ZSBE7IUFmCyAEH/m3WxJseY19RFywhOMs62fwMLI
         w/+ka551dJD7c/KS69IQ1YMr0OC9dZ3ThGADDP1M2Kz0xD/tNRNgR6w+3ZWwwV+ypjDL
         ziAVsY/JIsuV0NmJttjQVGymiq9UXZMmEfRg4m66MQYKTo6evw/1EVGLy5zS6Uvb3rsZ
         ac6ezKm21Vl4OmB1FxWmbvy/qLplG+1wrORaieDBaCNxsUxGCGqNAw3zVY91o3KeuEcQ
         4IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vr9KieBaPTGPrNLzjfejQ2FZzjA00zWd0juLdIYB5Wc=;
        b=FIQnfNVCZu8eU5YcBn8rYX5bzuCYNOpazA2LqzF6VEetN7kBhARItphF3KqcHlKztF
         hHW6SfyVjH/O3iQM/tVngsVWt/eBEf7egLHuR4DYyhczXEZws0boyzx8c3ejpjbcrXr5
         Y3zL674MysKoyPO4e7SnDhbOcF194L8RG+GCRzVDIYs0cIL8IkU4I6/oY1K4da+2XTSL
         FizZLFxKVtucutcglGNM/T8rDS6TshYxnTxcm+M/ukQ5w8oHY+MGHi6XNiueaqRd801a
         xyt5tnR++szY7tJgg7/6mcnDtPBhvzGpk3je+m5TSdwNl/VUR794SMcHdaT2x3XW+NfH
         FFcg==
X-Gm-Message-State: APjAAAV0OvQ1D4sGlWhhSde2AVQwb1CgdDV+UxMmXnQvsmw1OO4TKQtu
        xKAmIEfv24qC9wkU2S5Zxg0=
X-Google-Smtp-Source: APXvYqyatuDOlP/htAmmhifwZWLyZfoefZzoN8Rgg3OSVkkvKqaIiH/3ZCOFXAes9P27k1qUN/CrNA==
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr22929722pgv.55.1575965856388;
        Tue, 10 Dec 2019 00:17:36 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:1572:c35d:e9db:e357? ([240d:1a:90a:7900:1572:c35d:e9db:e357])
        by smtp.gmail.com with ESMTPSA id f13sm2214853pfa.57.2019.12.10.00.17.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Dec 2019 00:17:35 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
Date:   Tue, 10 Dec 2019 02:17:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLVJi_v9yD5khLUvJHDEXFj=eXFf-CHXz30y0mYojt-Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/9/19 7:51 PM, Rob Herring wrote:
> On Mon, Dec 9, 2019 at 7:35 AM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>>
>> On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
>>> Is there a memory usage issue for the systems that led to this thread?
>>
>> No, no memory issue led to this thread. I was just testing my patch and
>> I assumed that I did something wrong in the counting/lock drop/lock
>> acquire/allocate path because the array was hardly used. So I started to
>> look deeper…
>> Once I figured out everything was fine, I was curious if everyone is
>> aware of the different phandle creation by dtc vs POWER. And I posted
>> the mail in the thread.
>> Once you confirmed that everything is "known / not an issue" I was ready
>> to take off [0].
>>
>> Later more replies came in such as one mail [1] from Rob describing the
>> original reason with 814 phandles. _Here_ I was just surprised that 1024
>> were used over 64 entries for a benefit of 60ms. I understand that this
>> is low concern for you because that memory is released if modules are
>> not enabled. I usually see that module support is left enabled.
>>
>> However, Rob suggested / asked about the fixed size array (this is how I
>> understood it):
>> |And yes, as mentioned earlier I don't like the complexity. I didn't
>> |from the start and I'm  I'm still of the opinion we should have a
>> |fixed or 1 time sized true cache (i.e. smaller than total # of
>> |phandles). That would solve the RT memory allocation and locking issue
>> |too.
>>
>> so I attempted to ask if we should have the fixed size array maybe
>> with the hash_32() instead the mask. This would make my other patch
>> obsolete because the fixed size array should not have a RT issue. The
>> hash_32() part here would address the POWER issue where the cache is
>> currently not used efficiently.
>>
>> If you want instead to keep things as-is then this is okay from my side.
>> If you want to keep this cache off on POWER then I could contribute a
>> patch doing so.
> 
> It turns out there's actually a bug in the current implementation. If
> we have multiple phandles with the same mask, then we leak node
> references if we miss in the cache and re-assign the cache entry.

Aaargh.  Patch sent.

> Easily fixed I suppose, but holding a ref count for a cached entry
> seems wrong. That means we never have a ref count of 0 on every node
> with a phandle.

It will go to zero when the cache is freed.

My memory is that we free the cache as part of removing an overlay.  I'll
verify whether my memory is correct.

-Frank


> 
> I've done some more experiments with the performance. I've come to the
> conclusion that just measuring boot time is not a good way at least if
> the time is not a significant percentage of the total. I couldn't get
> any measurable data. I'm using a RK3399 Rock960 board. It has 190
> phandles. I get about 1500 calls to of_find_node_by_phandle() during
> boot. Note that about the first 300 are before we have any timekeeping
> (the prior measurements also would not account for this). Those calls
> have no cache in the current implementation and are cached in my
> implementation.
> 
> no cache:  20124 us
> current cache: 819 us
> 
> new cache (64 entry): 4342 us
> new cache (128 entry): 2875 us
> new cache (256 entry): 1235 us
> 
> To get some idea on the time spent before timekeeping is up, if we
> take the avg miss time is ~17us (20124/1200), then we're spending
> about ~5ms on lookups before the cache is enabled. I'd estimate the
> new cache takes ~400us before timekeeping is up as there's 11 misses
> early.
> 
>>From these numbers, it seems the miss rate has a significant impact on
> performance for the different sizes. But taken from the original 20+
> ms, they all look like good improvement.
> 
> Rob
> 

