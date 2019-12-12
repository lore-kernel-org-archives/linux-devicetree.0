Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B4EC2D0C9
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 15:48:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D7A3227BF
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 15:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tWDQHCzj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbfLLPsQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 10:48:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37446 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729013AbfLLPsQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 10:48:16 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so3059840wmf.2
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n8vF9XNoq8z6lGj5X7N3vW0Qdo3VLesTtOSH5vM0z9g=;
        b=tWDQHCzjEidxQRC+S3IK6O7tlY/wx1abfeFkrfPopDd3QnLtcJm/2dSOfbn4oBuHob
         r5oqnlemPeEejKOCEADPAyAr0Cn6ISp7836+r+o8bI0ZppfhowGu586AmRKCjlF4XovA
         Gan7Xv/WYJBpQPmip9CyMywfOCnw5YFEkNw+lfBkNsZ97VqUaLcFuP++4ZBfVBdkqyAu
         iS+Zh6cT5jmUAdSFEM6h/dQgBqqVy8JV17rG7osun1xfooVf1WiWuhgYi2xxuuO7fAvt
         SfVBVpVTBZeLFibk13ApL2uYWHGl00qSzJXR1iTJMR2XPTEkA6tAW2o+iWHF2t/b+41M
         +f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n8vF9XNoq8z6lGj5X7N3vW0Qdo3VLesTtOSH5vM0z9g=;
        b=N/GSkE96sWnRvgqYbJtlfc6RxTUHxu7972Q9UWmM4XoBulz/Gvn3Uot5dm3PouvMGw
         lB2/i3FPjhkazN+29NrXpg2lYBU24VAQFVnni8vC0IzCBiX70Bf7A88N/E3tX9Xsgyj/
         wef1SPn0RhI2jhRBL8JVGpHlf6ZAsMpsujRG6iBM4xFuArBsfbqLEcOJGP82lWiq0m0h
         iYz6lX44Ln8d2ZQLABGh37EokYmmzFksj4WQxsH9usNkaU1X0L2XyXkYBHzp5onC12Bk
         mKVuhO/tu739n+lj6Phz/wHmwGKQRxiy/g1byIk1gNhOlYf6VcuyMyYeobEnVH+wFE+N
         4ZEQ==
X-Gm-Message-State: APjAAAWBqcEWLrabc5dpWkNeNvoMvI6O0CG0hc/7gP4SpKjHRixHSbv0
        KyRrlPtew5kN5AeSuukAW+8uNQ==
X-Google-Smtp-Source: APXvYqxOLMy2RQ678Cljt3+lFrWx65iFon1zUH2zHDgdT62aQXQwwk5Wxg4qyHDQTsa3N8dQjdgobg==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr7206712wmc.2.1576165693930;
        Thu, 12 Dec 2019 07:48:13 -0800 (PST)
Received: from dell ([95.149.164.71])
        by smtp.gmail.com with ESMTPSA id p26sm6519960wmc.24.2019.12.12.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 07:48:13 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:48:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Add DA9062 GPIO support
Message-ID: <20191212154804.GB3468@dell>
References: <20191129165817.20426-1-m.felsch@pengutronix.de>
 <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
 <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 12 Dec 2019, Linus Walleij wrote:

> On Tue, Dec 10, 2019 at 10:51 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > gentle ping.
> (...)
> > > Marco Felsch (3):
> > >   dt-bindings: mfd: da9062: add gpio bindings
> > >   mfd: da9062: add support for the DA9062 GPIOs in the core
> > >   pinctrl: da9062: add driver support
> 
> I can merge this to the pinctrl subsystem but then I need
> Lee's ACK on patches 1 & 2 as they are to the MFD subsystem
> and I think he will want me to create an immutable branch too?
> 
> As Lee is not even on the To: line I think it is unlikely to happen,
> so maybe repost, stating your request for his ACK?

Or any other line I guess?  Seeing as these aren't in my inbox.

Yes, please submit a RESEND with me as a recipient.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
