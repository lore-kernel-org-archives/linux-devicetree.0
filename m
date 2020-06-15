Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA5AC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 10:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B655E20679
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 10:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yFjJXa0X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbgFOKoj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 06:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFOKoi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 06:44:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6E0C05BD43
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 03:44:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id j198so13827292wmj.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ApfEnyPC+yVUUFu3a6QZVNs6AfaJLADlLRYk8AqGh+Y=;
        b=yFjJXa0XP2kTJy4rtuzLf41qneTqL3ch5gdthCplaIGzDZHPqZ4+5smInUQcgy8xBN
         grtZ3Z/LJz4HAwCABRB2LFtwqcQO7Ep3zwDNBWeSNKgWG2dEPM4IQ6zWozHkALjQDW3Z
         cxJMZdeYdnK4kIEWHpLT+XIWiISrbOq0j1Urrp2HkRwKySdj6ZidLrtb0Kmsp1yAmVKs
         l4th8DtWv1p3Q2k15vyjVAoBBisHETTlBShPBdW37/S78N0buqf9xxVz33ERkJXfgnsC
         RBEXzHbh/8kpEGhbiGwNnHmzDYyqUsOzbkiseMcJ7atIwUX8FsTsmz1G00fQjIdAYlnL
         B8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ApfEnyPC+yVUUFu3a6QZVNs6AfaJLADlLRYk8AqGh+Y=;
        b=YGtz5qcevpdVm3kbp9B+w4DHQZQlwzILopLVbh7jJ0eXOieALYyO9SYIpmVrP+8yJO
         bne19ZQnktOE3t+f0+qbN2yB/w9CRPHiqLTguYhJEub0dSjnyMmw9ssbfUTIxH7Sh23v
         3GoRsXg5LoyVyZF5Oy637+em6jA5xf1CS4sqNteg1sakvji5syo15ysXVyDTrSJB9V/T
         QObcr/he/27VD9QNFonpHyGXJldm7+kV3YuzbYRnFV+B4O3kseEYZ8263M6j1ErZir52
         A7wm3vRaFYp5Kd0gMVMnKKx1f3ULFM2+508qfak6x7P0h4cxZjIbhvNNB9Lrxq/5T23P
         13rA==
X-Gm-Message-State: AOAM533RSL63LSVvwN4ppMT95Uqjnx2eJ0Yf0Fo7Y19Tc5+yA3kDeAzS
        z2/Oxu1aclPvmEb3w0vnNn2+8A==
X-Google-Smtp-Source: ABdhPJzQnjpq8TS/e6IeJqcJYo8oRb2zA9TKCNTNtpiyrWYgci+zXDR6fQkvawBZzGzwJ+vbVCUSVQ==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr12907814wmc.142.1592217877264;
        Mon, 15 Jun 2020 03:44:37 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c143sm32767994wmd.1.2020.06.15.03.44.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 03:44:36 -0700 (PDT)
Subject: Re: [RFC v2 2/3] drivers: nvmem: Add QTI qfprom-efuse support
To:     Doug Anderson <dianders@chromium.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, c_rbokka@codeaurora.org,
        mkurumel@codeaurora.org
References: <1591868882-16553-1-git-send-email-rbokka@codeaurora.org>
 <1591868882-16553-3-git-send-email-rbokka@codeaurora.org>
 <CAD=FV=XSfMPehyCLB25hct+GE8JtU=5J=04KyU4AoHfg9cs50A@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <472dc7d7-2e23-0f1a-8e1a-839c4c9c1f7a@linaro.org>
Date:   Mon, 15 Jun 2020 11:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XSfMPehyCLB25hct+GE8JtU=5J=04KyU4AoHfg9cs50A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 13/06/2020 21:33, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 11, 2020 at 2:49 AM Ravi Kumar Bokka <rbokka@codeaurora.org> wrote:
>>
>> This patch adds support for QTI qfprom-efuse controller. This driver can
>> access the raw qfprom regions for fuse blowing.
>>
>> The current existed qfprom driver is only supports for cpufreq, thermal sensors
>> drivers by read out calibration data, speed bins..etc which is stored
>> by qfprom efuses.
>>
>> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
>> ---
> 
> It makes all your code reviewers much happier (and much more likely to
> take the time to review your patches) if you include a changelog with
> what changed from one version to the next.  If you would like some
> help maintaining such a thing, might I suggest "patman":
> 
> https://gitlab.denx.de/u-boot/u-boot/-/blob/master/tools/patman/README
> 
> ...pay no mind that it's hosted in the U-Boot repo--it's really quite
> a great tool.
> 
> 
>>   drivers/nvmem/Kconfig  |   1 +
>>   drivers/nvmem/qfprom.c | 405 ++++++++++++++++++++++++++++++++++++++++++++++---
>>   2 files changed, 385 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index d7b7f6d..623d59e 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -117,6 +117,7 @@ config QCOM_QFPROM
>>          help
>>            Say y here to enable QFPROM support. The QFPROM provides access
>>            functions for QFPROM data to rest of the drivers via nvmem interface.
>> +         And this driver provides access QTI qfprom efuse via nvmem interface.
> 
> I'm not sure it was necessary to add that line, but I won't object if
> you/others really like it.
> 

NAK from my side!

> 
>>            This driver can also be built as a module. If so, the module
>>            will be called nvmem_qfprom.
>> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
>> index 8a91717..312318c 100644
>> --- a/drivers/nvmem/qfprom.c
>> +++ b/drivers/nvmem/qfprom.c
> 
> You've still mostly not addressed most of the review feedback I've now
> given you 3 times.  Rather than repeating comments, I have simply
> provided a patch that makes the driver into a state that I'm happy
> with:
> 
> https://crrev.com/c/2244932
> 
> Rough summary:
> 
> * There should be no reason to provide "reset" values for things.  For
> anything that you change for fuse blowing, just save and restore
> after.
> 
> * Use the major/minor version read from 0x6000 to pick the parameters
> to use.  Please double-check that I got this right.
> 
> * Reading should still read "corrected", not "raw".  Added a sysfs
> knob to allow you to read "raw", though.

We could create an additional nvmem read-only provider in future if 
required to read raw!.

> 
> * Simplified the SoC data structure.
> 
> * No need for quite so many levels of abstraction for setting clocks /
> regulator.
> 
> * Don't set regulator voltage.  Rely on device tree to make sure it's right.
> 
> * Properly undo things in the case of failure.
> 
> * Don't just keep enabling the regulator over and over again.
> 
> * Enable / disable the clock each time; now we don't need a .remove
> function and yet we still don't leave the clock enabled/prepared.
> 
> * Polling every 100 us but timing out in 10 us didn't make sense.
> Swap those.  Also no reason for 100 us to be SoC specific.
> 
> * No need for reg-names.
> 
> * We shouldn't be creating two separate nvmem devices.
> 
> 
> In general I'm happy to post my series to the list myself to get
> review feedback.  For now I'm expecting that you can squash my changes
> in and send the next version.
> 
> 
> -Doug
> 
