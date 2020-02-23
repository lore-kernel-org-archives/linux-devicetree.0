Return-Path: <SRS0=8u50=4L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A530FC35666
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 11:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67DD120656
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 11:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GZEnATEb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgBWL31 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Feb 2020 06:29:27 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56136 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgBWL31 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Feb 2020 06:29:27 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so6198900wmj.5
        for <devicetree@vger.kernel.org>; Sun, 23 Feb 2020 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:date:message-id:in-reply-to:references:user-agent
         :subject:mime-version:content-transfer-encoding;
        bh=Wsmvetnj/uRqidICErzZezRvkzyJsUsUIsU21dU7djU=;
        b=GZEnATEbiLPG2xlP1VtmI9eGW0L75Tjcio9m/sk7rU5YfD43fRdeoXb+g3oH9xuej9
         HdOAjrjAF/CgPwXQAZay9hQhUoKg2DOICY9riwHUIz1WFsRfhL/d3rR7RA+1jsQbJCqk
         HeKVxF410HwT+IKuUdBOa81l1QrUtp53kbKSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:subject:mime-version
         :content-transfer-encoding;
        bh=Wsmvetnj/uRqidICErzZezRvkzyJsUsUIsU21dU7djU=;
        b=n5vEnfQgpWwFnVGC1Zy65lePtMfloF6Ak/4NMsp28MStOD6z15syqeNpF31hRJ5oxw
         x9ZIRQ9oqIPzu/W6GUnupEpLvHRiSBGk6t+EYzQFvOnZLJ9cWG46qSuYL5V6alQnsaCW
         Lbgxk4OH7y8589mwe2Gw+h3TOuiUQoAlsu78vystszGXp/7X072A4zcXJusJwk7QvhCE
         rw1Bk3ch3qJn/Fo5SO7zy2vnLJXEi9EYIQ0vLEEPRRLx0Plm3D1KO9NqhgLmZYWeW2s1
         68Nt1rq5jz8XCvW/+YSfqKXhOg+4YAJ7lEhFkyZlpWv9uDfCGGaboUPXzIh9lprO/3sl
         HBFA==
X-Gm-Message-State: APjAAAXi2Hll4Z0RRvrzpeocbJrAzb1g1S4iSIymljGr7kgOeTb6OxCr
        eP0wDJCcMJ8UqhQSL2YsONT2Vw==
X-Google-Smtp-Source: APXvYqz6+9MPmpyo+ROixdyxqt/lfCR1xsPFagF33I0ML2XY9pDawBqPDq1xdZxReCF3AUcO3iuYFQ==
X-Received: by 2002:a1c:4383:: with SMTP id q125mr15905602wma.88.1582457364551;
        Sun, 23 Feb 2020 03:29:24 -0800 (PST)
Received: from [192.168.178.38] (f140230.upc-f.chello.nl. [80.56.140.230])
        by smtp.gmail.com with ESMTPSA id a135sm12328905wme.47.2020.02.23.03.29.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Feb 2020 03:29:23 -0800 (PST)
From:   Arend Van Spriel <arend.vanspriel@broadcom.com>
To:     =?UTF-8?B?T25kxZllaiBKaXJtYW4=?= <megous@megous.com>,
        "Chen-Yu Tsai" <wens@csie.org>
CC:     "linux-sunxi" <linux-sunxi@googlegroups.com>,
        Maxime Ripard <mripard@kernel.org>,
        Tomas Novotny <tomas@novotny.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Sun, 23 Feb 2020 12:29:21 +0100
Message-ID: <17071cf1268.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20200223105524.smp3p2quewp3ddop@core.my.home>
References: <20200222223154.221632-1-megous@megous.com>
 <20200222223154.221632-2-megous@megous.com>
 <CAGb2v67XwrYA8FLF9wpnngm9F-F9UV2m+rr+r3t+KUVv5-EMiw@mail.gmail.com>
 <CAGb2v66G5P_souwFHodO0_NYhWyQ+dGE4fbqLLK3qd9ue7Kk9g@mail.gmail.com>
 <20200223105524.smp3p2quewp3ddop@core.my.home>
User-Agent: AquaMail/1.23.0-1556 (build: 102300002)
Subject: Re: [linux-sunxi] [PATCH 1/4] ARM: dts: sun8i-a83t-tbs-a711: OOB WiFi interrupt doesn't work
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On February 23, 2020 11:55:25 AM Ondřej Jirman <megous@megous.com> wrote:

> Hello,
>
> On Sun, Feb 23, 2020 at 12:03:46PM +0800, Chen-Yu Tsai wrote:
>> On Sun, Feb 23, 2020 at 11:26 AM Chen-Yu Tsai <wens@csie.org> wrote:
>>>
>>> Hi,
>>>
>>>
>>> On Sun, Feb 23, 2020 at 6:32 AM Ondrej Jirman <megous@megous.com> wrote:
>>>>
>>>> It just causes a constant rate of 5000 interrupts per second for both
>>>> GPIO and MMC, even if nothing is happening. Rely on in-band interrupts
>>>> instead.
>>>>
>>>> Fixes: 0e23372080def7bb ("arm: dts: sun8i: Add the TBS A711 tablet devicetree")
>>>> Signed-off-by: Ondrej Jirman <megous@megous.com>
>>>
>>> What WiFi chip/module does this use? It might be worth asking Broadcom
>>> people to help with this and fix the driver.
>>
>> Based on the comments in the device tree file, it uses an AP6210, which
>> is a BCM43362 inside for SDIO-based WiFi. There is a recent fix in 5.6-rc1
>> for this,
>>
>> 8c8e60fb86a9 brcmfmac: sdio: Fix OOB interrupt initialization on brcm43362
>>
>> which seems to fix things for me. Could you try it on your end?
>
> I can confirm that it works as you say (on linus/master). 5.5 still doesn't 
> have
> the patch, so it's broken there, which confused me I guess.

Hi Ondrej,

I have seen emails from GregKH including this patch in 5.5 stable so it 
will also land there eventually.

Regards,
Arend

>
> Please ignore this patch.
>
> thank you,
> Ondrej
>
>> ChenYu
>>
>>
>>> ChenYu
>>>
>>>> ---
>>>> arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 3 ---
>>>> 1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts 
>>>> b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
>>>> index 2fd31a0a0b344..ee5ce3556b2ad 100644
>>>> --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
>>>> +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
>>>> @@ -214,9 +214,6 @@ &mmc1 {
>>>>    brcmf: wifi@1 {
>>>>            reg = <1>;
>>>>            compatible = "brcm,bcm4329-fmac";
>>>> -               interrupt-parent = <&r_pio>;
>>>> -               interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 WL_WAKE_UP */
>>>> -               interrupt-names = "host-wake";
>>>>    };
>>>> };
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>> --
>>>> You received this message because you are subscribed to the Google Groups 
>>>> "linux-sunxi" group.
>>>> To unsubscribe from this group and stop receiving emails from it, send an 
>>>> email to linux-sunxi+unsubscribe@googlegroups.com.
>>>> To view this discussion on the web, visit 
>>>> https://groups.google.com/d/msgid/linux-sunxi/20200222223154.221632-2-megous%40megous.com.



