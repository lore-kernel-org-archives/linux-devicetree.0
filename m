Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD0C33C99
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 10:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E34E20678
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 10:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taUrxPZT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgAGKRI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 05:17:08 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38064 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbgAGKRI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 05:17:08 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so53274390wrh.5
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 02:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fwzh5B1nXt/sAEFF4P6VGTRMD6n6bfO44NTRH3RJWZ4=;
        b=taUrxPZTGVzzuvL7T0lvDMjjDK8lWEumcMo06rflm+YVYxsAK4JOpHgrsuAfS9cWXI
         G41MsZHjP/iu0AGNtOm4RB+dnO/BlbvD6PqTU2RzKIaoKHNOTimtY1JJkFNR4ViAi44p
         bQfKDKrRFnorlrTOwWLpMu4a12R/xRFUrN6hUtUHkzTgobNonMUqEtmROPxp0Y7ldrp7
         P8SKMT8N1cWBfXuQWuAhAXgcL+n/MeAI86J59ta9lgyoQ0GiYcuCF0pDGqp3O5kR7WKY
         tU91FqNkCDxKwj/tG4ZzIzefo7Xul6TH6UYN1zmSjtQupZzVTC06qKPvsKuD5VykiP/Y
         Ii6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fwzh5B1nXt/sAEFF4P6VGTRMD6n6bfO44NTRH3RJWZ4=;
        b=SzrmcQsalpI2+d6hKralIUjTXEJBa4rg0JfOzIwTsuA3sHbwTBn2xvdh/aBwdwtvSl
         /uTY6WbIfPDa2WgKZY3jt0xbPPTRPgl+ptXCjmR+r2hqRf1/Cb/f7HQprqzx+P8N0vGQ
         hfn1MdebMXaHEdH4S0JcPiki39MVcQQZwrf2fhtvGzMSI6pv3XShz1GYnW7r7WhsgINJ
         t8hAsZUo6TwUAE8EiVXRQtGIR7dsFMncVpJhP1C5TZ/3G8GyibQMGmAdxo+LOHEEcsYC
         vhPs7iC4f54IFt4aUDDWZzMwgSe9M7DCYkQaIoroqaqmrDlJQOmlbMum7rcqW/xNJXQ+
         lFLQ==
X-Gm-Message-State: APjAAAVee9+G7fgzAR7R881D0Xc08ol/DUDS8cmDKUPCSsP7ogyauHNA
        xMzzPmSmaOHeJlzy1PX39XY6Qw==
X-Google-Smtp-Source: APXvYqx96FNnTE7Wcke6NICz9bHsU0YLHTjGvRQKQMsnCyEMLoYLSpwbGJRwJxjIiek++9x0xqV8nQ==
X-Received: by 2002:a05:6000:149:: with SMTP id r9mr99505691wrx.147.1578392226736;
        Tue, 07 Jan 2020 02:17:06 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id b17sm73177393wrx.15.2020.01.07.02.17.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 02:17:05 -0800 (PST)
Subject: Re: [PATCH v6 08/11] dt-bindings: gpio: wcd934x: Add bindings for
 gpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-9-srinivas.kandagatla@linaro.org>
 <CACRpkdYc-kB4Kx690FnU=3CwnjFdQhdxofGguFAAs_j==C=nmQ@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1a027d45-6082-1697-ccf2-4a5be9a3591a@linaro.org>
Date:   Tue, 7 Jan 2020 10:17:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYc-kB4Kx690FnU=3CwnjFdQhdxofGguFAAs_j==C=nmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 07/01/2020 09:47, Linus Walleij wrote:
> On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
>> gpio controller to control 5 gpios on the chip. This patch adds
>> required device tree bindings for it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Tell me if you want me to merge this patch through the GPIO tree.
> 
Yes that would be great!. gpio bindings and gpio driver can go via gpio 
tree as there is no compile time dependency. Also Mark has already 
merged the audio codec side of it.

I will address the comments on the driver and send new version of these 
2 patches.

Thanks,
srini
> Yours,
> Linus Walleij
> 
