From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: power: Add qcom rpmh power domain
 driver bindings
Date: Wed, 13 Jun 2018 15:12:58 -0700
Message-ID: <ca7fd33a-5ecd-203e-4a83-09c4f1074c2e@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-6-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612044052.4402-6-rnayak@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rajendra,

On 06/11/2018 09:40 PM, Rajendra Nayak wrote:
> Add DT bindings to describe the rpmh powerdomains found on Qualcomm

s/powerdomains/power domains/

> Technologies, Inc. SoCs. These power domains communicate a performance
> state to RPMh, which then translates it into corresponding voltage on
> a PMIC rail.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmhpd.txt | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmhpd.txt

include/dt-bindings/power/qcom-rpmhpd.h from patch 6/7 should be moved to
this patch.

> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmhpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
> new file mode 100644
> index 000000000000..41ef7afa6b24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
> @@ -0,0 +1,65 @@
> +Qualcomm RPMh Power domains
> +
> +For RPMh Power domains, we communicate a performance state to RPMh
> +which then translates it into a corresponding voltage on a rail
> +
> +Required Properties:
> + - compatible: Should be one of the following
> +	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
> + - power-domain-cells: number of cells in power domain specifier
> +	must be 1
> + - operating-points-v2: Phandle to the OPP table for the power-domain.
> +	Refer to Documentation/devicetree/bindings/power/power_domain.txt
> +	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details

Could you please mention here that qcom,level properties in the associated
opp-table should use the RPMH_REGULATOR_LEVEL_* constants?  RPMh ARC
resources depend upon the RPMH_REGULATOR_LEVEL_* constants to provide a
mapping of levels supported by hardware.

> +Example:

Could you please add this here?

#include <dt-bindings/power/qcom-rpmhpd.h>

> +
> +	rpmhpd: power-controller {
> +		compatible = "qcom,sdm845-rpmhpd";
> +		#power-domain-cells = <1>;
> +		operating-points-v2 = <&rpmhpd_opp_table>;
> +	};
> +
> +	rpmhpd_opp_table: opp-table {
> +		compatible = "operating-points-v2-qcom-level";
> +
> +		rpmhpd_opp_ret: opp1 {
> +			qcom-level = <16>;

As per qcom-opp.txt, 'qcom,level' should be used, not 'qcom-level'.

Where is the qcom-opp.txt patch?  It isn't part of the v3 patch series but
was in the v2 series [1].

Could you please change this to be the following?

    qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;

Also, please use the level constants for all other subnodes in this
example as well.

> +		};
> +
> +		rpmhpd_opp_min_svs: opp2 {
> +			qcom-level = <48>;
> +		};
> +
> +		rpmhpd_opp_low_svs: opp3 {
> +			qcom-level = <64>;
> +		};
> +
> +		rpmhpd_opp_svs: opp4 {
> +			qcom-level = <128>;
> +		};
> +
> +		rpmhpd_opp_svs_l1: opp5 {
> +			qcom-level = <192>;
> +		};
> +
> +		rpmhpd_opp_nom: opp6 {
> +			qcom-level = <256>;
> +		};
> +
> +		rpmhpd_opp_nom_l1: opp7 {
> +			qcom-level = <320>;
> +		};
> +
> +		rpmhpd_opp_nom_l2: opp8 {
> +			qcom-level = <336>;
> +		};
> +
> +		rpmhpd_opp_turbo: opp9 {
> +			qcom-level = <384>;
> +		};
> +
> +		rpmhpd_opp_turbo_l1: opp10 {
> +			qcom-level = <416>;
> +		};
> +	};

Could you please add an example consumer DT node as well which uses
"SDM845 Power Domain Indexes" from qcom-rpmhpd.h?  It isn't clear how a
specific power domain (e.g. SDM845_CX) is specified from the consumer
side.  It also isn't clear how the consumer specifies a mapping for the
power domain levels that it will be using.

Thanks,
David

[1]: https://lkml.org/lkml/2018/5/25/210

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
