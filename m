Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F513C10DCE
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 03:23:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEF7220637
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 03:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbgCKDXs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 23:23:48 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37057 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgCKDXs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 23:23:48 -0400
Received: by mail-ed1-f68.google.com with SMTP id b23so1106723edx.4
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 20:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ubNYkLFBm9LvnmdAtrDMZkV+T+QUMoRprRG4+zyFtg=;
        b=OTDfIsAILA0MNsjsEV3HQI/gMMSIHUcAPsOk4nNOT3sgG1cZT+00c6DnmaOpNiHNxn
         21tbc+y52Duo+2lupQsM5xhaiYhu+9ku2yKjPg1nkKmrUZUt7gsDzjfG1SMX5zSvcte7
         q/Q7f61Q8+qSSmc/aXK7b5Jrs4aB92XImBqnbN3bQIMkrGqZX1QNUx/ZktiyzPFyEVle
         i8CtTfgN47cGqef3laYuDAUTWUEWC8oReea6yw1XeQMCagFvICP1WWZGjPWSWW5AcMdk
         +CHdUNldOLwsVhnBA3zyL/Yx9PLuVbSbdEZqoGAV1B3G7lqiqNUBouJ7VL6qmJfVHxgH
         nkgQ==
X-Gm-Message-State: ANhLgQ37HO4vc7ioJ0Rn6camgarU14kVX53qnJjNIS3WOZ+iGbpVJrgc
        3MS7Nc4VXHgZ4tIDoCAOI2kh0npo8WQ=
X-Google-Smtp-Source: ADFU+vtdrIAblf3P1Ljq74Scx8jjIb2VPWDqvB/32JPizK5YivoMjeMG00HWgOoicKDx5ZHacwFXNA==
X-Received: by 2002:a50:cc9a:: with SMTP id q26mr896667edi.161.1583897025797;
        Tue, 10 Mar 2020 20:23:45 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id n9sm3000847ejz.87.2020.03.10.20.23.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 20:23:45 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id t11so708730wrw.5
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 20:23:45 -0700 (PDT)
X-Received: by 2002:a5d:5509:: with SMTP id b9mr1351435wrv.181.1583897024908;
 Tue, 10 Mar 2020 20:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200311010308.11880-1-andre.przywara@arm.com>
In-Reply-To: <20200311010308.11880-1-andre.przywara@arm.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Wed, 11 Mar 2020 11:23:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gMgLKRwsSVg0i+-uXPWQ_KJhtBdhktB7oOgo+2VAOFQ@mail.gmail.com>
Message-ID: <CAGb2v65gMgLKRwsSVg0i+-uXPWQ_KJhtBdhktB7oOgo+2VAOFQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sun8i: R40: Fix SPI2 and SPI3 MMIO addresses
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        JuanEsf <juanesf91@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 11, 2020 at 9:03 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> Copy&paste suggested an MMIO pattern that wasn't there, so the wrong
> MMIO base addresses for SPI2 and SPI3 sneaked in.
>
> Fix them, now double checked against the manual and similar SoCs.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 554581b79139 ("ARM: dts: sun8i: R40: Add SPI controllers nodes and pinmuxes")
> Reported-by: JuanEsf <juanesf91@gmail.com>

I posted a series fixing this, and some ordering issues yesterday:

https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=254199

I'll add the reported-by tag to my patch when applying.

ChenYu

> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index 8f09a24b36ec..8c4c4282a055 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -679,10 +679,10 @@
>                         #size-cells = <0>;
>                 };
>
> -               spi2: spi@1c07000 {
> +               spi2: spi@1c17000 {
>                         compatible = "allwinner,sun8i-r40-spi",
>                                      "allwinner,sun8i-h3-spi";
> -                       reg = <0x01c07000 0x1000>;
> +                       reg = <0x01c17000 0x1000>;
>                         interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&ccu CLK_BUS_SPI2>, <&ccu CLK_SPI2>;
>                         clock-names = "ahb", "mod";
> @@ -692,10 +692,10 @@
>                         #size-cells = <0>;
>                 };
>
> -               spi3: spi@1c0f000 {
> +               spi3: spi@1c1f000 {
>                         compatible = "allwinner,sun8i-r40-spi",
>                                      "allwinner,sun8i-h3-spi";
> -                       reg = <0x01c0f000 0x1000>;
> +                       reg = <0x01c1f000 0x1000>;
>                         interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks = <&ccu CLK_BUS_SPI3>, <&ccu CLK_SPI3>;
>                         clock-names = "ahb", "mod";
> --
> 2.14.5
>
