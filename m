From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: msm8998: Add mmcc node
Date: Tue, 05 Feb 2019 14:03:30 -0800
Message-ID: <154940421042.169292.8494408240796466238@swboyd.mtv.corp.google.com>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org> <1548866184-30378-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866184-30378-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org
Cc: marc.w.gonzalez@free.fr, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-01-30 08:36:24)
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/=
qcom/msm8998.dtsi
> index 7136ab1..5673a65 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -814,6 +814,21 @@
>                         status =3D "disabled";
>                 };
> =20
> +               mmcc: clock-controller@c8c0000 {
> +                       compatible =3D "qcom,mmcc-msm8998";
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +                       #power-domain-cells =3D <1>;
> +                       reg =3D <0x0c8c0000 0x40000>;
> +
> +                       clock-names =3D
> +                               "xo",

Weird newline here. Please put "xo" on the same line as clock-names.

> +                               "gpll0";
> +                       clocks =3D
> +                               <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +                               <&gcc GPLL0_OUT_MAIN>;

Ah ok, so only the multimedia clks get the xo clk from rpm for now?
