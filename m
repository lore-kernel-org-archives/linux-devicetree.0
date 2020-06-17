Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692DCC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 21:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42BAA21556
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 21:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCo06sn3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgFQVys (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 17:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQVys (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 17:54:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CADFC06174E
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 14:54:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x22so1801455pfn.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=46xOyQU+v3NV/CJLyPbLOw899ccTH8LTSgYcpk2EzN4=;
        b=tCo06sn3op54JvIYIGimsSl3+IokHrqUiQ5lR552G5bdsThYIziJ5NWp++fz9Oje3h
         S29QE6KyyXUzsBqlTd7uVWlYpA4BWpFewBts75lhI8f6zm5epX5BYRrjkgl5ax88AgoY
         PXWfyxV8kQmeFa/Tl1ZkfBxzORNCLJBV3aEN8RbGOQftIflMH+Qw1vQ/94zV3nDZjlqg
         8QKsFD7i+1GTWzjUP2a7e5JIKmSRF08c4ae3tRWGT+zFWuXjPlbzJ4fANNy2vN6LkS9/
         5J3N6gbmO1BopTYn25WXO/XKsP3AouucUiaksuss5anaH44dkeuZZ3yaqwvGnRfCHnQk
         x9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=46xOyQU+v3NV/CJLyPbLOw899ccTH8LTSgYcpk2EzN4=;
        b=G+NLzHtFQpilnaIwgFFvyLtFpF9F31iLSf7EHKWsngbZwHFj63AQhw6RaWDQfZqfmv
         vYE4eNiKWubbDomSmFPMv+VjR/N3gXCjgJ5dP/iCUPLamsPQt4SUHzBv7MZAXNjPy5vW
         TV2S4KWT+wY3R8i06sBalpDoBIvEjv6nr6FeO7/P0dWA2vMur6sEn7jnrDqsaBSFLws9
         h/16eoLmZ9UFZQ9WEUx8lwLAWuR0LeAmNSHcTA4xU1OsTKUQQdSqbhyIL3eHPkxlmqUd
         Kc4hlVG7FNRZYQZHy6AnbbfKBJ1CXFSXxrZBdnM5YcrJ7GNK21p0LMswoSsXJXrZa+kF
         rr8Q==
X-Gm-Message-State: AOAM531KJ6coPwgCy1ZH0+2H3NREjDe9loz5GXfe29dYXGtsbiIr+MGY
        3Rk4kl44jNplGYcU7FRs0aQ=
X-Google-Smtp-Source: ABdhPJyttGR14qLF9+fTbEmdgcInGze9ALFGtp9gSX/oG8ylUKbyjYBKpOV/57HiPDgHTO3N5X9+3w==
X-Received: by 2002:aa7:8813:: with SMTP id c19mr790565pfo.220.1592430888010;
        Wed, 17 Jun 2020 14:54:48 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b19sm755393pft.74.2020.06.17.14.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 14:54:47 -0700 (PDT)
Subject: Re: [PATCH 2/3] ARM: dts: NSP: Correct amac_base lengths, mailbox reg
 and add amac3
To:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
 <d638e006713d82d1a6af4bdbcfa516f425264bf6.1591719237.git.mnhagan88@gmail.com>
 <c08a06a8-de71-d1cd-541d-2e15a23f130a@gmail.com>
 <acbf9159-375c-5dcc-3353-e9d60496516e@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1b85f9bd-bc4c-6eaf-81c5-fcc247baf0b7@gmail.com>
Date:   Wed, 17 Jun 2020 14:54:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <acbf9159-375c-5dcc-3353-e9d60496516e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 6/16/2020 1:19 PM, Matthew Hagan wrote:
> 
> 
> On 14/06/2020 23:28, Florian Fainelli wrote:
>>
>>
>> On 6/9/2020 9:58 AM, Matthew Hagan wrote:
>>> According to gmac/src/et/sys/et_linux.c, IORESOURCE_MEM end address for each
>>> mac is IPROC_GMACx_REG_BASE+0xbff.
>>
>> The datasheet shows an entire GMAC to end at 0x1000 from its base offset
>> which is likely what was used to construct this DTS, I do not believe
>> this is a functional change, and if we look at the register details, the
>> last register starts at 0xb44 so 0xc00 is giving a little bit of
>> headroom. In practice it does not change anything since you are still
>> going to need a full 4KB page frame to map the registers.
>>
>>>
>>> The FA2 mailbox is specified at 0x18025000 but should actually be 0x18025c00,
>>> length 0x400 according to socregs_nsp.h and board_bu.c. amac3 is at 25000.
>>
>> Yes, FA2 definitively start 0x18025c00, and ends 0x400 later, so I did
>> split this patch in three patches:
>>
>> - one that fixes the FA2 base address, which can be queued to stable
>> kernel branches
>> - one that changes the AMAC register size
>> - one that adds the AMAC3
> 
> Since AMAC3 has been added with interrupt 150, should the mailbox
> interrupt not also be incremented to 151?

Yes indeed, now corrected:

https://github.com/Broadcom/stblinux/commit/ac4e106d8934a5894811fc263f4b03fc8ed0fb7a

(have not merged it back into devicetree/next yet)
-- 
Florian
