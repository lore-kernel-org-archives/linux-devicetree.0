From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Wed, 04 Mar 2015 11:35:43 -0800
Message-ID: <54F75E8F.2070900@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/02/15 20:25, Bjorn Andersson wrote:
> +	match = of_match_device(rpm_of_match, &pdev->dev);
> +	for (reg = match->data; reg->name; reg++) {
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

There's another problem with this of_parse_cb design. The regulator
framework requires supplies to be registered before consumers of the
supplies are registered. So when we register L23 we need to make sure
it's supply is already registered (S8 for example). If we used
of_regulator_match() we could sort the array by hand so that we always
register the supplies first. Or we could modify the regulator framework
to have a concept of "orphaned" supplies like the clock framework has so
that when a regulator is registered it waits until its supply is registered.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
