Return-Path: <SRS0=dKgV=Z6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577C3C43603
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Dec 2019 04:30:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14233206D6
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Dec 2019 04:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3gVGeXR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfLHEaJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 7 Dec 2019 23:30:09 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41429 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbfLHEaJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 7 Dec 2019 23:30:09 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so5379774pgk.8
        for <devicetree@vger.kernel.org>; Sat, 07 Dec 2019 20:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=781PHwSm+/eYNey8e32dXuSLH7usiq4iiJyGRSA4Sbs=;
        b=L3gVGeXRlYTYTATfZf6LVpsH+8+kTbmU8FtxEpACxibl2pJH41HAfQZnq+jePkJRFQ
         L9XXqNDTC8L+KNlDFkXML2edqiPff+zXdDwoMTWj0IxrFZjDlynk3bkAqY7UFa+RTwaV
         m5SHOhHvmfMpcXc/q2RVSlDhLURmOW/DI6Q7wWaOIqVEvVznxpMeckISEIlbUQElpeD8
         EbfOa9LFLEe6cAYGYmTALGzXouEvxy3xsof+A6/A5UZ3jbF37E0vKmvpnYljMalRmGsz
         2mlpGieD11JGCZ0/kY6z4YtAz5lbsSmTSxUYYcOmKvXc+8TkG1qCg35beQDSqAGwub0k
         6mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=781PHwSm+/eYNey8e32dXuSLH7usiq4iiJyGRSA4Sbs=;
        b=TGE5g90ROa85VbeCocrNboalVahVeMqcfP6Hrv+DciVvlNbA5ZZ890Hu/7ellQoVfW
         FzVk6Yv33jxYRJ/fAjtJdjsWaeuaLcqurZyHBccRzlzo531niVDWwyxCeDOS9+vDeIvE
         3iN0fTYMe9Rx6xTXuD+Qi4n2CW9UcKAV4ySrum70MAIJKgsw/lM1OCvzG8XDvVlzjLHf
         G0IOPjeSNARzO3+H1eW2PTtt1w/PxnoxJWjW7RdjunLhgY0zOU0l0+TsA6aTxUw9oC+i
         UgtXxfF4jVq4v448HWNxiz5CrI5Z75a924LtDZ1VyUUVPmnoVy3Ju44rtakyoAltlIPl
         0k7g==
X-Gm-Message-State: APjAAAVolE/UhqPlSf0tjW7es5AWXBQ7iUZY8lAWFKqbNKqu6N45JERs
        TKwMTEq0mXYT/NcySWajiyQ=
X-Google-Smtp-Source: APXvYqxl7KqZw+jNN3kWCNmOb/uJUayp/iyU9scOprFRkFoeoHaViuVl6YYUbpMSoaOVVXt9/Yig8Q==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr12199800pga.176.1575779408324;
        Sat, 07 Dec 2019 20:30:08 -0800 (PST)
Received: from [10.231.110.95] ([125.29.25.186])
        by smtp.gmail.com with ESMTPSA id d65sm21898652pfa.159.2019.12.07.20.30.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Dec 2019 20:30:07 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <87wobedpit.fsf@mpe.ellerman.id.au>
 <20191203183531.GT24609@gate.crashing.org>
 <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
 <20191206234034.GW3152@gate.crashing.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <051776be-9247-1c00-3131-a68c3c7794b2@gmail.com>
Date:   Sat, 7 Dec 2019 22:30:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191206234034.GW3152@gate.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/6/19 5:40 PM, Segher Boessenkool wrote:
> Hi,
> 
> On Thu, Dec 05, 2019 at 07:37:24PM -0600, Frank Rowand wrote:
>> On 12/3/19 12:35 PM, Segher Boessenkool wrote:
>>> Btw.  Some OFs mangle the phandles some way, to make it easier to catch
>>> people using it as an address (and similarly, mangle ihandles differently,
>>> so you catch confusion between ihandles and phandles as well).  Like a
>>> simple xor, with some odd number preferably.  You should assume *nothing*
>>> about phandles, they are opaque identifiers.
>>
>> For arm32 machines that use dtc to generate the devicetree, which is a
>> very large user base, we certainly can make assumptions about phandles.
> 
> I was talking about OF.  Phandles are explicitly defined to be opaque
> tokens.  If there is an extra meaning to them in flattened device trees,
> well, the kernel should then only depend on that there, not for more
> general phandles.  Where is this documented btw?

And dtc generated devicetrees are a huge proportion of the OF systems.

It is not documented.

As an aside, overlays also depend upon the current dtc implementation.
If an extremely large value is used for a phandle then overlay
application will fail.


> 
>> Especially because the complaints about the overhead of phandle based
>> lookups have been voiced by users of this specific set of machines.
>>
>> For systems with a devicetree that does not follow the assumptions, the
>> phandle cache should not measurably increase the overhead of phandle
>> based lookups.
> 
> It's an extra memory access and extra code to execute, for not much gain
> (if anything).  While with a reasonable hash function it will be good
> for everyone.
> 
>> If you have measurements of a system where implementing the phandle
>> cache increased the overhead,
> 
> Are you seriously saying you think this code can run in zero time and
> space on most systems?

No.  I made no such claim.  Note the additional words in the following
sentences.


>> and the additional overhead is a concern
>> (such as significantly increasing boot time) then please share that
>> information with us.  Otherwise this is just a theoretical exercise.
> 
> The point is that this code could be easily beneficial for most (or all)
> users, not just those that use dtc-constructed device trees.  It is

The point is that the cache was implemented to solve a specific problem
for certain specific systems.  There had been a few reports of various
machines having the same issue, but finally someone measures a **significant**
improvement in boot time for a specific machine.  The boot time with
the cache was **measured** to be much shorter.  The boot time for all
systems with a dtc generated devicetree is expected to be faster.  No
one responded to the implementation when it was proposed with a
**measurement** that showed increased boot time.  A concern of using
more memory was raised and discussed, with at least on feature added
as a result (freeing the cache in late init if modules are not
enabled).

Being "beneficial for most (or all) users" has to be balanced against
whether the change would remove the benefit for the system that the
feature was originally implemented to solve a problem for.  There
was no performance data supplied to answer this question.  (Though
eventually Rob did some measurements of the impact on hash efficiency
for such a system.)


> completely obvious that having a worse cache hash function results in
> many more lookups.  Whether that results in something expressed as
> milliseconds on tiny systems or microseconds on bigger systems is
> completely beside the point.

There was no performance data accompanying the proposed change that
started this thread.  There was no data showing whether the systems
that this feature was created for would suffer.  There was no data
showing that the boot time of the pseries systems would improve.
There was no assertion made that too much memory was being used
by the cache (there was an implied assertion that a large
percentage of the memory used for the cache was not used, thus
the performance benefit of the cache could be improved by
changing to using a hash instead of mask).  We had rejected
creating a cache for several years until finally some solid
data was provided showing an actual need for it.

It is not a question of "milliseconds on tiny systems or
microseconds on bigger systems".  I agree with that.  But it
does matter whether the performance impact of various
implementations is large enough to either solve a problem
or create a problem.  On the other hand, if the amount of
memory used by the cache is a problem (which is _not_
what was asserted by the patch submitter) then we can have
a conversation about how to resolve that.

-Frank

> 
> 
> Segher
> 

