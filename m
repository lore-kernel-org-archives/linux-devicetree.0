Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1ADC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 13:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 264E12073B
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 13:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aau+5lIM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390748AbgEYNED (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 09:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390585AbgEYNED (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 09:04:03 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86E5C061A0E
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 06:04:02 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k5so20639860lji.11
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qbKlh9rvr/ToxEMzUAmGtxv+hAZbxzL0uknOsgFGASk=;
        b=Aau+5lIM+AAKCnFmFHUwdB2fv88scc7+W1ocRo4djN5kn3UtOI9CaWpntIC4SIhSvO
         nbtEPvrzVgr8JhykJWbfZQI9hYmyzl5rY3zYQo8yxf5aqx7+0+B4XcTA3UHq32QEJR3M
         bY1nbC+YgbUoM624DQJ6nPudjKipLU5yDLoFsH+bZmAfrzDuJLPhcpO368a8wwNWdGlN
         Viys9iWK5f0YOtkmcBTIqXxRisLghvb6jwdu+HPh3f0BUyJSgxmYz3Th+4VrncZ2SQoR
         5jARHOVzaQIIZQX8Y9ea8DeTwsX95QwZihQlcRBHE2IkGCohhYDRZrxRcYUcJM20QB8+
         EqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qbKlh9rvr/ToxEMzUAmGtxv+hAZbxzL0uknOsgFGASk=;
        b=f5GbWbywNdP8lLwZir6Kj+94ku3hLSJ1Ol8BTOHW9bTuEUVE5CPgAJXt00TUianlMH
         jO6DW9FvKBFdkoUbOCjYzGuo+D9dFG6nP3K/gQfi/R3+gDEhBGpdnKViz25P5WymgSZn
         Hqw/a4R4C7YQyH+PFZ0fibo4Mf1izjI7xTdL8SB4HQGAU6UXxf72GmskNO38Testn2Y4
         s8dMTWV3TW3YPOPDk3LUM2pCWoY3F8E42Pw//l7idPlfxaEc+8xYuS8QWwPJn27Gb8Ui
         N7YaAeQ412QGt4Za7h6AmvaO+mFlZ85v2u7h2R/MnCJwuXx4orfOMAAgz0yS4wtt4fka
         KFrQ==
X-Gm-Message-State: AOAM533IoUmxj0cr0ehZTUKNrkjIybWNj2oewm/OD3ViwZmrNdM0i7fs
        dG58fTkEM1H1IXXDkYUrf3TXfOClAffFKYzi7xmdJg==
X-Google-Smtp-Source: ABdhPJxaHb2+gGS6W87P/n0XsJZ033bv/Oc6w4sdtxU1dzhwlkkN3Kp7Vteg43GSp/rNBOXzokfNg43+fcFtvQ0PwGk=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr10887714ljk.144.1590411841474;
 Mon, 25 May 2020 06:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200508165821.GA14555@x1> <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
 <20200518141843.GA916914@x1> <20200520220203.GA363398@x1> <CACRpkdYV4Pd2rL=Kha6HxL8J5+vFy_M0hV7+qMghS4AVxd9D2w@mail.gmail.com>
 <20200525120710.GA898135@x1>
In-Reply-To: <20200525120710.GA898135@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 15:03:50 +0200
Message-ID: <CACRpkdZLRjcE0FGwVR-Q7a50aEmpB=xO4q6H8_EaV199fGr0OA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 25, 2020 at 2:07 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Mon, May 25, 2020 at 11:23:17AM +0200, Linus Walleij wrote:
> > On Thu, May 21, 2020 at 12:02 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > > I've posted a v2 which I hope improves the intent of the line names. [0]
> > >
> > > I'm happy to integrate any feedback and create a v3 - especially if it
> > > is prefered for me to list the specific peripherial signals instead of
> > > an abstract term like "[ethernet]" or "[emmc]".  This is for lines that
> > > can not be used because they are not routed to the expansion headers.
> > >
> > > [0] https://lore.kernel.org/linux-omap/20200520214757.GA362547@x1/T/#u
> >
> > This looks good to me. FWIW
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Yours,
> > Linus Walleij
>
> Linus -
>
> I have posted a newer patch that targets am335x-beagleblack.dts [0]
> instead of am335x-bone-common.dtsi as Grygorii Strashko pointed out
> that these line names are not applicable to all BeagleBone models.
>
> The gpio line naming scheme is the same, is it ok to add your Ack?

Yes FWIW
Acked-by.

Linus Walleij
