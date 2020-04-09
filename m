Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F92BC2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 18:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24D392087E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 18:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMaO6MI5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgDISYh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 14:24:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46532 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDISYh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 14:24:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id m19so353333lfq.13;
        Thu, 09 Apr 2020 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fa26jqPPtzIkc//RtMH6SVR58k747j0sywbqTRpv304=;
        b=aMaO6MI5RtYfDEKWn9t0hPBC+iiaGTHCKRHtqhDSpYRMdBINmseVb852oVgHht6hPG
         fd5K+uLll0UGAFw7Ko66nAjKVrlhMMp65nYW03VLlXPRaY5atpmWKGaXhAtAb6xCClV6
         N47yqVKTXIOkz8e1N84nDPdfP9RrkXWPvqVNvtCeWnZrcO5m7hm7hcheYrI9c+na0Xow
         +vd9UPBZHs9OesASsdiq182qwSHO+rFmLE70XnZdIBKxF84e6TEcDUkS3c+EToF3JiTA
         dM95arlpy/Idu/NqW0rGgaHFtWN2RkP0URVjCMUNSOkAKTqoAPag5CwvxT/dKtmXCGUj
         A1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fa26jqPPtzIkc//RtMH6SVR58k747j0sywbqTRpv304=;
        b=HMd8rcob4UOZc1YvQoIAVp7CeQRpiU+GGJ6uhs5QVcZhpw1Bjv7fT+mDNCd5Sx5hHr
         DANoKrDEUuSrclign39Y0mZeNy7+rQ+iziURyrSMB28VV562r9QQY+zfTKkFsKucrx2j
         ypj83eR2yckJhg36JYMhEnI+PKAUnZBfn3fmQn8vKk2EDdKCuPy3P0tcubfaYf4l9XXW
         0twK24Ku28goqOSoyXs5qWyIaCN6HLG8CY5ScwZxtx7sTmKvG39eWd4zAYWeqis86qk0
         eZ/7MhG2UdhDK28PsucYX3egdts1qy25HRUYMdA0tkfLbaxbSPEa+jg0EjWBbqYmkBCM
         V7wA==
X-Gm-Message-State: AGi0PuZaFjWIe2LZboAmKYQh83LbwTHNKOSfOMRrJRtn6ff4vixYNuGC
        +xzOEuIeODaATzsXJt2X3As=
X-Google-Smtp-Source: APiQypKBIIC1fFOKcSXJcsM3k16YK6Uo7dy37UIDlG+baWYmUXAJIkTaBwCpQaQHtwMdvrWhiCEcxg==
X-Received: by 2002:a05:6512:443:: with SMTP id y3mr371032lfk.166.1586456673273;
        Thu, 09 Apr 2020 11:24:33 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id w7sm2108193lji.92.2020.04.09.11.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 11:24:32 -0700 (PDT)
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
Date:   Thu, 9 Apr 2020 21:24:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long *prate)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	struct tegra210_clk_emc_provider *provider = emc->provider;
> +	unsigned int i;
> +
> +	if (!provider || !provider->configs || provider->num_configs == 0)
> +		return clk_hw_get_rate(hw);

This still looks wrong to me. Nobody should be able to get EMC clock
until provider is registered.

This is troublesome, especially given that you're allowing the EMC
driver to be compiled as a loadable module. For example, this won't work
with the current ACTMON driver because it builds OPP table based on the
clk-rate rounding during the driver's probe, so it won't be able to do
it properly if provider is "temporarily" missing.

... I think that in a longer run we should stop manually building the
ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
ID, with voltages) in a device-tree. But this is just a vague plans for
the future for now.
