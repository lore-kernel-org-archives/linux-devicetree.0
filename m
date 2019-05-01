From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add MSM8998 Multimedia Clock
 Controller (MMCC) driver
Date: Tue, 30 Apr 2019 20:43:14 -0700
Message-ID: <20190501034314.GE2938@tuxbook-pro>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677642-29428-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556677642-29428-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org, marc.w.gonzalez@free.fr, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 30 Apr 19:27 PDT 2019, Jeffrey Hugo wrote:
> +static const struct of_device_id mmcc_msm8998_match_table[] = {
> +	{ .compatible = "qcom,mmcc-msm8998" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
> +
> +static int mmcc_msm8998_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +

Don't you want to wait for "xo" here as well?

> +	regmap = qcom_cc_map(pdev, &mmcc_msm8998_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
> +}
[..]
> +MODULE_DESCRIPTION("QCOM MMCC MSM8998 Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:mmcc-msm8998");

MODULE_DEVICE_TABLE() will provide the alias for module auto loading, so
drop this.

Regards,
Bjorn
