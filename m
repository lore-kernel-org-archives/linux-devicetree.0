From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: imx6qdl-sabresd: add light sensor support
Date: Wed, 5 Dec 2018 10:15:06 -0200
Message-ID: <CAOMZO5ACrqY9FusUG7E-vMWJ4pKpVgw-yLOYqJncOJ+H9A5k5w@mail.gmail.com>
References: <1544001240-18622-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544001240-18622-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Dec 5, 2018 at 7:20 AM Anson Huang <anson.huang@nxp.com> wrote:
>
> Add isl29023 light sensor support on i2c3 bus, the light
> sensor's power is controlled by a fixed regulator, since
> the isl29023 driver and most of other sensors on same
> board like mag3110 and mma8451 do NOT support regulator
> operation currently, they are all controlled by this
> regulator, so this patch also adds the fixed regulator
> support and make it always on.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index d7389b5..f96ae54 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -62,6 +62,19 @@
>                         gpio = <&gpio3 19 0>;
>                         enable-active-high;
>                 };
> +
> +               reg_sensor: regulator@4 {

I know that you followed the existing pattern for regulators in this
file, but it is not recommended to put regulators under "simple-bus".

I would suggest you to make a first patch of the series that removes
all of the existing regulators from "simple-bus", then you add this
series on top.

Then this regulator becomes:

reg_light_sensor: regulator-light-sensor {

> +                       compatible = "regulator-fixed";
> +                       reg = <4>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_sensor_reg>;

pinctrl_sensor_reg is too generic. You could use pinctrl_light_sensor_reg

> +                       regulator-name = "sensor-supply";
> +                       regulator-min-microvolt = <3300000>;
> +                       regulator-max-microvolt = <3300000>;
> +                       gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
> +                       enable-active-high;
> +                       regulator-always-on;
> +               };
>         };
>
>         gpio-keys {
> @@ -420,6 +433,15 @@
>                 interrupts = <7 2>;
>                 wakeup-gpios = <&gpio6 7 0>;
>         };
> +
> +       isl29023@44 {

Node names should be generic, so: light-sensor@44
