From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mq nitrogen8m basic dts support
Date: Thu, 25 Jul 2019 11:07:34 -0300
Message-ID: <CAOMZO5AJwocYFaKtUBZbo0NareGmdAySwDjouxh5KMvnGz2o0A@mail.gmail.com>
References: <20190724171747.26076-1-dafna.hirschfeld@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724171747.26076-1-dafna.hirschfeld@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com, Gary Bisson <gary.bisson@boundarydevices.com>
List-Id: devicetree@vger.kernel.org

Hi Dafna,

On Wed, Jul 24, 2019 at 2:51 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> From: dafna <dafna.hirschfeld@collabora.com>
>
> Add basic dts support for i.MX8MQ NITROGEN8M.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Your From and Signed-off-by tags do not match.

> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../arm64/boot/dts/freescale/imx8mq-nitrogen8m.dts | 411 +++++++++++++++++++++
>  2 files changed, 412 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-nitrogen8m.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index c043aca66572..54a5c18c5c30 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -26,3 +26,4 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mq-nitrogen8m.dtb

Please keep it in alphabetical order.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen8m.dts b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen8m.dts
> new file mode 100644
> index 000000000000..cfd4915d2916
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen8m.dts

Isn't the 8m in the end redundant? What about just naming it
imx8mq-nitrogen.dts instead?

> +&a53_opp_table {
> +               opp-1500000000 {
> +                       opp-hz = /bits/ 64 <1500000000>;
> +                       opp-microvolt = <1000000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <900000>;
> +               };

Couldn't this be dropped and just use the operational points defined
at imx8mq.dtsi?

> +};
> +
> +&iomuxc {

We usually prefer to place iomux as the last node.

> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_hog>;

You could place the "pinctrl_hog: hoggrp {" here

> +&i2c1 {
> +       clock-frequency = <400000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c1>;
> +       status = "okay";
> +
> +       i2cmux@70 {
> +               compatible = "pca9546";

You missed the manufacturer string: "nxp,pca9546"

> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_i2c1_pca9546>;
> +               reg = <0x70>;
> +               reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               i2c1a: i2c1@0 {
> +                       reg = <0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg_arm_dram: fan53555@60 {

Node names should be generic:

regulator@60

> +                               compatible = "fcs,fan53555";
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_reg_arm_dram>;
> +                               reg = <0x60>;
> +                               regulator-min-microvolt =  <900000>;
> +                               regulator-max-microvolt = <1000000>;
> +                               regulator-always-on;
> +                               vsel-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
> +                       };
> +               };
> +
> +               i2c1b: i2c1@1 {
> +                       reg = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg_dram_1p1v: fan53555@60 {

regulator@60

> +                               compatible = "fcs,fan53555";
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_reg_dram_1p1v>;
> +                               reg = <0x60>;
> +                               regulator-min-microvolt = <1100000>;
> +                               regulator-max-microvolt = <1100000>;
> +                               regulator-always-on;
> +                               vsel-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +                       };
> +               };
> +
> +               i2c1c: i2c1@2 {
> +                       reg = <2>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg_soc_gpu_vpu: fan53555@60 {

regulator@60

> +&usdhc1 {
> +       bus-width = <8>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc1>;
> +       non-removable;
> +       vqmmc-1-8-v;

This property does not exist. Please remove it.
