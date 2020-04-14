Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1F6C38A2B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA2B02084D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIhYIz+C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407357AbgDNPSi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407351AbgDNPSd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:18:33 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2219C061A0E;
        Tue, 14 Apr 2020 08:18:32 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id f8so3535lfe.12;
        Tue, 14 Apr 2020 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EaqdjDcz077guZZFx5utO0urvqfVvTtoCeZlyZLJ4kY=;
        b=YIhYIz+CpSklWfCMJiTQBwpRgBV0ctYIjrrVfeiHT9KHQexJd3U4HTtPCr4YalaSor
         Nb/P9+fWUhEsKtY7TsxML4gIPd5EAK5Ea/FBa2dXkvA/Ka/S2TcspycJTVowoi8l/lvV
         bK0PHJg39vlv9KuSwx8jW5cpVUz2xh6WeiWBTOgDFSmo5jjUx8+nRixvPGoTu/sRCl53
         xYmnFJQ/Dj6jC6TBu2wwg9vVcia08ijGsDcewfTfwArjgo7QZT4pzKdYLV5PCAdO/Dvg
         fh12n66uiF5FpV8ODdEGvsRqDELFXYsEYpdgoT76TZ+yn5bYItrrl54uRhcevznrgAQW
         Pd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EaqdjDcz077guZZFx5utO0urvqfVvTtoCeZlyZLJ4kY=;
        b=GqQ+0toOZ8vyW9tFLcR/Knkn2LgjVR3IzbDMdwI0C1lyIGPSnkOuw8eVoLwAMqfjUw
         STpGymBaN/eiA4Dd0pAmkfIsHUf38Xx/uRE/oABlJq6kKIrAGyhDKEzzE9hb8w4f98eW
         H2gdUdPsL0OUqPE9SwAknxTTDpdHp86mSaVMFf6+1P6K7aulQikUsQspsbB5eUw3Cy2L
         2qI0JLdPgS1TXsV7HZALNorOAD4jiI+J9gcfF3ePY3Wx8RnqlCLFJn+gOLFiK4WLWZxN
         ILBZYv7PG9z5n+XJ7jKAMlIRHlkCZQyOkuY86veXSnh0GmcU7ic5lWFg+p4s/yej6FDa
         JRRA==
X-Gm-Message-State: AGi0PubQUvAkqRl7ntjGBoN8AdI0w5UoMbTW7SCO53Ar5jEG7yhCpgYU
        ktx0yUUUngXYlbsUjSWNqPw=
X-Google-Smtp-Source: APiQypLUTnN9jhL1/kjbd/qXnyU7SH/YSbBa5XG5eUCrFPojjrbpHlIpRKG9PuFRu/KbkQRc6zRgEg==
X-Received: by 2002:a19:c14e:: with SMTP id r75mr221935lff.62.1586877510987;
        Tue, 14 Apr 2020 08:18:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j14sm9865266lfm.73.2020.04.14.08.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 08:18:30 -0700 (PDT)
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
 <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
 <20200414143424.GG3593749@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <92eb73ba-73e4-f9f1-bb22-9b515e32cee6@gmail.com>
Date:   Tue, 14 Apr 2020 18:18:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414143424.GG3593749@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 17:34, Thierry Reding пишет:
> On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
>> 09.04.2020 20:52, Thierry Reding пишет:
>> ...
>>> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +					unsigned long *prate)
>>> +{
>>> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
>>> +	struct tegra210_clk_emc_provider *provider = emc->provider;
>>> +	unsigned int i;
>>> +
>>> +	if (!provider || !provider->configs || provider->num_configs == 0)
>>> +		return clk_hw_get_rate(hw);
>>
>> This still looks wrong to me. Nobody should be able to get EMC clock
>> until provider is registered.
> 
> The EMC clock is mostly orthogonal to the provider. The provider really
> only allows you to actually change the frequency. The clock will still
> remain even if the provider goes away, it just will loose the ability to
> change rate.

It's not only about changing the clock rate, but also about rounding the
rate and etc.

Besides, you won't be able to change the rate until provider is
registered, which might be a quite big problem by itself.

>> This is troublesome, especially given that you're allowing the EMC
>> driver to be compiled as a loadable module. For example, this won't work
>> with the current ACTMON driver because it builds OPP table based on the
>> clk-rate rounding during the driver's probe, so it won't be able to do
>> it properly if provider is "temporarily" missing.
>>
>> ... I think that in a longer run we should stop manually building the
>> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
>> ID, with voltages) in a device-tree. But this is just a vague plans for
>> the future for now.
> 
> This code only applies to Tegra210 and we don't currently support ACTMON
> on Tegra210. I'm also not sure we'll ever do because using interconnects
> to describe paths to system memory and then using ICC requests for each
> driver to submit memory bandwidth requests seems like a better way of
> dealing with this problem than using ACTMON to monitor activity because
> that only allows you to react, whereas we really want to be able to
> allocate memory bandwidth upfront.

You absolutely have to have the ACTMON support if you want to provide a
good user experience because interconnect won't take into account the
dynamic CPU memory traffic. Without ACTMON support CPU will turn into a
"turtle" if memory runs on a lowest freq, while CPU needs the highest.

Secondly, the interconnect could underestimate the memory BW requirement
because memory performance depends quite a lot on the memory-accessing
patterns and it's not possible to predict it properly. Otherwise you may
need to always overestimate the BW, which perhaps is not what anyone
would really want to have.

I'm not sure why you're resisting to do it all properly from the start,
it looks to me that it will take you just a few lines of code (like in a
case of the T20/30 EMC).
