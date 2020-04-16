Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D553C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 21:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51D592076D
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587070994;
	bh=AWOEVk56lIsRUxVQRPyTZEvG11RZxuh/vr2RhTlLGD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=C05c5dtFEeoM1ozw4s26rpJa5xsSuYHUBk3UKUfJlyoyjYZseFMGlxJ/GVRqWtryd
	 4hRIP7R+7so+4Tw0/gVYuSdkNB5fD7QIHdJF0kwVDQetRmwxxzkmuBQtuCYxUTT9go
	 DabtlykGN1sSfOyXOWo8URCJNj9jBGCO+6WJcWvs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgDPVDN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 17:03:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:43740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgDPVDN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 17:03:13 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 746E522202;
        Thu, 16 Apr 2020 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587070991;
        bh=AWOEVk56lIsRUxVQRPyTZEvG11RZxuh/vr2RhTlLGD4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ko9mrQcHlyPTKydNkO0FBl2I/cve3riHVAl/dEdYpM5QejULPUa/9M0RtqFUF1BPy
         ki84B6VAl+UrWQpWN1+AhBfMqRk+2Z6Y+6122CjCZu9visr0b+wT1H56X8JlKLQ8HG
         wf6w6niqlaKNvgjYVb480dQKZbhxpD/Hga/ZDRk8=
Received: by mail-qt1-f179.google.com with SMTP id b10so130060qtt.9;
        Thu, 16 Apr 2020 14:03:11 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ2Kf8InUPqsv/CMQYhHPQSw3NJatpXV+8idj9n8r0trnVLrdrM
        m479VP6gxgtzHzG6NShiC7U2DZAtJt0JYHtFYw==
X-Google-Smtp-Source: APiQypJ9CPStA21dmEG4Pw+wkQToBwzb9UsuS9u7k0jxZmYkIMgnueVRGpvhBIMIR23CbNLC4h4N2QH9F4ePINdwkG0=
X-Received: by 2002:ac8:4907:: with SMTP id e7mr28698015qtq.300.1587070990286;
 Thu, 16 Apr 2020 14:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200117230855.25567-1-robh@kernel.org>
In-Reply-To: <20200117230855.25567-1-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 16 Apr 2020 16:02:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g@mail.gmail.com>
Message-ID: <CAL_JsqLDsoJteGC6BRMFvPZ0pekOU71eUNQUqh74we_BB7RZ_g@mail.gmail.com>
Subject: Re: [PATCH] arm: tegra: dts: Kill off "simple-panel" compatibles
To:     devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 17, 2020 at 5:08 PM Rob Herring <robh@kernel.org> wrote:
>
> "simple-panel" is a Linux driver and has never been an accepted upstream
> compatible string, so remove it.
>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Ping. This never got picked up.

> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts         | 3 +--
>  arch/arm/boot/dts/tegra124-venice2.dts         | 2 +-
>  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts  | 2 +-
>  arch/arm/boot/dts/tegra20-colibri-iris.dts     | 2 +-
>  arch/arm/boot/dts/tegra20-harmony.dts          | 2 +-
>  arch/arm/boot/dts/tegra20-medcom-wide.dts      | 2 +-
>  arch/arm/boot/dts/tegra20-paz00.dts            | 2 +-
>  arch/arm/boot/dts/tegra20-seaboard.dts         | 2 +-
>  arch/arm/boot/dts/tegra20-ventana.dts          | 2 +-
>  arch/arm/boot/dts/tegra30-apalis-eval.dts      | 2 +-
>  arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi          | 2 +-
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 +-
>  14 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index 97a5c3504bbe..8e48792ecdc8 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -46,8 +46,7 @@
>                         avdd-dsi-csi-supply = <&avdd_1v2_reg>;
>
>                         panel@0 {
> -                               compatible = "panasonic,vvx10f004b00",
> -                                            "simple-panel";
> +                               compatible = "panasonic,vvx10f004b00";
>                                 reg = <0>;
>
>                                 power-supply = <&avdd_lcd_reg>;
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
> index 7309393bfced..9004fb6dcede 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -1087,7 +1087,7 @@
>         };
>
>         panel: panel {
> -               compatible = "lg,lp129qe", "simple-panel";
> +               compatible = "lg,lp129qe";
>
>                 backlight = <&backlight>;
>                 ddc-i2c-bus = <&dpaux>;
> diff --git a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> index 3c0f2681fcde..37ad508b61d9 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-eval-v3.dts
> @@ -223,7 +223,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> index d8004d68efa0..af4740847769 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
> +++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
> @@ -205,7 +205,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
> index 1d96d92b72a7..02cd67ea2503 100644
> --- a/arch/arm/boot/dts/tegra20-harmony.dts
> +++ b/arch/arm/boot/dts/tegra20-harmony.dts
> @@ -665,7 +665,7 @@
>         };
>
>         panel: panel {
> -               compatible = "auo,b101aw03", "simple-panel";
> +               compatible = "auo,b101aw03";
>
>                 power-supply = <&vdd_pnl_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> index cda5448c2ace..c73510cd501c 100644
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> @@ -57,7 +57,7 @@
>         };
>
>         panel: panel {
> -               compatible = "innolux,n156bge-l21", "simple-panel";
> +               compatible = "innolux,n156bge-l21";
>
>                 power-supply =  <&vdd_1v8_reg>, <&vdd_3v3_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
> index 85fce5bc72d6..0151cdd09ffb 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -558,7 +558,7 @@
>         };
>
>         panel: panel {
> -               compatible = "samsung,ltn101nt05", "simple-panel";
> +               compatible = "samsung,ltn101nt05";
>
>                 ddc-i2c-bus = <&lvds_ddc>;
>                 power-supply = <&vdd_pnl_reg>;
> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
> index f91441683aad..376ecb6435f4 100644
> --- a/arch/arm/boot/dts/tegra20-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra20-seaboard.dts
> @@ -826,7 +826,7 @@
>         };
>
>         panel: panel {
> -               compatible = "chunghwa,claa101wa01a", "simple-panel";
> +               compatible = "chunghwa,claa101wa01a";
>
>                 power-supply = <&vdd_pnl_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
> index f44551e2d9d0..022649119821 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -611,7 +611,7 @@
>         };
>
>         panel: panel {
> -               compatible = "chunghwa,claa101wa01a", "simple-panel";
> +               compatible = "chunghwa,claa101wa01a";
>
>                 power-supply = <&vdd_pnl_reg>;
>                 enable-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
> index 749fc6d1ff70..b39c26806bf2 100644
> --- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
> +++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
> @@ -195,7 +195,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
> index 0be50e881684..e29dca92ba0a 100644
> --- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
> +++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
> @@ -196,7 +196,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> index 7ce61edd52f5..9048fdf4ad54 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> @@ -432,7 +432,7 @@
>         };
>
>         panel: panel {
> -               compatible = "chunghwa,claa101wb01", "simple-panel";
> +               compatible = "chunghwa,claa101wb01";
>                 ddc-i2c-bus = <&panelddc>;
>
>                 power-supply = <&vdd_pnl1_reg>;
> diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> index 5965150ecdd2..8e106e784dce 100644
> --- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
> @@ -159,7 +159,7 @@
>                  * edt,et057090dhu: EDT 5.7" LCD TFT
>                  * edt,et070080dh6: EDT 7.0" LCD TFT
>                  */
> -               compatible = "edt,et057090dhu", "simple-panel";
> +               compatible = "edt,et057090dhu";
>                 backlight = <&backlight>;
>                 power-supply = <&reg_3v3>;
>         };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> index a0385a386a3f..9f3206c63900 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
> @@ -990,7 +990,7 @@
>         };
>
>         panel: panel {
> -               compatible = "innolux,n116bge", "simple-panel";
> +               compatible = "innolux,n116bge";
>                 backlight = <&backlight>;
>                 ddc-i2c-bus = <&dpaux>;
>         };
> --
> 2.20.1
>
