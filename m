Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79205C432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 02:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36AFE217BC
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 02:46:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u3swcC59"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfK3Cqf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 21:46:35 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:32776 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfK3Cqf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 21:46:35 -0500
Received: by mail-yb1-f194.google.com with SMTP id o63so3706371ybc.0
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 18:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YCdaPQZbfXzTLP1E92kn7PXoHTPvZ4F0YuToxEo72rY=;
        b=u3swcC59e1lYc7E7yKK/AqO9djzwhyBYB4k6sfg4Tq23tP17l+boYpOfUNxG5KmTmo
         LZu7game9BM4GJQjA9BI8KM1s42B5lN9TCfsi+dkDumwmWevNw6Q/QwFy2K9KuG03GJh
         TDdy9Iuqoc/W3sJ8s8+zPeMCzdES8X/m3czoG+uiM5n/XCDGV5JzQN/c8EjHKIeojPg1
         LlBHRq4FQORLKIj7FuBDjEKWvHIqB7Vd2L0Sw2tab1HxJhZ29GdbK9leAPUbabqxeUB3
         RNNSzCNh6HTxRkpSq7lCY20RrGsFfFgoXV4Hx3QtiBHNmWOU/4uJqOxqwck3YuFk1JK+
         IOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YCdaPQZbfXzTLP1E92kn7PXoHTPvZ4F0YuToxEo72rY=;
        b=QJOtg/nJC2HxrW+70jDrZWWPccicUj2yxBUAXsfPNFKksL95i7HWl8RhHeala2WgfW
         8rJ/dC5Amfkl8XSs6LkU4jLFPwfcO9wbPOc/zCo38pXqjxza18coPnooeYkr8Mo/IULg
         cvbhUuwo0iC5EKmTTRevP7v4CWD6Q/zU3E/qsLdIQwa0ih7qFALIhwIJzZHBvIfHnR69
         1rlMIOppR9xk78fxYmS7oAxFqDGYv54ue6cIWQA9D2iQuYRv8fDhG+xtjlkG22LA+72t
         TuGuQoIHsctuuUxYX/K3QCDLconnuAPMDtj4BeInJ/BIBXbQpMEVICrSqWM8DAslpI8O
         5VCQ==
X-Gm-Message-State: APjAAAXwfm1KriuiC4h4W2XBgIX31fCCwYi1k3A8Bw1Y8fd4BsEqmNCO
        +6PF+Gy5g8gt/gqVo3GAOu8=
X-Google-Smtp-Source: APXvYqwxD93MbhW7sJzsSa5JSTwS/jdI2j52xTmt6pgP5IpSX6bAM3uiRHYgxP+XnUBOyL4gT4HszA==
X-Received: by 2002:a25:34cc:: with SMTP id b195mr12378981yba.244.1575081993404;
        Fri, 29 Nov 2019 18:46:33 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id k144sm4366346ywe.14.2019.11.29.18.46.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 18:46:32 -0800 (PST)
Subject: Re: [PATCH v2] of: allocate / free phandle cache outside of the
 devtree_lock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20191111172142.ozczh7j2gmzi7o5k@linutronix.de>
 <e62e6a76-c614-80c4-2c9b-cd4326105fd9@gmail.com>
 <20191129140446.dqb5y4uzv57cislp@linutronix.de>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <14b65198-fea8-377c-2147-86cb2680bee2@gmail.com>
Date:   Fri, 29 Nov 2019 20:46:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129140446.dqb5y4uzv57cislp@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 11/29/19 8:04 AM, Sebastian Andrzej Siewior wrote:
> The phandle cache code allocates memory while holding devtree_lock which
> is a raw_spinlock_t. Memory allocation (and free()) is not possible on
> RT while a raw_spinlock_t is held.
> Invoke the kfree() and kcalloc() while the lock is dropped.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> v1…v2:
>   - Add comments regarding memory allocation under the raw_spinlock_t
>   - use a temporary variable for the memory allocation.
> 
>  drivers/of/base.c |   32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -136,33 +136,37 @@ static struct device_node **phandle_cach
>  static u32 phandle_cache_mask;
>  
>  /*
> - * Caller must hold devtree_lock.
> + * Caller must hold devtree_lock under which kfree() can't be used so caller
> + * needs to kfree() the returned pointer.
>   */
> -static void __of_free_phandle_cache(void)
> +static struct device_node **__of_free_phandle_cache(void)
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
> @@ -197,10 +201,12 @@ void of_populate_phandle_cache(void)
>  	u32 cache_entries;
>  	struct device_node *np;
>  	u32 phandles = 0;
> +	struct device_node **shadow;
> +	struct device_node **tmp_phandle_cache;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  
> -	__of_free_phandle_cache();
> +	shadow = __of_free_phandle_cache();
>  
>  	for_each_of_allnodes(np)
>  		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
> @@ -208,12 +214,19 @@ void of_populate_phandle_cache(void)
>  
>  	if (!phandles)
>  		goto out;
> +	/*
> +	 * kcalloc() can't be used while a raw_spinlock_t held so it is dropped
> +	 * for the allocation.
> +	 */
> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  
>  	cache_entries = roundup_pow_of_two(phandles);
>  	phandle_cache_mask = cache_entries - 1;
>  
> -	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
> -				GFP_ATOMIC);
> +	tmp_phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
> +				    GFP_ATOMIC);
> +	raw_spin_lock_irqsave(&devtree_lock, flags);
> +	phandle_cache = tmp_phandle_cache;
>  	if (!phandle_cache)
>  		goto out;
>  
> @@ -225,6 +238,7 @@ void of_populate_phandle_cache(void)
>  
>  out:
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +	kfree(shadow);
>  }
>  
>  void __init of_core_init(void)
> 

Reviewed-by: Frank Rowand <frank.rowand@sony.com>

Compiled and booted on 5.4.  Did not do any more detailed testing.

-Frank
