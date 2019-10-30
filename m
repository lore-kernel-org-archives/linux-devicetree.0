Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911B5CA9EC5
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 16:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D2AD218DE
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 16:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvpgtLZA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfJ3QiL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 12:38:11 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37020 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfJ3QiK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 12:38:10 -0400
Received: by mail-vk1-f196.google.com with SMTP id u79so640959vke.4
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auF46VoPrwU8q8xbExiYoCGq7R2SVCAVuNRFF7Vo6Q4=;
        b=jvpgtLZAzhD5tmCnWI0+PjA+GxKnP96UKlIC/iCxYisv9XAIoCfOSEZ+czAl5xWenM
         kEN0V+prh2T2uTepdHm3OgJYZ2bL36OEG0a32tUNVV1Jt52zdLFSLYWmVJ8+wyfce0ih
         Gf8Ywk3HbDcDdQj2bpgMAWbiyxRLw6sC85pWLLtzMZ1fFn515niR5tWHJx0vc3s+ZpvE
         axJEqpVx9cRBnl+fLit7piXAxxZ5pFstmeRw1/+yNLzxIAd0ZkLvGkoeF41pZUZm7qBl
         1gb58hhxrwBlycMrGbNCHlwKLW6nGbnjGttpeK5uJ9iprV5Tc4qnI/LCx9wUEMuenw1P
         v7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auF46VoPrwU8q8xbExiYoCGq7R2SVCAVuNRFF7Vo6Q4=;
        b=fFY4Vuy6lV9Bwb20Bl0PIbxte8onywp+KHhQRyX4Avqq2+OdauXLai02hnNlY1AzHj
         qB1Q+S1oD6pB0Osvz3B7S2hHhFD1Il7tDnSx4U3Zr0SD7HDBhfkvMdWvYZh+6KDNBuL6
         B0skkeiXo6qWgJ+CJK93QvZpjyIjCENB4oURW1k/JqWyM8tKZlLrZ0PwMXXQjXnNVymT
         Yv4cCSfwPm4AuWFgBJtc7oYlZ1sOuGRxSiaaIgTve0cVUi1MXbRCoKe0+96+NnSCasMq
         CV+LPSt5ilzc/8QfFkH0YDofGJLoH4FAFNVOXsfNjKNBCoaGq/1XzSzPgxf8UZ8XpZPa
         HHKg==
X-Gm-Message-State: APjAAAXZl2KOpduf4b903blAPTmKDoE4udlerbOYex0YrAQ8Q1gjRJEu
        FK89waqcBnzhqNAFx2i6w2j31iYl71AI95kJWS86UA==
X-Google-Smtp-Source: APXvYqyw9H3UJasnYEPOA7qM+enY1BBSO79cCLBJeHD/ItiLI84vSH2Emor68J8dEUpRPo37gqz04ssqn79oqqupric=
X-Received: by 2002:ac5:ce04:: with SMTP id j4mr164380vki.2.1572453489621;
 Wed, 30 Oct 2019 09:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191024114305.15581-2-linus.walleij@linaro.org> <20191025192518.GA19549@bogus>
In-Reply-To: <20191025192518.GA19549@bogus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Oct 2019 17:37:58 +0100
Message-ID: <CACRpkdY8+Xa=QeTE6OQvZ6ZVkT14OapRLvGEmdsOhi0+==LPiw@mail.gmail.com>
Subject: Re: [PATCH 2/3 v4] drm/panel: Add DT bindings for Sony ACX424AKP
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 25, 2019 at 9:25 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Oct 24, 2019 at 01:43:04PM +0200, Linus Walleij wrote:
> > This adds device tree bindings for the Sony ACX424AKP panel.
> > Let's use YAML.
>
> Also broken. Run 'make dt_binding_check'.

That is what I'm doing.

make -f Makefile -j5 -l4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
KBUILD_OUTPUT=/home/linus/linux-stericsson/build-ux500
dt_binding_check
  CHKDT   Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
  CHKDT   Documentation/devicetree/bindings/display/dsi-controller.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
(...)

I'm a bit unsure how this thing works. Are the several passes?
Because later on this breaks because of an unrelated error in
the bindings upstream:
/home/linus/linux-stericsson/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
properties:compatible:enum:0: {'const': 'regulator-fixed'} is not of
type 'string'
/home/linus/linux-stericsson/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml:
properties:compatible:enum:1: {'const': 'regulator-fixed-clock'} is
not of type 'string'
(...)

This is v5.4-rc1.

Is there any way I can selectively make dt_bindings_check just target
the files I wanna check as any brokenness upstream cause problems
like this? (And I assume that will keep happening.)

Yours,
Linus Walleij
