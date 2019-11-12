Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B183BC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 22:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DCB621783
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 22:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQwntb6i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKLWsP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 17:48:15 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:33182 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLWsO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 17:48:14 -0500
Received: by mail-yb1-f195.google.com with SMTP id i15so190087ybq.0
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 14:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x+zbdb7wfpK642hZLvMahCEop1BdgpX81qldIVRmNfk=;
        b=gQwntb6ihniXZObw+VWrslIm2ZmVF3vEB8ZfnBi14lcab1eMmD4DmtT03DT744rY1m
         K3NQ8koeh8WGv7776BRj8vrkzh5hPT6CKnBredogMgYPzV+L2nk1TkpRrK25nEWmSKta
         HnzEcjh+JE1abWTGvSI4xEn5GNOOjd2qpglNabX9gcRuAyf18X9a9SEFR3kvolY0EN/0
         Qsps3wb9mJjvNpOOKK5AQWozp/cU3crUAC4kLk0qI3NYVjC1OLf3zOJ3TjtXU1jp6moq
         CmsFVz5btu/He0pANtICcmanuBC4MNSzXGFfPPrdtbWfA9y8LT4CkaYxDyquvj6EioYv
         yuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x+zbdb7wfpK642hZLvMahCEop1BdgpX81qldIVRmNfk=;
        b=PZ2NKmlzVOzcDBKtDmFKGJ9lObC8heMK1nPGRAeU0RW+YqznmYqjucFV1pcrUJHk10
         nyn5IYOiTq6xkbE26qI3/c+hxXTNEFzqX8sncMvssyk5y7Yd7gsBj+gHmbj/IGCFjOAQ
         MBUv0P1k/FE5dVnFOI9YFs6O1AAcFdxh1y4JF17m3+u+fats1xe5hPgKF4ekI+ezECb+
         WWwl++oZFUgnejZsgaDtPQDnSCVIj4so7xSkCfNe72zs6eXHj6MQO4ePOgVj3mK1IkzO
         1f3ExAymZ70kTARA/0deBmUUwz9dliM9JwgmVpM5/RkKD8zIYLra6KZQk0gfusr9CuGI
         38bA==
X-Gm-Message-State: APjAAAUPMiMTjlEU/IpxJwuw9Ccp8ONcdwC+EetQoysSs1PIOcXxHdXW
        YgbrUa5DJIe/41/0B9Z5aKo=
X-Google-Smtp-Source: APXvYqyrSJT+WqvWXeRuAehqAEI+vAgPo0G24rKl9tP1OorYtJeEuHjRz5wR9kQOyfF2LhA2UDI9dQ==
X-Received: by 2002:a25:2fd1:: with SMTP id v200mr336353ybv.484.1573598893195;
        Tue, 12 Nov 2019 14:48:13 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id d203sm86858ywh.48.2019.11.12.14.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 14:48:12 -0800 (PST)
Subject: Re: [PATCH] of: allocate / free phandle cache outside of the
 devtree_lock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e62e6a76-c614-80c4-2c9b-cd4326105fd9@gmail.com>
Date:   Tue, 12 Nov 2019 16:48:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sebastian,

On 11/11/19 11:21 AM, Sebastian Andrzej Siewior wrote:
> The phandle cache code allocates memory while holding devtree_lock which
> is a raw_spinlock_t. Memory allocation (and free()) is not possible on
> RT while a raw_spinlock_t is held.
> Invoke the kfree() and kcalloc() while the lock is dropped.

I thought the GFP_ATOMIC passed to kcalloc() in of_populate_phandle_cache()
was sufficient.  And I didn't realize (or remember) that kfree was
not allowed while a raw_spinlock_t is held.  Do you have a
pointer to the preempt RT documentation that explains that?
I'd like to add that pointer to my personal notes about locking so
that I won't mis-remember this too often.


> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> This is a repost of:
> 	https://lore.kernel.org/linux-devicetree/20180910154227.xsbbqvw3cayro4gg@linutronix.de/
> 
> I mentioned this patch (briefly) to Frank, let me summarize:
> 
> of_populate_phandle_cache() triggers a warning during boot on arm64 with
> RT enabled. By moving memory allocation/free outside of the locked
> section (which really disables interrupts on -RT) everything is fine
> again.
> 
> The lock has been made a raw_spinlock_t in RT as part pSeries bring up.
> It then made its way upstream as:
>    28d0e36bf9686 ("OF: Fixup resursive locking code paths")
>    d6d3c4e656513 ("OF: convert devtree lock from rw_lock to raw spinlock")
> 
> I've been looking into making devtree_lock a spinlock_t which would
> avoid this patch. I haven't seen an issue during boot on arm64 even
> with hotplug.> However Power64/pSeries complained during boot:
> 
> | smp: Bringing up secondary CPUs ...
> | BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:973
> | in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
> | 1 lock held by swapper/1/0:
> |  #0: c000000000def6e0 (devtree_lock){+.+.}, at: of_find_node_opts_by_path+0x1f4/0x230
> | Preemption disabled at:
> | [<c0000000000557a0>] start_secondary+0xd0/0x6a0
> |
> | Call Trace:
> | [c0000001f9667d10] [c000000000158e30] ___might_sleep+0x250/0x270
> | [c0000001f9667da0] [c000000000984f40] rt_spin_lock+0x70/0x90
> | [c0000001f9667de0] [c0000000007e3634] of_find_node_opts_by_path+0x1f4/0x230
> | [c0000001f9667e30] [c0000000007e3844] of_get_next_cpu_node+0x144/0x180
> | [c0000001f9667e70] [c0000000007e38d8] of_get_cpu_node+0x58/0x90
> | [c0000001f9667eb0] [c00000000002eb00] cpu_to_chip_id+0x20/0x70
> | [c0000001f9667ee0] [c000000000055858] start_secondary+0x188/0x6a0
> | [c0000001f9667f90] [c00000000000b554] start_secondary_prolog+0x10/0x14
> 
> because cpu_to_chip_id() acquires devtree_lock() early in the CPU-bring
> up path.

I read too much into that sentence, and ran off on a tangent re-educating
myself on preempt RT lock stuff.

The issue in this path is that start_secondary() disables preemption before
going down the code path that ends up with an attempt by of_find_node_opts_by_path()
to lock devtree_lock.  It is ok to acquire a raw spinlock with preemption
disabled, but not ok to acquire a normal spinlock with preemption disabled.

The calling path to cpu_to_chip_id() has an intervening call that does not
show up in the above trace, add_cpu_to_masks().  The first call of cpu_to_chip_id()
is "int chipid = cpu_to_chip_id(cpu)", which could be moved out to start_secondary(),
before preemption is disabled.  But at the end of add_cpu_to_masks() is:

        for_each_cpu(i, cpu_online_mask)
                if (cpu_to_chip_id(i) == chipid)
                        set_cpus_related(cpu, i, cpu_core_mask);

This use of cpu_to_chip_id() is a little harder to move to before the preemption,
but it is possible.  A table of the chip ids for all possible cpus could be
created before disabling preemption, and the table could be passed into
add_cpu_to_masks().  This would allow devtree_lock to be changed to a
spinlock_t.

I like this approach because it removes the one known place that constrains
what type of lock devtree_lock is.

My second choice (and I am willing to accept this) is:

> 
>  drivers/of/base.c |   19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -138,31 +138,34 @@ static u32 phandle_cache_mask;
>  /*
>   * Caller must hold devtree_lock.
>   */

Add a one line comment to the effect of kfree()
can not occur while raw_spinlock_t held, so caller must
do the kfree().


> -static void __of_free_phandle_cache(void)
> +static struct device_node** __of_free_phandle_cache(void)
>  {
>  	u32 cache_entries = phandle_cache_mask + 1;
>  	u32 k;
> +	struct device_node **shadow;
>  
>  	if (!phandle_cache)
> -		return;
> +		return NULL;
>  
>  	for (k = 0; k < cache_entries; k++)
>  		of_node_put(phandle_cache[k]);
>  
> -	kfree(phandle_cache);
> +	shadow = phandle_cache;
>  	phandle_cache = NULL;
> +	return shadow;
>  }
>  
>  int of_free_phandle_cache(void)
>  {
>  	unsigned long flags;
> +	struct device_node **shadow;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  
> -	__of_free_phandle_cache();
> +	shadow = __of_free_phandle_cache();
>  
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> -
> +	kfree(shadow);
>  	return 0;
>  }
>  #if !defined(CONFIG_MODULES)
> @@ -197,10 +200,11 @@ void of_populate_phandle_cache(void)
>  	u32 cache_entries;
>  	struct device_node *np;
>  	u32 phandles = 0;
> +	struct device_node **shadow;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  
> -	__of_free_phandle_cache();
> +	shadow = __of_free_phandle_cache();
>  
>  	for_each_of_allnodes(np)
>  		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
> @@ -208,12 +212,14 @@ void of_populate_phandle_cache(void)
>  
>  	if (!phandles)
>  		goto out;

Add a one line comment to the effect of raw_spinlock_t can not be held
when calling kcalloc().


> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
>  	cache_entries = roundup_pow_of_two(phandles);
>  	phandle_cache_mask = cache_entries - 1;
> 

Need to avoid race with of_find_node_by_phandle().  So change the following
to tmp_phandle_cache = kcalloc(...
 
>  	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
>  				GFP_ATOMIC);
> +	raw_spin_lock_irqsave(&devtree_lock, flags);

Then here:

        phandle_cache = tmp_phandle_cache;

>  	if (!phandle_cache)
>  		goto out;
>  
> @@ -225,6 +231,7 @@ void of_populate_phandle_cache(void)
>  
>  out:
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +	kfree(shadow);
>  }
>  
>  void __init of_core_init(void)
> 

The subtle race with of_find_node_by_phandle() is that if
of_find_node_by_phandle() added an entry to the cache it
also did an of_node_get().  It is ok that of_populate_phandle_cache()
overwrite the cache entry, but it would also do an additional
of_node_get().

-Frank
