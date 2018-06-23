From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: imx53: PPD: Add fixed-regulator information
Date: Sat, 23 Jun 2018 13:00:17 -0300
Message-ID: <CAOMZO5Bdh9d6nrX80xpkmFdFydfmazSkU+bwzNGFQFGz8dPAPA@mail.gmail.com>
References: <20180622145225.17883-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622145225.17883-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Fri, Jun 22, 2018 at 11:52 AM, Sebastian Reichel
<sebastian.reichel@collabora.co.uk> wrote:

> -       usbphy2: usbphy2 {
> +       usbphy2: usbphy-2 {

This node rename seems to be an unrelated change.

>                 compatible = "usb-nop-xceiv";
> +               vcc-supply = <&reg_3v3>;
>                 reset-gpios = <&gpio4 4 GPIO_ACTIVE_LOW>;
>                 clock-names = "main_clk";
>                 clock-frequency = <24000000>;
> @@ -208,8 +230,9 @@
>                 assigned-clock-parents = <&clks IMX5_CLK_OSC>;
>         };
>
> -       usbphy3: usbphy3 {
> +       usbphy3: usbphy-3 {

Ditto.
