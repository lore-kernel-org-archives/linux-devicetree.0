From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Include the interconnect resources
 DT header
Date: Sat, 23 Mar 2019 22:20:23 -0700
Message-ID: <20190324052023.GG27005@builder>
References: <20190311140602.12160-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190311140602.12160-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: andy.gross@linaro.org, daidavid1@codeaurora.org, evgreen@chromium.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 11 Mar 07:06 PDT 2019, Georgi Djakov wrote:

> Include the device tree header for the on-chip interconnect endpoint
> resources on sdm845 devices. This will allow using the "interconnects"
> property in DT nodes to describe the interconnect path resources they use.
> 
> The sdm845 interconnect provider DT node is already present, but the
> header file with the resources is not included, so let's fix this.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Thanks Georgi, picked up for v5.2 with Evan's r-b.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 5308f1671824..be4d4c5859c0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,lpass-sdm845.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sdm845.h>
> +#include <dt-bindings/interconnect/qcom,sdm845.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
