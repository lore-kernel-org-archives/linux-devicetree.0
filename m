From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/4] regulator: qcom-rpmh: Sort the compatibles
Date: Fri, 9 Aug 2019 10:02:13 -0700
Message-ID: <20190809170213.GN26807@tuxbook-pro>
References: <20190809073616.1235-1-vkoul@kernel.org>
 <20190809073616.1235-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809073616.1235-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 09 Aug 00:36 PDT 2019, Vinod Koul wrote:

> It helps to keep sorted order for compatibles, so sort them
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 693ffec62f3e..0ef2716da3bd 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -878,18 +878,14 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id rpmh_regulator_match_table[] = {
> -	{
> -		.compatible = "qcom,pm8998-rpmh-regulators",
> -		.data = pm8998_vreg_data,
> -	},
> -	{
> -		.compatible = "qcom,pmi8998-rpmh-regulators",
> -		.data = pmi8998_vreg_data,
> -	},
>  	{
>  		.compatible = "qcom,pm8005-rpmh-regulators",
>  		.data = pm8005_vreg_data,
>  	},
> +	{
> +		.compatible = "qcom,pm8009-rpmh-regulators",
> +		.data = pm8009_vreg_data,
> +	},
>  	{
>  		.compatible = "qcom,pm8150-rpmh-regulators",
>  		.data = pm8150_vreg_data,
> @@ -899,8 +895,12 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
>  		.data = pm8150l_vreg_data,
>  	},
>  	{
> -		.compatible = "qcom,pm8009-rpmh-regulators",
> -		.data = pm8009_vreg_data,
> +		.compatible = "qcom,pm8998-rpmh-regulators",
> +		.data = pm8998_vreg_data,
> +	},
> +	{
> +		.compatible = "qcom,pmi8998-rpmh-regulators",
> +		.data = pmi8998_vreg_data,
>  	},
>  	{}
>  };
> -- 
> 2.20.1
> 
