Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1720AC17445
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 12:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E253A21872
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 12:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hlskkMzH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfKKMsd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 07:48:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55393 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbfKKMsc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 07:48:32 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so13155378wmb.5
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 04:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LueFggV2mFZxu+VUXQPu24NK+wGUjIR5etrw8L3OYL8=;
        b=hlskkMzHuS9VjPDw7su1MuaSy4UKB/cuCbdV3y3X9IZv5WR6cpIayQK4ozvCLeGzMP
         ihs4CctijXAgpFBbqCCCN88t8nbiXnFeeeAvBYOQ11PHTVFGxHhmyuBJFe+3+xfA77RR
         FHMtHBCbAWQFWWYSsk13lR3NUuyoPmXwtuRCK+ThfsfC7YAkwPLKAGbU7yaUFEuFBLKU
         5SMWdckdwHtRdm3Vuam+QOjQ0Zdwico2zXB8uGOz5bPZpVAXME3tFReUi4L9NiGZZJ/V
         iaiEBAg21L0Ve1eJXYo645eZ32j/nTElMcxPkX0QUSbaihWx7grcK4EG7PX3WJEXbsoj
         Yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LueFggV2mFZxu+VUXQPu24NK+wGUjIR5etrw8L3OYL8=;
        b=gfgxPM2oASt2t+W+0C/+rGifTNbS40W9Btk4h1Jq6Z/QTxPjSrMd23EWMk/aZKT9mA
         wlPRKWJqwAg2xzu0pDFTpMTYQj4PSR41e48nNfimIF98SRl05RxXk5xaathU1TXdkJpm
         9aiayR6m+jfwOp9oxT4Z/WYXs6PAQ/NNEOF7eqILi2EWLvHw6eIlGFexEGOA5GGRoc2l
         MjhEfhA/ujcpTQEl4Lvvi1gTNHDV05GznXJ5PB4VDjGL8/r4ohI1XWmH4GbzE5Yx1lu2
         QbOwLU6SB+TJM1bl4s+sdqBjVd/fl/upzrnNDjUaBa/+Xw4zEp287GXuYeWon4VeW3q6
         tIYg==
X-Gm-Message-State: APjAAAXVyRkbHPr/LtZQ4hpkZ46fC+I/WGP2xxz/0sbJw1werYyW0r8B
        ++hBmYz2IAroAHbYHijgdXiSGA==
X-Google-Smtp-Source: APXvYqzR0+iSF3vPdqISM3JWy3ouLqoSAfFd0Vk+1PYXQknCvCZY112q3J7ZdtQDU3yTPdYF3TEp1A==
X-Received: by 2002:a7b:c858:: with SMTP id c24mr21422418wml.174.1573476508859;
        Mon, 11 Nov 2019 04:48:28 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id w81sm23284941wmg.5.2019.11.11.04.48.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 04:48:28 -0800 (PST)
Subject: Re: [PATCH v3 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
To:     Lee Jones <lee.jones@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-3-srinivas.kandagatla@linaro.org>
 <20191111111836.GH3218@dell>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ce2244ac-2219-3cc0-8ad6-7491295fbbef@linaro.org>
Date:   Mon, 11 Nov 2019 12:48:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191111111836.GH3218@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 11/11/2019 11:18, Lee Jones wrote:
> On Tue, 29 Oct 2019, Srinivas Kandagatla wrote:
> 
>> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
>>
>> This codec has integrated SoundWire controller, pin controller and
>> interrupt controller.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
> 
> No changelog?

I have done that in cover letter.
If you prefer it here, I can add that in next version.

> 
>>   drivers/mfd/Kconfig                   |  12 +
>>   drivers/mfd/Makefile                  |   1 +
>>   drivers/mfd/wcd934x.c                 | 306 +++++++++++++++
>>   include/linux/mfd/wcd934x/registers.h | 529 ++++++++++++++++++++++++++
>>   include/linux/mfd/wcd934x/wcd934x.h   |  31 ++
>>   5 files changed, 879 insertions(+)
>>   create mode 100644 drivers/mfd/wcd934x.c
>>   create mode 100644 include/linux/mfd/wcd934x/registers.h
>>   create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
> 
> This driver reads much better now. Thanks for making the changes.
> 
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index ae24d3ea68ea..9fe7e54b13bf 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1967,6 +1967,18 @@ config MFD_STMFX
>>   	  additional drivers must be enabled in order to use the functionality
>>   	  of the device.
>>   
>> +config MFD_WCD934X
>> +	tristate "Support for WCD9340/WCD9341 Codec"
>> +	depends on SLIMBUS
>> +	select REGMAP
>> +	select REGMAP_SLIMBUS
>> +	select REGMAP_IRQ
>> +	select MFD_CORE
>> +	help
>> +	  Support for the Qualcomm WCD9340/WCD9341 Codec.
>> +	  This driver provides common support wcd934x audio codec and its
>> +	  associated Pin Controller, Soundwire Controller and Audio codec.
> 
> Your capitalisation of devices is all over the place in both your help
> section and in the commit message. Either capitalise them all or none
> of them. Personally I would prefer all, rather than none. What ever
> you choose, please be consistent.
> 
> Same for "wcd934x", this should read "WCD934x" in all comments and the
> help.

I agree, will fix it along with other Nits you suggested.


[...]
>> +static void wcd934x_slim_remove(struct slim_device *sdev)
>> +{
>> +	struct wcd934x_ddata *ddata = dev_get_drvdata(&sdev->dev);
>> +
>> +	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
>> +	mfd_remove_devices(&sdev->dev);
>> +	kfree(ddata);
>> +}
>> +
>> +static const struct slim_device_id wcd934x_slim_id[] = {
>> +	{ SLIM_MANF_ID_QCOM, SLIM_PROD_CODE_WCD9340, 0x1, 0x0 },
> 
> What do the last parameters mean? Might be better to define them.

This is Instance ID and Device ID of SLIMBus enumeration address.


> 
>> +	{}
>> +};
> 
> [...]
> 
