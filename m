Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F0DC35247
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 21:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3C7D2072B
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 21:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxp4vvdk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgBEVeg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 16:34:36 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43517 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgBEVef (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 16:34:35 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so2563378lfq.10;
        Wed, 05 Feb 2020 13:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vd2LT5W67yDsSli24bUzWAzGwDRcbU4/vRfwMvPfGV4=;
        b=nxp4vvdkVEqU0Axe6PXRH8tGOtdEZ15A7aX/tfxin0i13esF22sPtQJ/LH3GTbDv06
         n1FgPZnHfK6ShfM0euV9O1eSSa/4p7cQZbk2WApHtyy2lLYXDKxNmRwCc8Z2TI8iIAuW
         7Sp6nwmWWgQ7bMbjaSk8ccwuTZLbvCelqsxy9tdnYHZ0VUNinFq5xOs2atlndoRXY9W7
         Lx5drj3TyUiGLFoD+br1sjndO5W/r16Qewg4aEgdFbYre9P4TqGR7ir97pzN9yCrr0dU
         ZND5fzdLWWT9nkuKfqidlV3wtPuy0XiQc9os3J9YuoBb0NVhUzAAN63nMLGY5TCL+M0c
         7SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vd2LT5W67yDsSli24bUzWAzGwDRcbU4/vRfwMvPfGV4=;
        b=V1Qn+pZmcY7857TJHa4QbirD8NzawrYTM5TqkhopopV6Z3i43T1Zt6xt89hkuGC7s7
         iiz6yA+EF3c8BenAzQh69l5hBlbWLT/7TSXMwl7nXf2wB9Dk4k7OvmtA6RHLz5mGeP9+
         pJioa3zCDz3WtJiVE7VrmetjLxT59l+66h6oYjUZVAdLdAEV/Lj3ZDo+22SYM9Chl1XV
         acL/DCLSj/72zxMQ2P2BIkGXagUYTbVk5BKq9G00V1NoABa/wcPec9ECR+QC90QUOlFg
         4iMPJe9/G+/DwUaziNsLHCgX9E7pwpGWANiAdbx4loQr0hXXRCfu4KpFOfmcBCivwmO8
         maEw==
X-Gm-Message-State: APjAAAUnMVTomcaGsuvWBEQ2OKTAIhy4HiLu8eFQWAouEuhVdxLzeJka
        Aax3YZLYAGSKTl9mjlzTiTD+h325
X-Google-Smtp-Source: APXvYqxyJ3nL3de4mMrYso8T4eK9+0LXc1uP5BCF3GQ4RskFhhau/IAQy2Q4QnCTACnbRZ2PZFQ4WA==
X-Received: by 2002:a19:6d13:: with SMTP id i19mr18310991lfc.6.1580938472264;
        Wed, 05 Feb 2020 13:34:32 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id d20sm299438ljg.95.2020.02.05.13.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 13:34:31 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
 <20200127124903.GB2117209@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4177818c-96dd-de75-2260-047236c129c0@gmail.com>
Date:   Thu, 6 Feb 2020 00:34:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200127124903.GB2117209@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

27.01.2020 15:49, Thierry Reding пишет:
> On Mon, Jan 27, 2020 at 12:56:24AM +0300, Dmitry Osipenko wrote:
> [...]
>> Thinking a bit more about how to define the ICC, I'm now leaning to a
>> variant like this:
>>
>> interconnects =
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;
>>
>> interconnect-names = "dma-mem", "read", "write", "dma-read", "dma-write";
>>
>> Looks like there is a problem with having a full MC-EMEM path being
>> defined for each memory client.. it's not very practical in terms of
>> memory frequency scaling.
>>
>> Take Display Controller for example, it has a memory client for each
>> display (overlay) plane. If planes are not overlapping on the displayed
>> area, then the required total memory bandwidth equals to the peak
>> bandwidth selected among of the visible planes. But if planes are
>> overlapping, then the bandwidths of each overlapped plane are
>> accumulated because overlapping planes will issue read request
>> simultaneously for the overlapping areas.
>>
>> The Memory Controller doesn't have any knowledge about the Display
>> Controller's specifics. Thus in the end it should be a responsibility of
>> Display Controller's driver to calculate the required bandwidth for the
>> hardware unit, since only the driver has all required knowledge about
>> planes overlapping state and whatnot.
> 
> I agree that the device-specific knowledge should live in the device-
> specific drivers. However, what you're doing above is basically putting
> the OS-specific knowledge into the device tree.
> 
> The memory client interfaces are a real thing in hardware that can be
> described using the corresponding IDs. But there is no such thing as the
> "BPMP" memory client. Rather it's composed of the other four.
> 
> So I think a better thing to do would be for the consumer driver to deal
> with all of that. If looking at only bandwidth, the consumer driver can
> simply pick any one of the clients/paths for any of the bandwidth
> requests and for per-interface settings like latency allowance the
> consumer would choose the appropriate path.

Will be good if we could avoid doing things like that because it doesn't
sound very nice :) Although, it should work.

On older Tegra SoCs Memory Controller has a hardware ID for each of the
clients module and we're using these IDs already for the MC resets.
Don't you think that we could use these IDs for ICC?

Are you sure that newer SoCs do not have these IDs too or maybe they are
kept private now?

>> The similar applies to multimedia things, like GPU or Video Decoder.
>> They have multiple memory clients and (I'm pretty sure that) nobody is
>> going to calculate memory bandwidth requirements for every client, it's
>> simply impractical.
>>
>> So, I'm suggesting that we should have a single "dma-mem" ICC path for
>> every hardware unit.
>>
>> The rest of the ICC paths could be memory_client -> memory_controller
>> paths, providing knobs for things like MC arbitration (latency)
>> configuration for each memory client. I think this variant of
>> description is actually closer to the hardware, since the client's
>> arbitration configuration ends in the Memory Controller.
> 
> Not necessarily. The target of the access doesn't always have to be the
> EMC. It could equally well be IRAM, in which case there are additional
> controls that need to be programmed within the MC to allow the memory
> client to access IRAM. If you don't have a phandle to IRAM in the
> interconnect properties, there's no way to make this distinction.

Could you please clarify what do you mean by the "memory client" here?
Do you mean the whole hardware module/unit or each memory client of the
hardware module that needs to be programmed for the IRAM accessing?
