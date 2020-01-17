Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5333C33CB6
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 08:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B2422082F
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 08:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gal77Kdr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgAQIRC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 03:17:02 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44669 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgAQIQ7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 03:16:59 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so1739276ljj.11
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 00:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eumIjdkn82CgKdbcA/3L7gfEiqOIGScZ7l1uaCLBeSY=;
        b=gal77KdrDv3aXpDleCBEPdV9VFlP7JmkBx4mWLLkT4B46bDGdyb+kQi3cNEwt4xJyB
         Nrz8CcOL9BTCfRv/NLKQRkdgWbD6Rm+1meXS6L2Nv51LEYKE/c+x36aOTA7IE6jHzjdP
         Wsj6jAshXygjrcwdUdAxl1vYQxp/lmwD3kmOTXGdY2Gjf3zWpMnl/S/B9P8LorCdPKQY
         N9KybhzW90peNVcdU3m+WxHReT2EOOzOviSh+W1lPEJ4N/hJ5lOx+wSBuvoDkO8VDvI1
         SI5S8IaHHUPl6rKh+SjWYBcoT8CnMJtSnKY4tClzU/ozrm8w2A7KuiSZfMuPIThf/PjS
         TJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eumIjdkn82CgKdbcA/3L7gfEiqOIGScZ7l1uaCLBeSY=;
        b=WDRqjSFxOC06HiBkZXKUQJr9qVNIHZlROoLUsi2cZwxKZ0edEppxJa0lE3bKfUPUDb
         Kej7w3NEbW8IPVkerXjXfOEQmKAYoZSlj3OnEYnU9gWLtkpA0U2qv13T3xsM/nx8eF86
         3D61EMpbf3BWWCdWULohYGiijjOs5w8trXpHeO8p4UuJS123K2b52uweFATjvge6UTlm
         B8LmSEWXeM1Y75ISPi+lWiiUzVUD525B4NH0Fp4xBrC3gAHzvPaExxnpEaFYlv3Spu/t
         yEUXKTJ/CanNwKC5ciJWc5T7uXtoNfS2Vddh2zIDpZHjUGh6Us6dISvYMOn7kfcvFFXW
         cY+w==
X-Gm-Message-State: APjAAAVdBQv66vPRYDlUy8Gu1cG9T0wrrL0xG4wT2Cmv6riDRQTJvRF5
        mVZVoSv02Xcu4JPGSzINY5jR/1snbTnNi23vR4wk+w==
X-Google-Smtp-Source: APXvYqynZ3geNnXUWrPvbN90CBox0dC1N8R3nvFQWoXv6XPzU9ZIleOfyLNCPNG+wfshRvylkCa3nZEtkNjMjJIcpVM=
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr4927401ljj.102.1579249017305;
 Fri, 17 Jan 2020 00:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-4-m.felsch@pengutronix.de> <20200115162915.ccudevxvre3v5c3d@pengutronix.de>
In-Reply-To: <20200115162915.ccudevxvre3v5c3d@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 09:16:46 +0100
Message-ID: <CACRpkdbwuaA6CnUW_s1i=cf1ix_jHrqGoZZENXdAG-VXcAd_Mw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jan 15, 2020 at 5:29 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Hi Linus,
>
> On 20-01-08 11:47, Marco Felsch wrote:
> > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > be used as input, output or have a special use-case.
> >
> > The patch adds the support for the normal input/output use-case.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> Is it possible to get this into 5.6?

It's patch 3/3 and patch 2/3 which makes it useful is not merged?

If you are convinced that 2/3 will be merged I can apply it.

Yours,
Linus Walleij
