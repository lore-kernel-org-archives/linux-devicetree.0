From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V4 3/6] ARM: dts: imx6sx-sabreauto: add IO expander
 max7310 support
Date: Wed, 25 Apr 2018 18:46:13 -0300
Message-ID: <CAOMZO5Dm6rcEe=zAJ9_nqKce3g2tdyWPqb=Uv-N5nfc_96jc-g@mail.gmail.com>
References: <1524634571-5914-1-git-send-email-Anson.Huang@nxp.com> <1524634571-5914-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524634571-5914-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 25, 2018 at 2:36 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

> +&i2c3 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3_2>;
> +       status = "okay";
> +
> +       max7310_a: gpio@30 {
> +               compatible = "maxim,max7310";
> +               reg = <0x30>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +
> +       max7310_b: gpio@32 {
> +               compatible = "maxim,max7310";
> +               reg = <0x32>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };

Please also add the users for the MAX7310 pins, such as Ethernet PHY.
