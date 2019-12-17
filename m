Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B79C2D0C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 03:15:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC2C22176D
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 03:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fdc0aNMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfLQDP6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 22:15:58 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36697 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfLQDP6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 22:15:58 -0500
Received: by mail-ed1-f66.google.com with SMTP id j17so6861755edp.3
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 19:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n0ZmwEm6Y6IwUNMyCmLhctNeiL5+CELSaD2v2htB66s=;
        b=fdc0aNMBWxJTW2PEAzGSAqifbgjBKEGNsA83zAQTv4XrOWu8k3huPlqJjfm6WWctrt
         m4CRNAl6K2fyr+zXGgjS4R9A+artZqjGeUxuOsfVu9vXMB6oyAdGC6KwqqnzjhPb5RtE
         J0ycsSMk8hWQiHfKoA7ZxyFv25arNi9EhcHWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0ZmwEm6Y6IwUNMyCmLhctNeiL5+CELSaD2v2htB66s=;
        b=OSzh0ejS4OsmAIX+pRAVQs58n8F1jNu8Qf89cNiBlME6a/buEzZKAbEBNgPIaSLbGi
         V4S55rLSnOvmoOTny7SqNJvYveEvHfYkDEnis56uq1R6aXguADwzgiVamfzOLutkcsjw
         Q+VeL43V/mrpvgxJkVRgYonuX3w5+FByA/g1RHueA2eLJvV0h3rA6AKquPOdZA59rtOl
         V0OferddVKAizLAFrkzt908WPen1eZx8J9FHBuuLjDw3yfL7uTP2rqEQS7oBaacNWyLq
         U6/93e9VbP9xT//xz9Cs+p60wRGvk5UR/UZd+WTmKf/bmgyEAAFNgXOnED34IDAMzbOy
         /xKQ==
X-Gm-Message-State: APjAAAWGZ+xNraubI6yovUP2jD/FJbF7Fga1b7YFNH7dZ1LXNAES5TAL
        RfPYs2dIsQmsWh2bVf7F5CjyGofHUNwpJA==
X-Google-Smtp-Source: APXvYqzDaGXubHMA8XeASNpGZydr9YGbMRpp/DAevSoiDVCEIuYLDQ7NqoL2YFfK7yMlVy7JzC6SoQ==
X-Received: by 2002:a17:906:445:: with SMTP id e5mr2652511eja.218.1576552555261;
        Mon, 16 Dec 2019 19:15:55 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id w2sm1125748eja.49.2019.12.16.19.15.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 19:15:52 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id w15so9696944wru.4
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 19:15:52 -0800 (PST)
X-Received: by 2002:adf:f803:: with SMTP id s3mr33909150wrp.7.1576552551964;
 Mon, 16 Dec 2019 19:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com> <20191211112849.16705-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20191211112849.16705-2-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 17 Dec 2019 12:15:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
Message-ID: <CAAFQd5AnWZqjQEVvw8gv7JzOBHxJvsOWaGrbY8CXQ_87ap-ahA@mail.gmail.com>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Rob Herring <robh+dt@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>, shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, Dongchun,

On Wed, Dec 11, 2019 at 8:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> new file mode 100644
> index 0000000..18acc4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> @@ -0,0 +1,54 @@
> +* Omnivision OV02A10 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov02a10"
> +- clocks: reference to the eclk input clock
> +- clock-names: shall be "eclk"
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.8 volts
> +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> +                  if any. This is an active low signal to the OV02A10.

On the hardware level this pin is active high, i.e. the device is
powered down when the signal is high.

> +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> +              This is an active high signal to the OV02A10.

On the hardware level this pin is active low, i.e. the device is held
in reset when the signal is low.

However, there is some confusion around how the polarity flag in the
GPIO specifier is supposed to be used.

As per [1],

"The gpio-specifier's polarity flag should represent the physical
level at the GPIO controller that achieves (or represents, for inputs)
a logically asserted value at the device. The exact definition of
logically asserted should be defined by the binding for the device."

In this case it sounds like "logically asserted" means the device is
powered down or held in reset, respectively, which would suggest that
the specifiers should have GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW
respectively. The latter would cause the GPIO subsystem to invert the
values set by the consumers, which would then be confusing from the
driver implementation point of view.

Should the pin be renamed to "nreset"? It would change the meaning of
"logically asserted" to "device is not held in reset" and so
GPIO_ACTIVE_HIGH (or 0) would be the right value to use.

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/gpio/gpio.txt#L83

Best regards,
Tomasz

> +
> +Optional Properties:
> +- rotation: as defined in
> +           Documentation/devicetree/bindings/media/video-interfaces.txt,
> +           valid values are 0 (sensor mounted upright) and 180 (sensor
> +           mounted upside down).
> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +&i2c4 {
> +       ov02a10: camera-sensor@3d {
> +               compatible = "ovti,ov02a10";
> +               reg = <0x3d>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> +
> +               clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> +                       <&topckgen CLK_TOP_UNIVP_192M_D8>;
> +               clock-names = "eclk", "freq_mux";
> +               clock-frequency = <24000000>;
> +
> +               dovdd-supply = <&mt6358_vcamio_reg>;
> +               avdd-supply = <&mt6358_vcama1_reg>;
> +               dvdd-supply = <&mt6358_vcn18_reg>;
> +               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> +               reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> +               rotation = <180>;
> +
> +               port {
> +                       /* MIPI CSI-2 bus endpoint */
> +                       ov02a10_core: endpoint {
> +                               remote-endpoint = <&ov02a10_0>;
> +                               link-frequencies = /bits/ 64 <390000000>;
> +                       };
> +               };
> +       };
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd5847e..92a868c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12130,6 +12130,13 @@ T:     git git://linuxtv.org/media_tree.git
>  S:     Maintained
>  F:     drivers/media/i2c/ov13858.c
>
> +OMNIVISION OV02A10 SENSOR DRIVER
> +M:     Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:     linux-media@vger.kernel.org
> +T:     git git://linuxtv.org/media_tree.git
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> +
>  OMNIVISION OV2680 SENSOR DRIVER
>  M:     Rui Miguel Silva <rmfrfs@gmail.com>
>  L:     linux-media@vger.kernel.org
> --
> 2.9.2
