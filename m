From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add missing space for
 cooling-cells property
Date: Thu, 27 Jun 2019 23:43:05 +0530
Message-ID: <CAP245DVTcQ5DXiSHWud42tOXFXAy7LFkqGsfUDoY0cm+7wQCBA@mail.gmail.com>
References: <20190627140215.29353-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627140215.29353-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2019 at 7:32 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> There should be a space both before and after the equal sign.
> Add a missing space for the cooling cells property.
>
> Fixes: f48cee3239a1 ("arm64: dts: qcom: qcs404: Add thermal zones for each sensor")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 01a51f381850..3d0789775009 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -35,7 +35,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 CPU1: cpu@101 {
> @@ -45,7 +45,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 CPU2: cpu@102 {
> @@ -55,7 +55,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 CPU3: cpu@103 {
> @@ -65,7 +65,7 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> -                       #cooling-cells= <2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 L2_0: l2-cache {
> --
> 2.21.0
>
