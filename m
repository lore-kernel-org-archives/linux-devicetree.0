From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 2/2] mfd: add documentation for ACT8945A DT bindings
Date: Wed, 10 Feb 2016 16:12:49 +0000
Message-ID: <20160210161249.GA3782@x1>
References: <1453887530-22490-1-git-send-email-wenyou.yang@atmel.com>
 <1453887530-22490-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453887530-22490-3-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 27 Jan 2016, Wenyou Yang wrote:

> The Active-semi ACT8945A PMIC is a Multi-Function Device, it has
> two subdevices:
>  - Regulator
>  - Charger
>=20
> This patch adds documentation for ACT8945A DT bindings.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>=20
> Changes in v9: None
> Changes in v8: None
> Changes in v7:
>  - collect Acked-by from Lee Jones
>=20
> Changes in v6:
>  - change the regulator name.
>=20
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
>  - fix the tabbing errors in Example.
>  - use "pmic@5b" label, not "act8945a@5b" in Example.
>  - collect Acked-by from Rob.
>=20
> Changes in v2:
>  - use more specific label in Example.
>  - add pmic and charger nodes in Example.
>=20
>  Documentation/devicetree/bindings/mfd/act8945a.txt |   82 ++++++++++=
++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.tx=
t

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Doc=
umentation/devicetree/bindings/mfd/act8945a.txt
> new file mode 100644
> index 0000000..f2a8387
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/act8945a.txt
> @@ -0,0 +1,82 @@
> +Device-Tree bindings for Active-semi ACT8945A MFD driver
> +
> +Required properties:
> + - compatible: "active-semi,act8945a".
> + - reg: the I2C slave address for the ACT8945A chip
> +
> +The chip exposes two subdevices:
> + - a regulators: see ../regulator/act8945a-regulator.txt
> + - a charger: see ../power/act8945a-charger.txt
> +
> +Example:
> +	pmic@5b {
> +		compatible =3D "active-semi,act8945a";
> +		reg =3D <0x5b>;
> +		status =3D "okay";
> +
> +		pmic {
> +			compatible =3D "active-semi,act8945a-regulator";
> +			active-semi,vsel-high;
> +
> +			regulators {
> +				vdd_1v35_reg: REG_DCDC1 {
> +					regulator-name =3D "VDD_1V35";
> +					regulator-min-microvolt =3D <1350000>;
> +					regulator-max-microvolt =3D <1350000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd_1v2_reg: REG_DCDC2 {
> +					regulator-name =3D "VDD_1V2";
> +					regulator-min-microvolt =3D <1100000>;
> +					regulator-max-microvolt =3D <1300000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd_3v3_reg: REG_DCDC3 {
> +					regulator-name =3D "VDD_3V3";
> +					regulator-min-microvolt =3D <3300000>;
> +					regulator-max-microvolt =3D <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd_fuse_reg: REG_LDO1 {
> +					regulator-name =3D "VDD_FUSE";
> +					regulator-min-microvolt =3D <2500000>;
> +					regulator-max-microvolt =3D <2500000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd_3v3_lp_reg: REG_LDO2 {
> +					regulator-name =3D "VDD_3V3_LP";
> +					regulator-min-microvolt =3D <3300000>;
> +					regulator-max-microvolt =3D <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd_led_reg: REG_LDO3 {
> +					regulator-name =3D "VDD_LED";
> +					regulator-min-microvolt =3D <3300000>;
> +					regulator-max-microvolt =3D <3300000>;
> +					regulator-always-on;
> +				};
> +
> +				vdd_sdhc_1v8_reg: REG_LDO4 {
> +					regulator-name =3D "VDD_SDHC_1V8";
> +					regulator-min-microvolt =3D <1800000>;
> +					regulator-max-microvolt =3D <1800000>;
> +					regulator-always-on;
> +				};
> +			};
> +		};
> +
> +		charger {
> +			compatible =3D "active-semi,act8945a-charger";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_charger_chglev>;
> +			active-semi,chglev-gpio =3D <&pioA 12 GPIO_ACTIVE_HIGH>;
> +			active-semi,input_voltage_threshold =3D <6600>;
> +			active-semi,precondition_timeout =3D <40>;
> +			active-semi,total_timeout =3D <3>;
> +		};
> +	};

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
