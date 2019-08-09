From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Fix pmic5_bob voltage count
Date: Fri, 9 Aug 2019 10:03:22 -0700
Message-ID: <20190809170322.GO26807@tuxbook-pro>
References: <20190809073616.1235-1-vkoul@kernel.org>
 <20190809073616.1235-3-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809073616.1235-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 09 Aug 00:36 PDT 2019, Vinod Koul wrote:

> pmic5_bob voltages count is 136 [0,135] so update it
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 0ef2716da3bd..391ed844a251 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -698,7 +698,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
>  	.regulator_type = VRM,
>  	.ops = &rpmh_regulator_vrm_bypass_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
> -	.n_voltages = 135,
> +	.n_voltages = 136,
>  	.pmic_mode_map = pmic_mode_map_pmic4_bob,
>  	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
>  };
> -- 
> 2.20.1
> 
