From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: Add 8x16 chipset SPMI PMIC's nodes
Date: Wed, 1 Apr 2015 15:00:36 -0500
Message-ID: <477459F0-90E0-4281-BFFF-F4F73BFCEE85@codeaurora.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org> <1427900715-26273-6-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-6-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Apr 1, 2015, at 10:05 AM, Ivan T. Ivanov <ivan.ivanov@linaro.org> wr=
ote:

> PM9816 has 2 SPMI devices per physical package. Add PMIC configuratio=
n
> nodes including sub-function device nodes and include them in boards,
> which are using 8x16 based chipset.
>=20
> PM9816 sub-function devices include:
>=20
> * GPIO block, with 4 pins
> * MPP block, with 4 pins
> * Volatage ADC (VADC), with multiple inputs
> * Thermal sensor device, which is using on chip VADC
>  channel report PMIC die temperature.
> * Power key device, which is responsible for clean system
>  reboot or shutdown
> * RTC device
>=20
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
> arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi |  1 +
> arch/arm64/boot/dts/qcom/pm8916.dtsi      | 93 ++++++++++++++++++++++=
+++++++++
> 3 files changed, 95 insertions(+)
> create mode 100644 arch/arm64/boot/dts/qcom/pm8916.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/b=
oot/dts/qcom/apq8016-sbc.dtsi
> index 703a4f1..58f0055f 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -12,6 +12,7 @@
>  */
>=20
> #include "msm8916.dtsi"
> +#include "pm8916.dtsi"
>=20
> / {
> 	aliases {
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/b=
oot/dts/qcom/msm8916-mtp.dtsi
> index bea871b..a1aa0b2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
> @@ -12,6 +12,7 @@
>  */
>=20
> #include "msm8916.dtsi"
> +#include "pm8916.dtsi"
>=20
> / {
> 	aliases {
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/d=
ts/qcom/pm8916.dtsi
> new file mode 100644
> index 0000000..2a5ad2c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -0,0 +1,93 @@
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +
> +	usid0: pm8916@0 {
> +		compatible =3D"qcom,spmi-pmic";
> +		reg =3D <0x0 SPMI_USID>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		rtc@6000 {
> +			compatible =3D "qcom,pm8941-rtc";
> +			reg =3D <0x6000 0x6100>;
> +			reg-names =3D "rtc", "alarm";
> +			interrupts =3D <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
> +		};
> +
> +		pwrkey@800 {
> +			compatible =3D "qcom,pm8941-pwrkey";
> +			reg =3D <0x800>;
> +			interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +			debounce =3D <15625>;
> +			bias-pull-up;
> +		};
> +
> +		pm8916_gpios: gpios@c000 {
> +			compatible =3D "qcom,pm8916-gpio";
> +			reg =3D <0xc000 0x400>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupts =3D <0 0xc0 0 0>, <0 0xc1 0 0>, <0 0xc2 0 0>, <0 0xc3 =
0 0>;

please cleanup level/edge cell values to use defines

> +		};
> +
> +		pm8916_mpps: mpps@a000 {
> +			compatible =3D "qcom,pm8916-mpp";
> +			reg =3D <0xa000 0x400>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupts =3D <0 0xa0 0 0>, <0 0xa1 0 0>, <0 0xa2 0 0>, <0 0xa3 =
0 0>;

please cleanup level/edge cell values to use defines

> +		};
> +
> +		pm8916_temp: temp-alarm@2400 {
> +			compatible =3D "qcom,spmi-temp-alarm";
> +			reg =3D <0x2400 0x100>;
> +			interrupts =3D <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
> +			io-channels =3D <&pm8916_vadc VADC_DIE_TEMP>;
> +			io-channel-names =3D "thermal";
> +			#thermal-sensor-cells =3D <0>;
> +		};
> +
> +		pm8916_vadc: vadc@3100 {
> +			compatible =3D "qcom,spmi-vadc";
> +			reg =3D <0x3100 0x100>;
> +			interrupts =3D <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#io-channel-cells =3D <1>;
> +
> +			usb_in {
> +				reg =3D <VADC_USBIN>;
> +				qcom,pre-scaling =3D <1 10>;
> +			};
> +			vph_pwr {
> +				reg =3D <VADC_VSYS>;
> +				qcom,pre-scaling =3D <1 3>;
> +			};
> +			die_temp {
> +				reg =3D <VADC_DIE_TEMP>;
> +			};
> +			ref_625mv {
> +				reg =3D <VADC_REF_625MV>;
> +			};
> +			ref_1250v {
> +				reg =3D <VADC_REF_1250MV>;
> +			};
> +			ref_gnd {
> +				reg =3D <VADC_GND_REF>;
> +			};
> +			ref_vdd {
> +				reg =3D <VADC_VDD_VADC>;
> +			};
> +		};
> +	};
> +
> +	usid1: pm8916@1 {
> +		compatible =3D"qcom,spmi-pmic=94;

fix whitespace after =91=3D'

> +		reg =3D <0x1 SPMI_USID>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +	};
> +};
> --
> 1.9.1
>=20

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
