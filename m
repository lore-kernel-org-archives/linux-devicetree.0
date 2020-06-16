Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F24C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 20:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FA23208B3
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 20:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N81wUKNP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730967AbgFPUT6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 16:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730725AbgFPUT6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 16:19:58 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EEEC061573
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 13:19:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l26so4077764wme.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3wFm9ppO8ULkxiCADJKRnXA2iDnjr8ZjowAIpexl/Hc=;
        b=N81wUKNPQIZUxYmgUDgnPT/wwOQ2Xk7LebNpYpXXzRQPKKBe9DdvyeRK31obFJjroO
         zS8w1RE2w04XzBodYo9FCnghtQ0ona725X6rYAfrpPePssH0Fkm4TR9TYbcjsc2A+AX1
         e2OB7Idnj7AwlP6OLaY/Je77kZmqr2ylq2TTvZwE0ETfXY0XoAgwd24WHg/2WB+ixAL0
         jxTt81dtKTKfmJwldzEpoOeca8EQQjwCQGFx1sY8D7JK+BIADYT2Zi0Q81hD8xH98ZF1
         pv6Gcg2qp/ZTIFu0bRidEGUZmB4OfAf1adxMZSVcM0PkJGdtBobDeocd26fA+iWz8FEQ
         /zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3wFm9ppO8ULkxiCADJKRnXA2iDnjr8ZjowAIpexl/Hc=;
        b=R3CVlcfBnlUOTLEHtLXbXmntkSAVff7ceKO2YIwqsXqSlVG0vyVNC/jr0f0HDdvRuH
         iLQGRgQok/skH0c3Q6jHR5mpcOi0ant3b4HmB4ovmvuMYR9WmxX2dG8PFCN9w5SQcmGy
         Ocj9G773ntFMxxqHYbkhcv3dZ+8d1pMh8d4+M9Q2K4y/YIJScdrdhY1cuik09elzfOYD
         3HWK7DUDhkTd219OjZvj7gjRFZxvdfX5wFWEb6UgpW4JQPcU5tVcL7P+sxmsPqxPI5ZL
         I7o3zxJmRvNBmVKGFP6hG6Bo95wswMDkAIv8krnYU4eDMnIYhMAbwWWgA4I7m6FV8agB
         tK4Q==
X-Gm-Message-State: AOAM533sUvGw8LoUZvMUXhh2XtTMgYE2Dn+yHhNAzbhxRzv8llMp7vhu
        s1VOKXPwV+z0od4dQFMMIO4=
X-Google-Smtp-Source: ABdhPJwTLjwBRYfFzDikwfA1l4lRZVBR11j6vEk91mXAzf1GLkWmxFGBWFgj3BG3+hwuJCDXmu9Hqg==
X-Received: by 2002:a1c:22d7:: with SMTP id i206mr4862866wmi.186.1592338797117;
        Tue, 16 Jun 2020 13:19:57 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
        by smtp.gmail.com with ESMTPSA id i10sm29871318wrw.51.2020.06.16.13.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 13:19:56 -0700 (PDT)
Subject: Re: [PATCH 2/3] ARM: dts: NSP: Correct amac_base lengths, mailbox reg
 and add amac3
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
 <d638e006713d82d1a6af4bdbcfa516f425264bf6.1591719237.git.mnhagan88@gmail.com>
 <c08a06a8-de71-d1cd-541d-2e15a23f130a@gmail.com>
From:   Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <acbf9159-375c-5dcc-3353-e9d60496516e@gmail.com>
Date:   Tue, 16 Jun 2020 21:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c08a06a8-de71-d1cd-541d-2e15a23f130a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 14/06/2020 23:28, Florian Fainelli wrote:
> 
> 
> On 6/9/2020 9:58 AM, Matthew Hagan wrote:
>> According to gmac/src/et/sys/et_linux.c, IORESOURCE_MEM end address for each
>> mac is IPROC_GMACx_REG_BASE+0xbff.
> 
> The datasheet shows an entire GMAC to end at 0x1000 from its base offset
> which is likely what was used to construct this DTS, I do not believe
> this is a functional change, and if we look at the register details, the
> last register starts at 0xb44 so 0xc00 is giving a little bit of
> headroom. In practice it does not change anything since you are still
> going to need a full 4KB page frame to map the registers.
> 
>>
>> The FA2 mailbox is specified at 0x18025000 but should actually be 0x18025c00,
>> length 0x400 according to socregs_nsp.h and board_bu.c. amac3 is at 25000.
> 
> Yes, FA2 definitively start 0x18025c00, and ends 0x400 later, so I did
> split this patch in three patches:
> 
> - one that fixes the FA2 base address, which can be queued to stable
> kernel branches
> - one that changes the AMAC register size
> - one that adds the AMAC3

Since AMAC3 has been added with interrupt 150, should the mailbox
interrupt not also be incremented to 151?
> 
> Such that the first patch can be queued for -stable fixes, whereas the
> other two, not being functional changes are candidates for devicetree/next.
> 
> Result here:
> 
> https://github.com/Broadcom/stblinux/commits/devicetree/next
> 
> Thanks!
> 

Thanks,
Matthew
