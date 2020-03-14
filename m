Return-Path: <SRS0=X1fx=47=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2102C10DCE
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Mar 2020 02:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A0E920663
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Mar 2020 02:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="OeHxhrJx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgCNCPD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 22:15:03 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64444 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgCNCPD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 22:15:03 -0400
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02E2Eklt024324
        for <devicetree@vger.kernel.org>; Sat, 14 Mar 2020 11:14:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02E2Eklt024324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584152087;
        bh=340svhN800T2tL7lQwgD39Edrp37kk1kfHafjXxduD4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OeHxhrJxxWF2ikFgA5ueTvT4IzvtJjv+S+NYU6w1tHxL5CwOqlT2liFzwo/dSjB3A
         orswaNdSbrHzoNchczjj4HqUACPKIgqnIkwkv8b9prePjhy7vPQXGUHNdklr865Lfc
         aTtfIb/QrvfOMN/4uk+F+FKwXZLXdov9QgsGdP0mivBkhhfAE80WdqOm7fpPPDkkan
         SPfDNSe2tMEDS/P8fVB2VN6kZ7n8WLkI1cimwIAgn8Q7b58ZF/3k7m7/uo0taLMKGy
         Htwah58zs8H62PXaXglXaRnsyG+hufdITHM2jDwWutBtW+tUkibZGW/MpGBLysflXE
         UaIMOXi8WEtfw==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id o124so3313120vkc.4
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 19:14:47 -0700 (PDT)
X-Gm-Message-State: ANhLgQ02ocl6msi1qDPuXJiVOr77JWnKivg/5NQYEJPKGbeywUGe9HCZ
        AvO7lF0vNtz0UxQjWtTg+jJbg0tO/xS1uqZVEOw=
X-Google-Smtp-Source: ADFU+vsTXrIehdH+8pQ7jb2b+XNZrUl+uiqcXs30gckO7t4OrY3ahwS7gVeukdvd00gtPleg1Li7o6ITtpPCTHoRftI=
X-Received: by 2002:a1f:900c:: with SMTP id s12mr11189857vkd.96.1584152085998;
 Fri, 13 Mar 2020 19:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com> <1584061096-23686-2-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1584061096-23686-2-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 14 Mar 2020 11:14:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCOhZ5BMWWCA1zKep-sXra1pBBTxjsDp816k8Ph1m1Pw@mail.gmail.com>
Message-ID: <CAK7LNASCOhZ5BMWWCA1zKep-sXra1pBBTxjsDp816k8Ph1m1Pw@mail.gmail.com>
Subject: Re: [PATCH 01/10] ARM: dts: uniphier: Add XDMAC node
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Add external DMA controller support implemented in UniPhier SoCs.
> This supports for Pro4, Pro5 and PXs2.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  arch/arm/boot/dts/uniphier-pro4.dtsi | 8 ++++++++
>  arch/arm/boot/dts/uniphier-pro5.dtsi | 8 ++++++++
>  arch/arm/boot/dts/uniphier-pxs2.dtsi | 8 ++++++++
>  3 files changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
> index 2ec04d7..a1bfe0f 100644
> --- a/arch/arm/boot/dts/uniphier-pro4.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
> @@ -426,6 +426,14 @@
>                         };
>                 };
>
> +               xdmac: dma-controller@5fc10000 {
> +                       compatible = "socionext,uniphier-xdmac";
> +                       reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;



This is odd.
<0x5fc20000 0x800> causes reg overwrap with
aidet@5fc20000 below.



> +                       interrupts = <0 188 4>;
> +                       dma-channels = <16>;
> +                       #dma-cells = <2>;
> +               };
> +
>                 aidet: aidet@5fc20000 {
>                         compatible = "socionext,uniphier-pro4-aidet";
>                         reg = <0x5fc20000 0x200>;
> diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
> index ea3961f..ecab061 100644
> --- a/arch/arm/boot/dts/uniphier-pro5.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
> @@ -408,6 +408,14 @@
>                         };
>                 };
>
> +               xdmac: dma-controller@5fc10000 {
> +                       compatible = "socionext,uniphier-xdmac";
> +                       reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> +                       interrupts = <0 188 4>;
> +                       dma-channels = <16>;
> +                       #dma-cells = <2>;
> +               };
> +
>                 aidet: aidet@5fc20000 {
>                         compatible = "socionext,uniphier-pro5-aidet";
>                         reg = <0x5fc20000 0x200>;
> diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> index 13b0d4a..6e60154 100644
> --- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
> +++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
> @@ -508,6 +508,14 @@
>                         };
>                 };
>
> +               xdmac: dma-controller@5fc10000 {
> +                       compatible = "socionext,uniphier-xdmac";
> +                       reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> +                       interrupts = <0 188 4>;
> +                       dma-channels = <16>;
> +                       #dma-cells = <2>;
> +               };
> +
>                 aidet: aidet@5fc20000 {
>                         compatible = "socionext,uniphier-pxs2-aidet";
>                         reg = <0x5fc20000 0x200>;
> --
> 2.7.4
>


--
Best Regards

Masahiro Yamada
