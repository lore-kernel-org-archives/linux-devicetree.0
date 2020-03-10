Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F0FC18E5C
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3C372253D
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAyamb3J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgCJQnS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:43:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37163 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgCJQnS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:43:18 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so1307551ljd.4;
        Tue, 10 Mar 2020 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FBFL+5WGT9Pn8Ub5SVAAk9yDdcFa+JUtYWb2994ZtrY=;
        b=dAyamb3JokRz1DfXE4yVA/mcSxyzcMgQBPsAtXgJLlua4/bsokmjNlLMQxJCMimd4o
         jfwzuynXDbP2bU9fPV6Gub2HrDDV+H2v5k7+eCm3CjK1DIHrGNIynI7UKjN3wJL2qO8g
         o9B9sP6schKllDoJhGamTIJyRodsoT0oFJTgR4R2qIeUM6yoMwRwM7DT/3CKWw50TE0A
         Tu3jvL1A5ujrgPB8ZQ888/hQe++2HdieScga7ro3/MAxLeiSsXhQmVPL98lpJ15v4aiQ
         UGFxRJwQh0zIzxt2kxFzUjzs+rK8lkKvJ3RHMwMOP5iBW+A/msl+JHeqqdAwhJSfp+Qy
         wTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FBFL+5WGT9Pn8Ub5SVAAk9yDdcFa+JUtYWb2994ZtrY=;
        b=ZfD8IS2UsL5A/EL1VTKbo+j37AA7QR14ehw7iR3xKZWThDvnt3VdnjEM/b1gwmjk6Q
         GcMmW6quJAJPQFEwJiyaOZ2ss2IS5BiR3DwItMyU4ZcxHgGPoWXXxe6+JFhOQ65COgfb
         lyVkw6OpbxvFcuU26ou1+F4V+2z7Kwq8Qvx+66LCf3dsidFthi7KgNzKU53ASZWbumQg
         /WCFx4De+f+k1of4HhJBGFs9TuUxVMtZ3qm2hUyYo29/ZQOrunlMTt2A+L8gr3XP+EHU
         r+7L0R5eTIylnL6f0sD7a1eYiD0uu7DsV+ONKN48EyCeCIWoyDDG8c3L0+9n81EdZiMK
         rNeg==
X-Gm-Message-State: ANhLgQ3+kJL+FznOdvp+mPZo4bawJQN2C2pZD3bDyiDX+Ad85oyB+Anr
        GxD1LHrQLSvfedFgmjnI8u8=
X-Google-Smtp-Source: ADFU+vtVfSMWLo7FnYwj+Zjtq1hRYyuXQCUbHBjXUeoVZzyjnreoimdN8AX1D6ndztQ4bQVPkXhj0w==
X-Received: by 2002:a2e:b6d3:: with SMTP id m19mr5230286ljo.68.1583858594597;
        Tue, 10 Mar 2020 09:43:14 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id e4sm16288858ljl.27.2020.03.10.09.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:43:13 -0700 (PDT)
Subject: Re: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
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
 <20200310152003.2945170-6-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ea3a96f-52cb-4eab-cf92-932f6882ad85@gmail.com>
Date:   Tue, 10 Mar 2020 19:43:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

10.03.2020 18:20, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> This is the initial patch for Tegra210 EMC frequency scaling. It has the
> code to program various aspects of the EMC that are standardized, but it
> does not yet include the specific programming sequence needed for clock
> scaling.
> 
> The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
> need to perform training of the RAM before it can be used. Firmware will
> perform this training during early boot and pass a table of supported
> frequencies to the kernel via device tree.
> 
> For the frequencies above 800 MHz, periodic retraining is needed to
> compensate for changes in timing. This periodic training will have to be
> performed until the frequency drops back to or below 800 MHz.
> 
> This driver provides helpers used during this runtime retraining that
> will be used by the sequence specific code in a follow-up patch.
> 
> Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - major rework and cleanup
> 
>  drivers/memory/tegra/tegra210-emc.c | 1952 +++++++++++++++++++++------
>  drivers/memory/tegra/tegra210-emc.h |  893 +++++++++++-
>  2 files changed, 2390 insertions(+), 455 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra210-emc.c b/drivers/memory/tegra/tegra210-emc.c
> index 80ea14d1e6ce..4ea8fb70a4fd 100644
> --- a/drivers/memory/tegra/tegra210-emc.c
> +++ b/drivers/memory/tegra/tegra210-emc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2015-2019, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2015-2020, NVIDIA CORPORATION.  All rights reserved.
>   */

Would be nice to avoid all the unnecessary changes, like the one above
and then all the code's removals/reshuffling.

Such that a new patch was a clean addition to a previous patch, instead
of a re-write.
