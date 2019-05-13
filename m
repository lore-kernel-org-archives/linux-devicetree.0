From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
Date: Mon, 13 May 2019 16:31:20 +0530
Message-ID: <CAHLCerP+F9AP97+qVCMqwu-OMJXRhwZrXd33Wk-vj5eyyw-KyA@mail.gmail.com>
References: <20190114184255.258318-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114184255.258318-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> that describes this topology.

This is partly true. There are two groups of gold and silver cores,
but AFAICT they are in a single cluster, not two separate ones. SDM845
is one of the early examples of ARM's Dynamiq architecture.

> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

I noticed that this patch sneaked through for this merge window but
perhaps we can whip up a quick fix for -rc2?

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 38 ++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index c27cbd3bcb0a6..f6c0d87e663f3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -192,6 +192,44 @@
>                                 next-level-cache = <&L3_0>;
>                         };
>                 };
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&CPU0>;
> +                               };
> +
> +                               core1 {
> +                                       cpu = <&CPU1>;
> +                               };
> +
> +                               core2 {
> +                                       cpu = <&CPU2>;
> +                               };
> +
> +                               core3 {
> +                                       cpu = <&CPU3>;
> +                               };
> +                       };
> +
> +                       cluster1 {

This shouldn't exist.

> +                               core0 {

Rename to core4, 5, etc...

> +                                       cpu = <&CPU4>;
> +                               };
> +
> +                               core1 {
> +                                       cpu = <&CPU5>;
> +                               };
> +
> +                               core2 {
> +                                       cpu = <&CPU6>;
> +                               };
> +
> +                               core3 {
> +                                       cpu = <&CPU7>;
> +                               };
> +                       };
> +               };
>         };
>
>         pmu {
> --
> 2.20.1.97.g81188d93c3-goog
>
