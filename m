From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 7/7] ARM: dts: add rk3288 evaluation board
Date: Thu, 24 Jul 2014 16:17:58 -0700
Message-ID: <CAD=FV=W9SxW-g+v-VRbJXMTt3njUvvU4mOvOke-s=ihve4ghfg@mail.gmail.com>
References: <4868343.UFgjaXesOn@diego>
	<2004020.THrDyKm3fa@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2004020.THrDyKm3fa@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Thu, Jul 17, 2014 at 5:21 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> There exist 2 variants using either the act8846 or rk808 as pmic, whi=
le the
> rest of the board stays the same.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Tested-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-evb-act8846.dts | 134 +++++++++++++++++++++=
++++++++++
>  arch/arm/boot/dts/rk3288-evb-rk808.dts   |  18 +++++
>  arch/arm/boot/dts/rk3288-evb.dtsi        |  83 +++++++++++++++++++
>  3 files changed, 235 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3288-evb-act8846.dts
>  create mode 100644 arch/arm/boot/dts/rk3288-evb-rk808.dts
>  create mode 100644 arch/arm/boot/dts/rk3288-evb.dtsi
>
> diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot=
/dts/rk3288-evb-act8846.dts
> new file mode 100644
> index 0000000..7d59ff4
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
> @@ -0,0 +1,134 @@
> +/*
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +#include "rk3288-evb.dtsi"
> +
> +/ {
> +       compatible =3D "rockchip,rk3288-evb-act8846", "rockchip,rk328=
8";
> +};
> +
> +&i2c0 {
> +       hym8563@51 {
> +               compatible =3D "haoyu,hym8563";
> +               reg =3D <0x51>;
> +
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> +
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hym8563_int>;
> +
> +               #clock-cells =3D <0>;
> +               clock-output-names =3D "xin32k";
> +       };
> +
> +       act8846: act8846@5a {
> +               compatible =3D "active-semi,act8846";
> +               reg =3D <0x5a>;
> +               status =3D "okay";
> +
> +               regulators {
> +                       vcc_ddr: REG1 {
> +                               regulator-name =3D "VCC_DDR";
> +                               regulator-min-microvolt =3D <1200000>=
;
> +                               regulator-max-microvolt =3D <1200000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vcc_io: REG2 {
> +                               regulator-name =3D "VCC_IO";
> +                               regulator-min-microvolt =3D <3300000>=
;
> +                               regulator-max-microvolt =3D <3300000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vdd_log: REG3 {
> +                               regulator-name =3D "VDD_LOG";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vcc_20: REG4 {
> +                               regulator-name =3D "VCC_20";
> +                               regulator-min-microvolt =3D <2000000>=
;
> +                               regulator-max-microvolt =3D <2000000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vccio_sd: REG5 {
> +                               regulator-name =3D "VCCIO_SD";
> +                               regulator-min-microvolt =3D <3300000>=
;
> +                               regulator-max-microvolt =3D <3300000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vdd10_lcd: REG6 {
> +                               regulator-name =3D "VDD10_LCD";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vcca_codec: REG7 {
> +                               regulator-name =3D "VCCA_CODEC";
> +                               regulator-min-microvolt =3D <3300000>=
;
> +                               regulator-max-microvolt =3D <3300000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vcca_tp: REG8 {
> +                               regulator-name =3D "VCCA_TP";
> +                               regulator-min-microvolt =3D <3300000>=
;
> +                               regulator-max-microvolt =3D <3300000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vccio_pmu: REG9 {
> +                               regulator-name =3D "VCCIO_PMU";
> +                               regulator-min-microvolt =3D <3300000>=
;
> +                               regulator-max-microvolt =3D <3300000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vdd_10: REG10 {
> +                               regulator-name =3D "VDD_10";
> +                               regulator-min-microvolt =3D <1000000>=
;
> +                               regulator-max-microvolt =3D <1000000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vcc_18: REG11 {
> +                               regulator-name =3D "VCC_18";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                       };
> +
> +                       vcc18_lcd: REG12 {
> +                               regulator-name =3D "VCC18_LCD";
> +                               regulator-min-microvolt =3D <1800000>=
;
> +                               regulator-max-microvolt =3D <1800000>=
;
> +                               regulator-always-on;
> +                       };
> +               };
> +       };
> +};
> +
> +&pinctrl {
> +       hym8563 {
> +               hym8563_int: hym8563-int {
> +                       rockchip,pins =3D <RK_GPIO0 4 RK_FUNC_GPIO &p=
cfg_pull_up>;
> +               };
> +       };
> +};
> diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts b/arch/arm/boot/d=
ts/rk3288-evb-rk808.dts
> new file mode 100644
> index 0000000..9a88b6c
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> @@ -0,0 +1,18 @@
> +/*
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +/dts-v1/;
> +#include "rk3288-evb.dtsi"
> +
> +/ {
> +       compatible =3D "rockchip,rk3288-evb-rk808", "rockchip,rk3288"=
;
> +};
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk=
3288-evb.dtsi
> new file mode 100644
> index 0000000..2afd4f2
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -0,0 +1,83 @@
> +/*
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include "rk3288.dtsi"
> +
> +/ {
> +       aliases {
> +               serial0 =3D &uart0;
> +               serial1 =3D &uart1;
> +               serial2 =3D &uart2;
> +               serial3 =3D &uart3;
> +               serial4 =3D &uart4;

You've got these aliases in the main dtsi at
<https://patchwork.kernel.org/patch/4579531/>.  You don't need them
here, too.


> +       };
> +
> +       memory {
> +               reg =3D <0x0 0x80000000>;
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               autorepeat;
> +
> +               button@0 {
> +                       gpios =3D <&gpio0 5 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <116>;
> +                       label =3D "GPIO Key Power";
> +                       linux,input-type =3D <1>;
> +                       gpio-key,wakeup =3D <1>;
> +                       debounce-interval =3D <100>;
> +               };
> +       };
> +
> +       i2c0: i2c@ff650000 {

I think Olof was suggesting enabling these things via aliases.  In
other words, move to the top level and do:

&i2c0 {
  pinctrl-names =3D "default";
  pinctrl-0 =3D <&i2c0_xfer>;
  status =3D "okay";
};

=2E..same for other peripherals here.

Also: you made an argument for why you don't have the UART config in
the main 3288 dtsi file (because you thought boards might want to
enable flow control).  ...but why can't i2c go in the main 3288 dtsi
file?


> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&i2c0_xfer>;
> +               status =3D "okay";
> +       };
> +
> +       watchdog@ff800000 {
> +               status =3D "okay";
> +       };
> +
> +       serial@ff180000 {
> +               status =3D "okay";

How do these work without a pinctrl?


> +       };
> +
> +       serial@ff190000 {
> +               status =3D "okay";
> +       };
> +
> +       serial@ff690000 {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&uart2_xfer>;

Note: you could still put just the "xfer" in the main 3288 dtsi file
and boards could just override pinctrl-0 to include the CTS/RTS if
they want.


> +               status =3D "okay";
> +       };
> +
> +       serial@ff1b0000 {
> +               status =3D "okay";
> +       };
> +
> +       serial@ff1c0000 {
> +               status =3D "okay";
> +       };
> +
> +       pinctrl {
> +               buttons {
> +                       pwrbtn: pwrbtn {
> +                               rockchip,pins =3D <0 5 RK_FUNC_GPIO &=
pcfg_pull_up>;
> +                       };

Don't you need to refer to this somewhere?  I think you need to refer
to them in "pinctrl-0" of "gpio-keys".  See exynos5420-peach-pit.dts

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
