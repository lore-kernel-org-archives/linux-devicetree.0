From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/13] dt-bindings: cpufreq: qcom-nvmem: Support pstates
 provided by a power domain
Date: Wed, 24 Jul 2019 09:26:56 -0600
Message-ID: <20190724152656.GA10017@bogus>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-6-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-6-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 05, 2019 at 11:57:16AM +0200, Niklas Cassel wrote:
> Some Qualcomm SoCs have support for Core Power Reduction (CPR).
> On these platforms, we need to attach to the power domain provider
> providing the performance states, so that the leaky device (the CPU)
> can configure the performance states (which represent different
> CPU clock frequencies).
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  .../bindings/opp/qcom-nvmem-cpufreq.txt       | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> index c5ea8b90e35d..e19a95318e98 100644
> --- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> +++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> @@ -23,6 +23,15 @@ In 'operating-points-v2' table:
>  
>  Optional properties:
>  --------------------
> +In 'cpus' nodes:

In 'cpus' node or 'cpu' nodes?

> +- power-domains: A phandle pointing to the PM domain specifier which provides
> +		the performance states available for active state management.
> +		Please refer to the power-domains bindings
> +		Documentation/devicetree/bindings/power/power_domain.txt
> +		and also examples below.
> +- power-domain-names: Should be
> +	- 'cpr' for qcs404.
> +
>  In 'operating-points-v2' table:
>  - nvmem-cells: A phandle pointing to a nvmem-cells node representing the
>  		efuse registers that has information about the
