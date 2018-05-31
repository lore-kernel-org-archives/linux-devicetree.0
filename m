From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] soc: qcom: rpmpd: Add a powerdomain driver to
 model corners
Date: Wed, 30 May 2018 22:27:09 -0500
Message-ID: <20180531032709.GA13554@rob-hp-laptop>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-2-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180525100121.28214-2-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, collinsd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2018 at 03:31:16PM +0530, Rajendra Nayak wrote:
> The powerdomains for corners just pass the performance state set by the
> consumers to the RPM (Remote Power manager) which then takes care
> of setting the appropriate voltage on the corresponding rails to
> meet the performance needs.
> 
> We add all powerdomain data needed on msm8996 here. This driver can easily
> be extended by adding data for other qualcomm SoCs as well.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  |  55 ++++
>  drivers/soc/qcom/Kconfig                      |   9 +
>  drivers/soc/qcom/Makefile                     |   1 +
>  drivers/soc/qcom/rpmpd.c                      | 299 ++++++++++++++++++
>  4 files changed, 364 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>  create mode 100644 drivers/soc/qcom/rpmpd.c
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> new file mode 100644
> index 000000000000..68f620a2af0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> @@ -0,0 +1,55 @@
> +Qualcomm RPM Powerdomains
> +
> +* For RPM powerdomains, we communicate a performance state to RPM
> +which then translates it into a corresponding voltage on a rail
> +
> +Required Properties:
> + - compatible: Should be one of the following
> +	* qcom,msm8996-rpmpd: RPM Powerdomain for the msm8996 family of SoC
> + - power-domain-cells: number of cells in power domain specifier
> +	must be 1.
> + - operating-points-v2: Phandle to the OPP table for the power-domain.
> +	Refer to Documentation/devicetree/bindings/power/power_domain.txt
> +	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
> +
> +Example:
> +
> +	rpmpd: power-controller {
> +		compatible = "qcom,msm8996-rpmpd";
> +		#power-domain-cells = <1>;
> +		operating-points-v2 = <&rpmpd_opp_table>,
> +				      <&rpmpd_opp_table>,
> +				      <&rpmpd_opp_table>,
> +				      <&rpmpd_opp_table>,
> +				      <&rpmpd_opp_table>,
> +				      <&rpmpd_opp_table>,
> +				      <&rpmpd_opp_table>;
> +	};
> +
> +	rpmpd_opp_table: opp-table {
> +		compatible = "operating-points-v2-qcom-level", "operating-points-v2";
> +
> +		rpmpd_opp1: opp@1 {

unit-address without reg property is not valid.

> +			qcom,level = <1>;

Is this the only property? If so, I don't see the point in trying to use 
operating-points-v2 here.

Rob
