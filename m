Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0869EC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 13:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1B75207E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 13:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qehfjqnl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgAGN0U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 08:26:20 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35023 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGN0T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 08:26:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so38879777lfr.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9djqwGIJf2I22OzfnRj3IuEtZ6zVvwdwNk4Hj6ZFA70=;
        b=qehfjqnlIKGhemdvcDzaHIWgPnMIKeEq9JYcoVJcdsSy8Wat4sbe4iABBcAk+56lCq
         n/niykJ5zW3gXIkUyKPDN2QY7xguV1vGofNnIaCmEItNPGFPAFKzl6aFKSLFUfGlhEBc
         h83Je2A3rbiMS+3FWD3mF39kdkdMn9H0hF4C91J4sYY3P9vSbioZkYKUH/HwI8hRXNdg
         dUWKMOcIYgJ6ExKWgP4K1ESqWNneUFp7hc00BfWmQzYO9XUdON/YZbPX4w2Ecr6ckL1J
         j+Q4ONZ5p8qiSABW176nzeVQOcpfF9kkhO5Kr12axgHB4S9HbTwYXs7drtn3eD4Heeu/
         UmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9djqwGIJf2I22OzfnRj3IuEtZ6zVvwdwNk4Hj6ZFA70=;
        b=h2t7INWdJGNUSuA1b+k7thbZAwnyjFU/WySbos9gZnRDA/bsz6wbtgnMrkhs662YOf
         tfgxBa/pbM6jDEs8vrDBZMLPcFjHs922qwnp+SJt1OZrFX2RLc/XzH0kMrl5Gn/YYlI6
         QfpZsK8VuapCdLW7mbIBbHiKAksynpHYHCf1g4zIG618iLBZBFepEDnmNC7LJeGT5Iq9
         MUeiTy932TwyWNz8Bi/Js5YIKyEjEzxyhFpHw/5T2q16gqP23wPX4ZGv4i796jEaKbJw
         6qs0MpO/IjfZm4kJMvNyVc7QvN5KW1VlA1Ct4u1hRmu4POyloKutfYimmsSB2QmnVjHE
         sSgA==
X-Gm-Message-State: APjAAAUqasAPFuIsdwSyzCmxDgXmAT4nPFIf3KURLC79vREinnClxrmU
        kAMG2d9k/SIYpCqjcfnoyCJh3GtXh/l8WQ9lXe8lXQ==
X-Google-Smtp-Source: APXvYqzkfn0LApP777P/NTsWuXQs9WqemFpwgDX6Y8xe92X1MAhfleO+4i8GW0Pi/uidnD4K7AZauJF4tdGd9SZmZZc=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr58785651lfp.133.1578403577691;
 Tue, 07 Jan 2020 05:26:17 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
 <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com> <1578399400.16092.14.camel@mtkswgap22>
In-Reply-To: <1578399400.16092.14.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 14:26:06 +0100
Message-ID: <CACRpkdYEq4FR07LyUSXRzPuQ=HXox7FJm+ABww0hvCYbHmQGkA@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 7, 2020 at 1:16 PM Light Hsieh <light.hsieh@mediatek.com> wrote:

> Use of "bias-pull-down = <MTK_PUPD_SET_R1R0_XX>" had already been
> described in
> Documentation/devicetree/binding/pinctrl/pinctrl-mt65xx.txt.
> Previous MediaTek chips using pinctrl-mtk-common.c had already use such
> binding. This is so-called backward compatibility.
>
> Besides, according to
> Documentation/devicetree/binding/pinctrl/pincfg-node.yaml, bias-pull-up
> and bias-pull-down can have an optional argument to select pull strength
> when supported by hardware.

That's right, I was wrong about this. This should be fine to use.

> So, I think the propose of using "mediatek,pull-up-adv" and
> "mediatek,pull-down-adv" is not necessary. However, I fail to stop
> upstream of using "mediatek,pull-up-adv" and "mediatek,pull-down-adv" in
> pinctrl-mtk-common-v2.c.

Let's see what Sean says, I am fine with the patch set in general.

Yours,
Linus Walleij
