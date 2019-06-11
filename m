From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcs404: Add interconnect provider DT
 nodes
Date: Tue, 11 Jun 2019 16:40:20 -0700
Message-ID: <20190611234020.GX4814@minitux>
References: <20190611164157.24656-1-georgi.djakov@linaro.org>
 <20190611164157.24656-6-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611164157.24656-6-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: robh+dt@kernel.org, agross@kernel.org, vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 11 Jun 09:41 PDT 2019, Georgi Djakov wrote:

> Add the DT nodes for the network-on-chip interconnect buses found
> on qcs404-based platforms.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> 
> v3:
> - Updated according to the new binding: added reg property and moved under the
>   "soc" node.
> 
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffedf9640af7..07ff592233b6 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2018, Linaro Limited
>  
> +#include <dt-bindings/interconnect/qcom,qcs404.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-qcs404.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> @@ -411,6 +412,33 @@
>  			#interrupt-cells = <4>;
>  		};
>  
> +		bimc: interconnect@400000 {

Please maintain sort order of address, node name, label name. So this
should go between rng@e3000 and remoteproc@b00000.

Other than that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
> +			reg = <0x00400000 0x80000>;
> +			compatible = "qcom,qcs404-bimc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus_clk", "bus_a_clk";
> +			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +				<&rpmcc RPM_SMD_BIMC_A_CLK>;
> +		};
> +
> +		pcnoc: interconnect@500000 {
> +			reg = <0x00500000 0x15080>;
> +			compatible = "qcom,qcs404-pcnoc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus_clk", "bus_a_clk";
> +			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
> +				<&rpmcc RPM_SMD_PNOC_A_CLK>;
> +		};
> +
> +		snoc: interconnect@580000 {
> +			reg = <0x00580000 0x23080>;
> +			compatible = "qcom,qcs404-snoc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus_clk", "bus_a_clk";
> +			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> +				<&rpmcc RPM_SMD_SNOC_A_CLK>;
> +		};
> +
>  		sdcc1: sdcc@7804000 {
>  			compatible = "qcom,sdhci-msm-v5";
>  			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
