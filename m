From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Update Qualcomm SDM845 DT
 bindings
Date: Sun, 21 Jul 2019 12:10:02 -0700
Message-ID: <20190721191002.GH7234@tuxbook-pro>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
 <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Dai <daidavid1@codeaurora.org>
Cc: georgi.djakov@linaro.org, robh+dt@kernel.org, evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 19 Jul 13:32 PDT 2019, David Dai wrote:

> Redefine the Network-on-Chip devices to more accurately describe
> the interconnect topology on Qualcomm's SDM845 platform. Each
> interconnect device can communicate with different instances of the
> RPMh hardware which are described as RSCs(Resource State Coordinators).
> 
> Signed-off-by: David Dai <daidavid1@codeaurora.org>

I like this and we don't have any consumers in DT yet, so I think this
is good.

But we need a patch to the implementation as well, to have the
provider(s) registered with the new compatibles.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  .../bindings/interconnect/qcom,bcm-voter.txt       | 32 +++++++++++++++++
>  .../bindings/interconnect/qcom,sdm845.txt          | 40 +++++++++++++++++-----
>  2 files changed, 63 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
> new file mode 100644
> index 0000000..2cf7da2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
> @@ -0,0 +1,32 @@
> +Qualcomm BCM-Voter interconnect driver binding
> +-----------------------------------------------------------
> +
> +The Bus Clock Manager (BCM) is a dedicated hardware accelerator
> +that manages shared system resources by aggregating requests
> +from multiple Resource State Coordinators (RSC). Interconnect
> +providers are able to vote for aggregated thresholds values from
> +consumers by communicating through their respective RSCs.
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +			"qcom,sdm845-bcm-voter",
> +
> +Examples:
> +
> +apps_rsc: rsc@179c0000 {
> +	label = "apps_rsc";
> +	compatible = "qcom,rpmh-rsc";
> +
> +	apps_bcm_voter: bcm_voter {
> +		compatible = "qcom,sdm845-bcm-voter";
> +	};
> +}
> +
> +disp_rsc: rsc@179d0000 {
> +	label = "disp_rsc";
> +	compatible = "qcom,rpmh-rsc";
> +
> +	disp_bcm_voter: bcm_voter {
> +		compatible = "qcom,sdm845-bcm-voter";
> +	};
> +}
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> index 5c4f1d9..27f9ed9 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> @@ -4,21 +4,43 @@ Qualcomm SDM845 Network-On-Chip interconnect driver binding
>  SDM845 interconnect providers support system bandwidth requirements through
>  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>  able to communicate with the BCM through the Resource State Coordinator (RSC)
> -associated with each execution environment. Provider nodes must reside within
> -an RPMh device node pertaining to their RSC and each provider maps to a single
> -RPMh resource.
> +associated with each execution environment. Provider nodes must point to at
> +least one RPMh device child node pertaining to their RSC and each provider
> +can map to multiple RPMh resources.
>  
>  Required properties :
>  - compatible : shall contain only one of the following:
> -			"qcom,sdm845-rsc-hlos"
> +			"qcom,sdm845-aggre1_noc",
> +			"qcom,sdm845-aggre2_noc",
> +			"qcom,sdm845-config_noc",
> +			"qcom,sdm845-dc_noc",
> +			"qcom,sdm845-gladiator_noc",
> +			"qcom,sdm845-mem_noc",
> +			"qcom,sdm845-mmss_noc",
> +			"qcom,sdm845-system_noc",
>  - #interconnect-cells : should contain 1
> +- reg : shall contain base register location and length
> +- qcom,bcm-voter : shall contain phandles to bcm voters
>  
>  Examples:
>  
> -apps_rsc: rsc {
> -	rsc_hlos: interconnect {
> -		compatible = "qcom,sdm845-rsc-hlos";
> -		#interconnect-cells = <1>;
> -	};
> +aggre1_noc: interconnect@16e0000 {
> +	compatible = "qcom,sdm845-aggre1_noc";
> +	reg = <0x16e0000 0xd080>;
> +	interconnect-cells = <1>;
> +	qcom,bcm-voter = <&apps_bcm_voter>;
>  };
>  
> +mmss_noc: interconnect@1740000 {
> +	compatible = "qcom,sdm845-mmss_noc";
> +	reg = <0x1740000 0x1c1000>;
> +	interconnect-cells = <1>;
> +	qcom,bcm-voter = <&apps_bcm_voter>, <&disp_bcm_voter>;
> +};
> +
> +mem_noc: interconnect@1380000 {
> +	compatible = "qcom,sdm845-mem_noc";
> +	reg = <0 0x1380000 0 0x27200>;
> +	#interconnect-cells = <1>;
> +	qcom,bcm-voter = <&apps_bcm_voter>, <&disp_bcm_voter>;
> +};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
