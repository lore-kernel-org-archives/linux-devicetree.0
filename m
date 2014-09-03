From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/5] dt-bindings: Add RK808 device tree bindings
 document
Date: Wed, 3 Sep 2014 15:20:29 +0100
Message-ID: <20140903142029.GH28985@lee--X1>
References: <1409752307-29044-1-git-send-email-zyw@rock-chips.com>
 <1409752307-29044-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409752307-29044-2-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 03 Sep 2014, Chris Zhong wrote:

> Add device tree bindings documentation and a header file
> for rockchip's RK808 pmic.
>=20
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>=20
> Tested-by: Heiko <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>=20
> Changes in v8:
> Advices by Doug
> - add description about "vccn-supply"
> - modify description about clock-cells
>=20
> Changes in v7:
> Advices by Mark Rutland
> - modify description about clock-cells
> - update the example
>=20
> Changes in v6:
> Advices by Mark Rutland
> - add description about clock-cells
> Advices by Doug
> - modify description about regulator
> - remove pinctrl description
>=20
> Changes in v5:
> Advices by Mark Brown
> - add description about regulator valid name.
> - add a header file "rockchip,rk808".
>=20
> Changes in v4:
> Advices by Doug
> - add a "#clock-cells" propertiy
> - update the example
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  Documentation/devicetree/bindings/mfd/rk808.txt |  177 +++++++++++++=
++++++++++
>  include/dt-bindings/clock/rockchip,rk808.h      |   11 ++
>  2 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rk808.txt
>  create mode 100644 include/dt-bindings/clock/rockchip,rk808.h

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Docume=
ntation/devicetree/bindings/mfd/rk808.txt
> new file mode 100644
> index 0000000..9e6e259
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -0,0 +1,177 @@
> +RK808 Power Management Integrated Circuit
> +
> +Required properties:
> +- compatible: "rockchip,rk808"
> +- reg: I2C slave address
> +- interrupt-parent: The parent interrupt controller.
> +- interrupts: the interrupt outputs of the controller.
> +- #clock-cells: from common clock binding; shall be set to 1 (multip=
le clock
> +  outputs). See <dt-bindings/clock/rockchip,rk808.h> for clock IDs.
> +
> +Optional properties:
> +- clock-output-names: From common clock binding to override the
> +  default output clock name
> +- rockchip,system-power-controller: Telling whether or not this pmic=
 is controlling
> +  the system power.
> +- vcc1-supply:  The input supply for DCDC_REG1
> +- vcc2-supply:  The input supply for DCDC_REG2
> +- vcc3-supply:  The input supply for DCDC_REG3
> +- vcc4-supply:  The input supply for DCDC_REG4
> +- vcc6-supply:  The input supply for LDO_REG1 and LDO_REG2
> +- vcc7-supply:  The input supply for LDO_REG3 and LDO_REG7
> +- vcc8-supply:  The input supply for SWITCH_REG1
> +- vcc9-supply:  The input supply for LDO_REG4 and LDO_REG5
> +- vcc10-supply: The input supply for LDO_REG6
> +- vcc11-supply: The input supply for LDO_REG8
> +- vcc12-supply: The input supply for SWITCH_REG2
> +
> +Regulators: All the regulators of RK808 to be instantiated shall be
> +listed in a child node named 'regulators'. Each regulator is represe=
nted
> +by a child node of the 'regulators' node.
> +
> +	regulator-name {
> +		/* standard regulator bindings here */
> +	};
> +
> +Following regulators of the RK808 PMIC block are supported. Note tha=
t
> +the 'n' in regulator name, as in DCDC_REGn or LDOn, represents the D=
CDC or LDO
> +number as described in RK808 datasheet.
> +
> +	- DCDC_REGn
> +		- valid values for n are 1 to 4.
> +	- LDO_REGn
> +		- valid values for n are 1 to 8.
> +	- SWITCH_REGn
> +		- valid values for n are 1 to 2
> +
> +Standard regulator bindings are used inside regulator subnodes. Chec=
k
> +  Documentation/devicetree/bindings/regulator/regulator.txt
> +for more details
> +
> +Example:
> +	rk808: pmic@1b {
> +		compatible =3D "rockchip,rk808";
> +		clock-output-names =3D "xin32k", "rk808-clkout2";
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pmic_int>;
> +		reg =3D <0x1b>;
> +		rockchip,system-power-controller;
> +		wakeup-source;
> +		#clock-cells =3D <1>;
> +
> +		vcc8-supply =3D <&vcc_18>;
> +		vcc9-supply =3D <&vcc_io>;
> +		vcc10-supply =3D <&vcc_io>;
> +		vcc12-supply =3D <&vcc_io>;
> +		vddio-supply =3D <&vccio_pmu>;
> +
> +		regulators {
> +			vdd_cpu: DCDC_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <750000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-name =3D "vdd_arm";
> +			};
> +
> +			vdd_gpu: DCDC_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <850000>;
> +				regulator-max-microvolt =3D <1250000>;
> +				regulator-name =3D "vdd_gpu";
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name =3D "vcc_ddr";
> +			};
> +
> +			vcc_io: DCDC_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc_io";
> +			};
> +
> +			vccio_pmu: LDO_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vccio_pmu";
> +			};
> +
> +			vcc_tp: LDO_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcc_tp";
> +			};
> +
> +			vdd_10: LDO_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-name =3D "vdd_10";
> +			};
> +
> +			vcc18_lcd: LDO_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc18_lcd";
> +			};
> +
> +			vccio_sd: LDO_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vccio_sd";
> +			};
> +
> +			vdd10_lcd: LDO_REG6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-name =3D "vdd10_lcd";
> +			};
> +
> +			vcc_18: LDO_REG7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-name =3D "vcc_18";
> +			};
> +
> +			vcca_codec: LDO_REG8 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vcca_codec";
> +			};
> +
> +			vcc_wl: SWITCH_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name =3D "vcc_wl";
> +			};
> +
> +			vcc_lcd: SWITCH_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name =3D "vcc_lcd";
> +			};
> +		};
> +	};
> diff --git a/include/dt-bindings/clock/rockchip,rk808.h b/include/dt-=
bindings/clock/rockchip,rk808.h
> new file mode 100644
> index 0000000..1a87343
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk808.h
> @@ -0,0 +1,11 @@
> +/*
> + * This header provides constants clk index RK808 pmic clkout
> + */
> +#ifndef _CLK_ROCKCHIP_RK808
> +#define _CLK_ROCKCHIP_RK808
> +
> +/* CLOCKOUT index */
> +#define RK808_CLKOUT0		0
> +#define RK808_CLKOUT1		1
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
