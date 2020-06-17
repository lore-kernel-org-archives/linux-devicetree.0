Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BE6C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 011A720773
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMpHfk60"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFQOYc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 10:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgFQOYc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 10:24:32 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CD2C06174E;
        Wed, 17 Jun 2020 07:24:31 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i3so3123560ljg.3;
        Wed, 17 Jun 2020 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+uuW3XuUjCqQI83FzYAOm74SLNTbDWiGUIvyPNntZ2M=;
        b=bMpHfk60dzJbqmZV/8yd7GuRoMbN6UItkQW6RXpx1vsLmJxAv+uIpu8oAvKYd7t79s
         T2HNVu+UM1cDyQldj+f85wCT+VB1oNCo7YwI1sMwkB+vWGIVaxo+TY/bfoO2RPmYddYq
         UurrtQ/aeYVaaa1zryLHwe//x96TMfg/8GNGWxZdJMXFMFDrxGtv8M+1Z9W//Q5eLJe0
         7AhI0+qFQJG8U9XS8kv7OSK8iuX97Zx6mcAEbHMa2eC9zThLRlsy9QLQHWp/OffKlt0k
         Lvbb6DFTuF7rOlpWJQKjXx6I3I3/YO3ND2jLIYI0k5HWzoYqEEH+so08rwDMUYFxspiM
         cppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+uuW3XuUjCqQI83FzYAOm74SLNTbDWiGUIvyPNntZ2M=;
        b=od7HjOLHycHM8Armr+n9fuuOxRskOZRcLhBBLEB1HdLVpcpr+2bb835XcUMCTy3s1m
         hCeKMLG2A2DuHnH16wlSU8TCx89CXBfTUupuZbbR1O1h7q5wQkf/5PwrgnES2WKnD5Rn
         3X/nuqlmLaGrFwWZIGqnLnjDOpSmHF2T91wXwj8vSWJiTVsYGjrc0MzTi++1pApLvgmd
         X7HbyrHg0II5dPFzOjd7+/E+Y7gTovWesAUdq0dB3R72FpdERB3kuDBuTlw+2cONRzEz
         OCHHvEkUEPFMaZF1XCukru5UZ6fyheaFIXnWFLeCnkTgl0Hvk205d8Wjb2QN1wxINdqj
         624Q==
X-Gm-Message-State: AOAM533JYwZdrubIrGk4wSAerNtkq9Ek40lKfJLWa1JdvR6hMhue/t1f
        S4jSvnLBLnOZ1CoIEWlT/GIeoPvs
X-Google-Smtp-Source: ABdhPJy4sUHxaqMAvkjuxUH6oAbxC1841BzB9UobjSJpF4NBYdIaZe7jCUHyosZkK3lDzOyWuskH3g==
X-Received: by 2002:a05:651c:1064:: with SMTP id y4mr4493062ljm.180.1592403869018;
        Wed, 17 Jun 2020 07:24:29 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id y3sm13220ljk.39.2020.06.17.07.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 07:24:28 -0700 (PDT)
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
 <20200617141706.GC3536291@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
Date:   Wed, 17 Jun 2020 17:24:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200617141706.GC3536291@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

17.06.2020 17:17, Thierry Reding пишет:
> On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
>> 12.06.2020 17:18, Thierry Reding пишет:
>> ...
>>> +patternProperties:
>>> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
>>> +  "^gpios(-[a-zA-Z0-9-]+)?$":
>>> +    type: object
>>> +    required:
>>> +      - gpio-hog
>>
>> There are two problems here:
>>
>> 1. This naming limitation didn't exist before this patch, so it's not a
>> part of the conversion.
>>
>> 2. GPIO core uses the node's name for the hog's name. Hence by imposing
>> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
>> which doesn't make much sense to me.
>>
>> Please explain the rationale of this change.
> 
> We could probably do without this if we didn't enforce additional or
> unevaluated properties. Because if we don't match on a pattern here then
> all of those GPIO hog nodes would show up as "extra" properties and they
> are currently not allowed. If we do allow them, then we can drop this,
> but we then have no way to fail validation for whatever else somebody
> might want to put into these device tree nodes.
> 
> That said, I think additionalProperties can be a schema in itself, so
> maybe there's a way to only allow additional properties if they are of
> type object and have a gpio-hog property. I'll look into that.

Isn't it possible to validate the additional properties by checking what
properties they have?

For example, if sub-node has a gpio-hog property then this sub-node is
okay, otherwise fail.
