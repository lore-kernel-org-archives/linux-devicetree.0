Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F59C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 13:07:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEDBD246B0
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 13:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqvZPGiw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgB2NH6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 08:07:58 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46511 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgB2NH6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Feb 2020 08:07:58 -0500
Received: by mail-lj1-f196.google.com with SMTP id h18so6298119ljl.13
        for <devicetree@vger.kernel.org>; Sat, 29 Feb 2020 05:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTXTbcLqGzk+vxiic2xdZAKhi85aGcMjL5+CI+XDl9o=;
        b=lqvZPGiwNgY/6Rk/KYqjLNbsgAWCtdcQERvLsaN628nqmK68A/x0ohJBgJbZHBc24z
         AWuk9YEsVP7uD208dxYjEnvFib4V/ox3gDL36JTuU0HVm6qhLaK5Lt4zd90a9WISt8Ry
         z3kluZ/YtKUw5dLIxB7yE+rCGeWpRA1nFaNHJsEGdQ9jCb9DKcDMcETkvHEEr7yBnmV2
         bp0IcTaxqXtUC2s+HBkvAilB3hVq0eHNtoKtpQfeolw+GkvuFHvnaGmSNgdsNzYceStf
         q7WjwDAEJdTqtxaC3SQFT3snuYSIUfHKPFUB7aSgzEyBxa/qUBUKyIcY5HskfsoJodWz
         iLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTXTbcLqGzk+vxiic2xdZAKhi85aGcMjL5+CI+XDl9o=;
        b=I2brn9AfiEDBgfx6S6kI7XUpYnosmQD/iJhfoO4TsLFikLp+V3SKqILI/SGVkZA8e0
         g8Df5SUIV68r2iBcv28fY5deNCXOWPXzRDiNE3KMkWZ/ftqkcwWjjTU81gEWvITCNXp4
         TxFC5D2R/Y1fqbpTPhwgTEX5p52uIYuOgUkYjs/beF9/TOJ2QlSLfp3JjH4nGO30IyTV
         PR4glo4pgMynXfE1TSP2Be7kdwXuDrJbUU+xIbo8h4fonl3EyofLCxFgqr48srTwRWV5
         cu989Ye9itJ258+msQhjw9m3uc2su/TeP1bn0Gg6f9kmqp/1oq5JK8f8vpByoXBz5DFL
         mq3Q==
X-Gm-Message-State: ANhLgQ3leGjHi3CtvLTGrKky/rtQvLCYePrjdBGM/2s4ZIbXUgNWtx8Y
        Xg89jcCc71jWh2I0W00JFVzf/5IZ5VEli+s3Zys=
X-Google-Smtp-Source: ADFU+vuAjHxsXHjO8yLsCrKlJ+WeQ6jtz8pxqrobWbXo1PJyxc2p5LTY62oDIJXwndXkWHs8VMtQVu1MYbiHXAMJSnM=
X-Received: by 2002:a05:651c:cf:: with SMTP id 15mr6157364ljr.288.1582981676104;
 Sat, 29 Feb 2020 05:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20200229104347.11126-1-vitor@massaru.org>
In-Reply-To: <20200229104347.11126-1-vitor@massaru.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 29 Feb 2020 10:07:45 -0300
Message-ID: <CAOMZO5Ddg2VhXkrWTn6xAX0N8fDLCNFmccE+xrcvKeRmmRmotQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: add gpio-fan/thermal support for
 Google i.MX 8MQ Phanbell
To:     Vitor Massaru Iha <vitor@massaru.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Vitor,

Thanks for your patch.

On Sat, Feb 29, 2020 at 7:43 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> It was based on Google Source Code for Coral Edge TPU Mendel release:
> https://coral.googlesource.com/linux-imx/
>
> It was tested on Coral Dev Board using this command:
>   sudo stress --cpu 4 --timeout 3600
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  .../boot/dts/freescale/imx8mq-phanbell.dts    | 78 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  2 +-
>  2 files changed, 79 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> index 3f2a489a4ad8..fb9f208d1e41 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> @@ -35,6 +35,14 @@
>                 gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
>         };
> +
> +       fan: gpio_fan {

Underscores are not recommended in property names. Please use
"gpio-fan" instead.

> +               compatible = "gpio-fan";
> +               gpio-fan,speed-map = <0 0 8600 1>;
> +               gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;

Please add an entry for the pinctrl description of this GPIO.
It worked because GPIO is the default functionality of the pin after
POR, but we should better not rely on it (bootloaders may change it)
and explicitly it in the device tree.

> +               #cooling-cells = <2>;
> +               status = "okay";
> +       };
>  };
>
>  &A53_0 {
> @@ -374,3 +382,73 @@
>                 >;
>         };
>  };
> +
> +&tmu {

Please keep the nodes in alphabetical order.


> +       throttle-cfgs {
> +               throttle_devfreq: devfreq {
> +                       throttle,max_state = <2>;

I don't see this property documented anywhere. Should it be removed?

Thanks
