Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DF8C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C839020644
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbDjzXio"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633479AbgDNU4m (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633476AbgDNU4i (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:56:38 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D42C061A0C;
        Tue, 14 Apr 2020 13:56:36 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w145so916558lff.3;
        Tue, 14 Apr 2020 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VXIck97a0Aek/aAV52HpZ0MXWHfB9oEpMa5wcF3XgGk=;
        b=SbDjzXioUzTK32wnVrOp+mrUtzSJSwM9ueiRLctq5tLHRvYwiSJElJDhHCBoZUsG/t
         vMpPxeF17vsyiNu4qfxNsQhviSI4eW3UJ5aFa8gO2TKLKXb1YEl1kYhQBc+rRbf+QStB
         2Pb/rJJ7LKgjsHveBSwOCZxamYEVaf3RbfYsFfO4mYSjn0wKPmIOsHsu0Ex39oJoqy2i
         xtgJ9RTwK+kuvDYwjkxZ0vlxohaEJ+7y1Kb1RhUbxAvzopQa4EuY7eYgMhg1uqGn9B0e
         FVXp0h00rjH+v7gS0SCDYIHGw9O2nj4sniBJITJpE52MNdnWnB6jU/fwl3YWDL1YrJdT
         crPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VXIck97a0Aek/aAV52HpZ0MXWHfB9oEpMa5wcF3XgGk=;
        b=iAFoYTCH5MBhAnZ0Q+0zB+wc3Q+CjFyUhvYz2nPo9EWuuceKCgjjC+GCCpmlKpQyTN
         3cQ/A/WW3N9yscPkXpYGqP3g70DZU9UbSEx7rDzOcleQ7i9PfebFhP/A1RayIcbm1LqZ
         UveAguPjwRjRo93Hb9aHqQb7ZSBaUxyMwXOy5/ExkwLkYP8i7+5Stlx1SUc5vfzynaYr
         Y0A3cFG6iwmbPXCOfxkaevXIvjXU6829vVlsfKBl0Y/MW+q+84KnQun/fDPVKy+eg7wy
         /zVIsWZXsvSs7fgtswxgEaRdaTqK0bQGRotObCrm0ydym41v5Iou78CI52sDokg8tabu
         PF9Q==
X-Gm-Message-State: AGi0PuZDKOqZ/DJOyZLPj0L9N02B/57rvK7KzUtWt5Q4wqRg/EO+m4PR
        UQZbo+Ce2Pzl9H/bjYrepm4=
X-Google-Smtp-Source: APiQypKtH1bUDHRdjihShdon0tmZ0zNWbYZQeiYG5Hr+bD+QTuphwkvgyVN2rrgzBmXRVqqdsJ4sSQ==
X-Received: by 2002:ac2:43c7:: with SMTP id u7mr1002725lfl.50.1586897795282;
        Tue, 14 Apr 2020 13:56:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id t8sm11485093lfe.31.2020.04.14.13.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 13:56:34 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <5616bbe7-d185-1a6a-1fc5-e4ee5d2f65e6@gmail.com>
Message-ID: <1ed62d87-4194-6dca-e28c-ff99988b6697@gmail.com>
Date:   Tue, 14 Apr 2020 23:56:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5616bbe7-d185-1a6a-1fc5-e4ee5d2f65e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 23:46, Dmitry Osipenko пишет:
> 09.04.2020 20:52, Thierry Reding пишет:
> ...
>> +static void tegra210_change_dll_src(struct tegra210_emc *emc,
>> +				    u32 clksrc)
>> +{
>> +	u32 dll_setting = emc->next->dll_clk_src;
>> +	u32 emc_clk_src;
>> +	u32 emc_clk_div;
>> +
>> +	emc_clk_src = (clksrc & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
>> +		       EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
>> +	emc_clk_div = (clksrc & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
>> +		       EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
>> +
>> +	dll_setting &= ~(DLL_CLK_EMC_DLL_CLK_SRC_MASK |
>> +			 DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK);
>> +	dll_setting |= emc_clk_src << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT;
>> +	dll_setting |= emc_clk_div << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT;
>> +
>> +	dll_setting &= ~DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK;
>> +	if (emc_clk_src == EMC_CLK_SOURCE_PLLMB_LJ)
>> +		dll_setting |= (PLLM_VCOB <<
>> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
>> +	else if (emc_clk_src == EMC_CLK_SOURCE_PLLM_LJ)
>> +		dll_setting |= (PLLM_VCOA <<
>> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
>> +	else
>> +		dll_setting |= (EMC_DLL_SWITCH_OUT <<
>> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
>> +
>> +	tegra210_clk_emc_dll_update_setting(dll_setting);
>> +
>> +	if (emc->next->clk_out_enb_x_0_clk_enb_emc_dll)
>> +		tegra210_clk_emc_dll_enable(true);
>> +	else
>> +		tegra210_clk_emc_dll_enable(false);
> 
> Isn't something like fence_udelay(1) needed after touching clk registers?
> 

Won't be better to move this whole function into clk/tegra?

It feels a bit dirty that a raw clk pointer is passed to the EMC code.
I'd factor all the clk functions into clk/tegra to have a clean
separation of the code.
