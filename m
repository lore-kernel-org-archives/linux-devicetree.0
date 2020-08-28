Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93E3C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 14:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9180D2086A
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 14:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDwFjpBr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgH1OEI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 10:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgH1OEB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 10:04:01 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19551C06121B
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 07:04:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w14so1445123ljj.4
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rldKsSyO8Mg537CVV+Im8ZTuxYELV9OmrakV1T0wY/Q=;
        b=PDwFjpBrjMGZqRuXHVqS7hGcWTYKK0nnG4+t4VnDXwrYPVxegILF8fCM+bL5bC5R+i
         yPp4FcOpKsEi5sKQTlyxGO4JUuKD623n+0yu9tNbb4ni1xLpESNAIsjp7YXtV6+VxpNx
         vCzX1BsPAV5VmshKr5Jye4VpJNFyO1zvmS/SEHGP4vSRYSUv7un36gcDvaT/Nn13fpE7
         E9ofE5OgFTmcolusEV9tQPn0dxje6oeKeERTdgVT5N1u0q8RENHMujOoqFJgcHYajb4G
         7fYT2amLIXBG6J73nzW/c/7zGDIyT8/CJZ6+IL/UkEHiwyxFLZEHJceh25ux6KmWERMr
         reaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rldKsSyO8Mg537CVV+Im8ZTuxYELV9OmrakV1T0wY/Q=;
        b=YlEFUMjXvTWyl3oIhWbwhauldFONG1GPvMtDhvvCkcaqowZBTxd6tBPJrt3Q2rV8fS
         0PlK1sZ8S8oI8DURwgsFvTNNpyxzY1YTvw7gXsSCUTa3odYMRJc76NAd9/jY8sdFiCiZ
         L6lsi0aGrrLU113dyu8GLyvs9IKcC+b4eOtZ5RVKJ9AeiDQbraeaZFN7l4B7u/vm5gdb
         uddJOKkIFxtPp32Y+sn+2bj24cHXEJqJwuIt4IIT5/5ai6sQflvhFNOhWxHrtIWyAqJ7
         TESoKczDT9uRoaALMBk3WMzLXm+2YsZcnsUpWaNSYhTIXoFL8ZrL41kaK870vEPqRTDR
         P5/w==
X-Gm-Message-State: AOAM533kKa23Rq2cQRvwB2zBrby7J4ppjq1vxAs+bm5SMrN3/JM6/UZA
        LSHdfKiEc14hsrr2bPsmzAd9ADJjyUxLOS2fEGzLMg==
X-Google-Smtp-Source: ABdhPJy/lRwhYXIy9Li0MsIsJNiilVbU4bVGVdfEhrtNhbXGJ6I+YewRcrBJgEQDzRS6qeXXRhZzPUjCB/O3NeqcRnI=
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr1020983ljo.286.1598623439418;
 Fri, 28 Aug 2020 07:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200826183805.19369-1-andre.przywara@arm.com> <20200826183805.19369-3-andre.przywara@arm.com>
In-Reply-To: <20200826183805.19369-3-andre.przywara@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:03:48 +0200
Message-ID: <CACRpkdZx3GUaAk=2pEEEGvxH6nUt-UVZh=mTG1VV9ZBevGVU5w@mail.gmail.com>
Subject: Re: [PATCH 2/6] ARM: dts: arm: Fix SP804 users
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 26, 2020 at 8:38 PM Andre Przywara <andre.przywara@arm.com> wrote:

> The SP804 DT nodes for Realview, MPS2 and VExpress were not complying
> with the binding: it requires either one or three clocks, but does not
> allow exactly two clocks.
>
> Simply duplicate the first clock to satisfy the binding requirement.
> For MPS2, we triple the clock, and add the clock-names property, as this
> is required by the Linux primecell driver.
> Try to make the clock-names more consistent on the way.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

This looks good to me, shall I simply apply this patch to my
Versatile tree (I suppose Sudeep should ack it too) or are
you sending it upstream to the soc tree?

Yours,
Linus Walleij
