From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: fsl: pico-pi: Add a device tree for
 the PICO-PI-IMX8M
Date: Sat, 20 Jul 2019 12:09:51 -0300
Message-ID: <CAOMZO5CAsTxEegEkBQ1uVaVD52WyLO7tV-GDSzYDDuEVpP6pmg@mail.gmail.com>
References: <20190719121430.9318-1-andradanciu1997@gmail.com> <20190719121430.9318-2-andradanciu1997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719121430.9318-2-andradanciu1997@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andradanciu1997 <andradanciu1997@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Dong Aisheng <aisheng.dong@nxp.com>, Li Yang <leoyang.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, pankaj.bansal@nxp.com, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Richard Hu <richard.hu@technexion.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andra,

Just realized one minor issue:

On Fri, Jul 19, 2019 at 9:14 AM andradanciu1997
<andradanciu1997@gmail.com> wrote:

> +&i2c1 {
> +       clock-frequency = <100000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       status = "okay";
> +
> +       pmic: pmic@4b {
> +               reg = <0x4b>;
> +               compatible = "rohm,bd71837";
> +               /* PMIC BD71837 PMIC_nINT GPIO1_IO12 */

Comment says gpio1 12...

> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pmic>;
> +               clocks = <&pmic_osc>;
> +               clock-names = "osc";
> +               clock-output-names = "pmic_clk";
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <3 GPIO_ACTIVE_LOW>;

but here you use gpio1 3 instead, so there is a mismatch.

Please check against the schematics and pick the correct one.

I would suggest removing the:
/* PMIC BD71837 PMIC_nINT GPIO1_IO12 */

comment entirely.

For the next version you can:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
