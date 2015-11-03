From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v2 5/6] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Tue, 3 Nov 2015 11:57:03 -0600
Message-ID: <5638F56F.2050102@ti.com>
References: <1446244904-29315-1-git-send-email-afd@ti.com>
 <1446244904-29315-6-git-send-email-afd@ti.com>
 <20151101023735.GE28319@sirena.org.uk> <5638D97A.8040306@ti.com>
 <20151103163117.GQ20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151103163117.GQ20228@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/03/2015 10:31 AM, Mark Brown wrote:
> On Tue, Nov 03, 2015 at 09:57:46AM -0600, Andrew F. Davis wrote:
>> On 10/31/2015 09:37 PM, Mark Brown wrote:
>>> On Fri, Oct 30, 2015 at 05:41:43PM -0500, Andrew F. Davis wrote:
>
>>>> +	struct regulator_desc desc;
>>>> +	unsigned int decay_reg;
>>>> +	unsigned int decay_mask;
>
>>> The decay_reg and decay_mask fields appear to be entirely write only,
>>> why are they present?
>
>> Not sure what you mean, they are written to differently for each regulator,
>> and read when setting the decay mode in _probe.
>
> Ugh, that's a bit hidden (mostly due to not using the callback).
>
>>>> +	ret = of_regulator_match(&pdev->dev, pdev->dev.of_node,
>>>> +				 tps65086_matches,
>>>> +				 ARRAY_SIZE(tps65086_matches));
>>>> +	if (ret < 0) {
>>>> +		dev_err(tps->dev, "Error parsing regulator init data\n");
>>>> +		return ret;
>>>> +	}
>
>>> Please match regulators using the fields in the regulator_desc rather
>>> than open coding.
>
>> I need to match to get the driver specific information for each regulator,
>> if I let regulator_register do it I never get a chance to process the match,
>> unless there is a callback or something I'm missing.
>
> There's a callback you are missing, of_parse_cb().
>

Ah, that will make things easier, I'll re-spin with the callback.
