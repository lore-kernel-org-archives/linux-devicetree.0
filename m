Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB637C433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 07:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5FBE2067D
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 07:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com header.i=@semihalf-com.20150623.gappssmtp.com header.b="iThWgF74"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgGPHZD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 03:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgGPHZC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 03:25:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E00EC08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 00:25:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b25so5981521ljp.6
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iwWRMO4k+W7lJrGwJ6PHZuZwqQtagZ/HD1fwTfYKovY=;
        b=iThWgF7429hYsYc4qRTjSRex2kqbLsyLFpMP2MZn9vGSLoqoJxFfTPHkXy3X4h1yNO
         wMz1ItZrgKBpe7X5PMDM4myu4rrmCQjBEjRGT5S7BwY5oHsi0Guvhf6UbuJJcopsQB7b
         OGYSi5XHeVBvtqJtMdhjgcvHv/TwUTYAbR3bnLbJ6hPEsCuHnhOwU3PgVSMjVTh75xaf
         AeCTv9c2vFTB92HqSTh1fztxT5IsXbKt0ZQfFS3lRIjiAeDY1ZHreovLQH6JDLDXGQdD
         c0wFuKYAiUNdlMGde+goFWD2217kTFZADR6xebf6pPZir0X6sz8/C6bZbzz3ICzSFyOd
         ye1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iwWRMO4k+W7lJrGwJ6PHZuZwqQtagZ/HD1fwTfYKovY=;
        b=l5y96O/7kHvtOcGlFJ0TNKoWWTMtrunwD5yroeRU1KfOTzXRZiVDAq/WyNQI3g6kiS
         jlS585YGDXlv6t40WpwEBP8s7J/6aNYBjl8DpoLy09AV1kxVtfYs4cBBCD1JX8EpD8zN
         7cxrko6prMb/6TjDl5KlwRloLkuZJP94WnsLi17LoOVG9qh8coCC0yLFOircmnYqZrZP
         uTinO2p3dxnKg2ITRhqHaaK4iR90HDibdgQKLfUOh02YJSCy8gOpJom8VIPjMvHUK7gn
         ed1KE/jSsmSFvNJdaJhkxEW8kdAc6QVhZDcpjd1+Vnhu06xk1u/GJcL7jaC8tKCf/z3d
         WRrA==
X-Gm-Message-State: AOAM531nNMIMweRgw83vKoT1vb+K9pBObjl+7J+wZvffIJw2uHdJQVLL
        2+n7V5i9e/wEBXzbRPeM6LlPcA==
X-Google-Smtp-Source: ABdhPJxzkaMOt17VDa5ZtlEX2xqBMWiE7KrO334rqTYiE7Kn0Ybp1ROEMzXevSBfAY/ipqVHatFG1Q==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr1396061ljn.345.1594884300536;
        Thu, 16 Jul 2020 00:25:00 -0700 (PDT)
Received: from [192.168.1.9] ([83.68.95.66])
        by smtp.googlemail.com with ESMTPSA id f13sm1003407lfs.29.2020.07.16.00.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 00:24:59 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] iommu/arm-smmu: Workaround for Marvell
 Armada-AP806 SoC erratum #582743
To:     Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
        joro@8bytes.org, gregory.clement@bootlin.com, robh+dt@kernel.org,
        hannah@marvell.com
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        nadavh@marvell.com, linux-arm-kernel@lists.infradead.org,
        mw@semihalf.com
References: <20200715070649.18733-1-tn@semihalf.com>
 <20200715070649.18733-3-tn@semihalf.com>
 <793ede4d-79e9-3615-9da1-57cfe1a44c4d@arm.com>
From:   Tomasz Nowicki <tn@semihalf.com>
Message-ID: <5728f570-b3e5-63fe-9d59-768831943fef@semihalf.com>
Date:   Thu, 16 Jul 2020 09:24:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <793ede4d-79e9-3615-9da1-57cfe1a44c4d@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 15.07.2020 12:32, Robin Murphy wrote:
> On 2020-07-15 08:06, Tomasz Nowicki wrote:
>> From: Hanna Hawa <hannah@marvell.com>
>>
>> Due to erratum #582743, the Marvell Armada-AP806 can't access 64bit to
>> ARM SMMUv2 registers.
>>
>> Provide implementation relevant hooks:
>> - split the writeq/readq to two accesses of writel/readl.
>> - mask the MMU_IDR2.PTFSv8 fields to not use AArch64 format (but
>> only AARCH32_L) since with AArch64 format 32 bits access is not 
>> supported.
>>
>> Note that most 64-bit registers like TTBRn can be accessed as two 32-bit
>> halves without issue, and AArch32 format ensures that the register writes
>> which must be atomic (for TLBI etc.) need only be 32-bit.
> 
> Thanks Tomasz, this has ended up as clean as I'd hoped it could, and 
> there's still room to come back and play more complicated games later if 
> a real need for AARCH64_64K at stage 2 crops up.

Based on your implementation infrastructure rework, indeed the code 
looks much cleaner :)

> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 

Thanks!

Tomasz
