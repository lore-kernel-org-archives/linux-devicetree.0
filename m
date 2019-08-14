From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 17/22] arm64: dts: qcom: sm8150: Add apss_shared and apps_rsc nodes
Date: Wed, 14 Aug 2019 10:12:34 -0700
Message-ID: <20190814171235.6BE1721721@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-18-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-18-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:07)
> Add apss_shared and apps_rsc node including the rpmhcc child node
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Can't this be squashed with the original dtsi file?

>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 5c6b103b042b..5258b79676f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -4,6 +4,7 @@
> =20
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>

But not the rpmh clk bindings?

> @@ -272,6 +279,29 @@
>                         };
>                 };
> =20
> +               apps_rsc: rsc@18200000 {
> +                       label =3D "apps_rsc";
> +                       compatible =3D "qcom,rpmh-rsc";
> +                       reg =3D <0x18200000 0x10000>,
> +                             <0x18210000 0x10000>,
> +                             <0x18220000 0x10000>;
> +                       reg-names =3D "drv-0", "drv-1", "drv-2";
> +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                       qcom,tcs-offset =3D <0xd00>;
> +                       qcom,drv-id =3D <2>;
> +                       qcom,tcs-config =3D <ACTIVE_TCS  2>,
> +                                         <SLEEP_TCS   1>,
> +                                         <WAKE_TCS    1>,
> +                                         <CONTROL_TCS 0>;
> +
> +                       rpmhcc: clock-controller {
> +                               compatible =3D "qcom,sm8150-rpmh-clk";
> +                               #clock-cells =3D <1>;

Should take some sort of clocks property to get the board clock for XO?

> +                       };
> +               };
> +
=20
