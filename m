From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv3 1/4] arm64: dts: qcom: sdm845: Add Coresight support
Date: Mon, 21 Jan 2019 11:37:31 -0700
Message-ID: <20190121183731.GA14049@xps15>
References: <cover.1547813804.git.saiprakash.ranjan@codeaurora.org>
 <73bf137fd5d6cb6bddecdf13026156afcf9d473b.1547813804.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73bf137fd5d6cb6bddecdf13026156afcf9d473b.1547813804.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sai,

On Fri, Jan 18, 2019 at 05:52:53PM +0530, Sai Prakash Ranjan wrote:
> Add coresight components found on Qualcomm SDM845 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> ---
> This depends on AMBA bus pclk change by Bjorn Andersson [1].
> Also depends on patch ("arm64: dts: qcom: sdm845: Increase address
> and size cells for soc") [2].
> 
> [1] https://lore.kernel.org/lkml/20190106080915.4493-7-bjorn.andersson@linaro.org/
> [2] https://lore.kernel.org/lkml/20190117042940.25487-2-bjorn.andersson@linaro.org/

Thank you for making modifications to this patch - I am happy with how it stands
now.  I tried to compile it on my side on a 5.0-rc3 kernel and even after
applying the above two patches you pointed out I get the following error:

Error: /home/mpoirier/work/coresight/kernel-maint/arch/arm64/boot/dts/qcom/sdm845.dtsi:1356.31-32 syntax error
FATAL ERROR: Unable to parse input tree

>From what I see neither aoss_qmp or AOSS_QMP_QDSS_CLK are defined.  Are there
more patches that need to be applied?

Thanks,
Mathieu


> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 448 +++++++++++++++++++++++++++
>  1 file changed, 448 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index c27cbd3bcb0a..2c589f7f13a8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1348,6 +1348,454 @@
>  			};
>  		};
>  
> +		stm@6002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0 0x06002000 0 0x1000>,
> +			      <0 0x16280000 0 0x180000>;
> +			reg-names = "stm-base", "stm-stimulus-base";
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint =
> +						  <&funnel0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@6041000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0 0x06041000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					funnel0_out: endpoint {
> +						remote-endpoint =
> +						  <&merge_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +					funnel0_in7: endpoint {
> +						remote-endpoint = <&stm_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@6043000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0 0x06043000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					funnel2_out: endpoint {
> +						remote-endpoint =
> +						  <&merge_funnel_in2>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@5 {
> +					reg = <5>;
> +					funnel2_in5: endpoint {
> +						remote-endpoint =
> +						  <&apss_merge_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@6045000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0 0x06045000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					merge_funnel_out: endpoint {
> +						remote-endpoint = <&etf_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					merge_funnel_in0: endpoint {
> +						remote-endpoint =
> +						  <&funnel0_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					merge_funnel_in2: endpoint {
> +						remote-endpoint =
> +						  <&funnel2_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@6046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0 0x06046000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					replicator_out: endpoint {
> +						remote-endpoint = <&etr_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					replicator_in: endpoint {
> +						remote-endpoint = <&etf_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etf@6047000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0 0x06047000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etf_out: endpoint {
> +						remote-endpoint =
> +						  <&replicator_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +					etf_in: endpoint {
> +						remote-endpoint =
> +						  <&merge_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etr@6048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0 0x06048000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					etr_in: endpoint {
> +						remote-endpoint =
> +						  <&replicator_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		/*
> +		 * On QCOM SDM845, we bypass the normal AMBA bus discovery
> +		 * method by forcing the peripheral ID because of the wrong
> +		 * value read from ETM PID registers.
> +		 */
> +
> +		etm@7040000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07040000 0 0x1000>;
> +
> +			cpu = <&CPU0>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm0_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7140000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07140000 0 0x1000>;
> +
> +			cpu = <&CPU1>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm1_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7240000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07240000 0 0x1000>;
> +
> +			cpu = <&CPU2>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm2_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7340000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07340000 0 0x1000>;
> +
> +			cpu = <&CPU3>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm3_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7440000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07440000 0 0x1000>;
> +
> +			cpu = <&CPU4>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm4_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7540000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07540000 0 0x1000>;
> +
> +			cpu = <&CPU5>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm5_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7640000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07640000 0 0x1000>;
> +
> +			cpu = <&CPU6>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm6_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etm@7740000 {
> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> +			arm,primecell-periphid = <0x000bb95d>;
> +			reg = <0 0x07740000 0 0x1000>;
> +
> +			cpu = <&CPU7>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					etm7_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@7800000 { /* APSS Funnel */
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0 0x07800000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					apss_funnel_out: endpoint {
> +						remote-endpoint =
> +						  <&apss_merge_funnel_in>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					apss_funnel_in0: endpoint {
> +						remote-endpoint =
> +						  <&etm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					apss_funnel_in1: endpoint {
> +						remote-endpoint =
> +						  <&etm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					apss_funnel_in2: endpoint {
> +						remote-endpoint =
> +						  <&etm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					apss_funnel_in3: endpoint {
> +						remote-endpoint =
> +						  <&etm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					apss_funnel_in4: endpoint {
> +						remote-endpoint =
> +						  <&etm4_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +					apss_funnel_in5: endpoint {
> +						remote-endpoint =
> +						  <&etm5_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +					apss_funnel_in6: endpoint {
> +						remote-endpoint =
> +						  <&etm6_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +					apss_funnel_in7: endpoint {
> +						remote-endpoint =
> +						  <&etm7_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@7810000 {
> +			compatible = "arm,coresight-funnel", "arm,primecell";
> +			reg = <0 0x07810000 0 0x1000>;
> +
> +			power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +			out-ports {
> +				port {
> +					apss_merge_funnel_out: endpoint {
> +						remote-endpoint =
> +						  <&funnel2_in5>;
> +					};
> +				};
> +			};
> +
> +			in-ports {
> +				port {
> +					apss_merge_funnel_in: endpoint {
> +						remote-endpoint =
> +						  <&apss_funnel_out>;
> +					};
> +				};
> +			};
> +		};
> +
>  		usb_1_hsphy: phy@88e2000 {
>  			compatible = "qcom,sdm845-qusb2-phy";
>  			reg = <0x88e2000 0x400>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
