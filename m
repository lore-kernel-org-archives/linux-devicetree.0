Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11896C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D58342083B
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YMy1Q/pc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHSUqz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 16:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHSUqy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 16:46:54 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BAAC061757
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 13:46:54 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b11so12796514lfe.10
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qi99Xq7OFQtrS3HvWRrLPLcLhnBb4j7+vDIzg/ZS78U=;
        b=YMy1Q/pcnLqeeA4tcagxpLCBlFHveuLAHO/mv7p7YaiDnH5i01ZbfCeL3FFDRbbdDb
         u2/F+vcssHM25YD3/byL5svh/FM6YW1ad7IHD8A9H0ZE/swjCcbNZ3QCN6qhFrw9FjGB
         2kMCNQ/m7ygfUwNrNVnQ6sM8RsRNjvlPnSsA9p4RaUldiYDvXI0rM3Kj4vfm0qtSWaVk
         PYQ8xmK4JwsJvbagsW4QiUNTkIlDizXPreLh4ep4JtsT24sARIsmkev0qxgI6OAUc7HJ
         iVn6h5SJquF8Jf797Lfxz4bnBo5pHxD7N1G4fiXGOVFom2E+ahIPOKTIVZ7mK3q4hMPA
         ga6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qi99Xq7OFQtrS3HvWRrLPLcLhnBb4j7+vDIzg/ZS78U=;
        b=i7FGjeZITH1GfEHyGp8KpVMMX2agpQnsvsNE23gq+8yYTms1NXSz27Uv7C/AaGhy/1
         87vspwhgc0BOCzT1PX6YwLsnJyDoLW2CtaIpP/Tfdx/ImfJi6zsi65nMvCd63WqePWAa
         FhFmCQpYZrFkS3GUY6gk0A58T2Hi2J3ibleSR1jieE4yLDcFYBQUjrJgJj4OGS7kZW6n
         FUiXcZwnYLgsCByipbhRD3R39QJGc+M/rLEi3aqw2wYC9J+QXauU1wYGgKqMHTi+PDW1
         kkLk3BeAVmpXb7sJoVVVJAWCuEushgy0IQCJAHOrlhH2pADWzQ/sIGG0ayokLZjNylMb
         atcg==
X-Gm-Message-State: AOAM531BRBqu/aohJMRaOQyuCJKnu7xQk6B787KpsKG/6ipJ+KhVIak0
        jy9778pav0+u0ruRi/Ss5zDWf+MV9zUhT1VsLiJn5g==
X-Google-Smtp-Source: ABdhPJxYsaEQNSGTuSsMUNmBMUPNhsmvD7Dua6a20QK/pxww6zjEfIY87vu/7DoXyEUieTD58VtbtuACfuT4CzMc5z0=
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr13104401lfq.89.1597870012976;
 Wed, 19 Aug 2020 13:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200812085850.2643820-1-linus.walleij@linaro.org> <CAL_JsqLR3HEsbuNq7i+N3ETYVoMtUP90_Ev=tO8GJr+fF4QHWQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLR3HEsbuNq7i+N3ETYVoMtUP90_Ev=tO8GJr+fF4QHWQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 Aug 2020 22:46:41 +0200
Message-ID: <CACRpkdYOym=0BOsTr=bh4Zax5euj9RcRzZ_keUL3Z1EN+UykWw@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight properties
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 5:46 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Aug 12, 2020 at 2:58 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Let's use a common.yaml include for the backlight like we do with
> > the LEDs. The LEDs are inherently incompatible so their bindings
> > cannot be reused for backlight.
> >
> > Cc: devicetree@vger.kernel.org
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - New patch as suggested by Sam.
> > ---
> >  .../bindings/leds/backlight/common.yaml       | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml
>
> I'd expect some refactoring here with existing backlight schemas
> including the ones I just added for 5.9.

Yeah if it takes off I can certainly make a slew of refactorings,
I would like to do that once this is applied.

> > +  LED powered by a boost converter.
> > +
> > +properties:
> > +  default-on:
> > +    description:
> > +      The initial state of the backlight can be set to be on with this
> > +      property. This is a state applied by the operating system so that the
> > +      backlight is always turned on at boot.
>
> Needs a type.

Dropping this property because the subsystem maintainer
doubts this is needed.

Fixed the rest!

Yours,
Linus Walleij
