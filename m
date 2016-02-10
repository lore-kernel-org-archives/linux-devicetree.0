From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v10 2/2] mfd: add documentation for ACT8945A DT bindings
Date: Wed, 10 Feb 2016 16:55:24 +0000
Message-ID: <20160210165524.GQ3782@x1>
References: <1454643390-16910-1-git-send-email-wenyou.yang@atmel.com>
 <1454643390-16910-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454643390-16910-3-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Peter Korsgaard <jacmet@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 05 Feb 2016, Wenyou Yang wrote:

> The Active-semi ACT8945A PMIC is a Multi-Function Device, it has
> two subdevices:
>  - Regulator
>  - Charger
>=20
> This patch adds documentation for ACT8945A DT bindings.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>=20
> Changes in v10:
>  - update the example, due to the subdevices are not regarded as
>    a child node.

v9 unapplied, v10 applied.

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
>  Documentation/devicetree/bindings/mfd/act8945a.txt |   76 ++++++++++=
++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Doc=
umentation/devicetree/bindings/mfd/act8945a.txt
> new file mode 100644
> index 0000000..f712830
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/act8945a.txt
> @@ -0,0 +1,76 @@
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
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_charger_chglev>;
> +		active-semi,chglev-gpio =3D <&pioA 12 GPIO_ACTIVE_HIGH>;
> +		active-semi,input-voltage-threshold-microvolt =3D <6600>;
> +		active-semi,precondition-timeout =3D <40>;
> +		active-semi,total-timeout =3D <3>;
> +
> +		active-semi,vsel-high;
> +
> +		regulators {
> +			vdd_1v35_reg: REG_DCDC1 {
> +				regulator-name =3D "VDD_1V35";
> +				regulator-min-microvolt =3D <1350000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v2_reg: REG_DCDC2 {
> +				regulator-name =3D "VDD_1V2";
> +				regulator-min-microvolt =3D <1100000>;
> +				regulator-max-microvolt =3D <1300000>;
> +				regulator-always-on;
> +			};
> +
> +			vdd_3v3_reg: REG_DCDC3 {
> +				regulator-name =3D "VDD_3V3";
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			vdd_fuse_reg: REG_LDO1 {
> +				regulator-name =3D "VDD_FUSE";
> +				regulator-min-microvolt =3D <2500000>;
> +				regulator-max-microvolt =3D <2500000>;
> +				regulator-always-on;
> +			};
> +
> +			vdd_3v3_lp_reg: REG_LDO2 {
> +				regulator-name =3D "VDD_3V3_LP";
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			vdd_led_reg: REG_LDO3 {
> +				regulator-name =3D "VDD_LED";
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			vdd_sdhc_1v8_reg: REG_LDO4 {
> +				regulator-name =3D "VDD_SDHC_1V8";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
