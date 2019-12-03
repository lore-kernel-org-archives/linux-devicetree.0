Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6E5C43215
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 04:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89DB22073B
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 04:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0jFSHDs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfLCE2m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 23:28:42 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:46115 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfLCE2m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 23:28:42 -0500
Received: by mail-pj1-f67.google.com with SMTP id z21so953377pjq.13
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 20:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8P0w8KphPi6rSrjLTuNVBYxVFByFC+P3r7zINnUs9yo=;
        b=l0jFSHDsYFZrJ/3j/Urpo5WxfkgRi8/R1tPnVmM2caEP1VMwT48aKb9kjejbHYaOb2
         R86pPb1HcLcxs+sb5KAan4OgH/WM/SC7gvKXvzbBtlTDIG2LjJ6jEJuSjvxSee61vc44
         9+16aZZUZzN29ObOxeflZdw9b3p8N3SHrvp38KH1XZo1zj0P9kmiy8kjxx7KNaDDccrL
         GaHxI6YauyIKB7JAQpPjUrTNagZ9F98RGLfZ5QD1vowJUJvyiFBus70Ko+ND4Ri4fy8J
         mbm9CkCYJcvQtDR+jdpBtRNorenC26EJM3PHpXfxFEYejaGbltn2xpZllNNzqt90ebvy
         dXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8P0w8KphPi6rSrjLTuNVBYxVFByFC+P3r7zINnUs9yo=;
        b=qO9YyhvT8iDiBQxRc8sk60rCzJnQGLW1o9hHMoKotmcLkpmzOTxrQgO5IYsisswQ7S
         +p2HqeZMCuf0NVNc5mHxamcauXx1dD+T5CqbHFTNXCzE1Z94gI4kBbuC0qEk3CJiFASD
         22Wzc0FNx/Jjyb44zWREEHD+czbkJ6Zm7lhwMuZHImjZVlNMsUXYSATeuGouLiZOmxt7
         XD2cVLguEIjXkemN8fw2hCEEsEda/5zhqjk7kJCa1RF/MErM6mQJArucsFSdqdVgbb3K
         inq5qH2a39bGjPN35zHOGwJNQTEbeiOzYPJGyfUYuqy6IPOCIjsUOdXzm/V6l6s3+HCy
         zrKg==
X-Gm-Message-State: APjAAAWoLl2mjsfWsqf8DlNt4UXp0F4Kmz5is0/82lqlecbg41oMPV9j
        jYQq2oxhbJIE/CVeXD3KNTg=
X-Google-Smtp-Source: APXvYqzwqRAsSdznW4XG3Ui5vku/ABziTBOhdYEpqNTvUk+8U8iut83jQCqVLved3nwihcIYAsm47g==
X-Received: by 2002:a17:90a:ff12:: with SMTP id ce18mr532136pjb.117.1575347321896;
        Mon, 02 Dec 2019 20:28:41 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:8c84:6439:19bd:b6b0? ([240d:1a:90a:7900:8c84:6439:19bd:b6b0])
        by smtp.gmail.com with ESMTPSA id q6sm1202357pfl.140.2019.12.02.20.28.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Dec 2019 20:28:41 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
Date:   Mon, 2 Dec 2019 22:28:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87tv6idp37.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/2/19 10:12 PM, Michael Ellerman wrote:
> Frank Rowand <frowand.list@gmail.com> writes:
>> On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
>>> I've been looking at phandle_cache and noticed the following: The raw
>>> phandle value as generated by dtc starts at zero and is incremented by
>>> one for each phandle entry. The qemu pSeries model is using Slof (which
>>> is probably the same thing as used on real hardware) and this looks like
>>> a poiner value for the phandle.
>>> With
>>> 	qemu-system-ppc64le -m 16G -machine pseries -smp 8 
>>>
>>> I got the following output:
>>> | entries: 64
>>> | phandle 7e732468 slot 28 hash c
>>> | phandle 7e732ad0 slot 10 hash 27
>>> | phandle 7e732ee8 slot 28 hash 3a
>>> | phandle 7e734160 slot 20 hash 36
>>> | phandle 7e734318 slot 18 hash 3a
>>> | phandle 7e734428 slot 28 hash 33
>>> | phandle 7e734538 slot 38 hash 2c
>>> | phandle 7e734850 slot 10 hash e
>>> | phandle 7e735220 slot 20 hash 2d
>>> | phandle 7e735bf0 slot 30 hash d
>>> | phandle 7e7365c0 slot 0 hash 2d
>>> | phandle 7e736f90 slot 10 hash d
>>> | phandle 7e737960 slot 20 hash 2d
>>> | phandle 7e738330 slot 30 hash d
>>> | phandle 7e738d00 slot 0 hash 2d
>>> | phandle 7e739730 slot 30 hash 38
>>> | phandle 7e73bd08 slot 8 hash 17
>>> | phandle 7e73c2e0 slot 20 hash 32
>>> | phandle 7e73c7f8 slot 38 hash 37
>>> | phandle 7e782420 slot 20 hash 13
>>> | phandle 7e782ed8 slot 18 hash 1b
>>> | phandle 7e73ce28 slot 28 hash 39
>>> | phandle 7e73d390 slot 10 hash 22
>>> | phandle 7e73d9a8 slot 28 hash 1a
>>> | phandle 7e73dc28 slot 28 hash 37
>>> | phandle 7e73de00 slot 0 hash a
>>> | phandle 7e73e028 slot 28 hash 0
>>> | phandle 7e7621a8 slot 28 hash 36
>>> | phandle 7e73e458 slot 18 hash 1e
>>> | phandle 7e73e608 slot 8 hash 1e
>>> | phandle 7e740078 slot 38 hash 28
>>> | phandle 7e740180 slot 0 hash 1d
>>> | phandle 7e740240 slot 0 hash 33
>>> | phandle 7e740348 slot 8 hash 29
>>> | phandle 7e740410 slot 10 hash 2
>>> | phandle 7e740eb0 slot 30 hash 3e
>>> | phandle 7e745390 slot 10 hash 33
>>> | phandle 7e747b08 slot 8 hash c
>>> | phandle 7e748528 slot 28 hash f
>>> | phandle 7e74a6e0 slot 20 hash 18
>>> | phandle 7e74aab0 slot 30 hash b
>>> | phandle 7e74f788 slot 8 hash d
>>> | Used entries: 8, hashed: 29
>>>
>>> So the hash array has 64 entries out which only 8 are populated. Using
>>> hash_32() populates 29 entries.
>>> Could someone with real hardware verify this?
>>> I'm not sure how important this performance wise, it looks just like a
>>> waste using only 1/8 of the array.
>>
>> The hash used is based on the assumptions you noted, and as stated in the
>> code, that phandle property values are in a contiguous range of 1..n
>> (not starting from zero), which is what dtc generates.
> 
>> We knew that for systems that do not match the assumptions that the hash
>> will not be optimal.
> 
> If we're going to have the phandle cache it should at least make some
> attempt to work across the systems that Linux supports.
> 
>> Unless there is a serious performance problem for
>> such systems, I do not want to make the phandle hash code more complicated
>> to optimize for these cases.  And the pseries have been performing ok
>> without phandle related performance issues that I remember hearing since
>> before the cache was added, which could have only helped the performance.
>> Yes, if your observations are correct, some memory is being wasted, but
>> a 64 entry cache is not very large on a pseries.
> 
> A single line change to use an actual hash function is hardly
> complicating it, compared to the amount of code already there.

With a dtc generated devicetree, the hash is perfect, with no
misses.  That single line change then makes the hash bad for
dtc generated devicetrees.

The cache was added to address a problem with a system with a
dtc generated devicetree.  I had not heard of any phandle
lookup performance issues on ppc systems.  An imperfect hash
for ppc should not make the ppc performance worse (unless
every single phandle value hashes to a single bucket).  So
the ppc performance is likely better than it was before
the hash was added, even without an optimal hash algorithm.

So the change would not be a single line change.  It would
be a change to use different hash algorithms for dtc
generated device trees versus other device trees.

Another possibility would be to make the cache be dependent
upon not CONFIG_PPC.  It might be possible to disable the
cache with a minimal code change.

> 
> cheers
> 

