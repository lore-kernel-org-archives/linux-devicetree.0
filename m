Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA742C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5953222C4
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4NR1a/x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgCJRoo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:44:44 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38882 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJRon (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:44:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id w1so15173049ljh.5;
        Tue, 10 Mar 2020 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GHzaWg3f9PXj0XCOnlYVM0t9EpHANTjAH8lOSKib10g=;
        b=q4NR1a/xd5/emofZa/GJ+NEzpDE46eywiiRq/5MsLLapNO99t6/vZC+h7gS89a4Hqh
         QtPUnNujxuDr+I+BudWjJCbxxh7LrO0rtprfl2xW8ZyVPLyu1PFv5gGqwc8VecibsCsR
         gNMVkd5XYWtNH+c4KzlApP7+n2k0pTpCsVMnpOblFN9Rm9kRNpBKGkuoZiI9B1q+fljd
         +OqLDo6dbHEh1Jzu/ijKFo/F8PkDSTmmV2JX8dIC5sKpuyKwBJSnJMfP40KtlUa1inNY
         7oShBwFNSuV784d+0tZAHmFcmPP7PrBVzAITxiy7z1CD0Nz8Anco+FZ4YUbKlFM5sQJO
         B3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GHzaWg3f9PXj0XCOnlYVM0t9EpHANTjAH8lOSKib10g=;
        b=iF4yw5hw+tWTUtNt+UAm4hJBPIlXlcx2dEAkU11oTiAuZ8P8uvacuEaE1frQd/28y5
         idbW9btqSgzIEcmG1UvOzzA9H/HC43ScEQeg6QbIE9kt2Kjjh4oO2FRtOAuRsAmD+iKI
         EBX83GnCiPFYOaRxQJ7mDueaEJdz61oQM/9SI2FoxppoUYFVn2LgosOzxsybfPHXn3mZ
         /d01ARr5zcZcukCxNw3Bc9V7owGq7GWi43nb3g/vSSnyjiJJN7iorC6p8KwdlekfG+Ep
         qQCDSFF4jrv9dIaDiVui26B9GQKOxOQ0HEDKYX4cIVQtCvjPz4Zuf+6yOL/yFLe156fE
         5bEA==
X-Gm-Message-State: ANhLgQ2X3TlX3QBQFdUNZfXQwi+9EpmZYe4QaDSTOeTkr48gConnAsly
        f6bdnxfRlrmwLYVpest4HQdwB3Or
X-Google-Smtp-Source: ADFU+vtedvwOTK2i5hsjsLdZAGJefepqqYliPvSiQKHVCcPbuAjQSCqfBBO7fuz7yRotFfidXnpBjw==
X-Received: by 2002:a2e:330e:: with SMTP id d14mr3309081ljc.72.1583862280236;
        Tue, 10 Mar 2020 10:44:40 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id c20sm16687727lfb.60.2020.03.10.10.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 10:44:39 -0700 (PDT)
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
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
 <20200310152003.2945170-4-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53@gmail.com>
Date:   Tue, 10 Mar 2020 20:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-4-thierry.reding@gmail.com>
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
> The EMC clock needs to carefully coordinate with the EMC controller
> programming to make sure external memory can be properly clocked. Do so
> by hooking up the EMC clock with an EMC provider that will specify which
> rates are supported by the EMC and provide a callback to use for setting
> the clock rate at the EMC.
> 
> Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - major rework and cleanup

...
> +static u8 tegra210_clk_emc_get_parent(struct clk_hw *hw)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	u32 value;
> +	u8 src;
> +
> +	value = readl_relaxed(emc->regs + CLK_SOURCE_EMC);
> +	src = (value >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT) &
> +			CLK_SOURCE_EMC_2X_CLK_SRC_MASK;

What about to use a generic FIELD_GET/PREP()?

> +static int tegra210_clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	struct tegra210_clk_emc_provider *provider = emc->provider;
> +	struct tegra210_clk_emc_config *config;
> +	struct device *dev = provider->dev;
> +	struct clk_hw *old, *new, *parent;
> +	u8 old_idx, new_idx, index;
> +	struct clk *clk;
> +	unsigned int i;
> +	int err;
> +
> +	if (!provider || !provider->configs || provider->num_configs == 0)
> +		return -EINVAL;

Why all these checks are needed? I don't think it ever could fail,
couldn't it?

> +static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
> +{
> +	int i;

unsigned int

Same for all other occurrences in the code.
