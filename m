Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91955C5DF65
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 18:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 610922166E
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 18:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deTo+90l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732466AbfKFSJs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 13:09:48 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51076 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfKFSJs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 13:09:48 -0500
Received: by mail-wm1-f67.google.com with SMTP id 11so4812965wmk.0
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rgJXsUBNZa/F0SLsO+it3k7f9qVrt3VaEEsEU5U0WF4=;
        b=deTo+90lJ6be7HHxTg00sHjXhZ3BCSqrIZB22Zr4Ih0eXfNoJ6Gwt/RbEw5gQSjgIg
         qidpwKs5uRX2/lu5DRzqXig8ftmUi03AhVaEYUpWJ0jjW9auDFhXL1SkjGYGBmto2pb8
         veFrOCGDVpD9USl2jXCi2MXpsVt0aBgUqTgiEF6etTbJSDsHDbDcWFVFy6vonpSHsMI7
         L2D0mmBoCGDPshPuZzY4p7VQhtH6IXIpaaGTfk6LPUmiJgvxFMYwzdxm8qdcFIcjlA9c
         b7kkPdCm7cyF1fB5SXXtiruwEQBPAIdGxrexuet+sitv4fmBS9v4vcbQa8fKE9swANAS
         tp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rgJXsUBNZa/F0SLsO+it3k7f9qVrt3VaEEsEU5U0WF4=;
        b=JwJCYCYlUo8/+8f41cJ1ItHXcn8ObCo10w1oh29HMEWDyKsG7La1eEK/bZ77SV87aR
         YkC0KYbNrNUD9J7HfzOgVFNzF0OH69qkh8FQ00y1fnhimDL2oKPGl9s/uuIbHEn/ho3h
         3sgHZ9++AZHYhVhlo2dzRFTx4RqFj9eOC1MTy+7n3WQiteo8iID1TMBukSpa9Qr/Zjg7
         Al3W+uISEoP4sbZm122PUq6kcTIF8DDBOY3loB1QHlAPSuXQFtWqJOBL4J2QjbdWJR9F
         3qhPVao6jVlFnKZ0mP3uAAhDCVoiG5S7RtaYOVWomdodh2rYQQHrCyhLOpieCDoeXI04
         Fq8w==
X-Gm-Message-State: APjAAAXgOupjW+RZxyZ0mEs6X8dz4Oa//LQfIKgc8YEqw5G9WhavFig0
        LcVGEy6U29Hb6+7kl+S/cuf5Uw==
X-Google-Smtp-Source: APXvYqwuEOoV5aCzLlGkVZlVwso0Ano0flwVy5rE6QbRo8vNmNb2jFk7drTtQSJedQIw1NCPZ+6geA==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr3948924wmc.164.1573063784694;
        Wed, 06 Nov 2019 10:09:44 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id r19sm29208269wrr.47.2019.11.06.10.09.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 10:09:43 -0800 (PST)
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
 <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
 <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
Date:   Wed, 6 Nov 2019 18:09:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 05/11/2019 19:08, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 4:55 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 29/10/2019 20:47, Rob Herring wrote:
>>> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
>>>>> Its Phandle.
>>>>>
>>>>> something like this is okay?
>>>>>
>>>>> slim-ifc-dev:
>>>>>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>>>>
>>>> Sorry this should not be an array, so something like this:
>>>>
>>>>      slim-ifc-dev:
>>>>        description: SLIMBus Interface device phandle
>>>
>>> You're just spelling out the abbreviated name. I can do that much.
>>> What is 'SLIMBus Interface device'?
>>
>> Each SLIMBus Component contains one Interface Device. Which is
>> responsible for Monitoring and reporting the status of component, Data
>> line to Data pin connection setup for SLIMBus streaming. Interface
>> device is enumerated just like any other slim device.
> 
> So a standard set of registers every slimbus device has? In hindsight,
> I would have made reg have 2 entries with both addresses. I guess that
> ship has sailed.

That will break SLIMBus bindings, Which is expecting one device per 
device node.

> 
> It seems strange you would need both "devices" described as separate
> nodes in DT.

Because they are two different devices on the SLIMBus Component.

> 
>>
>> We already have exactly same bindings for WCD9335 in upstream at:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42
>>
>>>
>>> Is it a standard SLIMBus property? If so, document it in the right
>>> place. If not, then needs a vendor prefix.
>>
>> "SLIMBus Interface Device" itself is documented in SLIMBus Specification.
>>
>> If I remember it correctly You suggested me to move to "slim-ifc-dev"
>> as this is part of SLIMBus Specification.
> 
> Probably so. If it is common, then document it in bindings/slimbus/bus.txt.
>
As we are dealing with audio codecs here, it might be that 
"slim-ifc-dev" is common across wcd9335 and wcd934x but not all devices 
on the SLIMBus Component would need handle to interface device. SLIMbus 
can also be used for control buses as well which might not need this.


> Then here, 'slim-ifc-dev: true' is sufficient. You can just assume we
> convert bus.txt to schema (or feel free to do that :) ).

We need phandle to the interface device so that we can program the 
streaming parameters for the SLIMBus Component.


--srini


> 
> Rob
> 
