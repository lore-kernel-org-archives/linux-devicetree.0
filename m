Return-Path: <SRS0=eKwZ=3A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D970C33CA4
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jan 2020 17:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58C5920866
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jan 2020 17:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k81VG9u2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730681AbgAKRqh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jan 2020 12:46:37 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33041 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730683AbgAKRqh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Jan 2020 12:46:37 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so3911868lfl.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jan 2020 09:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qFxZxIBjVPGHT4QdW7YVQeQ/1Ejq4ndiF3qT3HqOqtA=;
        b=k81VG9u2Fb4PxriTEm9rW5yrC4pkqURrQaaxHj0h8eYd60WT1LaMRv61DKAU06kXoi
         2qQHoeeE2oTk/Ea+vHUp0ewyuIK89nwdGrooWzt5W65a+9ODQbpHvSmaSZJ1xTacohBb
         2FsEG1spzmfVp1/g7dXG90KbbiCo2CsRGsRNwP8dWAPea3AMek1CfEzHAVrSSoFq9TDr
         kkZY3smhV+UYy49Pl+1Kt0LJWi0GKq7VwE329y+0K9Ae1/yHNPz1KOj38YmfPi+z6ETa
         be2jhnyB4RxM0IUJKuyTwDVrw2RvzWh/H9nXhr30P0x3i5IDYF2OOyrNChYvnzT0talW
         jceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qFxZxIBjVPGHT4QdW7YVQeQ/1Ejq4ndiF3qT3HqOqtA=;
        b=H5/LMJ2hR2psa2WZPrFXjUowSDCx6jLNa8gj/gkVKIPfF3MMtisdtM0rJiFJmICMe9
         v/bSf8+fU7P8GNwDdG0p/UZvlvdF96Fi+rm/J0M0F0j2H8fuMtVTwY8cyUBlC0Vg+xRP
         clxb58DLnNBM3o6AHBizzMATCG0MqucCLJXimZ39RyXrHw1L/fKAUQn9yBG55/W7784c
         k7xp+s7t6v1pXUoB7GGmy+pjZETsk5iEtdIkh9zH/LynqPkjKhk41k6qP12IrtRQaOUN
         /LodgAjKJvw2QVrAaxCIutgtEzMA713OHM6utWmqzo1mt+X2t+7Xr9pGAM1mZn/4nDiQ
         Ne/g==
X-Gm-Message-State: APjAAAWbtcuEmc5pDNzfDLns1wIuVWsL3xE5koCB8OKW/X4M/77lxkAU
        d5MIq2ulTxu+jl2VpYUJ8cr40kcKiYk=
X-Google-Smtp-Source: APXvYqwObFERCqedOglKM8N8BlxmMPlOWqkW2EtxhBCbT2+xn5dWgrsG9TVkB5cMescaOCwDb2x6dQ==
X-Received: by 2002:a19:491a:: with SMTP id w26mr5654165lfa.98.1578764795477;
        Sat, 11 Jan 2020 09:46:35 -0800 (PST)
Received: from [192.168.118.123] (95-28-65-22.broadband.corbina.ru. [95.28.65.22])
        by smtp.gmail.com with ESMTPSA id t10sm2884788lji.61.2020.01.11.09.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2020 09:46:34 -0800 (PST)
Subject: Re: [PATCH v3 0/2] Add IMX219 CMOS image sensor support
To:     Ezequiel Garcia <ezequiel@collabora.com>, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        peter.griffin@linaro.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
References: <20200110200915.22575-1-andrey.konovalov@linaro.org>
 <b1ce520494275ea2b9bd63af6ef12e9e8ac3c122.camel@collabora.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <5ffcdaad-159b-795b-2029-f3009d0249cf@linaro.org>
Date:   Sat, 11 Jan 2020 20:46:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b1ce520494275ea2b9bd63af6ef12e9e8ac3c122.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ezequiel,

On 11.01.2020 07:45, Ezequiel Garcia wrote:
> Hello Andrey,
> 
> Thanks for submitting a new version.
> 
> On Fri, 2020-01-10 at 23:09 +0300, Andrey Konovalov wrote:
>> This patchset adds support for IMX219 CMOS image sensor from Sony.
>> Sony IMX219 is an 8MPix, 1/4.0-inch CMOS active pixel digital image sensor
>> with an active array size of 3280H x 2464V. It is programmable through
>> I2C interface. Image data are sent through MIPI CSI-2, which can be configured
>> as either 2 or 4 data lanes, but this driver currently only supports 2 lanes.
>> The currently supported resolutions are 3280x2464 @ 15fps, 1920x1080 @ 30fps
>> (cropped FOV), and 1640x1232 (2x2 binned) @ 30fps.
>>
>> The driver has been tested with Raspberry Pi Camera Module v2 connected to
>> Raspberry Pi Zero W.
>>
>> Changes since v2 [1]:
>>
>> dt-bindings:
>>    - "clock-names" property removed
>>    - "xclr-gpios" property renamed to "reset-gpios"
>>    - the camera-clk mode moved out of sensor device node
>>    - "clock-lanes" property removed (the sensor doesn't support lane reordering)
>>    - "clock-noncontinuous" description made more clear (thanks Sakari)
>>    - "data-lanes" property reworked: it is now optional, and if it is not
>>      present the driver should assume four-lane operation. For two-lane
>>      operation (the only mode supported by the current driver) this property
>>      must be present and set to <1 2>
>>
>> imx219 sensor driver:
>>    - "xclr-gpios" property renamed to "reset-gpios", the corresponding
>>      struct gpio_desc field in the imx219 structure is renamed to reset_gpio
>>    - in the driver probe() a test to check that the number of CSI-2 data lanes
>>      is supported by the driver was added
>>    - devm_clk_get() is now called with NULL as the 2nd argument, as there is
>>      just single clock, and there is no need to use clock ID
>>    - error messages are added when the driver fails to get regulators, to init
>>      media entity pads, or to register sensor sub-device
>>
> 
> It seems you missed Sakari's review comments on v2,
> see https://patchwork.linuxtv.org/patch/60925/#114407

Hm.. Indeed. I missed Sakari's comments on the imx219.c v2 somehow.
I'll post an updated patchset shortly.

Thanks!
Andrey

> Thanks!
> Eze
> 
> 
> 
