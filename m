Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9933AC43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 08:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FE23206B7
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 08:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMDJxkiV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfLMIvG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 03:51:06 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34399 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfLMIvF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 03:51:05 -0500
Received: by mail-lj1-f196.google.com with SMTP id m6so1691801ljc.1
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Z8pJbrRFAv/SlVt/bSDmUqBFwkKFr/Lhgb4eauAhjA=;
        b=PMDJxkiVm1mqYfp/ezsU6gZukoELITxuF/mIzWkaCMb8HbMUt0H0XXohyYrah3DC8o
         uqedI955+6FULPhQIJeWc+4jOAht1WdCvwz3sCBIVpjuu8qEVOriXDF7nZYFmkybZ2gb
         aZptQmhIbuL+s0NMm1fzZ/iIZfmIr50n7rIcQzlMPV5j7q1H0K+WrH5BjGxJtnJ70Zpi
         YPfXecMgze8RwB3IQe+WFvHy2gIaUDX6TeXeHSlvLrh3NYlBQ48fnZaBDwlI8FgnHP+R
         V2D8i7oWgToWJAVqi3nZK41FFAG/U5BnNIk8OjYqM2CYxfoHo01aNJ3ImXlrk3oZV1BB
         ve4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Z8pJbrRFAv/SlVt/bSDmUqBFwkKFr/Lhgb4eauAhjA=;
        b=ow6K3GnZOoPoJhSUt91z7vhBlCr2cX/PBJPBaM5ikbBAf09/YrWTVc7OeYsUT6tLwx
         V5SdSd8XVA4dyrhBJ2yu77NMb0yR2os4rUazN7EdkW1ojn5hJ/+Z9r60x1KcmpwKTJce
         wYl7aL+cP44rRHopBboChrgaz8XEIIqcFSGBgprKknpI3yBnbL+Q6lFghxtqap3rZzLF
         ohGX/M8YjsWK2Wjy+dlUZ5tYLFKF57/8+nqpiplq74Byj6TKszE0TQFNZCbpTQMhyyKM
         0d2M5fWNuxWiK5Mn5WtBMbazzcYEktXwl6VN20iJBOBQ+X1sWMnbl0qLRvijhZKYgatg
         jSyw==
X-Gm-Message-State: APjAAAUqDASBVDVuPBU8/SjRYRmjhbaY7rFA4Dym3u21JdkAxd7cNk27
        NOp4xY0Cs4XR+4Sf6MrQlW4YnTbOrNJ/sarM8rqPcg==
X-Google-Smtp-Source: APXvYqyILnQnQIVLymrJqvXhhEyOLOB3SjozAuh1tYx1FYuarVqwz5mARQK0XlBDPuswAiEWqtLR5ZOSjwlUiEYSgvg=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr8428303ljh.42.1576227063362;
 Fri, 13 Dec 2019 00:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com> <20191203141243.251058-5-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191203141243.251058-5-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:50:51 +0100
Message-ID: <CACRpkdaaK85sDp9sdMyZX8P8YKZDqv2H-8VBE7Yvi-VEhM2sNw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] gpio: Add support for the Xylon LogiCVC GPIOs
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 3, 2019 at 3:13 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The LogiCVC display hardware block comes with GPIO capabilities
> that must be exposed separately from the main driver (as GPIOs) for
> use with regulators and panels. A syscon is used to share the same
> regmap across the two drivers.
>
> Add a minimalistic GPIO driver to drive these GPIOs, using a syscon
> regmap when available.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Patch applied.

Yours,
Linus Walleij
