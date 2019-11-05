Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CBFC17460
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 13:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B3A021882
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 13:27:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFsnwvZS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388918AbfKEN1t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 08:27:49 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38085 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387784AbfKEN1t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 08:27:49 -0500
Received: by mail-wm1-f67.google.com with SMTP id z19so15956380wmk.3
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 05:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hB3wQvRGrj1ZRhAhArvMifryRxQS5+RNbsqGlKhKgzk=;
        b=VFsnwvZSNKJMSeyhPMRpdB4ZkZ6AYmUUNRhN4Qn+9qfNHNcC6ktaTqN6hlQY8z30qG
         qlF43veqqmkNVZy9CfnyD0A8yBtPAxgvhX1uh+3IhiKA3TksGJ5bYEwJwqDUAyp6qd40
         yRDtgCQeFEhnOzGV3i/z3lUG99341c2z6YYWi7kYJ07qZt7eWSO2fWXgIlifnK0ZclNb
         mBi7qt4Tj1sUxRWtaFORfD2h4hQSbwxU+GQjWBt/F0ItPYmf3/n1RcS4QH+YKJIMMa0u
         WyWxnIrPBBJgV5MVCJsi74KqKHS/skjAwXoKuvF+MVMxXPjU7B9rzIHuFmjaw5OagwRA
         Aoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hB3wQvRGrj1ZRhAhArvMifryRxQS5+RNbsqGlKhKgzk=;
        b=hTFffzdjSbbQThhEeLDR0IuzbxD1xTnXT5FDIQyFsdscsrdbi4njHXbQU9VAp8PXNt
         TSNX5vqLvgxNa/RqF/XF0xM7nz/3YUuNCxFVI34LMxPXX27Rxcpycdo3uJW7oxyVqVek
         pVuMzQJiZp8Cuf25ou+j4o2he+PEXI4e2DZy3kv5oSTlgwCyoHrG/f4HRPD4QFeN7bs0
         BnILckN1gzOs7dhlfQfyhx1yj/fH9Tt+FZ6pyxVJUmpCIWkHCf47enbPuP+VNhWSpYu9
         2W3+VSA4gpFFnbJA+dEuCo/f18vLLxhfbkUmiVY+Csshe3A7Ml98rcxqEtKwiAsclUeY
         tghw==
X-Gm-Message-State: APjAAAUoc1Tnqb6h9jUxBbrZsEofqSJ2313BC5xXu2tN6TeC+OdOEBRf
        uyPbFTdxc3NF9i2osjpjOzWQzQ==
X-Google-Smtp-Source: APXvYqylIjqSxRwVDLHiilqgwmzoUpkTemPlTon9ahW0PhuOvXEZCINEZ4digiAahGcNH2/GlE6RAg==
X-Received: by 2002:a1c:411:: with SMTP id 17mr3955910wme.122.1572960467354;
        Tue, 05 Nov 2019 05:27:47 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id m25sm995475wmi.46.2019.11.05.05.27.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 05:27:46 -0800 (PST)
Subject: Re: [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add bindings
 for gpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
 <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
 <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
 <CACRpkda2CdbPe7jsomZSxdJ1wE65OmNYDsZNj1OmfzdvG4kWng@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <502c64dd-a249-bb2c-7bc5-8c66fa66be35@linaro.org>
Date:   Tue, 5 Nov 2019 13:27:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda2CdbPe7jsomZSxdJ1wE65OmNYDsZNj1OmfzdvG4kWng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 05/11/2019 13:25, Linus Walleij wrote:
> On Mon, Nov 4, 2019 at 10:35 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org>  wrote:
> 
>> This controller just has Output enable bits, No pin control properties.
>>
>> As you suggested I can move this to drivers/gpio in next version.
> OK perfect, thanks!
> 
> NB: this probably also affects the compatible-string which contains
> "pinctrl*" right?
Yes, I will suffix it with "-gpio" instead.

thanks,
srini
