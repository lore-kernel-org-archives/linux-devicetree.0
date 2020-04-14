Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF600C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D24E20737
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PipUNxux"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405218AbgDNQlA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404908AbgDNQk6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:40:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18597C061A0C;
        Tue, 14 Apr 2020 09:40:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l14so499900ljj.5;
        Tue, 14 Apr 2020 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=42zN/JWZMrImPOHqxaziIrOnovVE6HSOm6ZZB3qclDs=;
        b=PipUNxuxy3Q6sLRqz5k1a/Npe7zldh+VoHciAjWwpKNErtKr8tfgneF3cIcmDBppP5
         sbUjTK8ubc5x1aKFktL3nhoxYA4bsRwv9kRUNV+N7MRxcWwVoN+tG3mcRLq23qxfMqs/
         N13AiKb9ZenPnaIqf2o+g1Ek7GX2F851aM7WK+VJVA2BZYBhBZ3a8bwkin052ZRUd8Za
         pqB4djj8qbZfyY0Fx65++1zu83iPtDs71tzW0enbb/I6st1Wkzh4QMvFLW3TReiIuahJ
         /ZgqUcEVVXnSES/SzeKljm5HMOFJ5MRjl+7Z2vUgfFS9ruNWde/KvgtcE9yUqnGYyS1A
         wn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=42zN/JWZMrImPOHqxaziIrOnovVE6HSOm6ZZB3qclDs=;
        b=eQEsrh89vns8D0OwYeslGQBvW/GTkj3dg68qmew+PiNIR1uzZHI5iSO0sbAXTjkKHd
         xeOYieX3TRRTHDwkqBfgKsSvJjiJpeQcpx38sonTuB/rGXjJLA9wgpmJsbFcwLUmK+xf
         mMY3qF/9sE7YWJktr6VJ4xvhJCGNTjahAL/9DPsIHfyzBPCqLaP4CxjEPA8ykPAQ7JYR
         m6h3dxtOCCWW6Igb3JQSve8hchxognOhm5/Sy9mBtK7CZihhfInWyJMehdOShAhZowcz
         1fsv/YZ7k22WdNxRsa4FOJGQoKpjSWDOvSdmeNVhXHIz4QILlAE2X4egaku4ZVZMOUzH
         1pZw==
X-Gm-Message-State: AGi0PuafFa1l9zK9QB+ieT9MPD/Ki6XSzTWm0T4LLyh8WZbPfZncvRjZ
        8JgLbm0jiIuQYegBJZ72FLM=
X-Google-Smtp-Source: APiQypIsIVTReol7rZyJyAlFKw87DWeZ7xkU4PVTXTRJYLKhxkNO6FDzjCKYW+CTaMG6SrEu8MK46g==
X-Received: by 2002:a2e:6c15:: with SMTP id h21mr635259ljc.248.1586882456643;
        Tue, 14 Apr 2020 09:40:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id l13sm9448259ljc.84.2020.04.14.09.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 09:40:56 -0700 (PDT)
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <543bfc3b-2bb9-01d3-62da-89d1f0b18a5b@gmail.com>
Date:   Tue, 14 Apr 2020 19:40:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-12-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> -	/* EMC training timer */

Guess this comment isn't really needed from the start, or should it be kept?

> +	timer_setup(&emc->refresh_timer, tegra210_emc_poll_refresh,
> +		    TIMER_DEFERRABLE);
> +	atomic_set(&emc->refresh_poll, 0);
> +	emc->refresh_poll_interval = 1000;

