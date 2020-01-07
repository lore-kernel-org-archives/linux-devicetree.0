Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFCDC33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 10:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C269F2080A
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 10:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8e5zkbA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgAGKlK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 05:41:10 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36635 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgAGKlK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 05:41:10 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so54190893ljg.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UBtiNBdMZvnrnfPGqTIDF0mKwmvB3WgjS2DJzVGXsWA=;
        b=S8e5zkbAC4vGQyN2oQss8+zjnBiH2/1Oxd7//7o3rqWykwynawOBgCdO/acAzcuB5s
         mODoPHD8qcw1L3hjquQCkC0OrsKrcB77niLT521ZG6XitmsVfXMynWJ0GV5sUyh27+6c
         F5sa19WSHj3ogwD0IBzDD5qOUnOnWfXQhXVbCRpjMxcv40IymAx9IzzcIdDW78P3BMOI
         F6NvHOluAoPtlerKGz/DgXzJFBDujqnWB7hghFmAiTw91WKVMfFytwqCY4iPZ7wFzFsa
         INUIQKDoVJaPbk4IKdzkl3uWNrGDY013KPqlTmEjB5IbTXAtPRNjwCgsI97dA8rZ8Mmx
         4vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UBtiNBdMZvnrnfPGqTIDF0mKwmvB3WgjS2DJzVGXsWA=;
        b=eEYgP5XihfESOiMmTQcwtvMXMb9XCqcsLHM6X4j3Nb4bemhlRgZarbMKBINkTAM49R
         GSW+cJBsEv1LHYTVTRPogRKP6TB8Md50lTlyAdX6UXLXKXaNW5XbXof2oiukyYtx/HGX
         nEe+FyHQlQBEtF8Pi4R3wQf/akXDhxtbaNoGB8K+s885NrYdTjx/fb7ro/nKCTouZYDh
         xwr84QyhOkbXR/zHeXz7hi2dmWCse3lJHzvtOvV9YOT5Gy2xh/RgCW+U+h9QMQdq66ul
         a1J00TVM4nEsrf5pb6Rdqs8h1Q6oMCGrrllPCuqw16DoEAiCwcUqhNmPP5XHgJ+21K32
         7M2w==
X-Gm-Message-State: APjAAAU6SdjePr3yk08CVItG51H83zb0fU2Ee0DyMLYmSomNPIv4YDzv
        lnUw/vKMa7uNojXFfWae02IWg91DKXRe3k2vLtg/tg==
X-Google-Smtp-Source: APXvYqzPw/Qdx+sCdiOeNl65OnuQtCOolmEVElFYMMkBD7EgYjlKsv9P3YvfyZW4sD2cny18hKjAeDvhBrKHQUlYRoE=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr25961364ljm.251.1578393667915;
 Tue, 07 Jan 2020 02:41:07 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com> <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:40:57 +0100
Message-ID: <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To:     Light Hsieh <light.hsieh@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 31, 2019 at 2:41 PM Light Hsieh <light.hsieh@mediatek.com> wrote:

> Refine mtk_pinconf_set()/mtk_pinconf_get() for backward compatibility to
> previous MediaTek's bias-pull usage.
> In PINCTRL_MTK that use pinctrl-mtk-common.c, bias-pull setting for pins
> with 2 pull resistors can be specified as value for bias-pull-up and
> bias-pull-down. For example:
>     bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
>
> On the other hand, PINCTRL_MTK_PARIS use customized properties
> "mediatek,pull-up-adv" and "mediatek,pull-down-adv" to specify bias-pull
> setting for pins with 2 pull resistors.
> This introduce in-compatibility in device tree and increase porting
> effort to MediaTek's customer that had already used PINCTRL_MTK version.
> Besides, if customers are not aware of this change and still write devicetree
> for PINCTRL_MTK version, they may encounter runtime failure with pinctrl and
> spent time to debug.
>
> This patch adds backward compatible to previous MediaTek's bias-pull usage
> so that Mediatek's customer need not use a new devicetree property name.
> The rationale is that: changing driver implementation had better leave
> interface unchanged.

Are these devicetree bindings upstream, or are these bindings never
submitted for inclusion in the official device tree bindings?

I don't really want to encourage out-of-tree non-canonical device
tree experiments.

On the other hand I want running code.

I suppose if there is a solid use case for backwards compatibility
that also affect independent developers (such as people just
hacking around with these devices) then we could add it.

Yours,
Linus Walleij
