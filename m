Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4971EC432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 13:59:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07E312072C
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 13:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jLlqpxrT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfK3N7N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 08:59:13 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34495 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfK3N7N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 08:59:13 -0500
Received: by mail-oi1-f194.google.com with SMTP id l136so12801670oig.1
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 05:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knDG9q1Om7ylkLkDUnMttjzIm4kmfNCgMvz8qf3PAy0=;
        b=jLlqpxrTq0Xx9COlXnlECuoKTzj78CFge75eWGYPJ18t17/Gjqx9N1TLte+H2NUaxe
         yxXvd2fQDohV6UNhyEkdoTyVHOmguIB+zSXJ6p3Nhs8PBTTj861ePWHqioQlAdyxT6Eu
         TREjS6GEAgAuAl34PUb5rtxbpoeysgqos5Pm/hnCtRMh2p8+INLkRBxmvgNcBwIjjPRB
         SNgnFfJgtzFSbU66TysCdUQ02dRB4n9hpQJ5YbYuGETIImCfi73+pbJ9TB+uA+eWhlk3
         H0HcSE7WIht27rukA18DFw2YTCJm3cKowVUD6ShPJzHxAXlujOTlyWXjD6bJlY3LkzLc
         /u0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knDG9q1Om7ylkLkDUnMttjzIm4kmfNCgMvz8qf3PAy0=;
        b=BNhO5A4bl3Gux/vxwupCzucoX108j/qai4OCiIZBQ9o+BcRL1X5KksRTCalvRN+3gs
         ierTmM8Bcya8V4Mmz3/wlu+00/OA7/ePBdL6XRQOCNn1+YxG6MpurBTy8r5/qcViAML8
         rm+o2TgijVI2f4kWBW+kvUGLnHU0z9NXsjFbNKC43jr/9Mt51Va7IOfmWkiRmmWS8vkH
         PIdw4CTuMRZA1H9T4YBGOhEL/IbUlEBT5IwYqYr+K6ovEd9Osd4rOTJpvt/A/o6xMWav
         ciS3EkqCT+Bz3L1qIyl/vuIs3lFY9DCNu3VBAQVKyU92mN44cSGf7AN1tydgcok7I1/P
         6BfA==
X-Gm-Message-State: APjAAAXvQ0wAwaefIlfhOLva26xFBwzQ3TX8mk6w3Ahc/MfOx9qiy9qq
        srh4OTIcTSfkmOkSlhV3K0qhO97lCNCk+fn1bDJzTUiq
X-Google-Smtp-Source: APXvYqz1rUfi8sF0XztTmxtg04fI8l4L2p2Rz3H1ScN2vduYncwHYWNi7Ui0I0PKQZDwHbdGLpN4ydOzJDCQj9GYMJs=
X-Received: by 2002:aca:110f:: with SMTP id 15mr17097336oir.47.1575122351531;
 Sat, 30 Nov 2019 05:59:11 -0800 (PST)
MIME-Version: 1.0
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com> <20191130115824.31778-3-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130115824.31778-3-mohammad.rasim96@gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 30 Nov 2019 14:59:00 +0100
Message-ID: <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mohammad,

this patch should be third in the series.
the currently missing patch for the dt-bindings should be patch two.
you can take the following commit as an example:
effdd8a6b6ecb30b088f36ed0a1fb67cdc7610a9 ("dt-bindings: arm: amlogic:
add SEI Robotics SEI610 bindings")

On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> This patch adds support for the Videostrong KII Pro tv box which is
> based on the gxbb-p201 reference design
>
> The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
> which was merged recently into torvalds tree
>
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 84afecba9ec0..a795a170dcab 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> new file mode 100644
> index 000000000000..5d120e6ca338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-gxbb-p20x.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +/ {
> +       compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> +       model = "Videostrong KII Pro";
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               red {
> +                       label = "status";
this property seems to be deprecated now, see
Documentation/devicetree/bindings/leds/common.txt
but I'm not sure whether Kevin has made a decision yet when to not
accept "label" properties here anymore

> +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +               };
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               poll-interval = <20>;
> +
> +               button@0 {
please name this button-reset (even though we've done it wrong for
other boards in the past)
@0 indicates a unit-address, but the button has no address

> +                       label = "reset";
> +                       linux,code = <KEY_POWER>;
> +                       gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +};
> +
> +
> +
> +&uart_A {
> +       status = "okay";
> +       pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +       pinctrl-names = "default";
> +       uart-has-rtscts;
> +
> +       bluetooth {
> +               compatible = "brcm,bcm4335a0";
> +       };
> +};
> +
> +
> +
> +&ethmac {
> +       status = "okay";
> +       pinctrl-0 = <&eth_rmii_pins>;
> +       pinctrl-names = "default";
> +
> +       phy-handle = <&eth_phy0>;
> +       phy-mode = "rmii";
> +
> +       mdio {
> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               eth_phy0: ethernet-phy@0 {
> +                       /* IC Plus IP101GR (0x02430c54) */
> +                       reg = <0>;
> +                       reset-assert-us = <10000>;
> +                       reset-deassert-us = <10000>;
> +                       reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> +               };
thank you for switching to the new PHY bindings :)

assuming Kevin still accepts the LED "label" and you rename the button
node then you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(don't forget that we still need an additional dt-bindings patch though)


Martin
