Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DB3C2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DAB42076B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XczHHsXO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391506AbgDNQZb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391445AbgDNQZR (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:25:17 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170B9C061A0E;
        Tue, 14 Apr 2020 09:25:16 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q22so481498ljg.0;
        Tue, 14 Apr 2020 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2una7iJWwOFkr0nty9iNTmvafQ/jcphfps7irdBQAAM=;
        b=XczHHsXO2Vc/3ax0jvKyy/m6ldMN//z2v7SfxrOcXa6ULeuaavUZ87yysIAOYUpMyq
         fsJRS0rN4YZ8RokGQGIFrSOOgcsclI55/cXPzvESzZp84oZ8CtHW5bD4JYRBtaW9KNwz
         pO2JejVYOOUh6K+++un76m5w5fj0TQDtkmmCOtML/yGPikdg04JEACVAt5vDKstChur/
         4/O7t+5465fwWGuGiINMW0Smh0fpQ/amnz36ZuyeAbhXfGFYwRgeS+FBOSDzRYyi4QNt
         q4wlyTAhnZd1U2+xWrDH/8r0lsyazH6isPKqq/+/ot6Gdn0LNH0sx9HqLVGDAFfuUegl
         /WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2una7iJWwOFkr0nty9iNTmvafQ/jcphfps7irdBQAAM=;
        b=JkppN1kCHi7fP45OCLZKekpwUYk9qpbXVhwmKfYXj3A2PWfQsU9mbw51mSSP+DTJyy
         W30v3BjMEplk1y6U/bm1qKI9hVX7UfATSPG23xBw3RKef1OSme5qsLWQedgq1n04Tsnt
         yV0d3Yo8vX8QRVsGFhdrACacK5omcm/vaNWgW91tP530XN/3y5PD3+Ti9nCq1BP3TVjU
         cuei0T/zWoWqqIPMECK3DwZXEjWCkx5fgSegyy5rc/E6X43mOXV2Cb3H4gW1HYYSqJHK
         rFdai/najSjm7Gp8gINhGisF7cfukNxHCQocO43pvl6mZOtAgtiNusRdRrQzQEriMFHf
         /krA==
X-Gm-Message-State: AGi0PuajZRB77yanUBWVYymLVid75eWG+jthkBA6Cm66fgARqVeIaTQT
        EpJr5xX/4DyW8GORCCbDN7U=
X-Google-Smtp-Source: APiQypKoJ4+NDw8ILs0tNz9qCl7/54YNeXwAmegIbaAYbPNzbO3v92qT+kdeK3DDjgSoD6+kuN7Llw==
X-Received: by 2002:a2e:3507:: with SMTP id z7mr604794ljz.111.1586881514575;
        Tue, 14 Apr 2020 09:25:14 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y199sm10668331lfa.80.2020.04.14.09.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 09:25:13 -0700 (PDT)
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
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
 <20200409175238.3586487-12-thierry.reding@gmail.com>
 <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
 <20200414154753.GQ3593749@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <05b10433-f18f-dc38-bdd5-16c91f222051@gmail.com>
Date:   Tue, 14 Apr 2020 19:25:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414154753.GQ3593749@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 18:47, Thierry Reding пишет:
> On Fri, Apr 10, 2020 at 02:44:16AM +0300, Dmitry Osipenko wrote:
>> 09.04.2020 20:52, Thierry Reding пишет:
>> ...
>>>  	tegra210_emc_debugfs_init(emc);
>>>  
>>> +	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
>>> +						     &tegra210_emc_cd_ops);
>>> +	if (IS_ERR(cd)) {
>>> +		err = PTR_ERR(cd);
>>> +		dev_err(emc->dev, "failed to register cooling device: %d\n",
>>> +			err);
>>
>>> +		goto detach;
>>
>> I think it's not really worthwhile to fail whole EMC driver because of
>> the failed CDEV.
> 
> Well, we do kind of need this cooling device mechanism in order for the
> memory to continue to operate properly at high temperatures. It's also
> very unlikely that this will ever fail, so I don't see any harm in
> making this mandatory.

Fair enough.
