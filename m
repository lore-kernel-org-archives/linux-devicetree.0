Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7388C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 11:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C313320709
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 11:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQKy1yfK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgEOLtg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 07:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgEOLtf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 07:49:35 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81094C05BD0A
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 04:49:34 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h26so1562784lfg.6
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cWZJQisB640njiNbXdpel4cdg0AxhnskXdou47Rc1F4=;
        b=QQKy1yfKlgEVgZlxZnPSc4KobYi66fc37X5KZbTF709UgtKsHQ25iVQ9eGG7lceHe1
         +WSvipgrDudbGHKKMCHWyD8T0xl51RqwX11Hdj+avT7yhUOzlBLswGsVIHnI9/YCdr+1
         YhhcCmzMHLqe9+Eexqyiofuqtd0kCTc1kI9OZ6s1ss6V8PYkFSfmPFttGk9XKjYOPfOX
         B9fmecEHktSw/dsUZXOUYV+++WUjmjEEZF8oDmbn+Et3zf1bxOdSc7VFsetdcOOP/1ch
         BVps/p++Vr6PnYrFpc0uKvdfPNNFA2rnqOVc9C5xwPCo2ta1ZZm9TGpbNHzb8bIQmRMQ
         xIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWZJQisB640njiNbXdpel4cdg0AxhnskXdou47Rc1F4=;
        b=bu/mAxVoLdAI62SBzRkLzIZdulHv373CGtv1VTayIDF/f4Nvrz5bjB9wF/qsSm5/y2
         AYEHhD8aIj7sL/DeeBji6RvBavKUe+5X66Qc5dY24Z8ZzaZTqSvd6hIizymvErzjqMwH
         msMUaKmpaBVjqf1lqHHkmGfsOpNzzh/Yk0WIVTraESOxhISBuQIxIXjb2WIjcUTPXAad
         aPZaQwYDow24n2aR2SeW+6mgIEU82PxWy7UDi/E+i14KZRx8PKdBjT7tckrA+4c9w23Q
         waC5LEZxpI0+/Gs0BwWwQIoO408P6RjTXv6TDRKc97fQwFqmRLzMeXZheLhMgK9yjdwL
         nzZQ==
X-Gm-Message-State: AOAM533jwbuZ4kjP3red4uCs4J7vO3Dp++NC60yVbuIzPFdS4TT8+oMq
        EhrixJoUAzyn2eXMnFUo+fIoDdd5IdUsyrz/F1XAXw==
X-Google-Smtp-Source: ABdhPJzHseX/OaTVLiyuLxZCQZIEnSA0EuKj5TIZhiEbuayaYYcvsEL+IwgXAnQZHChm/0jP+VL1Q+/k5OjYy9RKlo0=
X-Received: by 2002:ac2:54a8:: with SMTP id w8mr1066569lfk.89.1589543372862;
 Fri, 15 May 2020 04:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200514204901.3199-1-xc-racer2@live.ca> <BN6PR04MB0660C7BA4CE07978AEC884E1A3BC0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <CACRpkdbucZ68KODd3shecm0uEkFgTzh4XiN08JdCM_chYApoXA@mail.gmail.com>
In-Reply-To: <CACRpkdbucZ68KODd3shecm0uEkFgTzh4XiN08JdCM_chYApoXA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 15 May 2020 13:49:21 +0200
Message-ID: <CACRpkdaOZmHgbFckYifF7=_uMY3DcmoVOY_1WJXKP-6WvnZOug@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] iio: accel: Add bma150/smb380 support to bma180
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 15, 2020 at 1:48 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, May 14, 2020 at 10:49 PM Jonathan Bakker <xc-racer2@live.ca> wrote:
>
> > The bma150/smb380 are very similar to the bma023 but have a temperature
> > channel as well.
> >
> > Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>
> The temperature channel can be added later, let's go ahead with this!

Oh I see you added it, missing things ... thanks Jonathan.

Yours,
Linus Walleij
