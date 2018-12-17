From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 02/10] dt-bindings: power: Add qcom rpm power domain
 driver bindings
Date: Mon, 17 Dec 2018 15:08:49 -0600
Message-ID: <20181217210849.GA15490@bogus>
References: <20181212092131.13046-1-rnayak@codeaurora.org>
 <20181212092131.13046-3-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181212092131.13046-3-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 02:51:23PM +0530, Rajendra Nayak wrote:
> Add DT bindings to describe the rpm/rpmh power domains found on Qualcomm
> Technologies, Inc. SoCs. These power domains communicate a performance
> state to RPM/RPMh, which then translates it into corresponding voltage on a
> PMIC rail.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  | 146 ++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  39 +++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>  create mode 100644 include/dt-bindings/power/qcom-rpmpd.h
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> new file mode 100644
> index 000000000000..a776e4407f09
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

#power-domain-cells

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
