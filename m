Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C54C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 08:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0F20215F1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 08:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GudKFDVk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfLBICI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 03:02:08 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38207 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfLBICI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 03:02:08 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so4293157wrh.5
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 00:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eObgtd5YnXMirZPt7QMUEmAc3hSdu9SksehJdyatM0s=;
        b=GudKFDVkIXgVvSEc21ZdU47PmDzbC+AedL8FhZIDDQ2X3zRURqR11cL9cNIOewQGn9
         8Fs1cpG8fp/vW06dxPy88jXNqoTCLaGxLK+mfw2hmmb0IAa5bjiA22PoKZBPJwqSmRVm
         bv2yqHLCd4UJOog0ulgaCrSUNV2GYyZ5FjiGkNeoiIXEZ+AMwcAJ/QGmAdmuE+oqlXZv
         Mboqq5Yk5u5uzikJVyHdyCdbWN1lP8rnqKvUoXELfsMQ2CDp3d76B4C1yjnxmkD7A/lP
         QZ7X30rqGRChjX/45dvwyiSgy98HhdDjdHSvAs75JIJqZGBoRJmNXZ0357DNMdeQRAJ7
         NcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eObgtd5YnXMirZPt7QMUEmAc3hSdu9SksehJdyatM0s=;
        b=lBI/bbJCZS8NbLLyE1zzWfyzptb+OHXIJIYthg14f5CqECR9KmDmS7N4JpqMpumk15
         aXAqQhPA8sjK4Q6jC/fEQ7+xrJZzbnxAHQ/ZVdSG71SjJm3LevDKnbgsTruddm3P9z1L
         8xupJP/UD30hQEVIV2dtfqxfqHtrUU32hZTjSCzbyXqcfsGcvVwo/oy7e/Brf0e+VpS4
         PEFwIOxKZE4hJgGZLo7el4H5+oQpXONP1lgBFxrb3vEhJ6hnE10s1BGo5CIFPhgISvSV
         mP5fqU8U4rulb7IPB07on4/RmX3ySxRk+B81AoQyOjDJUVaavUjyXbamvfYRCm1Bji3u
         rCiw==
X-Gm-Message-State: APjAAAXDCIp3+NLaJ4XHldjIdwz7LAulRTJDzmUw3jTDut8IRnF1vQeL
        pL0psQux8h3791ozmQv3Plc=
X-Google-Smtp-Source: APXvYqzmon6W+H8JN4yolgbpixrbflgEV30ECY4FKu4nkuXowRbAy1fYbCsnX/8mSqthL7aEdJ8Ijw==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr5103360wrq.348.1575273726282;
        Mon, 02 Dec 2019 00:02:06 -0800 (PST)
Received: from localhost ([37.238.189.20])
        by smtp.gmail.com with ESMTPSA id a64sm25450152wmc.18.2019.12.02.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 00:02:05 -0800 (PST)
Date:   Mon, 2 Dec 2019 11:02:03 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: meson-gxbb: add support for
 Videostrong KII Pro
Message-ID: <20191202080203.js5fciajlf7qkgvw@manjaro.localdomain>
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
 <20191130195335.17740-4-mohammad.rasim96@gmail.com>
 <CAFBinCCYzThAM_DkQyDZ2LrF-6bJoxeNZDtfADmWOxLH+B3AUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCCYzThAM_DkQyDZ2LrF-6bJoxeNZDtfADmWOxLH+B3AUw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/12/01 11:21PM, Martin Blumenstingl wrote:
> [...]
> > +       leds {
> > +               compatible = "gpio-leds";
> > +               status {
> > +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> > +                       default-state = "off";
> > +                       color = <LED_COLOR_ID_RED>;
> > +                       function = LED_FUNCTION_STATUS;
> why is LED_FUNCTION_STATUS not enclosed in <> like color above?
>
Well, the examples in the documentation enclose the color and don't
enclose function
https://github.com/torvalds/linux/blob/596cf45cbf6e4fa7bcb0df33e373a7d062b644b5/Documentation/devicetree/bindings/leds/common.txt#L140

Regards
>
> Martin
