From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: Add AOSS QMP node
Date: Thu, 23 May 2019 08:12:56 -0700
Message-ID: <CAD=FV=XTF5y9dhfq_QsFdbWLszj6EFzTH4NozDPu_7YVzQur3g@mail.gmail.com>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org> <20190501043734.26706-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501043734.26706-4-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Apr 30, 2019 at 9:37 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The AOSS QMP provides a number of power domains, used for QDSS and
> PIL, add the node for this.
>
> Tested-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v6:
> - Added #clock-cells
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fcb93300ca62..666bc88d3e81 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -14,6 +14,7 @@
>  #include <dt-bindings/interconnect/qcom,sdm845.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> @@ -2142,6 +2143,15 @@

Please avoid editing patches by hand.  I needed to manually change the
"15" above to "16" to apply.

-Doug
