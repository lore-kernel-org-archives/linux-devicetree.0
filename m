From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4 05/11] ARM: dts: add imx7d soc dtsi file
Date: Tue, 21 Apr 2015 15:37:16 -0500
Message-ID: <CAL_JsqLP6ZE9_G1L9XzT-hR=k6Wzx80rKQMTdagp8q80ADN61g@mail.gmail.com>
References: <1429563933-3129-1-git-send-email-Frank.Li@freescale.com> <1429563933-3129-6-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1429563933-3129-6-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Frank.Li@freescale.com
Cc: lznuaa@gmail.com, Shawn Guo <shawn.guo@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Anson Huang <b20788@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 20, 2015 at 4:05 PM,  <Frank.Li@freescale.com> wrote:
> From: Frank Li <Frank.Li@freescale.com>
>
> Add i.mx7d support:
>         imx7d dtsi part
>
> Signed-off-by: Anson Huang <b20788@freescale.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 498 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 498 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx7d.dtsi
>
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> new file mode 100644
> index 0000000..dd391e2
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -0,0 +1,498 @@
> +/*
> + * Copyright 2015 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

You should dual license dts files with BSD or MIT for any non-Linux users.


> +
> +       timer {
> +               compatible = "arm,armv7-timer";
> +               arm,cpu-registers-not-fw-configured;

Fix your bootloader. This is for broken bootloaders which can't be fixed.

> +               interrupts = <GIC_PPI 13
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +                       <GIC_PPI 14
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +               interrupt-parent = <&intc>;
> +               clock-frequency = <8000000>;

Ditto.

Rob
