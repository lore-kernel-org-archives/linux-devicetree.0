From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
Date: Wed, 26 Jun 2019 11:08:54 +0200
Message-ID: <CAHYWTt37Q1E_bggbKb8VdcHRj_YYubqaoVHNN7+1kcr8+XMX0g@mail.gmail.com>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org> <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, jassisinghbrar@gmail.com, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, Sibi Sankar <sibis@codeaurora.org>, enric.balletbo@collabora.com, Jagan Teki <jagan@amarulasolutions.com>, olof@lixom.net, Vinod Koul <vkoul@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-cl>
List-Id: devicetree@vger.kernel.org

I actually think that it makes sense to squash this patch with the
[PATCH v3 10/14] arm64: dts: qcom: qcs404: Add OPP table
patch.

But that might be a personal preference.

Either way, I think this series in ready for the real mailing list.




On Tue, 25 Jun 2019 at 18:48, Jorge Ramirez-Ortiz
<jorge.ramirez-ortiz@linaro.org> wrote:
>
> Support dynamic voltage and frequency scaling on qcs404.
>
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9569686dbc41..4b4ce0b5df76 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -34,6 +34,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 CPU1: cpu@101 {
> @@ -43,6 +46,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 CPU2: cpu@102 {
> @@ -52,6 +58,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 CPU3: cpu@103 {
> @@ -61,6 +70,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 L2_0: l2-cache {
> --
> 2.21.0
>
