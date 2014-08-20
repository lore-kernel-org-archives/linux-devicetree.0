From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2] ARM: apq8064: Add pinmux and i2c pinctrl nodes
Date: Wed, 20 Aug 2014 17:36:37 +0200
Message-ID: <53F4C085.5060101@suse.de>
References: <1408536133-13824-1-git-send-email-kiran.padwal@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1408536133-13824-1-git-send-email-kiran.padwal@smartplayin.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kiran Padwal <kiran.padwal@smartplayin.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, davidb@codeaurora.org
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 20.08.2014 14:02, schrieb Kiran Padwal:
> This patch adds pinmux and i2c pinctrl DT node for IFC6410 board.
> It also adds necessary DT support for i2c eeprom which is present on
> IFC6410.
>=20
> Tested on IFC6410 board.
>=20
> Signed-off-by: Kiran Padwal <kiran.padwal@smartplayin.com>
> ---
> Chages since v1:
> 	- Renamed pinmux phandle "qcom_pinmux" to "tlmm_pinmux".
> 	- Updated pinmux interrupt.
>=20
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |   29 ++++++++++++++
>  arch/arm/boot/dts/qcom-apq8064.dtsi        |   59 ++++++++++++++++++=
++++++++++
>  2 files changed, 88 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/bo=
ot/dts/qcom-apq8064-ifc6410.dts
> index 7c2441d..d52ac3c 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -5,6 +5,15 @@
>  	compatible =3D "qcom,apq8064-ifc6410", "qcom,apq8064";
> =20
>  	soc {
> +		pinmux@800000 {
> +			i2c1_pins: i2c1_pinmux {

Is there a requirement to have "_pinmux" in the subnode of the "pinmux"
node? Otherwise use just "i2c1"? I notice because the general conventio=
n
seems to be dashes rather than underscores for node names.

> +				mux {
> +					pins =3D "gpio20", "gpio21";
> +					function =3D "gsbi1";
> +				};
> +			};
> +		};
> +
>  		gsbi@16600000 {
>  			status =3D "ok";
>  			qcom,mode =3D <GSBI_PROT_I2C_UART>;
> @@ -12,5 +21,25 @@
>  				status =3D "ok";
>  			};
>  		};
> +
> +		gsbi1: gsbi@12440000 {
> +			qcom,mode =3D <GSBI_PROT_I2C>;
> +			status =3D "ok";

Usually the overridden status property goes first, as seen on the
previous gsbi node.

=46urther, its canonical value is "okay" (although in practice anything
other than "disabled" should work), so suggest you adopt it for your ne=
w
nodes.

Also, you already provide a label "gsbi1" to this node in the .dtsi
below, so you don't need to do it here again.
Some architectures prefer in such a case that in the .dts the node is
referenced as &gsbi1 {...}; below the root node in alphabetical order
rather than duplicating the full /soc/foo@bar hierarchy.

> +
> +			i2c1: i2c@12460000 {

Suggest to move the i2c1 label to the .dtsi. Then optionally same could
be done here as outlined for gsbi1.

> +				status =3D "ok";

"okay".

> +
> +				clock-frequency =3D <200000>;
> +
> +				pinctrl-0 =3D <&i2c1_pins>;
> +				pinctrl-names =3D "default";
> +
> +				eeprom: eeprom@52 {
> +					compatible =3D "atmel,24c128";
> +					reg =3D <0x52>;
> +					pagesize =3D <32>;
> +				};
> +			};
> +		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/=
qcom-apq8064.dtsi
> index 92bf793..bb2ccde 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -70,6 +70,17 @@
>  		ranges;
>  		compatible =3D "simple-bus";
> =20
> +		tlmm_pinmux: pinmux@800000 {
> +			compatible =3D "qcom,apq8064-pinctrl";
> +			reg =3D <0x800000 0x4000>;
> +
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			interrupts =3D <0 16 0x4>;

s/0x4/IRQ_TYPE_LEVEL_HIGH/?

> +		};
> +
>  		intc: interrupt-controller@2000000 {
>  			compatible =3D "qcom,msm-qgic2";
>  			interrupt-controller;
> @@ -133,6 +144,54 @@
>  			regulator;
>  		};
> =20
> +		gsbi1: gsbi@12440000 {
> +			compatible =3D "qcom,gsbi-v1.0.0";
> +			reg =3D <0x12440000 0x100>;
> +			clocks =3D <&gcc GSBI1_H_CLK>;
> +			clock-names =3D "iface";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +			status =3D "disabled";
> +
> +			i2c@12460000 {
> +				compatible =3D "qcom,i2c-qup-v1.1.1";
> +				reg =3D <0x12460000 0x1000>;
> +				interrupts =3D <0 194 0>;

The trailing 0 might be IRQ_TYPE_NONE?

> +
> +				clocks =3D <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
> +				clock-names =3D "core", "iface";
> +				status =3D "disabled";

I'd guess this is redundant since the parent is already disabled?

> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> +
> +		gsbi2: gsbi@12480000 {
> +			compatible =3D "qcom,gsbi-v1.0.0";
> +			reg =3D <0x12480000 0x100>;
> +			clocks =3D <&gcc GSBI2_H_CLK>;
> +			clock-names =3D "iface";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +			status =3D "disabled";
> +
> +			i2c@124a0000 {
> +				compatible =3D "qcom,i2c-qup-v1.1.1";
> +				reg =3D <0x124a0000 0x1000>;
> +				interrupts =3D <0 196 0>;

Again, IRQ_TYPE_NONE possibly?

Cheers,
Andreas

> +
> +				clocks =3D <&gcc GSBI2_QUP_CLK>, <&gcc GSBI2_H_CLK>;
> +				clock-names =3D "core", "iface";
> +				status =3D "disabled";
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> +
>  		gsbi7: gsbi@16600000 {
>  			status =3D "disabled";
>  			compatible =3D "qcom,gsbi-v1.0.0";

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
