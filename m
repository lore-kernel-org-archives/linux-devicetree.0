From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 4/5] regulator: max14577: Add regulator driver for Maxim
 14577
Date: Fri, 22 Nov 2013 14:00:44 +0100
Message-ID: <5314519.ORHTDE3qkF@amdc1032>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1385109972-28059-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org


Hi,

On Friday, November 22, 2013 09:46:11 AM Krzysztof Kozlowski wrote:

[...]

> +static int max14577_regulator_probe(struct platform_device *pdev)
> +{
> +	struct max14577 *max14577 = dev_get_drvdata(pdev->dev.parent);
> +	struct max14577_platform_data *pdata = dev_get_platdata(max14577->dev);
> +	int i, size;
> +	struct regulator_config config = {};
> +	struct regulator_dev **regulators;
> +
> +	if (!pdata) {
> +		/* Parent must provide pdata */
> +		dev_err(&pdev->dev, "No MFD driver platform data found.\n");
> +		return -ENODEV;
> +	}
> +
> +	if (max14577->dev->of_node) {
> +		int ret = max14577_regulator_dt_parse_pdata(pdev, pdata);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	size = sizeof(struct regulator_dev *) * ARRAY_SIZE(supported_regulators);
> +	regulators = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
> +	if (!regulators) {
> +		dev_err(&pdev->dev, "Cannot allocate memory for regulators\n");
> +		return -ENOMEM;
> +	}
> +
> +	config.dev = &pdev->dev;
> +	config.regmap = max14577->regmap;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_regulators); i++) {
> +		/*
> +		 * Index of supported_regulators[] is also the id and must
> +		 * match index of pdata->regulators[].
> +		 */
> +		config.init_data = pdata->regulators[i].initdata;
> +		config.of_node = pdata->regulators[i].of_node;
> +
> +		regulators[i] = devm_regulator_register(&pdev->dev,
> +				&supported_regulators[i], &config);
> +		if (IS_ERR(regulators[i])) {
> +			int ret = PTR_ERR(regulators[i]);

This can be cleaned up further.  The code just needs a single "struct
regulator_dev *regulator" (which can be declared inside "for" loop)
instead of an array.

> +			dev_err(&pdev->dev,
> +					"Regulator init failed for ID %d with error: %d\n",
> +					i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

