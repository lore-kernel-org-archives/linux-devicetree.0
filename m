From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add tsens nodes
Date: Fri, 06 Jul 2018 10:31:15 -0700
Message-ID: <153089827550.143105.2506072427444330254@swboyd.mtv.corp.google.com>
References: <cover.1530533998.git.amit.kucheria@linaro.org>
 <a52b77ad84867774a0659f51ccb79b17ba7638ab.1530533998.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a52b77ad84867774a0659f51ccb79b17ba7638ab.1530533998.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, Will Deacon <will.deacon@arm.com>, smohanad@codeaurora.org, bjorn.andersson@linaro.org, edubezval@gmail.com, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, vivek.gautam@codeaurora.org, Catalin Marinas <catalin.marinas@arm.com>, andy.gross@linaro.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Amit Kucheria (2018-07-02 05:44:09)
> SDM845 has two tsens blocks, one with 13 sensors and the other with 8
> sensors.
> =

> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index cdaabeb..edf8505 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -221,6 +221,22 @@
>                         #interrupt-cells =3D <2>;
>                 };
>  =

> +               tsens0: tsens@c222000 {

These unit addresses should match the first reg property, not the second
one.

> +                       compatible =3D "qcom,tsens-v2.4.0", "qcom,tsens-v=
2";
> +                       reg =3D <0xc263000 0x1ff>, /* TM */
> +                             <0xc222000 0x1ff>; /* SROT */
> +                       #qcom,sensors =3D <13>;
> +                       #thermal-sensor-cells =3D <1>;
> +               };
> +
> +               tsens1: tsens@c223000 {
> +                       compatible =3D "qcom,tsens-v2.4.0", "qcom,tsens-v=
2";
> +                       reg =3D <0xc265000 0x1ff>, /* TM */
> +                             <0xc223000 0x1ff>; /* SROT */
> +                       #qcom,sensors =3D <8>;
