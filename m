From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: fsl: pico-pi: Add a device tree for
 the PICO-PI-IMX8M
Date: Fri, 19 Jul 2019 08:19:43 -0300
Message-ID: <CAOMZO5Btu1Shou=dGRrG74e5UjHnh7NtR4+4ETK0t_1Zt48Crw@mail.gmail.com>
References: <20190719104802.18070-1-andradanciu1997@gmail.com> <20190719104802.18070-2-andradanciu1997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719104802.18070-2-andradanciu1997@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andradanciu1997 <andradanciu1997@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ping Bai <ping.bai@nxp.com>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <Michal.Vokac@ysoft.com>, Li Yang <leoyang.li@nxp.com>, sriram.dash@nxp.com, Lucas Stach <l.stach@pengutronix.de>, Vabhav Sharma <vabhav.sharma@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, pankaj.bansal@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Richard Hu <richard.hu@technexion.com>
List-Id: devicetree@vger.kernel.org

Hi Andra,

On Fri, Jul 19, 2019 at 7:48 AM andradanciu1997
<andradanciu1997@gmail.com> wrote:

> +       pmic: pmic@4b {
> +               reg = <0x4b>;
> +               compatible = "rohm,bd71837";
> +               /* PMIC BD71837 PMIC_nINT GPIO1_IO12 */
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pmic>;
> +               clocks = <&pmic_osc>;
> +               clock-names = "osc";
> +               clock-output-names = "pmic_clk";
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <3 GPIO_ACTIVE_LOW>;
> +               interrupt-names = "irq";
> +
> +               regulators {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

#address-cells and  #size-cells are not needed and they cause warnings with W=1:

  DTC     arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb
arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts:77.14-196.5: Warning
(avoid_unnecessary_addr_size):
/soc@0/bus@30800000/i2c@30a20000/pmic@4b/regulators: unnecessary
#address-cells/#size-cells without "ranges" or child "reg" property

Please remove them.
