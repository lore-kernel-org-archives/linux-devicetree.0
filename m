Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D6CC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 16:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75B7A23120
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 16:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="RU0tPU8b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgHFQq1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729235AbgHFQpo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 12:45:44 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BCFC0A3BD0
        for <devicetree@vger.kernel.org>; Thu,  6 Aug 2020 07:58:30 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y3so44311784wrl.4
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2020 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I2QgUmIlO6maUIvLNmFMIgB6tFghLiGYEgxkf43Wx9U=;
        b=RU0tPU8bAxRiOuvHY7DJRlCCP2+QRbiYTaM0EYG5OIICce80n/byLWVwV7uLOp8vjb
         zWbCdW/3rPa2b9W3bVCAqFeyee6Kk5YIEQGfReqtSa12vcltpB6yZj0yIp6dXYe+ZXTA
         uj1D2Zs5Yu49k1Pzvv5W7vUodcbxEQk3yvggE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I2QgUmIlO6maUIvLNmFMIgB6tFghLiGYEgxkf43Wx9U=;
        b=e25jB6xdAUCXYdVLixhYglHVV9PXN3jK+mVRMYo1bDx9bx0wE/qy6mxnWferAq1K9p
         M0DEtjdkxr5Hrz+M+O2C3y+bEbTbJviM0hUrefdcRYLbCW4Bffbx7TGOLkyQm87op0+r
         axPQxVh7PRWTKh97VJJXPk8qzSywWbcWxfMuzVpDru0A+frUxD0uupRwolqfRJZZgdQq
         htxfldullBUgcWVw9DvtE0fcdc7fHzHKqSoXxhC3SvSzZ3fsKNA6Fs8iHhqBzHUT+7rm
         4SjEyCZoJXuLUzrkoZkEe9kIEYjHukqvsdfwow/Rh+COZe4cVEXvaeXHqRk98bBAVIja
         JsFQ==
X-Gm-Message-State: AOAM530F4JWU3/0zw5YYK+PQllH3B8ODK+Ptu8shNSRRF9EK1FK4NJww
        QW6trSIewi7JNfjL4G4M523mKVuUBhG3GE1hA5eYUQ==
X-Google-Smtp-Source: ABdhPJxei3fOQSc5RtFiRdeqUA8wYj3HA5L3OtFNsjWOwMSmZXT0JK+Zw+6cm6ro6Yk62WFzA6yS7yy5PVLA37ZNW0U=
X-Received: by 2002:adf:ed85:: with SMTP id c5mr7800963wro.307.1596725908629;
 Thu, 06 Aug 2020 07:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PX=Gk9h6ASi6saBLhoZ45g-WqCzDQo2XWT033fJykFSY_g@mail.gmail.com>
 <20200806140739.31501-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20200806140739.31501-1-mark-pk.tsai@mediatek.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 6 Aug 2020 23:58:33 +0900
Message-ID: <CAFr9PXkFJJKnqVkPBXgh1kqL_serK4DmrmJ73xU+ZMA+NuF-bA@mail.gmail.com>
Subject: Re: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc:     alix.wu@mediatek.com, DTML <devicetree@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, yj.chiang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mark-PK,

On Thu, 6 Aug 2020 at 23:08, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > Do you know if it would be possible to confirm if they are
> > the
> > same thing? MediaTek bought MStar a few years ago so it seems likely
> > but I have no hard information.
> >
>
> Yes, it's for the same interrupt controller IP.

That's good news. :)

> > If they are the same thing could we work on making one series that
> > supports both use cases?
>
> Sure, and I think the irq controller driver should support both use cases.
> So how about keep the MTK version driver?

I'm fine with that. Maybe you can push the MTK version and I can send
a small patch after that to add the small bits I need?

> I'll send patch v2 after -rc1 as I mentioned in the previous mail,
> and keep you posted.
> And any suggestion is welcome. :)

I think Marc's comments on my series apply to your driver and I think
maybe answer some of the questions you had. For example what
to do about the read-modify-write sequence for updating the registers.

> > It's also possible that if the interrupt controller is the same some
> > other things like the SPI NOR controller etc are also common and
> > working
> > on a single driver for those would save us both time.
>
> I'm not sure about that.
> I'll check the patches you contributed and confirm with our driver owners.

I have a very messy tree with support for the SPI NOR controller, SPI, i2c etc
that were used in MStar chips. If any of those are shared it'd be great to know.

Thanks,

Daniel
