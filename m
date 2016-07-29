From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: TS-4900: add basic device tree
Date: Fri, 29 Jul 2016 10:38:43 -0300
Message-ID: <CAOMZO5AxNvQJv+JyfZDhv97FLmXZ8aMhvG8oPh6N4N1Njsci3g@mail.gmail.com>
References: <1469641982-19558-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 <1469641982-19558-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469641982-19558-3-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, kernel@savoirfairelinux.com, Lucile Quirion <lucile.quirion@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Lucile,

This looks good. Only some minor nits:

On Wed, Jul 27, 2016 at 2:53 PM, Lucile Quirion
<lucile.quirion@savoirfairelinux.com> wrote:

> @@ -0,0 +1,21 @@
> +/*
> + * Copyright 2011 Freescale Semiconductor, Inc.
> + * Copyright 2011 Linaro Ltd.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */

If possible, please consider dual GPL/X11 license. Same applies to other files.

> +       reg_3p3v: regulator-3p3v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "3p3v";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;

This 'regulator-always-on' can be removed.

> +&i2c1 {
> +       status = "okay";
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default", "gpio";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +       scl-gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
> +       sda-gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;

Please move 'status = "okay"' line to the end of the properties list.
Same apply to other nodes in this file.
