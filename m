Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7889C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 02:01:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5D112077B
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 02:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6tCO3KX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfLFCBt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 21:01:49 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45778 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfLFCBt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 21:01:49 -0500
Received: by mail-pl1-f194.google.com with SMTP id w7so2011218plz.12
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 18:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yawCDzrn1DZPzEC7TC2gsk/hjYWQ4hmDMD32WCjrPbk=;
        b=Y6tCO3KXQbX6mVGeqhEP97b/3pfwbgbG9fZAKtX3DfI/5sQ9/x7c0+d98HmaKY8VMk
         S2YGlDSiYypUevwgwsDJ+10qNi8s2juIbE2sT4w6Q0MFWvg9pU+EfmMeTH2ei41cQ8Mp
         d1JnDTZVyy9JhLP8EV0BqACLfqAQzxgyrjXYiOb7l0cAGo4oYw+Pv/SAgD8qnSKaC/0a
         rD8FXgrCkyGEUJ/on8f71AZB3mNkw0p/h6EJheutKQYEjo2QLb/ufPFHz0rchJEzVzcc
         aeqBqtuXQ1qK8dJGu6BXkoLkSNdJlG5XyKU+BTgBve2FPORSOYD8PpKRkR9sbaJ6yNhB
         0eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yawCDzrn1DZPzEC7TC2gsk/hjYWQ4hmDMD32WCjrPbk=;
        b=BDFMTdKHutSqyHx4PqMqfmh+I2Xmbe2GCyJKdgD3+urGKmPXbs8hLN9snr/LDrM4j+
         wDW4y3ME3Z+b9EJtMElapoLSHfNyOjAgAxxHi43Jig0AVQgNeOESY8PtKAM9lU3CNpVs
         3/pMelPjCVNgI/Eoei0zfU7fBpr5nDkIpwOuxuz1vF7Dx0IRIPvOqQxdErrJbTpyzGzm
         4Q7eiWgZHIsNJUVA2ThWAE+Q2qeDuL0M5KXamX7R/XGH/4214d4ZQ0lz3pao11PpFvuQ
         yzBLSB3ztnac91POnG6TuS2F78k+KCdlTY5xCPQgB+qifZuwRbyGwh5kIMYBQ2zlLkmq
         w2/w==
X-Gm-Message-State: APjAAAWJ0y/d9bfVjzqfibEd5gZvSI35Kj1FQMQVwPRcI2fvt11TJckj
        8kZVeaH6fkI4UZ8RqYFVbUY=
X-Google-Smtp-Source: APXvYqw2ueWFPqikZhD0a2qq1gWWV/hMz4rEndjfA9geXRuajF2h7mb6m0NVl6+8/W2Sr5Om8zAeDg==
X-Received: by 2002:a17:90a:348c:: with SMTP id p12mr12729041pjb.105.1575597708183;
        Thu, 05 Dec 2019 18:01:48 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:b0a6:2318:ed21:5e5? ([240d:1a:90a:7900:b0a6:2318:ed21:5e5])
        by smtp.gmail.com with ESMTPSA id z1sm14087108pfk.61.2019.12.05.18.01.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 18:01:47 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
Date:   Thu, 5 Dec 2019 20:01:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205163538.mzunfrpox7jbrssl@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/5/19 10:35 AM, Sebastian Andrzej Siewior wrote:
> On 2019-12-03 10:56:35 [-0600], Rob Herring wrote:
>>> Another possibility would be to make the cache be dependent
>>> upon not CONFIG_PPC.  It might be possible to disable the
>>> cache with a minimal code change.
>>
>> I'd rather not do that.
>>
>> And yes, as mentioned earlier I don't like the complexity. I didn't
>> from the start and I'm  I'm still of the opinion we should have a
>> fixed or 1 time sized true cache (i.e. smaller than total # of
>> phandles). That would solve the RT memory allocation and locking issue
>> too.
>>
>> For reference, the performance difference between the current
>> implementation (assuming fixes haven't regressed it) was ~400ms vs. a
>> ~340ms improvement with a 64 entry cache (using a mask, not a hash).
>> IMO, 340ms improvement was good enough.
> 
> Okay. So the 814 phandles would result in an array with 1024 slots. That
> would need 4KiB of memory.

Is this amount of memory an issue for this system?

If module support is not configured into the kernel then the cache is
removed and memory freed in a late initcall.  I don't know if that helps
your use case or not.


> What about we go back to the fix 64 slots array but with hash32 for the
> lookup? Without the hash we would be 60ms slower during boot (compared
> to now, based on ancient data) but then the hash isn't expensive so we
> end up with better coverage of the memory on systems which don't have a
> plain enumeration of the phandle.

That performance data is specific to one particular system.  It does not
generalize to all devicetree based systems.  So don't draw too many
conclusions from it.  If you want to understand the boot performance
impact for your system, you need to measure the alternatives on
your system.

Is there a memory usage issue for the systems that led to this thread?
Unless there is a documented memory issue, I do not want to expand an
issue with poor cache bucket percent utilization to the other issue
of cache size.

-Frank

> 
>> Rob
> 
> Sebastian
> 

