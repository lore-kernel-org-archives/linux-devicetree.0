Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C0CC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83EB7222C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec9Xy47+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgCJQNa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:13:30 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43427 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJQN3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:13:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id q9so4721754lfc.10;
        Tue, 10 Mar 2020 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W+60mEKOc6FZpec77KfiUx6G8m6jCqzHZbWxKsI68hg=;
        b=Ec9Xy47+PEgWoZAna5oFPlDRIuAjLD0n5J1sYYhhvbZCyOwpVFQMQ9XujlWExJs3gU
         7IwvIHCypTprj5W4tTESsxFSFbeqz9RBaIeJwEfQbxWzwX/oiySVJuiNe+tc8b4AIcDS
         s+CIz9PNBIesDikyaqiiLYix5W0mypifUSly7oN/hs4eUs/WIJr14ghZJeIktIi0SjPf
         24LH4DcyqCAxbnqVBGc29gB8XISHLBBgplOexNl1aDjLREoxHdyby2EQW3Qt6UR2SY9u
         lv41viFMWNFfAm/YvDown//2YQqJzY5zIMJP+fQ1K1uH2r9jChayZRg0WrkxzuMD+dFO
         L1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W+60mEKOc6FZpec77KfiUx6G8m6jCqzHZbWxKsI68hg=;
        b=q4e6wM0t/Fjb6BHJbJEOmzlJduOSrUU9BPmoBxV6aIgIEWBESXpgR33Hxpgf8+sc+o
         uYyY6VVf7ETNtc14gRaK1JecTggYwbVBPJYv44sM9s2HSR27jnMYBfbBm1jpKL/p/oSC
         6coRypvYHlrioJMmg1aH6emdrjGb54vV4NtbV+kOiStg+s2NXApPJuYXuhnfp2IJR2r4
         YpoimZRKIEhntXh4YbpggX6T9eUffWemVzLf5fqJz2d6rW1vQelcPd4n0VjbrVGOyP/b
         nFlBU2EYYVgtDUvQGjaqct8h82hbK8h8U3Azw9GnwjHnpUDPNCfSPmx4pqBLgyhTMNZc
         5nBA==
X-Gm-Message-State: ANhLgQ1U5wFHZSvdwMlhIWnF5WWdSETk3w8HBwEXzzOD+8X6/PnJWPsa
        2Q3o7WDLfETTRvbCgPUe0kQ=
X-Google-Smtp-Source: ADFU+vtaKKamjRMw8i2j8oskqRtAMyNXrKMEbwftPQGJTJ3Tr/icqA8fhaQeQsImoRUm3raAqgliwg==
X-Received: by 2002:a19:4c08:: with SMTP id z8mr7699955lfa.95.1583856806690;
        Tue, 10 Mar 2020 09:13:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id t27sm11160833ljk.78.2020.03.10.09.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:13:26 -0700 (PDT)
Subject: Re: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e1f11e9-a95a-500f-ff44-6f44ad990863@gmail.com>
Date:   Tue, 10 Mar 2020 19:13:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> Export functions to allow accessing the CAR register required by EMC
> clock scaling. These functions will be used to access the CAR register
> as part of the scaling sequence.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - remove tegra210_clk_emc_update_setting() which is no longer needed
> 
...
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
...
> +extern void tegra210_clk_emc_dll_enable(bool flag);
> +extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
> +extern void tegra210_clk_emc_update_setting(u32 emc_src_value);

Why these exports are needed given that the EMC driver is built-in?
