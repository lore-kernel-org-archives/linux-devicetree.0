From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 10/22] arm64: dts: qcom: pm8150b: Add pon and adc nodes
Date: Wed, 14 Aug 2019 10:08:02 -0700
Message-ID: <20190814170803.DEFCC214DA@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-11-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-11-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:00)
> Add the pon and adc nodes found in pm8150b PMIC.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Squash?

>=20
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/=
qcom/pm8150b.dtsi
> index c0a678b0f159..846197bd65cd 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
>  // Copyright (c) 2019, Linaro Limited
> =20
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> =20
> @@ -11,6 +12,59 @@
>                 reg =3D <0x2 SPMI_USID>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> +
> +               pon@800 {

Maybe pon node name should be 'key' or 'power-on'?

> +                       compatible =3D "qcom,pm8916-pon";
> +                       reg =3D <0x0800>;
> +               };
> +
> +               adc@3100 {
> +                       compatible =3D "qcom,spmi-adc5";
> +                       reg =3D <0x3100>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       #io-channel-cells =3D <1>;
> +                       interrupts =3D <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING=
>;
> +
> +                       ref-gnd@0 {
> +                               reg =3D <ADC5_REF_GND>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "ref_gnd";
> +                       };
> +
> +                       vref-1p25@1 {
> +                               reg =3D <ADC5_1P25VREF>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "vref_1p25";
> +                       };
> +
> +                       die-temp@6 {
> +                               reg =3D <ADC5_DIE_TEMP>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "die_temp";
> +                       };
> +
> +                       chg-temp@9 {
> +                               reg =3D <ADC5_CHG_TEMP>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "chg_temp";
> +                       };
> +
> +                       smb1390-therm@14 {
> +                               reg =3D <ADC5_AMUX_THM2>;
> +                               qcom,hw-settle-time =3D <200>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "smb1390_therm";
> +                       };
> +
> +                       smb1355-therm@78 {
> +                               reg =3D <ADC5_AMUX_THM2_100K_PU>;
> +                               qcom,ratiometric;
> +                               qcom,hw-settle-time =3D <200>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "smb1355_therm";
> +                       };

Again, are these board level details? Maybe should be provided here with
status =3D "disabled" and then added by the boards that use these ADCs.

> +               };
>         };
