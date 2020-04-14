Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D79C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC8022064A
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDR+lQnp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633361AbgDNUqZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633360AbgDNUqV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:46:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ABCC061A0C;
        Tue, 14 Apr 2020 13:46:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so1311500ljn.7;
        Tue, 14 Apr 2020 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=askKkkxXJk/7B022tFBDjGnyvpKGiBG8K0FTOjs5euA=;
        b=qDR+lQnp8GZU6clIRqeNTpS4EcIwSRn+r50cmd9pOX8dPjUM29BwMm7N2pZP6ElXNs
         yIF4LVjVNZ/vdB9FY7js5QNVltWXH4WZoBiBSyY8SpIVyJzRwZWQfuyxb5IOeBvgSXo+
         23JpPYKXdJ2N82F25cSVkBc1nPQfn1C2QmDQUrqJNXOyRAoCpxti/7C2jW2yFz4QLYFl
         9wq/d/rTyUHbDlig1os6oOE8nD9ZK5KTQU4Yyjuo69IiDI4j7xeDvm96mzsfHfEfHNCB
         4Dfznn9gOn7lAiW/3LGHZLCJEEevZdfYBpUMRKkgZ6tDTgLIN7sZfuL3I1Z0joCd/ftW
         j0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=askKkkxXJk/7B022tFBDjGnyvpKGiBG8K0FTOjs5euA=;
        b=KiFyNP+un49M77mYA9uYNBizG7b8qOz8VJf2zy1hMP1cJaniQ8OPG6ncIUcbQIPQlw
         wpXBR08S3r94KWHi+g143T6Mfe1/Q3fvDVrW9l4xwFTmqaJ+2kMx9EVmwoS3T4jYv1ul
         r+FELQrEkGpxq1awNlgsbIw1dvhdcESZllJ2gF42njtG1wRqoJ02rfB/91gqF+JHpK2h
         qY1gPP8TwckXwpoL1I01LU0yCdmWngzykYMcyoQAVbIGDzllTVCrHzxbdWV/5uEDhdVJ
         1an4AwKA0r5JefOGOnlgfo03lPlOuk6HXRO5v1BQ6dzXi9zR9QtixCjFhLL7bzgmW5Pc
         IFoA==
X-Gm-Message-State: AGi0PuZbJjtiOnXVjYBNDNbxG2xZg1QxEdedxt0MNC50v1BRenNh53wz
        UEY65AYzlv9iQTd1uvHTXPc=
X-Google-Smtp-Source: APiQypLKpY4Oh1/l6cd1fcyRF3hTmivo0FLa1hS+/dsEpVS65cvkmTQCd7ECNd+sOb4FZlV1oqmO/w==
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr1189106ljo.223.1586897179914;
        Tue, 14 Apr 2020 13:46:19 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id n9sm9637458ljo.89.2020.04.14.13.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 13:46:19 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5616bbe7-d185-1a6a-1fc5-e4ee5d2f65e6@gmail.com>
Date:   Tue, 14 Apr 2020 23:46:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static void tegra210_change_dll_src(struct tegra210_emc *emc,
> +				    u32 clksrc)
> +{
> +	u32 dll_setting = emc->next->dll_clk_src;
> +	u32 emc_clk_src;
> +	u32 emc_clk_div;
> +
> +	emc_clk_src = (clksrc & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
> +		       EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +	emc_clk_div = (clksrc & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
> +		       EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
> +
> +	dll_setting &= ~(DLL_CLK_EMC_DLL_CLK_SRC_MASK |
> +			 DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK);
> +	dll_setting |= emc_clk_src << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT;
> +	dll_setting |= emc_clk_div << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT;
> +
> +	dll_setting &= ~DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK;
> +	if (emc_clk_src == EMC_CLK_SOURCE_PLLMB_LJ)
> +		dll_setting |= (PLLM_VCOB <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +	else if (emc_clk_src == EMC_CLK_SOURCE_PLLM_LJ)
> +		dll_setting |= (PLLM_VCOA <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +	else
> +		dll_setting |= (EMC_DLL_SWITCH_OUT <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +
> +	tegra210_clk_emc_dll_update_setting(dll_setting);
> +
> +	if (emc->next->clk_out_enb_x_0_clk_enb_emc_dll)
> +		tegra210_clk_emc_dll_enable(true);
> +	else
> +		tegra210_clk_emc_dll_enable(false);

Isn't something like fence_udelay(1) needed after touching clk registers?
