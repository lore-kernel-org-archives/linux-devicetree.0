From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/7] drivers: regulator: qcom_spmi: enable linear
 range info
Date: Thu, 13 Jun 2019 08:10:08 -0700
Message-ID: <20190613151008.GA6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142231.8728-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613142231.8728-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:

> From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> index 53a61fb65642..fd55438c25d6 100644
> --- a/drivers/regulator/qcom_spmi-regulator.c
> +++ b/drivers/regulator/qcom_spmi-regulator.c
> @@ -1744,6 +1744,7 @@ MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
>  static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  {
>  	const struct spmi_regulator_data *reg;
> +	const struct spmi_voltage_range *range;
>  	const struct of_device_id *match;
>  	struct regulator_config config = { };
>  	struct regulator_dev *rdev;
> @@ -1833,6 +1834,12 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
>  			}
>  		}
>  
> +		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {

This doesn't compile, because HFS430 isn't defined until patch 7.

But in patch 2 you replace this with a check to see if there's just a
single range, which is a better solution. So squash the last hunk of
patch 2 into this.

Regards,
Bjorn

> +			/* since there is only one range */
> +			range = spmi_regulator_find_range(vreg);
> +			vreg->desc.uV_step = range->step_uV;
> +		}
> +
>  		config.dev = dev;
>  		config.driver_data = vreg;
>  		config.regmap = regmap;
> -- 
> 2.17.1
> 
