From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 25 Sep 2015 15:10:04 -0500
Message-ID: <5605AA1C.3090905@ti.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150925180533.GN30445@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/25/2015 01:05 PM, Mark Brown wrote:
> On Thu, Sep 24, 2015 at 09:52:53AM -0500, Andrew F. Davis wrote:
>
>> +static int tps65912_regulator_probe(struct platform_device *pdev)
>> +{
>> +	struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
>> +	struct regulator_init_data *init_data;
>> +	const struct tps_info *template;
>> +	struct regulator_dev *rdev;
>> +	const struct of_device_id *match;
>> +	struct regulator_config config = { };
>> +	int id;
>> +
>> +	match = of_match_device(tps65912_regulator_of_match_table, &pdev->dev);
>> +	if (!match)
>> +		return -ENODEV;
>> +
>> +	template = match->data;
>> +	id = template->id;
>> +	init_data = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
>> +					       &regulators[id]);
>
> Don't open code this stuff, use the core DT matching in the
> regulator_desc instead.
>

I assume you are referring to your additions in a0c7b164ad11? If so I'm not
sure that will save me anything as my probe function is called with a DT
match already, so no searching is needed.

> Please also use subject lines mathcing the style for the subsystem.
>

I'm not sure I know what you mean? What is wrong with my subject line, it looks
like the others I've looked at?
