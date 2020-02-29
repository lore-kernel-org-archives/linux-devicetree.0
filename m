Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E715C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 20:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D76A92468D
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 20:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="GhwOcOiu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgB2UOz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 15:14:55 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40557 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbgB2UOz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Feb 2020 15:14:55 -0500
Received: by mail-qk1-f195.google.com with SMTP id m2so6439304qka.7
        for <devicetree@vger.kernel.org>; Sat, 29 Feb 2020 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uIPKlVGsJhNNHi8p9/fEX9N67i5rB91sCnJJI1pWp9c=;
        b=GhwOcOiulOFV4Cr8+jF40BU+cXp+164hlsmhfCo6UcBEUaOcWd7hvcd52rceMl1ZuS
         0OL2qyC/SgcRHjVyht9Yu0nHIPy51jaAIEKNMbBXn5mDbn/V0LrSZJLBMxJVAPVN1w8R
         6jq7YJgzhd1ZibHXhFd613HQabG/9JABs+bmZmrxvkfaxVfxbCZH6HoRJDkFivVZebTW
         nnxDV9WaKQB/xAOF9uJqUO79FVtb/nAMqKTifRLaVk5gJmFXa1WAxfizABU/59RWwUKe
         O8f6RWgwA1rvF9allhwJhhRiqDqSwYiCRZ3SC+3i0UCMS36tKtuZLeqpsobqE702wzQc
         3PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uIPKlVGsJhNNHi8p9/fEX9N67i5rB91sCnJJI1pWp9c=;
        b=fRX7xX/uzOfEfqLAM9MS1mh2FtAeymTlyY6X9Hj5DSue+1ISgZeaW4fshsKrjHxP34
         1ekXTHIMPMfUBtUzWe+yCkbGN7KeukN8jG3Kqz/21K60FU6mivUVozpv/JZg3x4GTgZB
         ppdr/i1RRQD//u0H6/hoLLeUdRd17xywUvPLZKOrH6ucTc0XvKP9NZc0AWgJ/ipE3s5D
         CPB0ykTgOcU4rIIc05cb64ILnGe/CpSHsz4iw7hsgNE+iC54HJy8ZguQrTLRr0MBacXc
         SLoL5B1mq9po+38+bfd+V8y6iK0ALaonY1P4gD0HPNTNN+hsyiqsNK/O/ga+HVhWA/Gs
         6RBQ==
X-Gm-Message-State: ANhLgQ2kl5rKxO/UC7OcpipAuD7x90eHwgNWRZh/SP5+oSIRCIGA5epm
        5fAWh8XHnX2UQPRrsOZ8cW8RQw==
X-Google-Smtp-Source: ADFU+vuGtuRAhAbHNNImS6M/w8fACa5jQQX+t1JVIfR+V0j+FrQjiOha6TUU5l0BnBVJE4/5DLiARw==
X-Received: by 2002:a05:620a:a0d:: with SMTP id i13mr2639940qka.333.1583007293819;
        Sat, 29 Feb 2020 12:14:53 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id i4sm7516740qkf.111.2020.02.29.12.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 12:14:52 -0800 (PST)
Message-ID: <1988d5fa72d50485d953948f6148602824ee9548.camel@massaru.org>
Subject: Re: [PATCH] arm64: dts: freescale: add gpio-fan/thermal support for
 Google i.MX 8MQ Phanbell
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Date:   Sat, 29 Feb 2020 17:14:49 -0300
In-Reply-To: <CAOMZO5Ddg2VhXkrWTn6xAX0N8fDLCNFmccE+xrcvKeRmmRmotQ@mail.gmail.com>
References: <20200229104347.11126-1-vitor@massaru.org>
         <CAOMZO5Ddg2VhXkrWTn6xAX0N8fDLCNFmccE+xrcvKeRmmRmotQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabio,

On Sat, 2020-02-29 at 10:07 -0300, Fabio Estevam wrote:
> > +       fan: gpio_fan {
> 
> Underscores are not recommended in property names. Please use
> "gpio-fan" instead.

Sure. I'll fix it.

> > +               compatible = "gpio-fan";
> > +               gpio-fan,speed-map = <0 0 8600 1>;
> > +               gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
> 
> Please add an entry for the pinctrl description of this GPIO.
> It worked because GPIO is the default functionality of the pin after
> POR, but we should better not rely on it (bootloaders may change it)
> and explicitly it in the device tree.

Thanks. I'll do that.

> > +
> > +&tmu {
> 
> Please keep the nodes in alphabetical order.
> 
> 
> > +       throttle-cfgs {
> > +               throttle_devfreq: devfreq {
> > +                       throttle,max_state = <2>;
> 
> I don't see this property documented anywhere. Should it be removed?

Yes, I'll remove it.

BR,
Vitor

