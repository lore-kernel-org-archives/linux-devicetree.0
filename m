From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
Date: Thu, 5 Sep 2019 22:15:34 +0200
Message-ID: <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com> <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi Jianxin,

(it's great to see that you and your team are upstreaming this early)

On Thu, Sep 5, 2019 at 9:08 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
[...]
> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x8000000>;
> +               /*linux,usable-memory = <0x0 0x0 0x0 0x8000000>;*/
why do we need that comment here (I don't understand it - why doesn't
the "reg" property cover this)?

> +       };
> +};
> +
> +&uart_AO_B {
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> new file mode 100644
> index 00000000..4d476ac
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "amlogic,a1";
> +
> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {
> +               #address-cells = <0x2>;
> +               #size-cells = <0x0>;
only now I notice that all our other .dtsi also use hex values
(instead of decimal as just a few lines above) here
do you know if there is a particular reason for this?

[...]
> +               uart_AO_B: serial@fe002000 {
> +                       compatible = "amlogic,meson-gx-uart",
> +                                    "amlogic,meson-ao-uart";
> +                                    reg = <0x0 0xfe002000 0x0 0x18>;
the indentation of the "reg" property is off here

also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
aren't there any busses defined in the A1 SoC implementation or are
were you planning to add them later?


Martin
