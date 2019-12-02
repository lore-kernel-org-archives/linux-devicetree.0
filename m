Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB6C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 12:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8965C215E5
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 12:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUG7XFQx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfLBME4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 07:04:56 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38205 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbfLBMEz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 07:04:55 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so5280893wrh.5
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 04:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=soNW5fohseRrYu9CQUXRU3A2LW40lxkkIsWjpHtjy+4=;
        b=SUG7XFQxmmslnG3yAcE+XfPV6jsM+pD0FOn/54XPlpukSkJwexaujXTj7VWCN9CS51
         K1BGEZpvuVusIAPNwGWYifr6QBV3Ofv4pimEXUe+U5dyoDivC/moJFyo7GSqhy6FLBzE
         WWeFROjbPyNLXD3Ms5kdMU3IRJEI7ZHRWvg6XrjX7ok5CeC3Ac+2cLeXhB6D9JI3Gqwy
         27A+Hp/ugNpWU9QCKhl8xOP3Fq7lXOWOI4LlRYonFmGczAd9+0uJkz7DoDYWZddCb0O4
         LP84Kbe0/+QVfD1OcPz8Aj/skgXs+GqAe4hzEhQR44AkCyfP06M0x65zCPiL2tsJnVzV
         ilGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=soNW5fohseRrYu9CQUXRU3A2LW40lxkkIsWjpHtjy+4=;
        b=FIGmfBocFJYgFuGuiJP0050BCOkHExnx61Y0Z8E7vhEkFZn9eAEao5D77oZTk5mPJ0
         KJfSB33JqV3VMi/wF2/5pMk6lz/ISEOZyJ3KkEQUQI4K8Dg9khZVriKokso0icAFlG4g
         /+E6d9+ELV7tFida2u4fOpR4N/F/18d9rPbGEKvl7U60k9z4+C5fMAVOfHxNJVzhqRNO
         MePs/5/EgqA6IRp6mSPl3E+r4dfHzg4/hsiS5vmDw6z8883mLSqgvPoUo/FFshQ0BfcL
         M53GUvW6aUMahrTbNW4oiApl1hAwv+ym9rG7WFTv+cQ7482VylvFoe0LOdCjiHAz/u6K
         INwQ==
X-Gm-Message-State: APjAAAVXntJplP9aHEXGX7hBw6E/g9LkBGLJn0EJw+UnHyKLfkA4eoSQ
        pneoM19I+A8ptwfS+yxGmqLB3g==
X-Google-Smtp-Source: APXvYqwOBVgqYt1ED9Zw7laHel2W8Pvb3keFWerq1L9G4LSaenpLO4wmf6lPLnHFD28jBsEIYgohAA==
X-Received: by 2002:adf:db86:: with SMTP id u6mr72454037wri.318.1575288293871;
        Mon, 02 Dec 2019 04:04:53 -0800 (PST)
Received: from dell ([2.27.35.155])
        by smtp.gmail.com with ESMTPSA id 60sm40793963wrn.86.2019.12.02.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 04:04:53 -0800 (PST)
Date:   Mon, 2 Dec 2019 12:04:42 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/6] DA9062 PMIC features
Message-ID: <20191202120442.GC14416@dell>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 02 Dec 2019, Linus Walleij wrote:

> On Fri, Nov 29, 2019 at 6:25 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > this series address all comments made on [1]. Patch "gpio: add support
> > to get local gpio number" is splitted into:
> >  - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
> >  - "gpio: make gpiod_to_offset() available for other users"
> > Please check the discussion [1] for more information. You need to apply
> > [2] to test the new features.
> 
> I am very happy with the shape of patches (1) and (2).
> 
> I can apply these on an immutable branch and merge into the
> GPIO tree at v5.5-rc1 and offer to other subsystem maintainers
> to pull in so they can merge the rest of the patch series on
> top.
> 
> Alternatively I can merge all the patches into the GPIO tree.
> 
> I suppose this is not so much of a MFD business at this
> point so whatever the regulator maintainer prefers I suppose?

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
