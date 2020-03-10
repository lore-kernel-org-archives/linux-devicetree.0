Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB8CC18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:20:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C38E0222C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 16:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqCYx88G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgCJQUF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:20:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43441 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgCJQUF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 12:20:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id r7so14829976ljp.10;
        Tue, 10 Mar 2020 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J1n1CjK3DESSyBmNxPalFUipSJmYITet4TKN4OHft7c=;
        b=HqCYx88GlfzFJ99ETs849WW5pHMsHcUqpqbHmrESJoEGqcgPYBBd7NcHtt75Cvd4St
         BFEJD4IFpQxTkUCKqRZ0ftOYTlyyTUzioTxbPF11JYBOwdb2osEqEeNHdzujLO4End4Y
         X0zPdJrx1NCd2LPdltyVmbxYd33JKr2kASvjoI83wyLaNkj3jXX16oO1v7k8Hnuw12Ed
         bVcBK1qax1dNwG/NGmGMbBr9tmcg3Vwusepc6EWHY3PSigtQe/Gu6W6XntThodiuXrGr
         Mu85kw1K0eDE2sBRFYbSe2+7DU0OWrYnCvcu4z+90oTREdKfOB5AJBJOuwgsceCqNvmP
         Jamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J1n1CjK3DESSyBmNxPalFUipSJmYITet4TKN4OHft7c=;
        b=qwXRY8X/e7oBHtAd/GmPK2VbLc4Iht67KlsOyHFN4IFVnCgb686jR403ZohsDViJDI
         zQ+6WcxThZrdNMObJUL3l4FTMTunZclNfe5mz+Kv3sGA5zee2DcBO5HCZkO6rpvn2H4S
         EzvqC5n/MY7CNICp21syoF4ZATN/alaFzy6INSAPwdV0QBeXskyaKgui78GpB/XyNfeM
         yfftjJQst6LIY8c6ax2H8YbOIwsCjsXrEPaIXJEUab0CvvAohKfc+NoCEIWVnpd+x0tY
         2qYWndlBdv+jBUGhCJKXLGDVJiaeC3zKeiRI4/sBqZW/scPa46ppQmEPjCuFMMi4rD7C
         RNGQ==
X-Gm-Message-State: ANhLgQ2/mruejejbhx2DffSKPB9qKxS/OINtwH+QU+VvSpq8wb2pkYbx
        qy7kDZXunsTEbAMmZ8rbUY9J0iLX
X-Google-Smtp-Source: ADFU+vuk2CesxaGJ5WQuIGUaiBwcdsAUiqyJ65FAPmvnAfSsieZ1n7ZA9Y8skRjqkkI6bz4R+lxzJA==
X-Received: by 2002:a2e:9cd0:: with SMTP id g16mr13068009ljj.11.1583857201185;
        Tue, 10 Mar 2020 09:20:01 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id l11sm18461933lfg.87.2020.03.10.09.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:20:00 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
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
 <20200310152003.2945170-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9b343fd1-15df-409a-390f-e30fa6bbbfe7@gmail.com>
Date:   Tue, 10 Mar 2020 19:19:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-2-thierry.reding@gmail.com>
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
> Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
> clock source.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
>  include/dt-bindings/clock/tegra210-car.h |  4 ++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 45d54ead30bc..f99647b4a71f 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -3161,6 +3161,17 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>  	clk_register_clkdev(clk, "pll_m_ud", NULL);
>  	clks[TEGRA210_CLK_PLL_M_UD] = clk;
>  
> +	/* PLLMB_UD */
> +	clk = clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
> +					CLK_SET_RATE_PARENT, 1, 1);
> +	clk_register_clkdev(clk, "pll_mb_ud", NULL);
> +	clks[TEGRA210_CLK_PLL_MB_UD] = clk;
> +
> +	/* PLLP_UD */
> +	clk = clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
> +					0, 1, 1);
> +	clks[TEGRA210_CLK_PLL_P_UD] = clk;

Isn't it possible to auto-enable the low-jitter bit when necessary
during of the rate-change based on a given clock-rate?
