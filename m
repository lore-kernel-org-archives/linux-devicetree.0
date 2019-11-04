Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6B6CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 15:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C18222080F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 15:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y17/dQyI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfKDPdy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 10:33:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46125 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbfKDPdw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 10:33:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id e9so4804888ljp.13
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 07:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DBMbcScUQGQZVNBdTsiLXor9xyXQU7D+1E9hPAM9ZKA=;
        b=Y17/dQyIIuBV7qFVbf3hljdrzyzDXMH3+Q7l6qUsJpgq4TKcHmzgXg3WqeQuOs/Ofr
         mt2X8W/YV22xCxDSI7shE92hjOUSTvROnDYbTxNm1xYEndn+xp9O/ei1MZbUJxV6NJoN
         xZausHHAo7VcDDwOsRj9NvgnwvXaFD92HMPjiSmUcBMYtj9mw0nxOc+p3cXXndAcjDnk
         aGaq3jsRxA2dLzVTii61YjV/gf2b54iJ3BhoYJ/OCVyMlTmGJ9i0FMaiTKNYRj5YNy61
         u2YAwqRk7R6fyPzl2R98OqG+hOyGHDz1J36kBp1LS+6gSTEBnwLs13XR2sHVIs/RcOiK
         davQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DBMbcScUQGQZVNBdTsiLXor9xyXQU7D+1E9hPAM9ZKA=;
        b=N6hXwvjWmIBinOrEW2AoCbqtZlHZ9stC7nPcX7UowbXD6XS5jmsMeSh6lGMfVKEHz3
         oDsGWLtYJ32dQIbOG66VZI0R5FjFjPwXhweOSpWwLJ53niyXNOCvV4PT4rgGV0I3kFOI
         dK//mqIYseoD4UY7l2wSUpNWEUj8ddcIlPfeVp23VNpynGMBAKcSbgsuty26qJOKWwmZ
         aMXQA5TbhDcfNuMF51avQ8fbs6I5aH3Tozt/IlrGX8JfFp38ktbKOENiWIB4/xURDRZA
         8B1KPsaq4I3iyltyEd4xFLnMiX8SLSkC+swvfprK3hKg02ik7NAP6QCaxm+bYmvQnE3Z
         TP3A==
X-Gm-Message-State: APjAAAViG+nHFfidk8YSmLlOWU9gAvle12lz8m7c5gfe8TaXyFvho55t
        ldDYlCBqs24klFvywjcIwfABLh00AF3lr7ocPxG7kA==
X-Google-Smtp-Source: APXvYqzeyNb16dPEjCkVmBtMh5caBJBGKo91VcHGLZKHPNSD5nRiCk1pJcF4RPBtbEVrq+xcQYHHZlXiwcUyrN8+Ke8=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr11818095lji.191.1572881630658;
 Mon, 04 Nov 2019 07:33:50 -0800 (PST)
MIME-Version: 1.0
References: <1572004167-24150-1-git-send-email-qianggui.song@amlogic.com>
 <1572004167-24150-2-git-send-email-qianggui.song@amlogic.com> <CACRpkdZZpc0yrewfseG3PUXgvV3H9XED25Ej21VeMYn8cUxasg@mail.gmail.com>
In-Reply-To: <CACRpkdZZpc0yrewfseG3PUXgvV3H9XED25Ej21VeMYn8cUxasg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:33:39 +0100
Message-ID: <CACRpkdZbvdVfLAmfPRXrrZCvyNCJWHkJCE_SBCb9W=O2UpMxrQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] pinctrl: add compatible for Amlogic Meson A1 pin controller
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 4, 2019 at 4:31 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Oct 25, 2019 at 1:49 PM Qianggui Song <qianggui.song@amlogic.com> wrote:
>
> > Add new compatible name for Amlogic's Meson-A1 pin controller
> > add a dt-binding header file which document the detail pin names.
> > Note that A1 doesn't need DS bank reg any more, use gpio reg as
> > base.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>
> Patch applied.

I see there are still comments on the code patches but that is
fine, we can merge these bindings anyway. Just resend the
remaining 3 patches when you repost.

Yours,
Linus Walleij
