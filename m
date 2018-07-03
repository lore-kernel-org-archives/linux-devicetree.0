From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: power: Add qcom rpm power domain
 driver bindings
Date: Tue, 3 Jul 2018 16:35:54 -0600
Message-ID: <20180703223554.GA32313@rob-hp-laptop>
References: <20180627045234.27403-1-rnayak@codeaurora.org>
 <20180627045234.27403-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180627045234.27403-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2018 at 10:22:30AM +0530, Rajendra Nayak wrote:
> Add DT bindings to describe the rpm/rpmh power domains found on Qualcomm
> Technologies, Inc. SoCs. These power domains communicate a performance
> state to RPM/RPMh, which then translates it into corresponding voltage on a
> PMIC rail.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  | 146 ++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  39 +++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>  create mode 100644 include/dt-bindings/power/qcom-rpmpd.h
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> new file mode 100644
> index 000000000000..8825080afa5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -0,0 +1,146 @@
> +Qualcomm RPM/RPMh Power domains
> +
> +For RPM/RPMh Power domains, we communicate a performance state to RPM/RPMh
> +which then translates it into a corresponding voltage on a rail
> +
> +Required Properties:
> + - compatible: Should be one of the following
> +	* qcom,msm8996-rpmpd: RPM Power domain for the msm8996 family of SoC
> +	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
> + - power-domain-cells: number of cells in Power domain specifier
> +	must be 1.
> + - operating-points-v2: Phandle to the OPP table for the Power domain.
> +	Refer to Documentation/devicetree/bindings/power/power_domain.txt
> +	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
> +
> +Refer to <dt-bindings/power/qcom-rpmpd.h> for the level values for
> +various OPPs for different platforms as well as Power domain indexes
> +
> +Example: rpmh power domain controller and OPP table
> +
> +#include <dt-bindings/power/qcom-rpmhpd.h>
> +
> +qcom,level values specified in the OPP tables for RPMh power domains
> +should use the RPMH_REGULATOR_LEVEL_* constants from
> +<dt-bindings/power/qcom-rpmhpd.h>
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
> +			qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> +		};

I don't see the point in using the OPP binding here when you aren't 
using *any* of the properties from it.

Rob
