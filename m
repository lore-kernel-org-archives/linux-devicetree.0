From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 2/7] regulator: qcom_spmi: Refactor get_mode/set_mode
Date: Thu, 13 Jun 2019 14:32:00 -0700
Message-ID: <20190613213200.GC4814@minitux>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212531.10452-1-jeffrey.l.hugo@gmail.com>
 <20190613212531.10452-2-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613212531.10452-2-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 13 Jun 14:25 PDT 2019, Jeffrey Hugo wrote:

> spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
> multi-level ifs which mirror a switch statement.  Refactor to use a switch
> statement to make the code flow more clear.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 26 +++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 42c429d50743..1b3383a24c9d 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -911,13 +911,16 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
>  
>  	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
>  
> -	if (reg & SPMI_COMMON_MODE_HPM_MASK)
> -		return REGULATOR_MODE_NORMAL;
> +	reg &= SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
>  
> -	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
> +	switch (reg) {
> +	case SPMI_COMMON_MODE_HPM_MASK:
> +		return REGULATOR_MODE_NORMAL;
> +	case SPMI_COMMON_MODE_AUTO_MASK:
>  		return REGULATOR_MODE_FAST;
> -
> -	return REGULATOR_MODE_IDLE;
> +	default:
> +		return REGULATOR_MODE_IDLE;
> +	}
>  }
>  
>  static int
> @@ -925,12 +928,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
>  {
>  	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>  	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
> -	u8 val = 0;
> +	u8 val;
>  
> -	if (mode == REGULATOR_MODE_NORMAL)
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
>  		val = SPMI_COMMON_MODE_HPM_MASK;
> -	else if (mode == REGULATOR_MODE_FAST)
> +		break;
> +	case REGULATOR_MODE_FAST:
>  		val = SPMI_COMMON_MODE_AUTO_MASK;
> +		break;
> +	default:
> +		val = 0;
> +		break;
> +	}
>  
>  	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
>  }
> -- 
> 2.17.1
> 
