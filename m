From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: interconnect: Add Qualcomm QCS404 DT
 bindings
Date: Tue, 11 Jun 2019 16:08:18 -0700
Message-ID: <20190611230818.GT4814@minitux>
References: <20190611164157.24656-1-georgi.djakov@linaro.org>
 <20190611164157.24656-2-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190611164157.24656-2-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: robh+dt@kernel.org, agross@kernel.org, vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 11 Jun 09:41 PDT 2019, Georgi Djakov wrote:

> The Qualcomm QCS404 platform has several buses that could be controlled
> and tuned according to the bandwidth demand.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
> 
> v3:
> - Add a reg property and move the interconnect nodes under the "soc" node.
> 
> v2:
> - No changes.
> 
>  .../bindings/interconnect/qcom,qcs404.txt     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
> new file mode 100644
> index 000000000000..14a827268dda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
> @@ -0,0 +1,46 @@
> +Qualcomm QCS404 Network-On-Chip interconnect driver binding
> +-----------------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +			"qcom,qcs404-bimc"
> +			"qcom,qcs404-pcnoc"
> +			"qcom,qcs404-snoc"
> +- #interconnect-cells : should contain 1
> +
> +Optional properties :
> +reg : specifies the physical base address and size of registers
> +clocks : list of phandles and specifiers to all interconnect bus clocks
> +clock-names : clock names should include both "bus_clk" and "bus_a_clk"
> +
> +Example:
> +
> +soc {
> +	...
> +	bimc: interconnect@400000 {
> +		reg = <0x00400000 0x80000>;
> +		compatible = "qcom,qcs404-bimc";
> +		#interconnect-cells = <1>;
> +		clock-names = "bus_clk", "bus_a_clk";
> +		clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +			<&rpmcc RPM_SMD_BIMC_A_CLK>;
> +	};
> +
> +	pnoc: interconnect@500000 {
> +		reg = <0x00500000 0x15080>;
> +		compatible = "qcom,qcs404-pcnoc";
> +		#interconnect-cells = <1>;
> +		clock-names = "bus_clk", "bus_a_clk";
> +		clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
> +			<&rpmcc RPM_SMD_PNOC_A_CLK>;
> +	};
> +
> +	snoc: interconnect@580000 {
> +		reg = <0x00580000 0x23080>;
> +		compatible = "qcom,qcs404-snoc";
> +		#interconnect-cells = <1>;
> +		clock-names = "bus_clk", "bus_a_clk";
> +		clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> +			<&rpmcc RPM_SMD_SNOC_A_CLK>;
> +	};
> +};
