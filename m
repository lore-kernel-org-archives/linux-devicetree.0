From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH RESEND] arm64: dts: msm8916: remove bogus argument to the
 cpu clock
Date: Thu, 24 Jan 2019 20:23:07 +0530
Message-ID: <CAHLCerOvpf0ONVV0V6JKbQL_k31qqyiT8vcjvsvK4PPTMqZS_Q@mail.gmail.com>
References: <20190124124508.6541-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124124508.6541-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 6:15 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> The apcs node has #clock-cells = <0>, which means that those who
> references it should specify 0 arguments.
>
> The apcs reference in the cpu node incorrectly specifies an argument,
> remove this bogus argument.
>
> Fixes: 65afdf458360 ("arm64: dts: qcom: msm8916: Add CPU frequency scaling support")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index d302d8d639a1..e4bfd47178b1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -111,7 +111,7 @@
>                         next-level-cache = <&L2_0>;
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SPC>;
> -                       clocks = <&apcs 0>;
> +                       clocks = <&apcs>;
>                         operating-points-v2 = <&cpu_opp_table>;
>                         #cooling-cells = <2>;
>                 };
> @@ -123,7 +123,7 @@
>                         next-level-cache = <&L2_0>;
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SPC>;
> -                       clocks = <&apcs 0>;
> +                       clocks = <&apcs>;
>                         operating-points-v2 = <&cpu_opp_table>;
>                         #cooling-cells = <2>;
>                 };
> @@ -135,7 +135,7 @@
>                         next-level-cache = <&L2_0>;
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SPC>;
> -                       clocks = <&apcs 0>;
> +                       clocks = <&apcs>;
>                         operating-points-v2 = <&cpu_opp_table>;
>                         #cooling-cells = <2>;
>                 };
> @@ -147,7 +147,7 @@
>                         next-level-cache = <&L2_0>;
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SPC>;
> -                       clocks = <&apcs 0>;
> +                       clocks = <&apcs>;
>                         operating-points-v2 = <&cpu_opp_table>;
>                         #cooling-cells = <2>;
>                 };
> --
> 2.19.1
>
