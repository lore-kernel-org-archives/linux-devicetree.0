From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add lpasscc node
Date: Thu, 6 Dec 2018 16:08:36 -0800
Message-ID: <CAD=FV=UA3zyjr_VqUcyekWhSOo7rtjEbbcU-E=SZ1e9HNhOyrQ@mail.gmail.com>
References: <1543996836-16717-1-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543996836-16717-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 5, 2018 at 12:00 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> This adds the low pass audio clock controller node to sdm845 based on
> the example in the bindings.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 +++-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 8 ++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index b3def03..cf73f3c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -346,7 +346,9 @@
>  &gcc {
>         protected-clocks = <GCC_QSPI_CORE_CLK>,
>                            <GCC_QSPI_CORE_CLK_SRC>,
> -                          <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> +                          <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +                          <GCC_LPASS_Q6_AXI_CLK>,
> +                          <GCC_LPASS_SWAY_CLK>;
>  };
>
>  &i2c10 {
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 1419b00..a3db089 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +#include <dt-bindings/clock/qcom,lpass-sdm845.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> @@ -1264,6 +1265,13 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               lpasscc: clock-controller@17014000 {
> +                       compatible = "qcom,sdm845-lpasscc";
> +                       reg = <0x17014000 0x1f004>, <0x17300000 0x200>;
> +                       reg-names = "cc", "qdsp6ss";
> +                       #clock-cells = <1>;
> +               };
> +
>                 tsens0: thermal-sensor@c263000 {

Please keep nodes with a unit address sorted numerically by unit
address.  0x17014000 should not come before 0xc263000

Presumably this is the kind of thing that Andy can fix himself when he
lands stuff (often dts stuff ends up conflicting a bunch anyway), so I
wouldn't personally post another patch unless I hear from him that he
wants you to repost.  ...but please keep it in mind for the future.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
