From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add MSM8998 Multimedia Clock Controller
 (MMCC) driver
Date: Wed, 1 May 2019 08:25:44 -0600
Message-ID: <0513163c-5088-6168-64fb-04fa51f711fa@codeaurora.org>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677642-29428-1-git-send-email-jhugo@codeaurora.org>
 <20190501034314.GE2938@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501034314.GE2938@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org, marc.w.gonzalez@free.fr, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/30/2019 9:43 PM, Bjorn Andersson wrote:
> On Tue 30 Apr 19:27 PDT 2019, Jeffrey Hugo wrote:
>> +static const struct of_device_id mmcc_msm8998_match_table[] = {
>> +	{ .compatible = "qcom,mmcc-msm8998" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
>> +
>> +static int mmcc_msm8998_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
> 
> Don't you want to wait for "xo" here as well?

No, I don't want to.  As far as I recall, Stephen would like to make a 
clear divide between clock providers, and clock consumers.  Since we 
have the uart issue in gcc, and gcc is pretty critical to the entire 
SoC, it seems like there is a reason (not sure I'd call it "good") to 
wait for xo there.

Here, I'm less confident in the reasoning.  mmcc is not really critical 
to the SoC, and everything it services is "optional".  If you have a 
headless system with no display output, you won't even need it.  On 
system where there is a display, I expect the realistic driver ordering 
to be that everything which consumes a mmcc clock to come up well after 
xo is available.

In short, seems like a bit of a kludge to maybe avoid an issue which 
doesn't seem like would happen.

> 
>> +	regmap = qcom_cc_map(pdev, &mmcc_msm8998_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
>> +}
> [..]
>> +MODULE_DESCRIPTION("QCOM MMCC MSM8998 Driver");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:mmcc-msm8998");
> 
> MODULE_DEVICE_TABLE() will provide the alias for module auto loading, so
> drop this.

Huh.  I did not know that.  Will put on the list to fixup.

> 
> Regards,
> Bjorn
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
