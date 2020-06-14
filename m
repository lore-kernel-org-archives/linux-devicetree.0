Return-Path: <SRS0=7KtL=73=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E785DC433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6BDE2067B
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvVIckVh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgFNWPq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 14 Jun 2020 18:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgFNWPq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 14 Jun 2020 18:15:46 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A32C05BD43
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:15:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l26so12772243wme.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C44Nsc/2DIW6Metz8grkN1P5aC9GoqP/aiWhLmCWYm0=;
        b=ZvVIckVhIsLKFTkOdk8RwO5CnasQlO23IOxj1tFZ/GCrjFMATbMHnpsKuq6FmZJ7IM
         TY5lCBMaAX+XYtP5NSEy6h62B+jrQkEAvw/YVeYEcC/YjuYZnF8G48ptZ1qvya+DJJZS
         rL71UWwt8ZwZlBug1cGctc76z45SwkWVWGIdeBGqAXOac9qvUDDx/KkbhRUUQwxo9LIf
         MBIqQgXyUKKsAshQxT8jtXkvW10w5WdgSE811e9FZ3Dgl8BAjtFazh1AckbkjrJWifYt
         MLJtmO/ltwz4nI/2u6sgKBZcgnun4GjTPsyF3I/nlN525SFq8Jh91mx4BK0Voj6tJb4J
         3vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C44Nsc/2DIW6Metz8grkN1P5aC9GoqP/aiWhLmCWYm0=;
        b=H+18xBI6Nty8d2K0RtcKNeKVE8dE+jx7V38ykmyYOQ2OO2hWVeAxSwYUvg9gxDTiDZ
         yokYhWeAJQp3iOQCzWAV8XI4GAZkSaYa3gdS1fhgVKoud0cwZWrG03baZifqsvqXPier
         r6sL0algv/8mlqM8hdIjanPpBSSO8SDv5YfR+K0BieV3uO3PZONC/vwAcslgCgfIGQQh
         ZepSoq9G2P6GCtRbFNRU/0YiyEWvK4xafs0d/mEvMtpJIT+B1rK3ey7Uql4Q6LwIxbYn
         wJJ/h6s4jrmXvt6hStIhRhQpIro9/uDbrsNZcopoAmYa4mrIjBKReOu7mjDfPJbJ+INh
         2u3A==
X-Gm-Message-State: AOAM531Ud3TuKdIexVmKFvmaAK32jeY9UA7Bd/xE4Ge9JS5J3kSwdraE
        wSxn7nspYfEl5mX4V2X3eLcnLLfW
X-Google-Smtp-Source: ABdhPJyzkFjstWBKqkNeC9D/EqTSECbYtWtK8eK6FyzOzcNjrjI9Yvnp4KlsK1Vh4JOKaoROr+NLAQ==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr9619055wmf.72.1592172944411;
        Sun, 14 Jun 2020 15:15:44 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id a7sm20718527wmh.14.2020.06.14.15.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2020 15:15:43 -0700 (PDT)
Subject: Re: [PATCH 3/3] ARM: bcm: Select ARM_TIMER_SP804 for ARCH_BCM_NSP
To:     Matthew Hagan <mnhagan88@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
 <afd290238d7a7b392aa477590f3d05f3ebb2f9b9.1591719237.git.mnhagan88@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6e506d16-3147-d18d-c7e3-603bdc93892f@gmail.com>
Date:   Sun, 14 Jun 2020 15:15:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <afd290238d7a7b392aa477590f3d05f3ebb2f9b9.1591719237.git.mnhagan88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 6/9/2020 9:58 AM, Matthew Hagan wrote:
> The NSP SoC includes an SP804 timer so should be enabled here.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>

Applied to soc/fixes with:

Fixes: a0efb0d28b77 ("ARM: dts: NSP: Add SP804 Support to DT")

Thanks
-- 
Florian
