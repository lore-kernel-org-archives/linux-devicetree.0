From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845: Add Coresight support
Date: Fri, 11 Jan 2019 11:46:43 -0700
Message-ID: <20190111184643.GA22691@xps15>
References: <cover.1547054308.git.saiprakash.ranjan@codeaurora.org>
 <a13ad49d3ae8d9a5a972027283b7212ab19f97d0.1547054308.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a13ad49d3ae8d9a5a972027283b7212ab19f97d0.1547054308.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sai,

On Wed, Jan 09, 2019 at 11:16:47PM +0530, Sai Prakash Ranjan wrote:
> Add coresight components found on Qualcomm SDM845 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../arm64/boot/dts/qcom/sdm845-coresight.dtsi | 437 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +
>  2 files changed, 439 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-coresight.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-coresight.dtsi b/arch/arm64/boot/dts/qcom/sdm845-coresight.dtsi
> new file mode 100644
> index 000000000000..b6ef250b9186
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-coresight.dtsi
> @@ -0,0 +1,437 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDM845 Coresight DTS
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +&soc {
> +	stm@6002000 {
> +		compatible = "arm,coresight-stm", "arm,primecell";
> +		reg = <0x06002000 0x1000>,
> +		      <0x16280000 0x180000>;
> +		reg-names = "stm-base", "stm-stimulus-base";
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				stm_out: endpoint {
> +					remote-endpoint = <&funnel0_in7>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@6041000 {
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0x06041000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				funnel0_out: endpoint {
> +					remote-endpoint =
> +						<&merge_funnel_in0>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@7 {
> +				reg = <7>;
> +				funnel0_in7: endpoint {
> +					remote-endpoint = <&stm_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@6043000 {
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0x06043000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				funnel2_out: endpoint {
> +					remote-endpoint =
> +					  <&merge_funnel_in2>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@5 {
> +				reg = <5>;
> +				funnel2_in5: endpoint {
> +					remote-endpoint =
> +					  <&apss_merge_funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@6045000 {
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0x06045000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				merge_funnel_out: endpoint {
> +					remote-endpoint = <&etf_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				merge_funnel_in0: endpoint {
> +					remote-endpoint =
> +						<&funnel0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				merge_funnel_in2: endpoint {
> +					remote-endpoint =
> +						<&funnel2_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	replicator@6046000 {
> +		compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +		reg = <0x06046000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				replicator_out: endpoint {
> +					remote-endpoint = <&etr_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			port {
> +				replicator_in: endpoint {
> +					remote-endpoint = <&etf_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etf@6047000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0x06047000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etf_out: endpoint {
> +					remote-endpoint = <&replicator_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +				etf_in: endpoint {
> +					remote-endpoint = <&merge_funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etr@6048000 {
> +		compatible = "arm,coresight-tmc", "arm,primecell";
> +		reg = <0x06048000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		in-ports {
> +			port {
> +				etr_in: endpoint {
> +					remote-endpoint = <&replicator_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7040000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;

I'm a little curious as to why you need to bypass the normal AMBA bus discovery
method by forcing the peripheral ID.  Tracers don't show up the way other
coresight devices do at boot time?

> +		reg = <0x07040000 0x1000>;
> +
> +		cpu = <&CPU0>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm0_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7140000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07140000 0x1000>;
> +
> +		cpu = <&CPU1>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm1_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7240000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07240000 0x1000>;
> +
> +		cpu = <&CPU2>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm2_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7340000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07340000 0x1000>;
> +
> +		cpu = <&CPU3>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm3_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7440000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07440000 0x1000>;
> +
> +		cpu = <&CPU4>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm4_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in4>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7540000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07540000 0x1000>;
> +
> +		cpu = <&CPU5>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm5_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in5>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7640000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07640000 0x1000>;
> +
> +		cpu = <&CPU6>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm6_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in6>;
> +				};
> +			};
> +		};
> +	};
> +
> +	etm@7740000 {
> +		compatible = "arm,coresight-etm4x", "arm,primecell";
> +		arm,primecell-periphid = <0x000bb95d>;
> +		reg = <0x07740000 0x1000>;
> +
> +		cpu = <&CPU7>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				etm7_out: endpoint {
> +					remote-endpoint = <&apss_funnel_in7>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@7800000 { /* APSS Funnel */
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0x07800000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				apss_funnel_out: endpoint {
> +					remote-endpoint =
> +					    <&apss_merge_funnel_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				apss_funnel_in0: endpoint {
> +					remote-endpoint =
> +						<&etm0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				apss_funnel_in1: endpoint {
> +					remote-endpoint =
> +						<&etm1_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				apss_funnel_in2: endpoint {
> +					remote-endpoint =
> +						<&etm2_out>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				apss_funnel_in3: endpoint {
> +					remote-endpoint =
> +						<&etm3_out>;
> +				};
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +				apss_funnel_in4: endpoint {
> +					remote-endpoint =
> +						<&etm4_out>;
> +				};
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				apss_funnel_in5: endpoint {
> +					remote-endpoint =
> +						<&etm5_out>;
> +				};
> +			};
> +
> +			port@6 {
> +				reg = <6>;
> +				apss_funnel_in6: endpoint {
> +					remote-endpoint =
> +						<&etm6_out>;
> +				};
> +			};
> +
> +			port@7 {
> +				reg = <7>;
> +				apss_funnel_in7: endpoint {
> +					remote-endpoint =
> +						<&etm7_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	funnel@7810000 {
> +		compatible = "arm,coresight-funnel", "arm,primecell";
> +		reg = <0x07810000 0x1000>;
> +
> +		power-domains = <&aoss_qmp AOSS_QMP_QDSS_CLK>;
> +
> +		out-ports {
> +			port {
> +				apss_merge_funnel_out: endpoint {
> +					remote-endpoint =
> +					    <&funnel2_in5>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			port {
> +				apss_merge_funnel_in: endpoint {
> +					remote-endpoint =
> +					    <&apss_funnel_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index c27cbd3bcb0a..03683179b8f7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1853,3 +1853,5 @@
>  		};
>  	};
>  };
> +
> +#include "sdm845-coresight.dtsi"
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
