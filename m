From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sdm845: remove unnecessary
 properties for dsi nodes
Date: Wed, 24 Jul 2019 10:31:11 +0530
Message-ID: <CAHLCerPQXQKrm4njTv3bTTKHFCpQC_TnJ98Jmnr0g+bD_Q3ycw@mail.gmail.com>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-3-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724044906.12007-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 10:20 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> We get a warning about unnecessary properties of
>
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2211.22-2257.6: Warning (avoid_unnecessary_addr_size): /soc/mdss@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2278.22-2324.6: Warning (avoid_unnecessary_addr_size): /soc/mdss@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>
> So, remove these properties
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index e81f4a6d08ce..2985df032179 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2234,9 +2234,6 @@
>
>                                 status = "disabled";
>
> -                               #address-cells = <1>;
> -                               #size-cells = <0>;
> -
>                                 ports {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> @@ -2301,9 +2298,6 @@
>
>                                 status = "disabled";
>
> -                               #address-cells = <1>;
> -                               #size-cells = <0>;
> -
>                                 ports {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
> --
> 2.20.1
>
