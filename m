From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add support for ZII i.MX7 RPU2 board
Date: Wed, 3 Apr 2019 19:56:53 -0300
Message-ID: <CAOMZO5BZCGzJddFdbXKFYu8YPf-sWrpidf-B8JKi-KXPFR4Kmg@mail.gmail.com>
References: <20190327064150.31549-1-andrew.smirnov@gmail.com> <20190327064150.31549-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327064150.31549-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

This looks good. Only some minor comments:

On Wed, Mar 27, 2019 at 3:41 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7d-zii-rpu2.dts
> @@ -0,0 +1,936 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
Shawn mentioned on a prior submission of mine that this empty line is
not needed.

> +       cs2000_ref: cs2000-ref {

generic node name, please.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24576000>;
> +       };
> +
> +       cs2000_in_dummy: cs2000-in-dummy {

generic node name, please.

> +&ecspi1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_ecspi1>;
> +       status = "okay";
> +
> +       cs-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;

status property usually is the last one. So please move cs-gpios prior
to status.

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

> +&i2c1 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       status = "okay";
> +
> +       pmic: pfuze3000@8 {

pmic@8

Reviewed-by: Fabio Estevam <festevam@gmail.com>
