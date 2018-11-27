From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add videocc node
Date: Mon, 26 Nov 2018 16:35:50 -0800
Message-ID: <CAD=FV=X3C=oKep1kPWjasLDZdFKfhCs0JMWTOensgYDj=apvuQ@mail.gmail.com>
References: <1541414117-27864-1-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414117-27864-1-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>, Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 5, 2018 at 2:35 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> This adds the video clock controller node to sdm845 based on the examples
> in the bindings.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0..91a281b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,videocc-sdm845.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> @@ -1256,6 +1257,13 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               videocc: clock-controller@ab00000 {
> +                       compatible = "qcom,sdm845-videocc";
> +                       reg = <0xab00000 0x10000>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;

Any reason not to include "#reset-cells = <1>;" here?  The bindings
list it as optional but I see no reason why we should leave it off.
The file "include/dt-bindings/clock/qcom,videocc-sdm845.h" seems to
include some #defines for resets.  Even though the driver doesn't seem
like it supports it yet, it still should be fine to list it here.


> +               };
> +
>                 tsens0: thermal-sensor@c263000 {

Please sort your new node by unit address.  Specifically "ab00000"
comes before "af00000", thus I would expect you to have your node
right before the dispcc.


-Doug
