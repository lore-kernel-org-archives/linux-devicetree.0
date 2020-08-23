Return-Path: <SRS0=sXX/=CB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0933BC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 22:59:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D06A920724
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Aug 2020 22:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="xUqk7lJm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgHWW7C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 23 Aug 2020 18:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgHWW7A (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 23 Aug 2020 18:59:00 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629E5C061573
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2020 15:59:00 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id v6so6824470iow.11
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2020 15:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yMBkmv0QmaZUXjMTcydv1MvAQ17m/air8AA2TKonhbk=;
        b=xUqk7lJmfQL+W6Y/yVEN1nr4YOva5j95dPVccDsw4YrsizctfrTagnEDzeYuiv7CO3
         bmCwF9r81iE+EN9gz1U8xyFIbgQHWFnENIurKB/4PvDuKkFuQbN6qlFwY0FpeGtvd+6V
         35t8bELtqc+1fpUkc/KHGrMgMDpwSH7P5ef/0/YYFwvB5PTqfMkD/WqmxMebAvtWHbZf
         yV2sbG0Y7qAN4o5NCfkcA84LhQC8M6TPsxoXuwHnSwm3OfV4mddWJVFX94bsxVG++Z/j
         /hKt7w09ivoOfqHY7sQatOvc8ulYpCFsd2R15v5ZfqTflzSQjbTbLqdPwUg8nhsTNgIV
         t0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yMBkmv0QmaZUXjMTcydv1MvAQ17m/air8AA2TKonhbk=;
        b=raUW0o7YTSQzQ2tAtUUffEK/95LqXklUU/BOKgkrq/kuHWGmHhjKOsAvURePvkdh0m
         3ikShJiD3rgZF/hxwMYSkJ7ldLdB2ucgG3U4+3/yNkQ7v1XMyW5wplpxXwje8aJGLXO6
         CNBJpJzB7V2PyNoypvFz78henMLAtGsnwkEhutuG1IsSj86EuOqEVKVTK1eV5E34mhlh
         ZIUp6dcho5QjSV0W2HkfuNpl8O5UX3ngGNmhL5jTR8QH4eWMasTTkEjV710q3vL0WaU8
         hVKCMg1cxApUbT90v+lwu7pxT3AMHam+uGiPfIJvhy4f4vHzqXaYWIEKRLhEn7yNOIzd
         0/8g==
X-Gm-Message-State: AOAM532m0V9d6MDGR+6k8snHspgzhkTEssKC7LIgGnf8rAZ/vn/T6AfC
        R1D+CLbPH/leMpXYVyYm0JzNzIz5Wce2+LnfSBu00A==
X-Google-Smtp-Source: ABdhPJxZDAxn1LzOKezHkNZB1x2PKPPIIfZnkKnRgW8p3oI1Zv5UOzASaFY2I9OCzjHFeqCyhCTIWI/uqplIdTc/Qrk=
X-Received: by 2002:a02:730b:: with SMTP id y11mr2987869jab.126.1598223539443;
 Sun, 23 Aug 2020 15:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200817065654.4419-1-krzk@kernel.org> <20200823014600.GH30094@dragon>
 <20200823084241.GA2886@kozik-lap>
In-Reply-To: <20200823084241.GA2886@kozik-lap>
From:   Olof Johansson <olof@lixom.net>
Date:   Sun, 23 Aug 2020 15:58:48 -0700
Message-ID: <CAOesGMhL887y5WaW=yM8Bh9RZGsO6mZzC=Giv_Ai4=_Z=YZhAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: defconfig: Enable USB gadget with configfs
To:     Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        ARM-SoC Maintainers <arm@kernel.org>,
        SoC Team <soc@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Sun, Aug 23, 2020 at 1:42 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sun, Aug 23, 2020 at 09:46:01AM +0800, Shawn Guo wrote:
> > On Mon, Aug 17, 2020 at 08:56:53AM +0200, Krzysztof Kozlowski wrote:
> > > USB OTG connections are pretty common for embedded and development
> > > boards, for example to have networking or serial access to the device.
> > > Build as a module the USB gadget configfs options so the defconfig can
> > > be used in such development configurations.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > Applied both, thanks.
>
> Thanks, although few days ago I got confirmation from patchwork that
> Olof already applied them to arm-soc.  I cannot find them in arm-soc
> or next trees, though.
>
> Dear Olof,
> Did you pick these up already?

Yes, I applied them to the arm/fixes in the soc tree:
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=arm/fixes


-Olof
