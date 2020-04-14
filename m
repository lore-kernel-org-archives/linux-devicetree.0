Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282C4C352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 048C320774
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uvtq2ztp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633393AbgDNUus (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729251AbgDNUuq (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:50:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3241C061A0C;
        Tue, 14 Apr 2020 13:50:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h25so1305326lja.10;
        Tue, 14 Apr 2020 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4VidULW3sNFq1IBr5BVgYkJ2HzTTpcpxAz2X7BrAVHg=;
        b=uvtq2ztpgL632NvpxgxVdkS4VFpaqYP7UnlDWrRVWP0qyJK0JvIMXlY6JEF3csVS9x
         hWh5spAPEXlOZg6zDssOLfWPjeYofi72+ezWhkMdmzx1cJeFMzLN2qliVkSMAyC3piBw
         p8ArrIgjiFdvuoODf+PYy5CfebBerzULhSvEDdZX4KZjcP9XCWr9pj8sYqC6JfcC1aHe
         +Fnh0mHJzBMeShiR1HsagJ5HygkFgk2cSu+P12zPFIpxtz8HL+rRIz4hSAD/tXEbk0zb
         x1TULL6HArYkM8NaI8b9idGt/QP1kWh4p/pOr12j1lnctUXrrMSTeO5S++JLpyWD3GMx
         XpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4VidULW3sNFq1IBr5BVgYkJ2HzTTpcpxAz2X7BrAVHg=;
        b=VbTyety1dHdZaKXPewPW7bRvtVy0B9QK3yc4wCA7roeo3Xa8OQcDslJbHW251nubWt
         TvBrAjdMMi3B2W3BInwwRe+x1rsWIJCflVI7nqRA/Y8Q2Fu1WWL7482BjeoXEbdLaVTO
         Rl2VTSiGGeWTErK+a+52pgKKy+T0SvcntoVgk92Nf0DcJCZVZImVQXm2fXJzznVJ+21A
         oYC706pGQqoAnvYJKG23BWG0PNSk9GsMp09I73b8cTd+OfS/T/qQOvRH5ebb9FXeT76Y
         3hRZL+M6IhFoCN3kjCTCgECswcUhTwB65fhTA4xMUZtK3Ud+cHoVXFdbL4kz9iJoNOhd
         xGpQ==
X-Gm-Message-State: AGi0PuZFBlxK2FGf3/0gdsv9FWSXM2vJULOoi+VusaZBTu0ZvVe4t5+A
        BG481lUptiIKa/u+AOtEJfvMIQ0+
X-Google-Smtp-Source: APiQypILAUnA0zAmCZatBH8tHsS3tV4vXCvYDhLfn2rH0mkq6ZK2azlTQdov/cLZ9PHX+LP6y8dz4A==
X-Received: by 2002:a2e:992:: with SMTP id 140mr1175625ljj.188.1586897444412;
        Tue, 14 Apr 2020 13:50:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i18sm5608207lfo.57.2020.04.14.13.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 13:50:43 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
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
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
 <20200414145442.GJ3593749@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <37c5af25-c00b-cfe0-4c13-00ac5bdef82c@gmail.com>
Date:   Tue, 14 Apr 2020 23:50:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414145442.GJ3593749@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 17:54, Thierry Reding пишет:
...
>> I'd suggest to check how much time invocation of ktime_get() takes, at
>> least it came to a surprise to me in a case of the tegra-cpuidle driver.
>>
>> It may be well over the emc->clkchange_delay.
> 
> I assume that at least each invocation would take roughly the same
> amount of time?

Not sure.

> Since we only use the value to compute the time since
> the last clock change the result should always be valid. In the worst
> case if ktime_get() really takes that long we may be waiting longer
> than we need to, but that wouldn't be all that bad either. Changing
> the EMC clock rate isn't something that you want to do a lot.

Then probably should be cleaner and simpler to have a constant delay in
the code?
