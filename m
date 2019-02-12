From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add dynamic CPU power coefficients
Date: Tue, 12 Feb 2019 10:35:14 +0530
Message-ID: <CAP245DWMH44v_E5uqet4Wm_bwpwLL7K_faB4Vq=7H5onxj94qg@mail.gmail.com>
References: <20190211190019.171583-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211190019.171583-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 12:30 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add dynamic power coefficients for the Silver and Gold CPU cores of
> the Qualcomm SDM845.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index e4b69c74fe077..6e8a2331176ec 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -120,6 +120,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <100>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_0>;
> @@ -137,6 +138,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x100>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <100>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_100>;
> @@ -151,6 +153,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x200>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <100>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_200>;
> @@ -165,6 +168,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x300>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <100>;
>                         qcom,freq-domain = <&cpufreq_hw 0>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_300>;
> @@ -179,6 +183,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x400>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <396>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_400>;
> @@ -193,6 +198,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x500>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <396>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_500>;
> @@ -207,6 +213,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x600>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <396>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_600>;
> @@ -221,6 +228,7 @@
>                         compatible = "qcom,kryo385";
>                         reg = <0x0 0x700>;
>                         enable-method = "psci";
> +                       dynamic-power-coefficient = <396>;
>                         qcom,freq-domain = <&cpufreq_hw 1>;
>                         #cooling-cells = <2>;
>                         next-level-cache = <&L2_700>;
> --
> 2.20.1.791.gb4d0f1c61a-goog
>
