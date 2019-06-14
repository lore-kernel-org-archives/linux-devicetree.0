From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add ZII support for ZII i.MX7 RMU2 board
Date: Fri, 14 Jun 2019 09:52:04 -0700
Message-ID: <CAHQ1cqFcbs5feFzSjrwMWyNsSphuQy487_wsvRY_BKnS=x4b=w@mail.gmail.com>
References: <20190614080317.16850-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614080317.16850-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Bob Langer <Bob.Langer@zii.aero>, Liang Pan <Liang.Pan@zii.aero>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 1:03 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Add support for ZII's i.MX7 based Remote Modem Unit 2 (RMU2) board.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Bob Langer <Bob.Langer@zii.aero>
> Cc: Liang Pan <Liang.Pan@zii.aero>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
>  arch/arm/boot/dts/Makefile           |   1 +
>  arch/arm/boot/dts/imx7d-zii-rmu2.dts | 358 +++++++++++++++++++++++++++
>  2 files changed, 359 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx7d-zii-rmu2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5559028b770e..516e2912236d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -593,6 +593,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>         imx7d-sdb.dtb \
>         imx7d-sdb-reva.dtb \
>         imx7d-sdb-sht11.dtb \
> +       imx7d-zii-rmu2.dtb \
>         imx7d-zii-rpu2.dtb \
>         imx7s-colibri-eval-v3.dtb \
>         imx7s-mba7.dtb \
> diff --git a/arch/arm/boot/dts/imx7d-zii-rmu2.dts b/arch/arm/boot/dts/imx7d-zii-rmu2.dts
> new file mode 100644
> index 000000000000..10fdafe5e0e4
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7d-zii-rmu2.dts
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Device tree file for ZII's RMU2 board
> + *
> + * RMU - Remote Modem Unit
> + *
> + * Copyright (C) 2019 Zodiac Inflight Innovations
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/thermal/thermal.h>
> +#include "imx7d.dtsi"
> +
> +/ {
> +       model = "ZII RMU2 Board";
> +       compatible = "zii,imx7d-rmu2", "fsl,imx7d";
> +
> +       chosen {
> +               stdout-path = &uart2;
> +       };
> +
> +       gpio-leds {
> +               compatible = "gpio-leds";
> +               pinctrl-0 = <&pinctrl_leds_debug>;
> +               pinctrl-names = "default";
> +
> +               debug {
> +                       label = "zii:green:debug1";
> +                       gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +};
> +
> +&cpu0 {
> +       arm-supply = <&sw1a_reg>;
> +};
> +
> +&ecspi1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ecspi1>;
> +       cs-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +
> +       flash@0 {
> +               compatible = "jedec,spi-nor";
> +               spi-max-frequency = <20000000>;
> +               reg = <0>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +       };
> +};
> +
> +&fec1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_enet1>;
> +       assigned-clocks = <&clks IMX7D_ENET1_TIME_ROOT_SRC>,
> +                         <&clks IMX7D_ENET1_TIME_ROOT_CLK>;
> +       assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
> +       assigned-clock-rates = <0>, <100000000>;
> +       phy-mode = "rgmii";
> +       phy-handle = <&fec1_phy>;
> +       status = "okay";
> +
> +       mdio {

Ugh, missed

#address-cells = <1>;
#size-cells = <0>;

here. Will fix in v2.

Thanks,
Andrey Smirnov
