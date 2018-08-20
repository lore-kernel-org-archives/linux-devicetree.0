From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: Add USB-related nodes
Date: Mon, 20 Aug 2018 11:17:05 -0700
Message-ID: <153478902525.28926.6688429060107225232@swboyd.mtv.corp.google.com>
References: <20180810215150.82490-1-dianders@chromium.org>
 <20180810215150.82490-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180810215150.82490-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, tfiga@chromium.org, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Douglas Anderson (2018-08-10 14:51:48)
> From: Manu Gautam <mgautam@codeaurora.org>
> =

> This adds nodes for USB and related PHYs.
> =

> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> [dianders: reworked quite a bit]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

One question below, otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> =

> Changes in v2:
> - Use "0x784000" for qfprom rather than "0x780000" as per docs.

?

> - Add calibration for 2nd USB port too
> =

>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 196 +++++++++++++++++++++++++++
>  1 file changed, 196 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index ae57c065780c..f13d8c2fb4a5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  =

>  / {
> @@ -249,6 +250,23 @@
>                         #power-domain-cells =3D <1>;
>                 };
>  =

> +               qfprom@784000 {

This doesn't match reg property.

> +                       compatible =3D "qcom,qfprom";
> +                       reg =3D <0x780000 0x8ff>;

Because this should be 0x784000?

> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       qusb2p_hstx_trim: hstx-trim-primary@1eb {
> +                               reg =3D <0x1eb 0x1>;
> +                               bits =3D <1 4>;
> +                       };
> +
> +                       qusb2s_hstx_trim: hstx-trim-secondary@1eb {
> +                               reg =3D <0x1eb 0x2>;
> +                               bits =3D <6 4>;
> +                       };
> +               };
> +
>                 qupv3_id_0: geniqup@8c0000 {
>                         compatible =3D "qcom,geni-se-qup";
>                         reg =3D <0x8c0000 0x6000>;
