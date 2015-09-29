From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v3 4/5] regulators: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Tue, 29 Sep 2015 13:08:50 -0500
Message-ID: <560AD3B2.1070102@ti.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-5-git-send-email-afd@ti.com>
 <20150925180533.GN30445@sirena.org.uk> <5605AA1C.3090905@ti.com>
 <20150929151320.GT30445@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150929151320.GT30445@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/29/2015 10:13 AM, Mark Brown wrote:
> On Fri, Sep 25, 2015 at 03:10:04PM -0500, Andrew F. Davis wrote:
>> On 09/25/2015 01:05 PM, Mark Brown wrote:
>>> On Thu, Sep 24, 2015 at 09:52:53AM -0500, Andrew F. Davis wrote:
>
>>>> +	match = of_match_device(tps65912_regulator_of_match_table, &pdev->dev);
>>>> +	if (!match)
>>>> +		return -ENODEV;
>
>>>> +	template = match->data;
>>>> +	id = template->id;
>>>> +	init_data = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
>>>> +					       &regulators[id]);
>
>>> Don't open code this stuff, use the core DT matching in the
>>> regulator_desc instead.
>
>> I assume you are referring to your additions in a0c7b164ad11? If so I'm not
>
> Please don't refer to commits by ID only, include a human readable
> description of the commit for the benefit of any humans who might read
> your mail.
>

Forgot about those pesky humans :), OK, will do from now on.

>> sure that will save me anything as my probe function is called with a DT
>> match already, so no searching is needed.
>
> You've not understood what that change is replacing, the code I'm
> quoting above is exactly that code.  Check out some of the existing
> drivers using this API.
>

Looking at other drivers that use this API they all call regulator_register
in a loop in their probe, once for each possible regulator, in this case
letting the API do the DT node search makes sense. My probe on the other-hand
is only called when we already have a DT match, therefor searching is not
necessary and all I have to do is call of_get_regulator_init_data myself on
the already found DT node. No need to add node names to my regulator_desc
and make the API re-search for the node.

I have further cleaned up this code to show this.

If this is acceptable, I'll push the re-spin so you can review further.

>>> Please also use subject lines mathcing the style for the subsystem.
>
>> I'm not sure I know what you mean? What is wrong with my subject line, it looks
>> like the others I've looked at?
>
> You are using "regulators:", the regulator API uses "regulator:" - this
> should be really clear if you do something like a git shortlog.
>

Ah, slipped right past me, thanks for clarifying, fixed.
