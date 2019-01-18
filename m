From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx6: Add support for Phytec phyBOARD
 i.MX6UL Segin
Date: Fri, 18 Jan 2019 19:18:55 -0200
Message-ID: <CAOMZO5ASTUDfKkghXq5FftM8-XNztXCYpmdOU9CVfyX3pgKxxA@mail.gmail.com>
References: <20190118194812.3319-1-martyn.welch@collabora.com> <20190118194812.3319-2-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118194812.3319-2-martyn.welch@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <s.riedmueller@phytec.de>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Christian Hemp <c.hemp@phytec.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Martyn,

On Fri, Jan 18, 2019 at 5:49 PM Martyn Welch <martyn.welch@collabora.com> wrote:

> +       /*
> +        * Set the minimum memory size here and
> +        * let the bootloader set the real size.
> +        */
> +       memory {

Need to pass device_type = "memory";

> +               reg = <0x80000000 0x8000000>;
> +       };
> +&uart1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_uart1>;
> +       status = "okay";
> +};
> +
> +&iomuxc {
> +       pinctrl-names = "default";

Uneeded line.

> +
> +       pinctrl_enet1: enet1grp {
> +&iomuxc {
> +       pinctrl_gpio_keys: gpio_keysgrp {
> +               fsl,pins = <
> +                       MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00      0x79
> +               >;
> +       };
> +
> +       pinctrl_user_leds: user_ledsgrp {
> +               fsl,pins = <
> +                       MX6UL_PAD_JTAG_MOD__GPIO1_IO10          0x79
> +                       MX6UL_PAD_GPIO1_IO01__GPIO1_IO01        0x79
> +               >;
> +       };
> +};
> diff --git a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> new file mode 100644
> index 000000000000..83cdf4fa10c0
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016 PHYTEC Messtechnik GmbH
> + * Author: Christian Hemp <c.hemp@phytec.de>
> + */
> +
> +/dts-v1/;
> +#include "imx6ul-phytec-pcl063.dtsi"
> +#include "imx6ul-phytec-phyboard-segin.dtsi"
> +#include "imx6ul-phytec-peb-eval-01.dtsi"
> +
> +/ {
> +       model = "Phytec phyBOARD-Segin i.MX6 UltraLite Full Featured";
> +       compatible = "phytec,imx6ul-pbacd10", "phytec,imx6ul-pcl063",
> +                    "fsl,imx6ul";

Better keep it in a single line?

> +&ecspi3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ecspi3>;
> +       cs-gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +
> +       spidev@0 {
> +               compatible = "spidev";

Doesn't the kernel complain about spidev dts nodes?

> +};
> diff --git a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi
> new file mode 100644
> index 000000000000..bccabb84c9f6
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016 PHYTEC Messtechnik GmbH
> + * Author: Christian Hemp <c.hemp@phytec.de>
> + */
> +
> +/ {
> +       model = "Phytec phyBOARD-Segin i.MX6 UltraLite";
> +       compatible = "phytec,imx6ul-pbacd-10", "phytec,imx6ul-pcl063",
> +                    "fsl,imx6ul";

Single line?

> +&i2c1 {
> +       codec: tlv320@18 {

Node names should be generic and label names specific, so:

 tlv320: codec@18

> +               compatible = "ti,tlv320aic3007";
> +               #sound-dai-cells = <0>;
> +               reg = <0x18>;
> +               AVDD-supply = <&reg_sound_3v3>;
> +               IOVDD-supply = <&reg_sound_3v3>;
> +               DRVDD-supply = <&reg_sound_3v3>;
> +               DVDD-supply = <&reg_sound_1v8>;
> +               status = "disabled";
> +       };
> +
> +       stmpe: stmpe@44 {

touchscreen@44
