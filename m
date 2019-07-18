From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: fsl: pico-pi: Add a device tree for
 the PICO-PI-IMX8M
Date: Thu, 18 Jul 2019 20:05:41 -0300
Message-ID: <CAOMZO5B-9+JnbfrTWP8GTuc0VcnDDPEZq-iXGbYVx9a6O9gwRg@mail.gmail.com>
References: <20190718121628.23991-1-andradanciu1997@gmail.com> <20190718121628.23991-2-andradanciu1997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718121628.23991-2-andradanciu1997@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andra Danciu <andradanciu1997@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Li Yang <leoyang.li@nxp.com>, sriram.dash@nxp.com, Lucas Stach <l.stach@pengutronix.de>, pankaj.bansal@nxp.com, Ping Bai <ping.bai@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Richard Hu <richard.hu@technexion.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andra,

On Thu, Jul 18, 2019 at 9:16 AM Andra Danciu <andradanciu1997@gmail.com> wrote:
>
> From: Richard Hu <richard.hu@technexion.com>

Please put a few words about the board and a link to its webpage, if available.

> The current level of support yields a working console and is able to boot
> userspace from NFS or init ramdisk.
>
> Additional subsystems that are active :
>         - Ethernet
>         - USB
>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Richard Hu <richard.hu@technexion.com>
> Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |   1 +
>  arch/arm64/boot/dts/freescale/pico-pi-8m.dts | 417 +++++++++++++++++++++++++++
>  2 files changed, 418 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/pico-pi-8m.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index c043aca66572..538422903e8a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -26,3 +26,4 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> +dtb-$(CONFIG_ARCH_MXC) += pico-pi-8m.dtb

The convention we use with imx dtbs is to put the SoC name first, so
that would become:

imx8mq-pico-pi.dtb


> +&iomuxc {

Please place iomuxc node as the last one.

> +&fec1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fec1 &pinctrl_enet_3v3>;
> +       phy-mode = "rgmii-id";
> +       pinctrl-assert-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;

This property does not exist.

> +       phy-handle = <&ethphy0>;
> +       fsl,magic-packet;
> +       status = "okay";
> +
> +       mdio {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ethphy0: ethernet-phy@1 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       reg = <1>;
> +                       at803x,led-act-blind-workaround;
> +                       at803x,eee-disabled;

These two properties do not exist.

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
> +               pinctrl-0 = <&pinctrl_pmic>;

pinctrl-names = "default" is missing

> +               gpio_intr = <&gpio1 3 GPIO_ACTIVE_LOW>;

This is not documented.

Please look at Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
for the valid bindings and also at
arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts for a
reference for adding the BD71837 support.

> +&A53_0 {
> +       operating-points = <
> +               /* kHz    uV */
> +               1500000 1000000
> +               1300000 1000000
> +               1000000 900000
> +               800000  900000

This is not needed as these operating points are already specified at
imx8mq.dtsi.
