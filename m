Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611E3C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E29320656
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PamThkVb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440012AbgDNQsR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439869AbgDNQsP (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:48:15 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615ABC061A0C;
        Tue, 14 Apr 2020 09:48:15 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j14so271311lfg.9;
        Tue, 14 Apr 2020 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Kw/fyFEkyNl4nhmDgy4d2CWUNDFR/R0fTw+bRmg16o=;
        b=PamThkVbVW4+gLLvVbtvpBDc87SyAtJSlwa21DAei0japxekALaBraAxt9et9FJiCS
         ia2ZL7HnGN6JUL1BhDZHEuyRRDFmLq1HlPzVyzDUX/0b4IWzCcPP4cUdIB0UEUz1lEfN
         oM4uiYH0kyVMGAsyOlFUOfN/lkNr8Wy1Xa2I/liL1d/+24xBAA4JuRRd57lVFXEBxj4Z
         n5vtAYmpamHQ9CnqBVSzUNtQq73JXTo00Id069Oi1wSotOOrQl4QFJAc9dDxHfpVnBYe
         Qsu9tqVzpeH8QHWVGPd8qZnkwTtUXBs9Zy7nUcGANRr5AfmFgrlj28QPGQo9cHrZGFvr
         zMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Kw/fyFEkyNl4nhmDgy4d2CWUNDFR/R0fTw+bRmg16o=;
        b=e5nk2mZZRtYvmcnR2vwQPqP16HNtYDIRzMKu7fWJUZrlVWbJLMepD2diRXE3qEdcV8
         WyeqjXERbYSJ7F4QgEIOQditk9ZcUugnJg1KCRZtnHbFruVmKrHJRsxBBGtLZodHb1PP
         NK5MeIiB8WbFHD+Qzz9f4Zb8AJMDoWMiz9cznnq08mfwaRL52XGNZZhRMPgUcDJCQVHM
         LoYg1b9+0KWMKRYImqTqBRvDnl7zAfUOvbfAfa8Qe+8TN3LEYNWJNhCz/wC4UHShQwJQ
         vLbD7OXBSd2zTI2c3Jk3iT8LufmjUP9oIwBJLv9R6UU5jeYb3L1oEISGjI3dGumQWuSF
         rtIg==
X-Gm-Message-State: AGi0PuZTiDtcE6Y8ed4v7ovkTZ8uLLKWTOr7haTE+tNYZDhjPbPds5eQ
        Fi9u5qTNA2k91PpRfRaAj3o=
X-Google-Smtp-Source: APiQypLkikpgZUnOTOdp6SzcFWIX++W+faWrLSWt8Ymz5B2tCPgZUoXWJOOrOAF/DKPTCiQ5Zyeyug==
X-Received: by 2002:a05:6512:490:: with SMTP id v16mr418834lfq.71.1586882893937;
        Tue, 14 Apr 2020 09:48:13 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r23sm9540512ljh.34.2020.04.14.09.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 09:48:13 -0700 (PDT)
Subject: Re: [PATCH v6 04/14] clk: tegra: Rename Tegra124 EMC clock source
 file
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <cyndis@kapsi.fi>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-5-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a7209708-6e67-5885-5935-2db3d92174e8@gmail.com>
Date:   Tue, 14 Apr 2020 19:48:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> This code is only used on Tegra124, so rename it accordingly to make it
> more consistent with other file names.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/Makefile                          | 2 +-
>  drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
> 
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 1f7c30f87ece..dec508ef2ada 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -14,7 +14,6 @@ obj-y					+= clk-tegra-audio.o
>  obj-y					+= clk-tegra-periph.o
>  obj-y					+= clk-tegra-fixed.o
>  obj-y					+= clk-tegra-super-gen4.o
> -obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
> @@ -22,6 +21,7 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
> +obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-tegra124-emc.o

What about to rename CONFIG_TEGRA_CLK_EMC to CONFIG_TEGRA124_CLK_EMC as
well?

Also.. maybe the CONFIG_TEGRA_CLK_EMC isn't really needed at all and the
TEGRA124_EMC of memory/tegra could be re-used here?
