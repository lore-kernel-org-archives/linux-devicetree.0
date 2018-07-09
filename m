From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v5 7/7] arm64: dts: sdm845: Add tsens nodes
Date: Mon, 9 Jul 2018 17:07:51 +0530
Message-ID: <CAHLCerMsVwrkeK+dVpqapM5EXcYuGxrFE8FdNL4r6NJoWW5awg@mail.gmail.com>
References: <cover.1531133611.git.amit.kucheria@linaro.org> <742cf44d162523a66bb4ce60e15449dfbf88800a.1531133612.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <742cf44d162523a66bb4ce60e15449dfbf88800a.1531133612.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, smohanad@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lakml <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 9, 2018 at 4:57 PM, Amit Kucheria <amit.kucheria@linaro.org> wrote:
> SDM845 has two tsens blocks, one with 13 sensors and the other with 8
> sensors. It uses version 2 of the TSENS IP, so use the fallback property to
> allow more common code.
>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index cdaabeb..d97ee00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -221,6 +221,22 @@
>                         #interrupt-cells = <2>;
>                 };
>
> +               tsens0: tsens@c222000 {

Oops, sending out v6 to fix this.

> +                       compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
> +                       reg = <0xc263000 0x1ff>, /* TM */
> +                             <0xc222000 0x1ff>; /* SROT */
> +                       #qcom,sensors = <13>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
> +               tsens1: tsens@c223000 {
> +                       compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
> +                       reg = <0xc265000 0x1ff>, /* TM */
> +                             <0xc223000 0x1ff>; /* SROT */
> +                       #qcom,sensors = <8>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
>                 spmi_bus: spmi@c440000 {
>                         compatible = "qcom,spmi-pmic-arb";
>                         reg = <0xc440000 0x1100>,
> --
> 2.7.4
>
