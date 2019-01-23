From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: imx: Add support for Logic PD i.MX6QD EVM
Date: Wed, 23 Jan 2019 10:05:07 -0200
Message-ID: <CAOMZO5DvotRNhzeDEhz_jPVBmme8ozJ80KhjLH7mBGBd-K3BFg@mail.gmail.com>
References: <20190122164958.30666-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122164958.30666-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Adam,

On Tue, Jan 22, 2019 at 2:50 PM Adam Ford <aford173@gmail.com> wrote:

> +       tmp102@4a {

temperature-sensor@4a

> +               compatible = "ti,tmp102";
> +               reg = <0x4a>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_tempsense>;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +               #thermal-sensor-cells = <1>;
> +       };
> +
> +       tmp102@49 {

temperature-sensor@49

> +               compatible = "ti,tmp102";
> +               reg = <0x49>;
> +               interrupt-parent = <&gpio6>;
> +               interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +               #thermal-sensor-cells = <1>;
> +       };
> +
> +       at24@51 {

eeprom@51

> +               compatible = "atmel,24c64";
> +               pagesize = <32>;
> +               read-only;      /* Manufacturing EEPROM programmed at factory */
> +               reg = <0x51>;
> +       };
> +
> +       at24@52 {

eeprom@52

With these changes you can add:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
