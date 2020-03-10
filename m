Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7AFC18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB37B20873
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJxbR7Nx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgCJQQW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:16:22 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37508 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgCJQQV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:16:21 -0400
Received: by mail-lj1-f194.google.com with SMTP id r24so1203899ljd.4;
        Tue, 10 Mar 2020 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjaCGXNjRwtaH9QvtoEkEWAf93tfcxpeZIkmTeM6Kac=;
        b=PJxbR7NxiXrWYDxph/s80a0xfFYJALFbg0lgiM/Na7hrjFyMqWi4bIDja60OH+2gai
         r4Y+0QXErE2COKoqutTh0HmMm0pdGUHUoYJwozxJFMcG6ScchrKG3PKA6PhDHIP7Oq4T
         mGZNHU5ZT4J80hgUdusmp8Ei4hiKw4z+02ADlWdpQrAp9OSU7/UvZrIX5bkGda5cFYfe
         meDYxpn7asJEn0/VKHJrhhKSwrZM5J7luopdabdC8Ztf/VQrh5C1VFm2GIyYVRL6oDBg
         p47swnjc6phMB/EYZkC70RNn6shhHc1Fkydi+9z8cGhvRHlivILGtXSSsERxzD5HyuS2
         Qamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjaCGXNjRwtaH9QvtoEkEWAf93tfcxpeZIkmTeM6Kac=;
        b=rzzpsanwWCUmwDoKOD2vcgrIKEaKxFxvSLN9ZOHraB3n9/pvfTZi0Xv1OW82ni78l/
         AcIZnmSCyHky3v3yVNv9uo/AQ46zmLpya34sVvRTzQEcjJsGqEA71vEBy3QuMsLrxaB1
         oaDyJ1ZavVbqlg9thbUZgnFBBev5Otqb1qVk4sXEYIsD1BnmrLNqsdfIx0tuFIF6WJgF
         IFJ9dgTBsdQl0xBmytk6lt4P17Ty4+nkXGkqbn2FnkimMWe9u4OW7nP2Z4sBWLeL5VaF
         xRrLwKqFqUhJb7CghSQ8k0gXGgMlmEwd3hy+oTjopED6Jyxq7g+KKWINDcdDtp1ECRxb
         lQGQ==
X-Gm-Message-State: ANhLgQ31YFsQg+wSaDrDs/zhYwypJZHuc5w2tpS+yPNVYoXgoRg0Ui0s
        NsIS4ITpMMwb8Q0hV/cIG3s=
X-Google-Smtp-Source: ADFU+vvBHH36dIlNgKvb4wlGwtmjMNU9As71C/R/V+eZBvBQEoLLiBKML70HHd5NEFujerM1RXOobA==
X-Received: by 2002:a2e:904f:: with SMTP id n15mr12784000ljg.101.1583856976966;
        Tue, 10 Mar 2020 09:16:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id x13sm10752448lfq.97.2020.03.10.09.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:16:16 -0700 (PDT)
Subject: Re: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-3-thierry.reding@gmail.com>
 <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
Message-ID: <1ac24caf-e4c1-b20e-4c3d-97b328a97ea5@gmail.com>
Date:   Tue, 10 Mar 2020 19:16:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

10.03.2020 19:13, Dmitry Osipenko пишет:
> 10.03.2020 18:19, Thierry Reding пишет:
>> From: Joseph Lo <josephl@nvidia.com>
>>
>> Export functions to allow accessing the CAR register required by EMC
>> clock scaling. These functions will be used to access the CAR register
>> as part of the scaling sequence.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Changes in v5:
>> - remove tegra210_clk_emc_update_setting() which is no longer needed
>>
> ...
>> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
> ...
>> +extern void tegra210_clk_emc_dll_enable(bool flag);
>> +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
>> +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
> 
> Why these exports are needed given that the EMC driver is built-in?
> 

Also, seems changelog doesn't match the patch itself.
