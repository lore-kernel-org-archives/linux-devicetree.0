From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: Update PMIC modes for PMIC5
Date: Fri, 9 Aug 2019 11:00:14 -0700
Message-ID: <20190809180014.GP26807@tuxbook-pro>
References: <20190809073616.1235-1-vkoul@kernel.org>
 <20190809073616.1235-4-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809073616.1235-4-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 09 Aug 00:36 PDT 2019, Vinod Koul wrote:

> Add the PMIC5 modes and use them pmic5 ldo and smps
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 52 +++++++++++++++++++++----
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 391ed844a251..db6c085da65e 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -50,6 +50,20 @@ enum rpmh_regulator_type {
>  #define PMIC4_BOB_MODE_AUTO			2
>  #define PMIC4_BOB_MODE_PWM			3
>  
> +#define PMIC5_LDO_MODE_RETENTION		3
> +#define PMIC5_LDO_MODE_LPM			4
> +#define PMIC5_LDO_MODE_HPM			7
> +
> +#define PMIC5_SMPS_MODE_RETENTION		3
> +#define PMIC5_SMPS_MODE_PFM			4
> +#define PMIC5_SMPS_MODE_AUTO			6
> +#define PMIC5_SMPS_MODE_PWM			7
> +
> +#define PMIC5_BOB_MODE_PASS			2
> +#define PMIC5_BOB_MODE_PFM			4
> +#define PMIC5_BOB_MODE_AUTO			6
> +#define PMIC5_BOB_MODE_PWM			7
> +
>  /**
>   * struct rpmh_vreg_hw_data - RPMh regulator hardware configurations
>   * @regulator_type:		RPMh accelerator type used to manage this
> @@ -488,6 +502,14 @@ static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
>  	[REGULATOR_MODE_FAST]    = -EINVAL,
>  };
>  
> +static const int pmic_mode_map_pmic5_ldo[REGULATOR_MODE_STANDBY + 1] = {
> +	[REGULATOR_MODE_INVALID] = -EINVAL,
> +	[REGULATOR_MODE_STANDBY] = PMIC5_LDO_MODE_RETENTION,
> +	[REGULATOR_MODE_IDLE]    = PMIC5_LDO_MODE_LPM,
> +	[REGULATOR_MODE_NORMAL]  = PMIC5_LDO_MODE_HPM,
> +	[REGULATOR_MODE_FAST]    = -EINVAL,
> +};
> +
>  static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int rpmh_mode)
>  {
>  	unsigned int mode;
> @@ -518,6 +540,14 @@ static const int pmic_mode_map_pmic4_smps[REGULATOR_MODE_STANDBY + 1] = {
>  	[REGULATOR_MODE_FAST]    = PMIC4_SMPS_MODE_PWM,
>  };
>  
> +static const int pmic_mode_map_pmic5_smps[REGULATOR_MODE_STANDBY + 1] = {
> +	[REGULATOR_MODE_INVALID] = -EINVAL,
> +	[REGULATOR_MODE_STANDBY] = PMIC5_SMPS_MODE_RETENTION,
> +	[REGULATOR_MODE_IDLE]    = PMIC5_SMPS_MODE_PFM,
> +	[REGULATOR_MODE_NORMAL]  = PMIC5_SMPS_MODE_AUTO,
> +	[REGULATOR_MODE_FAST]    = PMIC5_SMPS_MODE_PWM,
> +};
> +
>  static unsigned int
>  rpmh_regulator_pmic4_smps_of_map_mode(unsigned int rpmh_mode)
>  {
> @@ -552,6 +582,14 @@ static const int pmic_mode_map_pmic4_bob[REGULATOR_MODE_STANDBY + 1] = {
>  	[REGULATOR_MODE_FAST]    = PMIC4_BOB_MODE_PWM,
>  };
>  
> +static const int pmic_mode_map_pmic5_bob[REGULATOR_MODE_STANDBY + 1] = {
> +	[REGULATOR_MODE_INVALID] = -EINVAL,
> +	[REGULATOR_MODE_STANDBY] = -EINVAL,
> +	[REGULATOR_MODE_IDLE]    = PMIC5_BOB_MODE_PFM,
> +	[REGULATOR_MODE_NORMAL]  = PMIC5_BOB_MODE_AUTO,
> +	[REGULATOR_MODE_FAST]    = PMIC5_BOB_MODE_PWM,
> +};
> +
>  static unsigned int rpmh_regulator_pmic4_bob_of_map_mode(unsigned int rpmh_mode)
>  {
>  	unsigned int mode;
> @@ -643,7 +681,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo = {
>  	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
>  	.n_voltages = 256,
>  	.hpm_min_load_uA = 10000,
> -	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
> +	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>  	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>  };
>  
> @@ -653,7 +691,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo_lv = {
>  	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 62, 8000),
>  	.n_voltages = 63,
>  	.hpm_min_load_uA = 10000,
> -	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
> +	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>  	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>  };
>  
> @@ -663,7 +701,7 @@ static const struct rpmh_vreg_hw_data pmic5_nldo = {
>  	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
>  	.n_voltages = 124,
>  	.hpm_min_load_uA = 30000,
> -	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
> +	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
>  	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
>  };
>  
> @@ -672,7 +710,7 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps510 = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
>  	.n_voltages = 216,
> -	.pmic_mode_map = pmic_mode_map_pmic4_smps,
> +	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };
>  
> @@ -681,7 +719,7 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 263, 4000),
>  	.n_voltages = 264,
> -	.pmic_mode_map = pmic_mode_map_pmic4_smps,
> +	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };
>  
> @@ -690,7 +728,7 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 1600),
>  	.n_voltages = 5,
> -	.pmic_mode_map = pmic_mode_map_pmic4_smps,
> +	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };
>  
> @@ -699,7 +737,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
>  	.ops = &rpmh_regulator_vrm_bypass_ops,
>  	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
>  	.n_voltages = 136,
> -	.pmic_mode_map = pmic_mode_map_pmic4_bob,
> +	.pmic_mode_map = pmic_mode_map_pmic5_bob,
>  	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
>  };
>  
> -- 
> 2.20.1
> 
