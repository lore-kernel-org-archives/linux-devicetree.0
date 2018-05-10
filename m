From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: DTS: imx53: Add support for imx53 HSC/DDC boards
 from K+P
Date: Wed, 9 May 2018 22:45:39 -0300
Message-ID: <CAOMZO5BGfoLZDesBN=hQ5cr7Rkm1p6xyggwTvWNq6QKJZVyzeA@mail.gmail.com>
References: <20180509153428.1440-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509153428.1440-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 9, 2018 at 12:34 PM, Lukasz Majewski <lukma@denx.de> wrote:

> +               button@1 {
> +                       label = "Kaltstart";
> +                       linux,code = <64>; /* KEY_F6 */

If you include <dt-bindings/input/input.h> then you can simply do:

 linux,code = <KEY_F6 >;

> +                       gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +               };
> +               button@2 {
> +                       label = "PowerFailInterrupt";
> +                       linux,code = <65>; /* KEY_F7 */

Same here.
