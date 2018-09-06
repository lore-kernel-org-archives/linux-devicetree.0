From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add AOSS reset driver node for SDM845
Date: Thu, 6 Sep 2018 09:00:45 -0700
Message-ID: <CAD=FV=UohTgZLG+Nymf6Rd0v7H9gssheYAxuH5m0QRN3TufJQA@mail.gmail.com>
References: <20180901222355.21803-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901222355.21803-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Sep 1, 2018 at 3:23 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
>
> This patch adds the node to support AOSS reset driver on
> SDM845
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> [bjorn: Updated addresses to match the binding that was merged]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0c9a2aa6a1b5..077760792cf0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/reset/qcom,sdm845-aoss.h>

nit: please sort alphabetically.  "reset" comes before "soc"

...other than that this looks sane to me.  Feel free to add my Reviewed-by tag.


-Doug
