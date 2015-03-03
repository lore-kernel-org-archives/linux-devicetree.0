From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 3/4] regulator: qcom: Refactor of-parsing code
Date: Tue, 03 Mar 2015 10:56:48 -0800
Message-ID: <54F603F0.5000805@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-4-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-4-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/02/15 20:25, Bjorn Andersson wrote:
> +
> +static int rpm_reg_probe(struct platform_device *pdev)
> +{
> +	struct regulator_init_data *initdata;
> +	const struct qcom_rpm_reg *template;
> +	const struct of_device_id *match;
> +	struct regulator_config config = { };
> +	struct regulator_dev *rdev;
> +	struct qcom_rpm_reg *vreg;
> +	const char *key;
> +	u32 val;
> +	int ret;
> +
> +	match = of_match_device(rpm_of_match, &pdev->dev);
> +	template = match->data;
> +
> +	vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
> +	if (!vreg) {
> +		dev_err(&pdev->dev, "failed to allocate vreg\n");

We don't need error messages on allocation failures.

> +		return -ENOMEM;
> +	}


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
