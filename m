From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: add rk3288 evaluation board
Date: Tue, 15 Jul 2014 18:00:29 -0700
Message-ID: <20140716010029.GC26207@quad.lixom.net>
References: <1471578.ILeMmG2DL6@diego>
 <2186895.xqgxh7zegl@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2186895.xqgxh7zegl@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This mostly looks good, with a couple of comments below.

On Wed, Jul 16, 2014 at 01:02:58AM +0200, Heiko St=FCbner wrote:
> +&i2c0 {
> +	hym8563@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hym8563_int>;
> +
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "xin32k";
> +	};
> +
> +	act8846: act8846@5a {
> +		compatible =3D "active-semi,act8846";
> +		reg =3D <0x5a>;
> +		status =3D "okay";
> +	};
> +};
> +
> +&act8846 {

This is slightly odd since you're defining the node just above, you cou=
ld just
add the regulators right there.

> +	regulators {
> +		vcc_ddr: REG1 {
> +			regulator-name =3D "VCC_DDR";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-always-on;
> +		};
> +
> +		vcc_io: REG2 {
> +			regulator-name =3D "VCC_IO";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		vdd_log: REG3 {
> +			regulator-name =3D "VDD_LOG";
> +			regulator-min-microvolt =3D <1000000>;
> +			regulator-max-microvolt =3D <1000000>;
> +			regulator-always-on;
> +		};
> +
> +		vcc_20: REG4 {
> +			regulator-name =3D "VCC_20";
> +			regulator-min-microvolt =3D <2000000>;
> +			regulator-max-microvolt =3D <2000000>;
> +			regulator-always-on;
> +		};
> +
> +		vccio_sd: REG5 {
> +			regulator-name =3D "VCCIO_SD";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		vdd10_lcd: REG6 {
> +			regulator-name =3D "VDD10_LCD";
> +			regulator-min-microvolt =3D <1000000>;
> +			regulator-max-microvolt =3D <1000000>;
> +			regulator-always-on;
> +		};
> +
> +		vcca_codec: REG7 {
> +			regulator-name =3D "VCCA_CODEC";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		vcca_tp: REG8 {
> +			regulator-name =3D "VCCA_TP";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		vccio_pmu: REG9 {
> +			regulator-name =3D "VCCIO_PMU";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		vdd_10: REG10 {
> +			regulator-name =3D "VDD_10";
> +			regulator-min-microvolt =3D <1000000>;
> +			regulator-max-microvolt =3D <1000000>;
> +			regulator-always-on;
> +		};
> +
> +		vcc_18: REG11 {
> +			regulator-name =3D "VCC_18";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-always-on;
> +		};
> +
> +		vcc18_lcd: REG12 {
> +			regulator-name =3D "VCC18_LCD";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-always-on;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	hym8563 {
> +		hym8563_int: hym8563-int {
> +			rockchip,pins =3D <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts b/arch/arm/boot/d=
ts/rk3288-evb-rk808.dts
> new file mode 100644
> index 0000000..c168cb2
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> @@ -0,0 +1,19 @@
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
> +	compatible =3D "rockchip,rk3288-evb-rk808", "rockchip,rk3288";
> +
> +};

No rk808 node? Or adding that once the driver is sorted out?

> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk=
3288-evb.dtsi
> new file mode 100644
> index 0000000..ff642d4
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -0,0 +1,77 @@
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
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +		serial2 =3D &uart2;
> +		serial3 =3D &uart3;
> +		serial4 =3D &uart4;
> +	};
> +
> +	memory {
> +		reg =3D <0x0 0x80000000>;
> +	};
> +
> +	soc {
> +		gpio-keys {

I'd recommend doing all of these with &-references instead to avoid hav=
ing to
revisit this if/when the tree topography changes w.r.t. the 'soc' node.=
 Also,
the gpio-keys should be on the top level.

> +			compatible =3D "gpio-keys";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			autorepeat;
> +
> +			button@0 {
> +				gpios =3D <&gpio0 5 GPIO_ACTIVE_HIGH>;
> +				linux,code =3D <116>;
> +				label =3D "GPIO Key Power";
> +				linux,input-type =3D <1>;
> +				gpio-key,wakeup =3D <1>;
> +				debounce-interval =3D <100>;
> +			};
> +		};
> +
> +		i2c0: i2c@ff650000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&i2c0_xfer>;
> +			status =3D "okay";
> +		};
> +
> +		watchdog@ff800000 {
> +			status =3D "okay";
> +		};
> +
> +		serial@ff180000 {
> +			status =3D "okay";
> +		};
> +
> +		serial@ff190000 {
> +			status =3D "okay";
> +		};
> +
> +		uart2: serial@ff690000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart2_xfer>;
> +			status =3D "okay";
> +		};
> +
> +		uart3: serial@ff1b0000 {
> +			status =3D "okay";
> +		};
> +
> +		uart4: serial@ff1c0000 {
> +			status =3D "okay";
> +		};
> +	};
> +};


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
