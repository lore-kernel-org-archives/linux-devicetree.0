Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50891C432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 02:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15556217BC
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 02:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cft47JZC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfK3CsJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 21:48:09 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:32815 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfK3CsJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 21:48:09 -0500
Received: by mail-yb1-f195.google.com with SMTP id o63so3707178ybc.0
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 18:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h5NC5IvVZZiqc0iy++UTanTgRuzq6t8qTsKUPscRzek=;
        b=cft47JZCnj7wWQn4v7BSX3McOlhxdL67FJ/hoAAt4TFLQAeuw1PHMq0QbduHYRjDv5
         OOjKg2BQl+Sz91p3qjuUwgBXZqn1j3/VL/SJXK0r42QD1Wdg+7zCUhquLUeTNvKD3GW6
         Zcl474csaVdiNhutPME9cC0Kjf/I9RtSbheTFmbx4dQrz6zsqqxuS9G5a6oGq92md55s
         7vpwC1JoAa1QYCLjsZWEp0spmB5yfyKYBlgUYDVQOJjg7uhNZ4MB4t2g6THzRyuW3uGd
         NB+pFpgvAfJefoCTIQyssAJbSVPO87iFNsGqb+ZzFZz9L1RqcejIANz1uJo8QGx2rg2X
         k1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h5NC5IvVZZiqc0iy++UTanTgRuzq6t8qTsKUPscRzek=;
        b=pJc4zlb8/pbmIwFLNCXsnLlSW1udeyv5nzsuCtIDZwfm/SnefSerMAVADxTFo1zWz7
         Jq23SXJ8AtX5idZtxKuxZ3IDLgk2GJVayl3exLyYbIZ1N1unCdsDgeBCWH7mjaENJJ/Z
         YaPkrA5etOo0Rn4OSa0OroLu50Dj0+zXJ+uaYqHMe9Dd6/iPkS3CDGP5MhbVUyINHlYU
         95y+zpSgL52CY9YY6BUl2q+Hyt9UVYJp6td3kkwwKACMftEkmOfQ4CbUO06mFvs5ruvT
         Zd+uCyuje9jaPuIrJSGpDiUfXYdSoPUrjCpaq9NcuTT7ij1J9ZUqywkJAIMt6r71oJqr
         rEGw==
X-Gm-Message-State: APjAAAUeE+b92IUpqzm17UiMqob1QA+Cu8v/kFEa3fP/GXRVEaRKLRml
        ClF8chcSLnbgySznd7Rme3QXVXBA
X-Google-Smtp-Source: APXvYqwQG11XMSHHfIaCckFJu/e1tCwN7Rq/u0c2btHIFjhvoTvR8aoq/Nx/YELu9+93zhdbCv9gSg==
X-Received: by 2002:a25:3753:: with SMTP id e80mr11970848yba.123.1575082086796;
        Fri, 29 Nov 2019 18:48:06 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id y186sm10705361ywe.97.2019.11.29.18.48.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 18:48:06 -0800 (PST)
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <e62e6a76-c614-80c4-2c9b-cd4326105fd9@gmail.com>
 <20191129135756.tfmuygw4be6yftz5@linutronix.de>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <1ce03fc5-e527-8bb7-e1af-4d05a9c000e5@gmail.com>
Date:   Fri, 29 Nov 2019 20:48:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129135756.tfmuygw4be6yftz5@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sebastian,

On 11/29/19 7:57 AM, Sebastian Andrzej Siewior wrote:
> On 2019-11-12 16:48:12 [-0600], Frank Rowand wrote:
>> Hi Sebastian,
> Hi Frank,
> 
>> On 11/11/19 11:21 AM, Sebastian Andrzej Siewior wrote:
>>> The phandle cache code allocates memory while holding devtree_lock which
>>> is a raw_spinlock_t. Memory allocation (and free()) is not possible on
>>> RT while a raw_spinlock_t is held.
>>> Invoke the kfree() and kcalloc() while the lock is dropped.
>>
>> I thought the GFP_ATOMIC passed to kcalloc() in of_populate_phandle_cache()
>> was sufficient.  And I didn't realize (or remember) that kfree was
>> not allowed while a raw_spinlock_t is held.  Do you have a
>> pointer to the preempt RT documentation that explains that?
>> I'd like to add that pointer to my personal notes about locking so
>> that I won't mis-remember this too often.
> 
> Unfortunately not yet. I have a mini document that needs polishing…
> However, since as far as my RT memory goes:
> GFP_ATOMIC can be used in non-blocking context. On !RT that includes
> disabled preemption and/or interrupts _usually_ part of locking (like
> spin_lock_irqsave()) or the inherited context like IRQ-handler or
> softirq for instance.
> On RT the former example is not blocking anymore (sleeping spinlocks,
> threaded IRQs). The locking with raw_spinlock_t still disables
> preemption and interrupts as part of the procedure. The GFP_ATOMIC in
> this case does not matter on RT here in terms of blocking (the part with
> emergency pools and so on remains unchanged). 
> The kfree() part within a raw_spinlock_t section has the same
> limitations on RT as kmalloc() for the same reason. The SLUB part of the
> function is fine. The problem is once SLUB has to call to the page
> allocated in order to return or ask for memory. We can't do this in
> blocking context.

Thanks for writing this up.

And thanks for digging even deeper into the relevant context than I
did below.

-Frank

> 
> …
>>> | smp: Bringing up secondary CPUs ...
>>> | BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:973
>>> | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
>>> | 1 lock held by swapper/1/0:
>>> |  #0: c000000000def6e0 (devtree_lock){+.+.}, at: of_find_node_opts_by_path+0x1f4/0x230
>>> | Preemption disabled at:
>>> | [<c0000000000557a0>] start_secondary+0xd0/0x6a0
>>> |
>>> | Call Trace:
>>> | [c0000001f9667d10] [c000000000158e30] ___might_sleep+0x250/0x270
>>> | [c0000001f9667da0] [c000000000984f40] rt_spin_lock+0x70/0x90
>>> | [c0000001f9667de0] [c0000000007e3634] of_find_node_opts_by_path+0x1f4/0x230
>>> | [c0000001f9667e30] [c0000000007e3844] of_get_next_cpu_node+0x144/0x180
>>> | [c0000001f9667e70] [c0000000007e38d8] of_get_cpu_node+0x58/0x90
>>> | [c0000001f9667eb0] [c00000000002eb00] cpu_to_chip_id+0x20/0x70
>>> | [c0000001f9667ee0] [c000000000055858] start_secondary+0x188/0x6a0
>>> | [c0000001f9667f90] [c00000000000b554] start_secondary_prolog+0x10/0x14
>>>
>>> because cpu_to_chip_id() acquires devtree_lock() early in the CPU-bring
>>> up path.
>>
>> I read too much into that sentence, and ran off on a tangent re-educating
>> myself on preempt RT lock stuff.
>>
>> The issue in this path is that start_secondary() disables preemption before
>> going down the code path that ends up with an attempt by of_find_node_opts_by_path()
>> to lock devtree_lock.  It is ok to acquire a raw spinlock with preemption
>> disabled, but not ok to acquire a normal spinlock with preemption disabled.
> That is correct. So
> 	spin_lock();
> 	spin_lock();
> 
> is okay. However
> 	preempt_disable();
> 	spin_lock();
> 
> is not okay. Same is true for s/preempt_disable/local_irq_disable()/.
> 
> Please note the even before preempt_disable() in start_secondary() the
> whole code runs with disabled interrupts as part of CPU bring up. 
> 
>> The calling path to cpu_to_chip_id() has an intervening call that does not
>> show up in the above trace, add_cpu_to_masks().  The first call of cpu_to_chip_id()
>> is "int chipid = cpu_to_chip_id(cpu)", which could be moved out to start_secondary(),
>> before preemption is disabled.  But at the end of add_cpu_to_masks() is:
>>
>>         for_each_cpu(i, cpu_online_mask)
>>                 if (cpu_to_chip_id(i) == chipid)
>>                         set_cpus_related(cpu, i, cpu_core_mask);
>>
>> This use of cpu_to_chip_id() is a little harder to move to before the preemption,
>> but it is possible.  A table of the chip ids for all possible cpus could be
>> created before disabling preemption, and the table could be passed into
>> add_cpu_to_masks().  This would allow devtree_lock to be changed to a
>> spinlock_t.
>>
>> I like this approach because it removes the one known place that constrains
>> what type of lock devtree_lock is.
> 
> So even if we move that whole section before preempt_disable(), we still
> run with disabled interrupts and can't use spinlock_t.
>  
>> My second choice (and I am willing to accept this) is:
>>
>>>
>>>  drivers/of/base.c |   19 +++++++++++++------
>>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>>
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -138,31 +138,34 @@ static u32 phandle_cache_mask;
>>>  /*
>>>   * Caller must hold devtree_lock.
>>>   */
>>
>> Add a one line comment to the effect of kfree()
>> can not occur while raw_spinlock_t held, so caller must
>> do the kfree().
> 
> okay.
> 
> …
>>> @@ -208,12 +212,14 @@ void of_populate_phandle_cache(void)
>>>  
>>>  	if (!phandles)
>>>  		goto out;
>>
>> Add a one line comment to the effect of raw_spinlock_t can not be held
>> when calling kcalloc().
> okay.
> 
>>> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>>  
>>>  	cache_entries = roundup_pow_of_two(phandles);
>>>  	phandle_cache_mask = cache_entries - 1;
>>>
>>
>> Need to avoid race with of_find_node_by_phandle().  So change the following
>> to tmp_phandle_cache = kcalloc(...
> okay.
>  
>>>  	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
>>>  				GFP_ATOMIC);
>>> +	raw_spin_lock_irqsave(&devtree_lock, flags);
>>
>> Then here:
>>
>>         phandle_cache = tmp_phandle_cache;
>>
>>>  	if (!phandle_cache)
>>>  		goto out;
>>>  
>>> @@ -225,6 +231,7 @@ void of_populate_phandle_cache(void)
>>>  
>>>  out:
>>>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>> +	kfree(shadow);
>>>  }
>>>  
>>>  void __init of_core_init(void)
>>>
>>
>> The subtle race with of_find_node_by_phandle() is that if
>> of_find_node_by_phandle() added an entry to the cache it
>> also did an of_node_get().  It is ok that of_populate_phandle_cache()
>> overwrite the cache entry, but it would also do an additional
>> of_node_get().
> okay.
> 
>> -Frank
> 
> Sebastian
> 

