From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Tue, 03 Mar 2015 14:09:03 -0800
Message-ID: <54F630FF.60109@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/02/15 20:25, Bjorn Andersson wrote:
> -	config.of_node = pdev->dev.of_node;
> +static int rpm_reg_probe(struct platform_device *pdev)
> +{
> +	const struct rpm_regulator_data *reg;
> +	const struct of_device_id *match;
> +	struct regulator_config config = { };
> +	struct regulator_dev *rdev;
> +	struct qcom_rpm_reg *vreg;
>  
> -	ret = rpm_reg_of_parse(pdev->dev.of_node, &vreg->desc,
> -			       &config, initdata);
> -	if (ret)
> -		return ret;
> +	match = of_match_device(rpm_of_match, &pdev->dev);
> +	for (reg = match->data; reg->name; reg++) {

How does this work for the case where we may not want to add all the
regulators that a PMIC supports. I'm mostly thinking about the case
where we want to use the pm8xxx-regulator driver for a few regulators
and so we omit them from the DT for the RPM regulators.

-Stephen
> +		vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
> +		if (!vreg) {
> +			dev_err(&pdev->dev, "failed to allocate vreg\n");
> +			return -ENOMEM;
> +		}
> +		memcpy(vreg, reg->template, sizeof(*vreg));
> +		mutex_init(&vreg->lock);
> +
> +		vreg->dev = &pdev->dev;
> +		vreg->resource = reg->resource;
> +
> +		vreg->desc.id = -1;
> +		vreg->desc.owner = THIS_MODULE;
> +		vreg->desc.type = REGULATOR_VOLTAGE;
> +		vreg->desc.name = reg->name;
> +		vreg->desc.supply_name = reg->supply;
> +		vreg->desc.of_match = reg->name;
> +		vreg->desc.of_parse_cb = rpm_reg_of_parse;
> +
> +		vreg->rpm = dev_get_drvdata(pdev->dev.parent);
> +		if (!vreg->rpm) {
> +			dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
> +			return -ENODEV;
> +		}
>  
> -	rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
> -	if (IS_ERR(rdev)) {
> -		dev_err(&pdev->dev, "can't register regulator\n");
> -		return PTR_ERR(rdev);
> +		config.dev = &pdev->dev;
> +		config.driver_data = vreg;
> +		rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(&pdev->dev, "can't register regulator\n");
> +			return PTR_ERR(rdev);
> +		}
>  	}
>  
>  	return 0;


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
