Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59849C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 374292076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 20:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2O042p3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633047AbgDNUXF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 16:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633045AbgDNUXB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 16:23:01 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB6CC061A10;
        Tue, 14 Apr 2020 13:23:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m8so1292546lji.1;
        Tue, 14 Apr 2020 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nftyzQSk2fEKUJDNudw4NfsmJdF93g+Dcfc3U2Gpatw=;
        b=d2O042p3UMR+y78JCY4hyzFSMK0uq6Ov9HkHyV9Kqk9/x4tHw8giXjpHrcyy9K/91r
         NwpWUDriyxVukBbzSp+a/YRU96XrxPjJnJzVZSMHj49CjXDBF6jSvcXMLVGycS1KzGas
         M95wHrHjvNA8WPnAGHL+2vvrX9mcjYaDpQ2IgqI0a+PPO/B9jxh+aB8WuoO0fqkQ0I1A
         PSBo23wKFzZO7Fm3tv1aG3B8lzK5PV0CphfRkxRurkAaOlsmV5OobxW0kb+FGwcVRAlz
         gOTlyctwo6Rr9oidtgCE0fu5w7rAtkZESRvECAGJVarbJ6WH5ZtRD9NU82cCvWUbap+S
         73zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nftyzQSk2fEKUJDNudw4NfsmJdF93g+Dcfc3U2Gpatw=;
        b=JWYjsyoi9Xitv2uDkO1Wf758Pt7EO/TGiblx0o3kokyWrucp0mqtnSuYmBP7+D/0kM
         R8sjaFlK3159hqwoArxv3OB94Nz+9Ge9GdaitEEV713kU3sCvejZgaljrBerx3UB9DSO
         KkNOh4UTy2NTt75OOdnG2+T212DYHE28QdUGS4ty9jfVqbGusW+iSuGeMU8AhOj3H2tK
         J5Dk32LS7ZUte9zG/di50OpfBY/dUJw2w3f0iT2NRfMSK8bDZcNby/uO+LzU9q+5KJBT
         vSKhxDxxcO7N7TwcLn2WGB/x0wBYaER605SxOY2hT3Tm2sry+cchKh3dAg33jzhrtpRM
         faJQ==
X-Gm-Message-State: AGi0PubXWqiGH5/A6W3+IpAHmok6j5qVsEc8Lu9Ve87QHE7xcKCJt37R
        yryE142pGsalyisXtNQ/TEE=
X-Google-Smtp-Source: APiQypLDIks8pKmGAVh3u5mAQntArQHMa9ewxINywmVJml1EW274oGfcsHEh4jPeHsTjVJV56LMUPQ==
X-Received: by 2002:a2e:9b56:: with SMTP id o22mr1106944ljj.270.1586895779255;
        Tue, 14 Apr 2020 13:22:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z7sm9746643ljc.17.2020.04.14.13.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 13:22:58 -0700 (PDT)
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
 <92eb73ba-73e4-f9f1-bb22-9b515e32cee6@gmail.com>
 <20200414171010.GB15932@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9dd6ffe0-49bb-4847-e956-2f2e339c3a28@gmail.com>
Date:   Tue, 14 Apr 2020 23:22:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414171010.GB15932@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 20:10, Thierry Reding пишет:
> On Tue, Apr 14, 2020 at 06:18:29PM +0300, Dmitry Osipenko wrote:
>> 14.04.2020 17:34, Thierry Reding пишет:
>>> On Thu, Apr 09, 2020 at 09:24:31PM +0300, Dmitry Osipenko wrote:
>>>> 09.04.2020 20:52, Thierry Reding пишет:
>>>> ...
>>>>> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
>>>>> +					unsigned long *prate)
>>>>> +{
>>>>> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
>>>>> +	struct tegra210_clk_emc_provider *provider = emc->provider;
>>>>> +	unsigned int i;
>>>>> +
>>>>> +	if (!provider || !provider->configs || provider->num_configs == 0)
>>>>> +		return clk_hw_get_rate(hw);
>>>>
>>>> This still looks wrong to me. Nobody should be able to get EMC clock
>>>> until provider is registered.
>>>
>>> The EMC clock is mostly orthogonal to the provider. The provider really
>>> only allows you to actually change the frequency. The clock will still
>>> remain even if the provider goes away, it just will loose the ability to
>>> change rate.
>>
>> It's not only about changing the clock rate, but also about rounding the
>> rate and etc.
> 
> The code will currently just return the configured rate when no provider
> is available. It's going to always round to that one rate and it will
> refuse to set another one. The EMC clock is basically going to function
> as a fixed clock while no provider is attached.

Yes, I'm telling that this should be a wrong thing to do.

>> Besides, you won't be able to change the rate until provider is
>> registered, which might be a quite big problem by itself.
> 
> Until the provider is registered, there's just no way to change the
> rate. You always need to write MC and EMC registers in order to change
> the rate, so trying to change it when the MC/EMC drivers aren't
> available isn't going to work.

Again, clk_get() should return -EPROBE_DEFER until provider is registered.

>>>> This is troublesome, especially given that you're allowing the EMC
>>>> driver to be compiled as a loadable module. For example, this won't work
>>>> with the current ACTMON driver because it builds OPP table based on the
>>>> clk-rate rounding during the driver's probe, so it won't be able to do
>>>> it properly if provider is "temporarily" missing.
>>>>
>>>> ... I think that in a longer run we should stop manually building the
>>>> ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
>>>> ID, with voltages) in a device-tree. But this is just a vague plans for
>>>> the future for now.
>>>
>>> This code only applies to Tegra210 and we don't currently support ACTMON
>>> on Tegra210. I'm also not sure we'll ever do because using interconnects
>>> to describe paths to system memory and then using ICC requests for each
>>> driver to submit memory bandwidth requests seems like a better way of
>>> dealing with this problem than using ACTMON to monitor activity because
>>> that only allows you to react, whereas we really want to be able to
>>> allocate memory bandwidth upfront.
>>
>> You absolutely have to have the ACTMON support if you want to provide a
>> good user experience because interconnect won't take into account the
>> dynamic CPU memory traffic. Without ACTMON support CPU will turn into a
>> "turtle" if memory runs on a lowest freq, while CPU needs the highest.
> 
> Can we not guess a bandwidth based on the CPU frequency? Yes, that's
> perhaps going to be an overestimation if the CPU doesn't actually access
> memory, but that's better than nothing at all.

CPU load doesn't reflect the memory usage.

1. CPU could be 100% loaded while not making memory accesses at all
(100% cache hit).

2. CPU governor settings could be changed by user and CPU != memory.

ACTMON is specifically designated to memory scaling based on actual
memory usage statistics. T210 ACTMON is similar to T124, it should be
easy to support.

> Also, at this point I'm less worried about power consumption rather than
> making Tegra210 devices perform useful tasks. Yes, eventually we'll want
> to fine-tune power consumption, but it's going to take a bit of work to
> get there. In the meantime, giving people a way to set an EMC frequency
> other than that set on boot is going to make them very happy.
> 
>> Secondly, the interconnect could underestimate the memory BW requirement
>> because memory performance depends quite a lot on the memory-accessing
>> patterns and it's not possible to predict it properly. Otherwise you may
>> need to always overestimate the BW, which perhaps is not what anyone
>> would really want to have.
> 
> Overestimating might be a good starting point, though. At this point I'm
> mostly concerned about being able to change the memory frequency at all
> because many systems are mostly unusable at the boot EMC frequency.
> 
> Like I said, if ACTMON really does prove to be useful I'm all for adding
> support on Tegra210, but I don't think trying to do everything all at
> once is a very good plan. So I'm trying to get there in incremental
> steps.
> 
>> I'm not sure why you're resisting to do it all properly from the start,
>> it looks to me that it will take you just a few lines of code (like in a
>> case of the T20/30 EMC).
> 
> I'm not trying to resist anything. I'm just saying that all of the
> issues that you're bringing up aren't an immediate concern.
> 
> My main concerns right now are to: a) allow people to change the EMC
> frequency (and hopefully soon also allow the EMC frequency to be changed
> based on bandwidth demands by memory client drivers) and b) not bloat
> the kernel more than it has to (while my configuration isn't tweaked,
> it's pretty standard and the resulting image is roughly 20 MiB; adding
> the Tegra210 EMC driver adds another 64 KiB).
> 
> And if we really do want to add ACTMON support later on, you already
> suggested a better way of moving forward, so it sounds to me like that
> would be a nice incremental improvement, certainly much better than
> bloating the kernel even further by requiring this to be built-in and
> preventing it from being unloaded.

Up to you then :)

