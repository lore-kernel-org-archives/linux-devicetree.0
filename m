From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: add documentation for ACT8945A DT bindings
Date: Tue, 12 Jan 2016 08:52:07 +0000
Message-ID: <20160112085207.GQ19803@x1>
References: <1452585915-551-1-git-send-email-wenyou.yang@atmel.com>
 <1452585915-551-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452585915-551-3-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier@dowhile0.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jan 2016, Wenyou Yang wrote:

> The Active-semi ACT8945A PMIC is a Multi-Function Device, it has
> two subdevices:
>  - Regulator
>  - Charger
>=20
> This patch adds documentation for ACT8945A DT bindings.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> ---
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
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Doc=
umentation/devicetree/bindings/mfd/act8945a.txt
> new file mode 100644
> index 0000000..e4a8aaf
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
> +	act8945a@5b {
> +		compatible =3D "active-semi,act8945a";
> +		reg =3D <0x5b>;
> +		status =3D "okay";
> +
> +		pmic {
> +			compatible =3D "active-semi,act8945a-regulator";
> +			active-semi,vsel-high;
> +
> +				regulators {

Your tabbing here is not correct.

> +					vdd_1v35_reg: DCDC_REG1 {
> +						regulator-name =3D "VDD_1V35";
> +						regulator-min-microvolt =3D <1350000>;
> +						regulator-max-microvolt =3D <1350000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_1v2_reg: DCDC_REG2 {
> +						regulator-name =3D "VDD_1V2";
> +						regulator-min-microvolt =3D <1100000>;
> +						regulator-max-microvolt =3D <1300000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_3v3_reg: DCDC_REG3 {
> +						regulator-name =3D "VDD_3V3";
> +						regulator-min-microvolt =3D <3300000>;
> +						regulator-max-microvolt =3D <3300000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_fuse_reg: LDO_REG1 {
> +						regulator-name =3D "VDD_FUSE";
> +						regulator-min-microvolt =3D <2500000>;
> +						regulator-max-microvolt =3D <2500000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_3v3_lp_reg: LDO_REG2 {
> +						regulator-name =3D "VDD_3V3_LP";
> +						regulator-min-microvolt =3D <3300000>;
> +						regulator-max-microvolt =3D <3300000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_led_reg: LDO_REG3 {
> +						regulator-name =3D "VDD_LED";
> +						regulator-min-microvolt =3D <3300000>;
> +						regulator-max-microvolt =3D <3300000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_sdhc_1v8_reg: LDO_REG4 {
> +						regulator-name =3D "VDD_SDHC_1V8";
> +						regulator-min-microvolt =3D <1800000>;
> +						regulator-max-microvolt =3D <1800000>;
> +						regulator-always-on;
> +					};
> +				};
> +			};
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
