Return-Path: <SRS0=7KtL=73=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66AAC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99F2F2068E
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjdbMtFj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgFNW2i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 14 Jun 2020 18:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgFNW2h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 14 Jun 2020 18:28:37 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31521C05BD43
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:28:37 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q11so15177294wrp.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=trQHcuohLtyUSpNm7aV0Du6sP39QEoJjS3ozq1EOQr0=;
        b=gjdbMtFjuioL5GRdxYSTTEKGL9MnqKryVULnRrQz5h0uvmtc3qTj3BND4oaS5qNk2e
         5TVNLyp/WnB80FoaIAMn1fDOJk/nF656k73U5r24E/QsrpeRqXdt7uww1MFSJcvXXwGq
         TpDYGRlLJ3wTWRhgW/QBkOBbmY082uBbVXavlo4CWqnFmwBQsZ9jkiPUnNcrEgL/ikKJ
         7i48eyl/IpsYUu0x3y5iROpEe+eB3jBOvIdrJAHsbfq8ajG6GP3nZE4o/uniBeZgV/rq
         RXSC3J7LhkW1hnDztSg7VXYRO3iZvE7A+azidmUzH/nzdPanaDwjMeH1gduiqOsX7lEV
         FzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=trQHcuohLtyUSpNm7aV0Du6sP39QEoJjS3ozq1EOQr0=;
        b=OT3zaiLnxMUs30/p7ZtNdxWYftMP6HTzpCy3kFFd/dol1VAQkpzUn/nANmEI6y0Bj3
         gTsuZs+PmsgD4KSggzfz7UhurBoKmYyBUSzPADI+dsRvHqv6ieSVS7YFlgg2UJ4ySyb+
         j41IrOxhQqaXz/di/V6vCXheeQcoQbOwCiWRI/YgsjlCwaYWVM7KNWCrMAIPnuDTYbCH
         kS64q8N9gFWECzoB7t7OHTrpURJg/nHpHj4WPsgmere2/0X+q7EtI8wX8NdBFNDS5mqU
         ImjvrSjE6XWke/DiWUQA8wY+LcuDMlavic/lzUIlBWmo/6jN1BqjNQaBtovnb6NiFjUY
         qBbg==
X-Gm-Message-State: AOAM532aGhu9PjYgDrcnZleXbFPAYvVD6OOcKfDp7YuREJEbnmoIG/K5
        END+f3uZ3c3ogA2pdLRt4Rk=
X-Google-Smtp-Source: ABdhPJwfPKToAg7dRk6HHsvr8GhxJHa5n0GAnA8K67zHHAFEKSLniMj7mKWryHBKbc953G1ikG+rzQ==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr27419008wrt.150.1592173715910;
        Sun, 14 Jun 2020 15:28:35 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id f11sm21254064wrj.2.2020.06.14.15.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2020 15:28:35 -0700 (PDT)
Subject: Re: [PATCH 2/3] ARM: dts: NSP: Correct amac_base lengths, mailbox reg
 and add amac3
To:     Matthew Hagan <mnhagan88@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
 <d638e006713d82d1a6af4bdbcfa516f425264bf6.1591719237.git.mnhagan88@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c08a06a8-de71-d1cd-541d-2e15a23f130a@gmail.com>
Date:   Sun, 14 Jun 2020 15:28:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d638e006713d82d1a6af4bdbcfa516f425264bf6.1591719237.git.mnhagan88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 6/9/2020 9:58 AM, Matthew Hagan wrote:
> According to gmac/src/et/sys/et_linux.c, IORESOURCE_MEM end address for each
> mac is IPROC_GMACx_REG_BASE+0xbff.

The datasheet shows an entire GMAC to end at 0x1000 from its base offset
which is likely what was used to construct this DTS, I do not believe
this is a functional change, and if we look at the register details, the
last register starts at 0xb44 so 0xc00 is giving a little bit of
headroom. In practice it does not change anything since you are still
going to need a full 4KB page frame to map the registers.

> 
> The FA2 mailbox is specified at 0x18025000 but should actually be 0x18025c00,
> length 0x400 according to socregs_nsp.h and board_bu.c. amac3 is at 25000.

Yes, FA2 definitively start 0x18025c00, and ends 0x400 later, so I did
split this patch in three patches:

- one that fixes the FA2 base address, which can be queued to stable
kernel branches
- one that changes the AMAC register size
- one that adds the AMAC3

Such that the first patch can be queued for -stable fixes, whereas the
other two, not being functional changes are candidates for devicetree/next.

Result here:

https://github.com/Broadcom/stblinux/commits/devicetree/next

Thanks!
-- 
Florian
