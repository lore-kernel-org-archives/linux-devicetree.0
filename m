Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E22C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 06:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDC512076B
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 06:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpYvDBU0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgHLGs4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 02:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgHLGs4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 02:48:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF62C06174A
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2020 23:48:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m22so1020660ljj.5
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2020 23:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J31UG4xZfaTIfqQug3jDowpRaMecAJvi+cR7RWW/6Kc=;
        b=VpYvDBU0f25AQ9m3GDVHoUNKGkkDhwbrnVrRQGv9qnG12eXf4IY7Tpb4nKzyaA5GnR
         AHtuTeNxArmL+axuWPrSumZ/XebgP77RRcTE+GQkB8i0oVWOsRSw3z0wBHwftrhm/jFP
         CvNNCuSx/bwusMpWV+mV9dc66XOoA5fxPM26P+c7ZZjLqGy7wW5QVw4vw9fqIqUTa5cF
         PSVEIwmtvgOvsay+aDb9WpoGr6AwxjmjiR43zYa7iWp4i2u/PL9XMjOAPLVij/0Pn1yV
         +mULTLZ5F3Go7VxJFDc79NuukaGuX283qR5QhEyWTK2QvmhsNtuRRq7Luw33QF6WG0Zs
         U7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J31UG4xZfaTIfqQug3jDowpRaMecAJvi+cR7RWW/6Kc=;
        b=LmLta2sXx6lBWLxVljEummR+eQgwq7fhpSZot9K7cf3yc7hbbYTPNuUYFhT1QisX0d
         cMse4sQcn94CUMn7F8NpafiOHewIprg8GxHklFX0lTV+5VohpPQAgisH9OIJOQ4g4ATq
         FKIF/390fjo7nOKSrrjMNuocRZyGJxyIjzM8NvDtFit9hC1iE5OsCY1OByxfBLpjLeH4
         KJ76/UE+i17DnwA/RvLVzjzbB7rjiitnJ0QLckcR8ttBe9PSNhEQrG+hpzYjWakDTZA4
         KtitdXPo6rwHRdlsSboOKu9hU1XRPqaIeNdSVBrkF/Ul5yIgFFt1en0IngPzcEKq3NRF
         KJdA==
X-Gm-Message-State: AOAM533YX94VCvH+YkNmuFtD2Q3XNK++wkTpJKCoH4u8SLnuX+kaH4T0
        dS/HJb4f+Q4WXV3/CyXF9pZMECyjKabhUnXynBgApw==
X-Google-Smtp-Source: ABdhPJxHxwmcGrskpI/3oFiCVwxSZLG0pwpgInuuMV19jZuo3wuyU4iLrgAO3cTWdJQBKcHLd6uIZH9VRx2ad2MKIIE=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr4977361ljg.100.1597214934520;
 Tue, 11 Aug 2020 23:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200720203506.3883129-1-linus.walleij@linaro.org> <20200721083228.GA283099@ravnborg.org>
In-Reply-To: <20200721083228.GA283099@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Aug 2020 08:48:42 +0200
Message-ID: <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 10:32 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> > +description: |
> > +  The Kinetic Technologies KTD253 is a white LED backlight that is
> > +  controlled by a single GPIO line. If you just turn on the backlight
> > +  it goes to maximum backlight then you can set the level of backlight
> > +  using pulses on the enable wire.
>
> No $ref for common.yaml?

Since this is a backlight, and we do not have common bindings for,
backlight I first looked into using the LED bindings in
../common.yaml, but that has several problems, it cannot really
be used for backlight. Backlight doesn't have "triggers",
patterns, flash properties, the function is also pretty much
evident.

So I will look into creating a new common for backlight.

Yours,
Linus Walleij
