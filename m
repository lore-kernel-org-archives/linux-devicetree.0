From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Tue, 3 Mar 2015 14:32:35 -0800
Message-ID: <20150303223235.GK26334@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F630FF.60109@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54F630FF.60109@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 03 Mar 14:09 PST 2015, Stephen Boyd wrote:

> On 03/02/15 20:25, Bjorn Andersson wrote:
> > -	config.of_node = pdev->dev.of_node;
> > +static int rpm_reg_probe(struct platform_device *pdev)
> > +{
> > +	const struct rpm_regulator_data *reg;
> > +	const struct of_device_id *match;
> > +	struct regulator_config config = { };
> > +	struct regulator_dev *rdev;
> > +	struct qcom_rpm_reg *vreg;
> >  
> > -	ret = rpm_reg_of_parse(pdev->dev.of_node, &vreg->desc,
> > -			       &config, initdata);
> > -	if (ret)
> > -		return ret;
> > +	match = of_match_device(rpm_of_match, &pdev->dev);
> > +	for (reg = match->data; reg->name; reg++) {
> 
> How does this work for the case where we may not want to add all the
> regulators that a PMIC supports. I'm mostly thinking about the case
> where we want to use the pm8xxx-regulator driver for a few regulators
> and so we omit them from the DT for the RPM regulators.
> 

An empty or non-existing regulator of_node will still be registered, but
without REGULATOR_CHANGE_STATUS nor REGULATOR_CHANGE_VOLTAGE; so any
operation on this regulator will fail with an -EPERM.

Regards,
Bjorn
