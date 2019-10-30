Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF5BCA9EC7
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 09:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8982217D9
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 09:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GOMrdPbt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfJ3JzR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 05:55:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38884 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfJ3JzQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 05:55:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so1532059wrq.5
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hs0Xj3TpOFo7Xi2C92NXMI0mClPmgg9hIzDJgVyM7dI=;
        b=GOMrdPbtza7bahmXFnK8BFCvQpxJK0EQx9lvmMYCWiUB8A+wjb7ykcc+ZmPoJ8CvTM
         jbyq/wUOW8NOvHiKNVmSnOYslZCf5BVbXBM+9pgUmRnmYbWAJ63oxlKbgAIbtYO6bvz8
         m/OtQlCrNANBMhVXthUDHMx4y0ZR3qqXBkI/C5auNKC2tYlJ10Qfxk4M12PXQExMxYb+
         QWWWervwvAlSmyLn037zf39ucwHSn8ESM+PcaORjBd6NWlYu0Q7I1q9gkWYPO5+X19Ip
         OSwsj3JqkQxj4M4epdlGZ/m8HpkLhowk+0Reki9OuLANr649y8RLZyGnq1wGz0de2K0q
         ZJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hs0Xj3TpOFo7Xi2C92NXMI0mClPmgg9hIzDJgVyM7dI=;
        b=DlI0aFBKEBG8+/fOLOg7IWiNbumC243euCVuk1GmnNqUWpBgt5sgqGBMj5NLHCaM0z
         EXMb+/zj1FA1+7P+hqct44AgemaaRXhj7Y02tpLQ10VYmAxFv52z0Z3r4KIGcFQHLbOP
         8MbkOIwp+3s6akQZ2NTvf5/DrPh4Y+Gyjs9gGZQTRuzAoIWgJ/L2bpDNdSoX8bFPE4Or
         eterrZoomqjXKgxEvhJq1NII9X5LpZI1Eyq8jSCAWi6l6PF/wksOoAViy5ut/SEgzX69
         Y/RvJbyuFxb7ewCrxFtpgJYd6E8RpkwLbNYvpW7xtbRXurzpGprE3NWXfAH0hPZV1iQP
         sRHg==
X-Gm-Message-State: APjAAAUb85TFBy5clQ5XgsP3g8WRGTudg/7jT9AjBLv0nBZBZTK1naZf
        iJVdBwu+yQHGv4OmEPX683hVzg==
X-Google-Smtp-Source: APXvYqyEXL1nWX9W5G1Oh1yg4gjs2XsDhJV/J4RZbb5xTf2TxaEp1juTXqmwC1y55FdaXSwMim9fMQ==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr9057873wrq.46.1572429314643;
        Wed, 30 Oct 2019 02:55:14 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id g5sm1675086wmg.12.2019.10.30.02.55.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 02:55:13 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, Banajit Goswami <bgoswami@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
 <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
Date:   Wed, 30 Oct 2019 09:55:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 29/10/2019 20:47, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
>>> Its Phandle.
>>>
>>> something like this is okay?
>>>
>>> slim-ifc-dev:
>>>     $ref: '/schemas/types.yaml#/definitions/phandle-array'
>>
>> Sorry this should not be an array, so something like this:
>>
>>     slim-ifc-dev:
>>       description: SLIMBus Interface device phandle
> 
> You're just spelling out the abbreviated name. I can do that much.
> What is 'SLIMBus Interface device'?

Each SLIMBus Component contains one Interface Device. Which is 
responsible for Monitoring and reporting the status of component, Data 
line to Data pin connection setup for SLIMBus streaming. Interface 
device is enumerated just like any other slim device.

We already have exactly same bindings for WCD9335 in upstream at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42

> 
> Is it a standard SLIMBus property? If so, document it in the right
> place. If not, then needs a vendor prefix.

"SLIMBus Interface Device" itself is documented in SLIMBus Specification.

If I remember it correctly You suggested me to move to "slim-ifc-dev" 
as this is part of SLIMBus Specification.

Thanks,
srini


> 
>>       $ref: '/schemas/types.yaml#/definitions/phandle'
>>
>>
>>>     description: SLIMBus Interface device phandle
