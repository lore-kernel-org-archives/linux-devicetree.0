Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406F1C3A5A0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 13:21:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9FD20857
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 13:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChSBQwr+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDTNVU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 09:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726049AbgDTNVT (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 09:21:19 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFD3C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 06:21:19 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id g6so5353473ybh.12
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hz6KYcGv84bJO1Ds+5TVr6YXgSzuJd4prz26JPnnKhQ=;
        b=ChSBQwr+bOBQ/GPOYYPDg4iIBzOcH4FV0Bt6oV2T/ngBEjkIDiRdlq6UQt6iImxB8F
         ezTX/pTCArISETN1m00aks/kHs+eCuoJau0vEETcKpK73TYW/ksk86XpUOZDyWRhVUpi
         ph7qnjT5x7BTRUD/JH1y4bcyGReyOCkdSfxpu+UrPMlNDPnOX4DgBqSKLWAmh9E4wVUd
         eyGBfOrJEa+vw3N9Y9QdLnpjC0H1NGjjJ5YqYBa4HC1ZTxMI/1IODykcbg0fR8KWJDbY
         BkUWOHG0VIOf5Vq3DjXHPhNTrP6cpKbXCqeiuQyeMr0phM3rEihuem/ZAa9EO1A2wpyW
         q5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hz6KYcGv84bJO1Ds+5TVr6YXgSzuJd4prz26JPnnKhQ=;
        b=DtJ9/aGHnf6jHDSL/LixhabrBbG/g5KeHfTchWkBhVmJlTnbcaM9BMZ7rcKHct5YEj
         szhIqZ3xmPsAUnpJ0+6rLrBp3gBN4GpC9o2luh3LH0NAFgHmhuNNLXMlFpCnawlCruM0
         COY9/OUtPKjSOqUQYhK+2RyHnvj5CejtczjJChr4TreZtBOUkGDsPFNgGSOcgebLzJTF
         lqioB58WSXcxCwTkNp7qX82zredwSE4/rglRkcGJfchwJpmLSJHjAwB7niaMO2Z1wGIw
         0cW7by0eHFDPJVy3JiJtO6ZjzlrW23jX4HyNkyXdWCucUozOASDo5jBVcGLzyZg5OhXp
         pyZw==
X-Gm-Message-State: AGi0PuaE2Xa0ObXsxYy5kYfiDKm87qmV9J6tDJJxRFTXduZ0jblpAHP1
        qkEKQWAQdSH5DoHk9lvL9ojowOwW5wlU2vXJI+175w==
X-Google-Smtp-Source: APiQypKxJq0iDW27LTTAcdqxVKFrgf93YIPI4opqqPbgfS1b/8SB27Nw3gHoBP7ip6K2GBPkzf+747+XMJa33CoAhfs=
X-Received: by 2002:a25:504f:: with SMTP id e76mr20132091ybb.207.1587388874395;
 Mon, 20 Apr 2020 06:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <158737719165.27947.6617937231903079086.stgit@localhost>
 <20200420190749.b508c7e6d60a8203360178ec@linaro.org> <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
In-Reply-To: <CAK7LNAQtTPLdKN8cz842gvoS36GVQvk2ztahGp8XWoW3C8BzQg@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Mon, 20 Apr 2020 22:21:03 +0900
Message-ID: <CAA93ih0TNEfU_fiS_43+H6+UWrP2b8zh+PxMiiKBg3pZW8Jo8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: uniphier: Add support for Akebi96
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yamada-san,

Thank you for your review.

2020=E5=B9=B44=E6=9C=8820=E6=97=A5(=E6=9C=88) 20:16 Masahiro Yamada <masahi=
roy@kernel.org>:
>
> On Mon, Apr 20, 2020 at 7:08 PM Masami Hiramatsu
> <masami.hiramatsu@linaro.org> wrote:
> >
> > Add the device tree for Akebi96. Akebi96 is a 96boards certified
> > development board based on UniPhir LD20.
> > ( https://www.96boards.org/product/akebi96/ )
> >
> > This board has;
> > - MAX3421 USB-SPI chip on SPI port3 (for USB gadget port)
> > - Simple frame buffer with 1080p fixed resolution.
> > - I2S port which is connected to aout1b instead of aout1.
> > - 3 serial ports, only serial3 has CTS/RTS.
> > - No NAND, only eMMC on the board.
> > - OP-TEE support.
>
>
> I did not know "OP-TEE support" was board spec.

Indeed, that is a feature in the firmware on the board. Actually I was
wondering too, but as other boards already have OP-TEE firmware entry,
I decided to add it.

>
> Anyway, I decided to not worry about that.

Thanks :)

>
>
> You are adding lots of redundant code.
>
> Delete as follows.

Thanks for the comment. OK, I'll update it.

>
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
> b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
> index 84ff98d96751..aaf86162da84 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dts
> @@ -113,7 +113,6 @@ &serial2 {
>  &serial3 {
>         /* LS connector UART0 */
>         status =3D "okay";
> -       pinctrl-0 =3D <&pinctrl_uart3_ctsrts>;
>  };
>
>  &spdif_hiecout1 {
> @@ -155,11 +154,6 @@ &i2c1 {
>         status =3D "okay";
>  };
>
> -&audio {
> -       pinctrl-0 =3D <&pinctrl_aout1b>,
> -                   <&pinctrl_aoutiec1>;
> -};
> -
>  &spi3 {
>         status =3D "okay";
>         #address-cells =3D <1>;
> @@ -187,14 +181,10 @@ xirq10 {
>         };
>  };
>
> -&pinctrl {
> -       pinctrl_aout1b: aout1b {
> -               groups =3D "aout1", "aout1b";
> -               function =3D "aout1";
> -       };
> +&pinctrl_aout1 {
> +       groups =3D "aout1", "aout1b";
> +};
>
> -       pinctrl_uart3_ctsrts: uart3-ctsrts {
> -               groups =3D "uart3", "uart3_ctsrts";
> -               function =3D "uart3";
> -       };
> +&pinctrl_uart3 {
> +       groups =3D "uart3", "uart3_ctsrts";
>  };
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> index f93519793bfb..afa90b762ea9 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> @@ -337,7 +337,7 @@ gpio: gpio@55000000 {
>                                                      <21 217 3>;
>                 };
>
> -               audio: audio@56000000 {
> +               audio@56000000 {
>                         compatible =3D "socionext,uniphier-ld20-aio";
>                         reg =3D <0x56000000 0x80000>;
>                         interrupts =3D <0 144 4>;
>
>
> Lastly, is the pin-setting "aout1", "aout1b" correct ?

Yes, according to the schematics of Akebi96(*), it is connected to
aout1b(XIRQ*) instead of aout1(AO1*).

(*) https://www.96boards.org/documentation/enterprise/akebi96/hardware-docs=
/akebi96-schematics.pdf

Best regards,



>
>
>
> --
> Best Regards
> Masahiro Yamada



--
Masami Hiramatsu
