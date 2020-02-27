Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B98AC11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 15:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C96EC246A0
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 15:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xds/R4BC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgB0PSN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:18:13 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34312 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgB0PSN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 10:18:13 -0500
Received: by mail-lj1-f194.google.com with SMTP id x7so3890981ljc.1;
        Thu, 27 Feb 2020 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M4uLZ+YZgo9Q68Dx5CiKtqfNH6WlHnEQZUoVCBn8Lbc=;
        b=Xds/R4BCpC6BW8dtHzTtZGQOCQGcOhXw+x+LzzwA/VJAA/Fpq6fXrabWA4Io39mSbY
         I8EXdBzJq4OithOB0SjRvPqGZY2qCNMJmyjZCFXcScHogSkDq2kXTr1Ju7TBLKuMxq4V
         9pp5l9LKE/3UFPBLmsvj2kpal5qDKajtLLbZ8FslteeR2jO5qUF6I89+LlEOtPaX7sYE
         3DLUdCyCHHep/Kc+EF8/k0wKJoJKYh/kEX57/LQH3kLFodc1ei1s7eu7LWeEP1E1ZQha
         NoG7OvkqtH9bukiPObP041+mnsPO2ZK2eoIa6RVUkxs/hpBcuKm8HSQ0AntWsOiRX9jc
         2ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M4uLZ+YZgo9Q68Dx5CiKtqfNH6WlHnEQZUoVCBn8Lbc=;
        b=ALzSvV2BaAW4xpsSQXJQh5W8y9jYGxqfZyXlKsQEmNf9YjUtVJd8ZeSFDcfRdJzYWN
         QUvMiyEm2S3UDaIpycBpzvZGpwg8qxjrZHZL4VM5uAJW4kNBDkJiHCbnMQdtw8cpxXqP
         ExCaxkwVqVL3WIqLY4LYFvZKHliQyZvNAzuq7QHsNNeVw/tKawocOwh0Qm+Rnp96FdB0
         KbOzK+4Nc/X2kVLQYEjKKcbApXQ+st1WqTN9rCV7U0CDBZcNoNW7fzty0tHvar1ozL8s
         AQHXIu4kshfWyjohIHH+KeeEatNdnMFFGXLb1IctqK3nlx2UDxGlj7Movbx9K693bpzE
         3ffA==
X-Gm-Message-State: ANhLgQ1G8h7Whd94X1y6HoaYYHgT26TS6FxFcdG2NOPt1AISfI8D3I+R
        HgyekyVWlKP6H+38r2/GQmw=
X-Google-Smtp-Source: ADFU+vvWGmb7VbXM2thy02s+ZlBJEquIVTkcMVYWcqrjO/570bRTlqOJc56Hn86Q1ksLj3e7mv01pQ==
X-Received: by 2002:a05:651c:414:: with SMTP id 20mr3024627lja.165.1582816689249;
        Thu, 27 Feb 2020 07:18:09 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t1sm3409703lji.98.2020.02.27.07.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 07:18:06 -0800 (PST)
Subject: Re: [PATCH V4 4/8] memory: tegra: Add Tegra210 EMC clock driver
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joseph Lo <josephl@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-5-josephl@nvidia.com>
 <403181d4-100b-679e-b1d8-c052c6d1f3ac@gmail.com>
 <2f9722b4-df92-546b-9659-3b02768bbe41@nvidia.com>
 <20200226165746.GA818759@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <922e3faf-dd51-e159-4dc4-d427af58dc8f@gmail.com>
Date:   Thu, 27 Feb 2020 18:18:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200226165746.GA818759@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

26.02.2020 19:57, Thierry Reding пишет:
> On Thu, May 30, 2019 at 10:45:01AM +0800, Joseph Lo wrote:
>> On 5/29/19 9:26 PM, Dmitry Osipenko wrote:
>>> 29.05.2019 11:21, Joseph Lo пишет:
>>>> This is the initial patch for Tegra210 EMC clock driver, which doesn't
>>>> include the support code and detail sequence for clock scaling yet.
>>>>
>>>> The driver is designed to support LPDDR4 SDRAM. Because of the LPDDR4
>>>> devices need to do initial time training before it can be used, the
>>>> firmware will help to do that at early boot stage. Then, the trained
>>>> table of the rates we support will pass to the kernel via DT. So the
>>>> driver can get the trained table for clock scaling support.
>>>>
>>>> For the higher rate support (above 800MHz), the periodic training is
>>>> needed for the timing compensation. So basically, two methodologies for
>>>> clock scaling are supported, one is following the clock changing
>>>> sequence to update the EMC table to EMC registers and another is if the
>>>> rate needs periodic training, then we will start a timer to do that
>>>> periodically until it scales to the lower rate.
>>>>
>>>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>>>
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> ---
>>>> v4:
>>>> - remove the statistic data in debugfs
>>>> - add tegra210_clk_register_emc API to make it compatible with the case
>>>>    if the kernel still uses the older DTB which doesn't have EMC node.
>>>>    And the MC and EMC clock can still be registered successfully.
>>>> v3:
>>>> - address almost all the comments from the previous version
>>>> - remove the DT parser of EMC table
>>>> - The EMC table is passing as a binary blob now.
>>>> ---
>>>>   drivers/memory/tegra/Kconfig        |  10 +
>>>>   drivers/memory/tegra/Makefile       |   1 +
>>>>   drivers/memory/tegra/tegra210-emc.c | 671 ++++++++++++++++++++++++++++
>>>>   drivers/memory/tegra/tegra210-emc.h | 156 +++++++
>>>>   include/soc/tegra/emc.h             |   2 +
>>>>   5 files changed, 840 insertions(+)
>>>>   create mode 100644 drivers/memory/tegra/tegra210-emc.c
>>>>   create mode 100644 drivers/memory/tegra/tegra210-emc.h
>>>>
>>>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
>>>> index 4680124ddcab..9d051bcdbee3 100644
>>>> --- a/drivers/memory/tegra/Kconfig
>>>> +++ b/drivers/memory/tegra/Kconfig
>>>> @@ -26,3 +26,13 @@ config TEGRA124_EMC
>>>>   	  Tegra124 chips. The EMC controls the external DRAM on the board.
>>>>   	  This driver is required to change memory timings / clock rate for
>>>>   	  external memory.
>>>> +
>>>> +config TEGRA210_EMC
>>>> +	bool "NVIDIA Tegra210 External Memory Controller driver"
>>>> +	default y
>>>
>>> This is not enough since you're leaving possibility to disable
>>> compilation of the driver, but the compilation will fail because of the
>>> unresolved symbol (tegra210_clk_register_emc).
>>>
>>>> +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
>>>> +	help
>>>> +	  This driver is for the External Memory Controller (EMC) found on
>>>> +	  Tegra210 chips. The EMC controls the external DRAM on the board.
>>>> +	  This driver is required to change memory timings / clock rate for
>>>> +	  external memory.
>>>
>>> Either TEGRA210_EMC Kconfig option shall be always force-selected for
>>> T210 or you should move all the clk-related code into drivers/clk/tegra/.
>>>
>>> Could you please give a rationale for having EMC clock code within the
>>> EMC driver?
>>
>> I didn't have a specific reason for that initially, just wanted the clock
>> code and EMC driver together for easier maintenance.
>>
>> But considering the fix in v4, that makes it backward compatible with the
>> case if the kernel uses the older DT without EMC node, I think it's better
>> to move the clock code into the clk folder now.
> 
> I looked into this a bit and I don't think this is actually worth it.
> The problem is that, as opposed to Tegra124 and earlier, the sequence
> for changing the EMC frequency is much more entangled. The bulk of the
> programming will be on the EMC side, with the code occasionally calling
> into CAR code to set the parent clock and some other flags.
> 
> So there's going to be some interdependencies regardless of where the
> clock code actually lives. I can try to split this apart, but I don't
> have very high hopes that the end result will be any cleaner than the
> version here.

I'm vaguely recalling that there was another reason than just to "make
things cleaner"..

https://patchwork.kernel.org/patch/10938389/#22641053

Secondly, if you're going to use the CCF API for the clock changes, then
I'm not sure that having couple custom clock-API functions sounds too bad.

Lastly, in regards to the cleanup.. at minimum you should strip out all
the unused parts from this code, make a generic cleanup to make it all
look better, address previous comments.
