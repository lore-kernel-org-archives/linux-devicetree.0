Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEBBC17441
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 23:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3DD821925
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 23:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWK9MaQh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfKLXqj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 18:46:39 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:35803 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfKLXqj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 18:46:39 -0500
Received: by mail-yb1-f194.google.com with SMTP id h23so239167ybg.2
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 15:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ior18/Br9yc7PCdU/8L5uy+XseXzFZgB5I0f11fK4Ck=;
        b=pWK9MaQhof0Vf1Vv78HRv0joK/Go5T/Z3+5BcUm+p3ihuCpJzBBY4m4MvBK7ZV94Qn
         JMbd+/Gj9TrYgoKHemgbTQzUnO82sWaYYiDKQTRkGrIlw+6Gd/D5R21IVMInFF8C+uRx
         nQhLoJpwcFEAd+ejaJn1/8MTs9NNdhy8sFew0rLpO5zekA71gFMGuYaJPWznUfC4TG0s
         QKkfKG9iBFZRuC3iF+tkntOQ2vX9hdYmURaC0p7XIfpwDe045JYneidwbURuPuXnBE6r
         /hTSFTX2VQXIqwTkcI7+qj3l0as8mrE7MCahFtY3ZywAuBeD5nWYwe0tRINOY1hbVVU+
         JNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ior18/Br9yc7PCdU/8L5uy+XseXzFZgB5I0f11fK4Ck=;
        b=ZYO82kd2jnQQ50t7vp0VOGc3T/hwAI8Fnte+I9CQJhY2pAy2zxlBxcKeWkfBcIZgnu
         +X2VGEyWjjVsqwx5gMLcPVH4sup3Ow4UhRLhnQUdPDTk5Ry0PVev/Cf2vSdoFXne+y1S
         Xa3h0f6bmyIuhnfMi9v17aDqMicJqMBIDWIk9WDDGHWcLwSzaJIAobf8FZjou9mg4kCl
         szUmQeFjiROrUq1/AzS/WFZ+DCwgyoEXK6woG/tY1sEZOewH8LRIQlL6GGUKkxI+mxC/
         vqtdBzPm5u3XDX7H0Akk/oDj8GKiA6gtB8t3/gdFKdw77+eidL7QblUKcl3q/4jm7ujj
         djCA==
X-Gm-Message-State: APjAAAUNJ6DR3+HIMUMEtA5YrSzqaWVQMTUmxLaxVwK5dJdRQxY9Gp0x
        htBSjF74zaJyvjenXwnKjog=
X-Google-Smtp-Source: APXvYqzB1+QzFeph1biO4+FD5XMoj28jWHjWnGfycadr5g6qEQXkAQhDJkATHPvmSWMtkJfsPnt2ww==
X-Received: by 2002:a25:b8c:: with SMTP id 134mr498347ybl.115.1573602398228;
        Tue, 12 Nov 2019 15:46:38 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id x78sm133296ywg.108.2019.11.12.15.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 15:46:37 -0800 (PST)
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
To:     Rob Herring <robh+dt@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <CAL_JsqLecYPGGP8grE7sUgD1ZBYeVhuqX_sOT_9Rw1LM1yhSmw@mail.gmail.com>
 <20191112091032.aa23wd24j4b324kw@linutronix.de>
 <CAL_Jsq+Rfguea+KO0kLKom=8t_oCnesT8cb833Y0fhsbu_a1Cg@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <c2c76ab9-9967-3cc3-fff2-5f791598c7e3@gmail.com>
Date:   Tue, 12 Nov 2019 17:46:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+Rfguea+KO0kLKom=8t_oCnesT8cb833Y0fhsbu_a1Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 11/12/19 9:55 AM, Rob Herring wrote:
> On Tue, Nov 12, 2019 at 3:10 AM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>>
>> On 2019-11-11 21:35:35 [-0600], Rob Herring wrote:
>>>>    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
>>>>    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")
>>>
>>> So to summarize, we changed mainline to fix RT which then broke RT. :)
>>
>> correct, but we were good until v4.17-rc1 :)
>>
>>>> I've been looking into making devtree_lock a spinlock_t which would
>>>> avoid this patch. I haven't seen an issue during boot on arm64 even
>>>> with hotplug.
>>>
>>> Did you look into using RCU reader locks any more?
>>
>> A little bit. The writers, which modify the node, would need to replace
>> the whole node. So this is where things got a little complicated.
> 
> Why is that exactly? That's pretty much how node and property updates
> work anyways though maybe not strictly enforced. The other updates are
> atomic flags and ref counts which I assume are fine. The spinlock
> protects traversing the tree of nodes and list of properties.
> Traversing and updates would need to follow similar semantics as
> rculist, right? BTW, there's been some thoughts to move node and
> property lists to list_head. We may want to do that rather than trying
> to roll our own RCU code.
> 
>> Frank wasn't a big fan of it back then and he still wasn't a few weeks
>> back.
> 
> I guess you spoke at ELCE. RCU seems like the right locking to me as
> we're almost entirely reads and I haven't seen another proposal.
> 
>> If you two agree to prefer RCU over this patch then I would look more
>> into adding RCU into the lookup path. The argument was that this isn't
>> time critical. I'm just trying to avoid to replace the locking for
>> nothing.
>> So, should I come up with a RCU patch?
> 
> Lets see what Frank says first.

RCU is good for adding list entries, deleting list entries, and updating
the value(s) of a list element.

RCU is not good for excluding readers of a data structure while multiple
entries are being added, deleted, and/or modified, such that the readers
only see the state of the data structure either (1) before any changes
or (2) after all changes occur.  Overlay application and removal require
multiple modifications, with readers seeing either the before state of
the after state.


> While this patch is a bit of a band-aid, I don't think it complicates
> the situation at all to prevent coming up with a better solution. The

Agreed.


> other option is get rid of the memory allocation altogether. My
> preference for the cache was a simpler solution that was truly a cache
> (i.e. a fixed size that could miss). The performance wasn't quite as
> good though.

The current implementation allows and properly handles misses.  But misses
will not occur if the range of phandle values is in the range of 1..n,
when there are n distinct phandle values.

I don't think the patch makes the implementation so bad that the cache
should instead switch to a fixed size to avoid kcalloc().

> 
> Rob
> 

