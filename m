Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683DBC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:42:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D3302074A
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 08:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHKltIvy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgH0ImF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 04:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgH0ImE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 04:42:04 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63CAC061264
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2020 01:41:35 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f26so5469102ljc.8
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2020 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNHfAA9c1rW26r8b3XpKfnc6lco5EHJf/DqyF4IQnJE=;
        b=uHKltIvyd+elQaC/FxlGXQPhY77dqRUJIAEshJY+kg7O7GiZ2doChKLmnuCNsojyFv
         XWtsBL+iSbkK8CgZnUZuhHi54H4Q0uzVSCYcroegnfH74cq2za0N2HiVhVHCXBNoh116
         h4qfeqqTJzbzVWBB5jB7eTXxVmkvRDGOW3chqmma9sG9zaIMxeonKjXa53Y1iNSR9PPJ
         NR3KdQfWrGh18axOYUFKhyF+SmJiwliOuOIoKNHIMQ1USfBBeRImeR0HQMDgd8KCR//y
         53hpVgiCHZS26XCIRnvHZtNmo/JGqXyH4gCWXsocXsa2NvlLXYUJMxdHybQf8sl9Ou7E
         YY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNHfAA9c1rW26r8b3XpKfnc6lco5EHJf/DqyF4IQnJE=;
        b=P+oaz40CIpdhh3jwB1w6MjEea1/fECQWhB7+WF4LHtvzLRzvO+JIaxm6PH9NGs7/v2
         hzjN3pdiQdv8CKK/qM83ALMUabsBlBh611vG6bMqOq5+YRR6Lz+Jy9yPuDkjhn9xlgJl
         8b1iCjb44jLAiXx6UVD/pHPbILFfjUBhplAuj9XjAIzeFqTUDaEtfEzNTb7NME5xdTJH
         dyixaYAOdr/xEQbCvv9nuyAEWgMiRe5FTow81GIv8LLoh0h3yTtfurenvP6CgmiEfRBP
         HBOza9Eppp0/lNUUjj3AEKgLiYxfIbkZR3ujCy1W7Yjyp5TgTbEIbNNkFX8ug6+lXS3A
         PKeQ==
X-Gm-Message-State: AOAM532nnzG+gQeXg9fAPb2a5phROSFmMJjxma5ypOjlATrHStzQ70x6
        xH/zlFGopU/YzLUHtE5HrQRXiAtXBohJQm2nKEKVPw==
X-Google-Smtp-Source: ABdhPJyoexWx0lQntuDJb/srGDOvASDiz+F6QURT3uDs8tPb+ypjy3GzKHexyWtdLFyvuDKYcfrpblkjhfpNDVWMtWA=
X-Received: by 2002:a2e:558:: with SMTP id 85mr1888049ljf.293.1598517694135;
 Thu, 27 Aug 2020 01:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
In-Reply-To: <cover.1596461275.git.cristian.ciocaltea@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 10:41:23 +0200
Message-ID: <CACRpkdaE0HZVN6QxMpA5+509iZ8kZ7A5S5XwuiRoyM=0dpGGSw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add Actions Semi S500 pinctrl support
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Aug 3, 2020 at 4:21 PM Cristian Ciocaltea
<cristian.ciocaltea@gmail.com> wrote:

> This patchset adds pinctrl support for Actions Semi S500 SoC.
>
> Pinmux functions are only accessible for pin groups while pinconf
> parameters are available for both pin groups and individual pins.
>
> The pinctrl driver has been verified using RoseapplePi, the SBC for
> which an initial support has been provided via:
> https://lore.kernel.org/lkml/cover.1592123160.git.cristian.ciocaltea@gmail.com/

No comments on the v2 patch set for more than 2 weeks so patches
applied. If people find issues we can make incremental
patches.

Thanks!
Linus Walleij
