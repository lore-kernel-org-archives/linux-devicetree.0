Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F9EC43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:28:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 002C221783
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:28:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=essensium-com.20150623.gappssmtp.com header.i=@essensium-com.20150623.gappssmtp.com header.b="rUqS5Mhs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfKMN2O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 08:28:14 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:53474 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfKMN2O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 08:28:14 -0500
Received: by mail-wm1-f47.google.com with SMTP id u18so2005761wmc.3
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 05:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=N1nsfiQD+VApG26stZWWDxLm7wGBXZ3wkt9ZoXLGf50=;
        b=rUqS5Mhsmm+pha/vr9hbkjQHwDxbECGu/HrbYVLMfdy56YgzoUVPIkSiqXJ9V2WDhQ
         TxcJAUqTB8/YuLU8T0DoEdYuHmckwaYhlL49fUFhrcI9RVV00zByuO0aAQpvKAkrkfxE
         IMNc+hYG565A9XfuvJSSMZ8aZs9L7xIC1GQgaDGvx8y2PK/BhfAXzVnuf7kRa56uXmkt
         3NfW+r1kVJ2vbWTmwQTGjlh//MICCyRbVsH06tG1aZcR4VTFzudXE075qd6E8MWveDWJ
         mAoVnqZ0EuV2iSqPG3AGThJ5hXXlbhB7AZDnAfGTW46BRNeM7TOH2JuhR7fXvIL0+7s9
         G34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=N1nsfiQD+VApG26stZWWDxLm7wGBXZ3wkt9ZoXLGf50=;
        b=MyK8LM7jc2+ifx6YaBmuSv4Ndn0NN+HiScQtPg9KbQ3HSrhrCszYKmayhQXo+9u2AX
         vJKqpjUrPSWPVWb4zm7KS2STP1KupHf/oxFK3Up3wwpzfhMqnalJ+QfI34PUpF3JbtW5
         FXJ+bytxEF7tezPtVO68TN5fpHxt8AqKj8TpgU4wsSi0hX4sBzSDRPDSLciseWkQGBdZ
         88RYOWn/nUK6qiEWAv1eUm7Dl/oBF9QBDFCUuN+KTRYzcxXtcLxMtHiRnbnaA58W1XgM
         5WtWhhJXCswSpWxbQLWhQ6VUE6XxdNF2ea+FRAE1B0Y6MFNRucjQI+rZNZ6tnL1Rp6vT
         p1BA==
X-Gm-Message-State: APjAAAWUvhxmSpLX8udhTUIAgbDeKbFTZkvUZQgbTcd06QaOtTOXpAbt
        sSH5RchpO4Wk3KpYWzpPPXtzB4mZDCI=
X-Google-Smtp-Source: APXvYqyWYu5hlqP2+2590fa7y+C43fpSZE7tGcK7pfXNubEE2fPVDajpz2JhtN6MpPgPHadCOsBdSQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id e9mr2692273wma.177.1573651690013;
        Wed, 13 Nov 2019 05:28:10 -0800 (PST)
Received: from [192.168.1.37] (230.120-247-81.adsl-dyn.isp.belgacom.be. [81.247.120.230])
        by smtp.gmail.com with ESMTPSA id p25sm2192681wma.20.2019.11.13.05.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2019 05:28:09 -0800 (PST)
From:   Couret Charles-Antoine <charles-antoine.couret@essensium.com>
Subject: Questions about your advice for PCM9211 driver
To:     robh@kernel.org, devicetree@vger.kernel.org
Message-ID: <e9b558d5-2ff8-e3fb-deb3-f40d91299485@essensium.com>
Date:   Wed, 13 Nov 2019 14:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob (and everyone),

I'm working on upstreaming PCM9211 driver which was already submitted in 
the past. But based on your advice I'm not totally sure how to improve 
this driver. FYI the thread was 
https://www.spinics.net/lists/alsa-devel/msg63273.html

In fact I don't understand what is the best design for the pinmuxing 
part. You mentioned there are common bindings to deal with it. But I 
found only "pinctrl-single" which is used for one pin = one register. 
That's not the case for this device. Do you have something else in mind?

So from my understanding the only way is to develop a new pinctrl driver 
and convert PCM9211 driver to a MFD to handle pinctrl + sound soc. From 
my point of view it seems a bit overkill. Or something more generic must 
be provided like generic pinctrl which can match PCM9211 needs and 
eventually other devices.


Thank you in advance and I hope you can clarify the situation for me.

Regards,

Charles-Antoine

