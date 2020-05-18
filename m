Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E78C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 17:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4C8E20758
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 17:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdA653P/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgERRBl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 13:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERRBl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 13:01:41 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74D7C061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 10:01:40 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so10647548wrx.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A6wVB9L5JuVcZQhVgNV1j0Bavs6H5jtfAqYurATa2Do=;
        b=bdA653P/QboIHjRsQ/kXQWemQ8gbXJMRQu3sewNP+YlMuTl/p+foWkhrLBStyDO3gs
         P2xavifo28Zofs/Rb7dMxZhbpgta+7Kk+bqr4BIbGuby4R3WDa5HKRGg2vGBBRVYB4YQ
         aEDQ+ayplQUHRW1UmsY0tBOxCcGFp4kf4pIW4vhdh0O3Vkmx23NrQLjGIW0bxNe7fNj3
         V7gc+n4557nQQNW5GXTQMVbWEL++D8cGjwykRK1eXP54o8As3O6011hEi6Ugivsi8Aeo
         m//EeAkt88jJOpWwhlanVeKgEjGYuzreqBkcqexXZUxp3lcCujAJH3Tu31bBPV06jEiR
         6l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A6wVB9L5JuVcZQhVgNV1j0Bavs6H5jtfAqYurATa2Do=;
        b=VlaxUHduxec+txWPF60QHGGMde7WAyyd74XiYLVa4ukM0tmsoDy9gJPv93V04pPPXJ
         YAiBr7f2zA0+9GIpNbPFD3WuqQsZc/EjDtGa8UQRHess5PMZ+h0tuJYckRtMCCXl2TQD
         f3MD8P1WxPyfbQJm8FxfSropml/JxSa0ZxnWmKTp4LD6ypUQLhimYDG2Q1YTZxJxPg9k
         tNUYTQBnmLMV2HapyhxCj4yMbTGJPt2jOkQyftt/GpknoV4myUgmyM5uHSRYnsPr5isu
         DA9JM5C5oe6dQNZ9ILegzMtl518Wi7DMUtwbq4kyosaqWXOI4x/C1iwYjC4a+4O0z8bd
         RLHQ==
X-Gm-Message-State: AOAM530OlLJ/XO2Cgn2TF0rmHfcvsXTdXfwuTukr1r0yDTxW7shiMCtV
        4/DFnGyyjAuI1nAk/9l8/FLLEQ==
X-Google-Smtp-Source: ABdhPJxWOh06HcVOViu4DIpbbOhR0OOnnCEwdTI40X9By447kp5WfnRE1ew1W4UPHl9Gn9nhNxTnxg==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr20606675wru.62.1589821299348;
        Mon, 18 May 2020 10:01:39 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8? ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
        by smtp.googlemail.com with ESMTPSA id m13sm178601wmi.42.2020.05.18.10.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 10:01:38 -0700 (PDT)
Subject: Re: [PATCHv3 00/14] Update omaps to use drivers/clocksource timers
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20200507172330.18679-1-tony@atomide.com>
 <340cdd4a-d996-073f-127d-89ce6c05f221@linaro.org>
 <20200518170059.GR37466@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c2404711-af5e-e9a2-29c1-55378522ebd2@linaro.org>
Date:   Mon, 18 May 2020 19:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518170059.GR37466@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 18/05/2020 19:00, Tony Lindgren wrote:
> * Daniel Lezcano <daniel.lezcano@linaro.org> [200518 16:59]:
>>
>> Hi Tony,
>>
>> On 07/05/2020 19:23, Tony Lindgren wrote:
>>> Hi all,
>>>
>>> Here's v3 series to udpate omaps to use drivers/clocksource timers for
>>> the 32k counter and dmtimer, and to remove the old legacy platform code.
>>> Please review and test.
>>>
>>> I've updated the timer-ti-dm-systimer.c patch based on the comments from
>>> Daniel and Rob, and added support for selecting the preferred timers to
>>> use.
>>>
>>> Then for merging when folks are happy with this series, Daniel if you
>>> can please apply the first three patches into an immutable branch it
>>> would be great.
>>
>> so the clk patch also ?
> 
> Oops sorry, just first two are needed as we no longer need the
> device tree binding changes :)

Ok


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
