From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Mon, 23 Nov 2015 13:18:15 -0600
Message-ID: <56536677.5070102@ti.com>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
 <20151121133739.GG26072@sirena.org.uk> <5650D6D2.5060108@ti.com>
 <20151122131321.GM26072@sirena.org.uk> <56534FA7.2040200@ti.com>
 <20151123190026.GS26072@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151123190026.GS26072@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/23/2015 01:00 PM, Mark Brown wrote:
> On Mon, Nov 23, 2015 at 11:40:55AM -0600, Andrew F. Davis wrote:
>
>> But which of_node?
>
>> regulator_config->of_node
>> regulator_config->dev->of_node
>
>> The second is the only one I see getting used, the first is only
>> used when drivers provide their own init_data and automatic init
>> data getting fails.
>
> The configuration of_node is there to override the device one if there
> were some reason to do it.  This should only happen in a situation where
> we weren't able to use the core parsing, with modern drivers it
> indicates a problematic binding so the code deliberately doesn't handle
> it.  Anything with a problematic binding will have generated the
> init_data in driver code anyway.  If we come up with a reason to extend
> the interface we can do that but for now there is no need.
>

Right, so this is the kind of description that would be nice with the
declaration.

>> The same issue is present in GPIO (gpiolib.c:612), where the of_node
>
> Line number references are complately unhelpful if you don't say what
> you're looking at (for me that's a call to irq_find_mapping() which I'm
> guessing isn't what you were talking about).
>

My bad, that is for v4.4-rc1 line 694. The lines are:

> 	of_node = gpiochip->dev->of_node;
> #ifdef CONFIG_OF_GPIO
> 	/*
> 	 * If the gpiochip has an assigned OF node this takes precedence
> 	 * FIXME: get rid of this and use gpiochip->dev->of_node everywhere
> 	 */
> 	if (gpiochip->of_node)
> 		of_node = gpiochip->of_node;
> #endif

So, if we have a config->of_node it is used over config->dev->of_node.

>> in the config takes precedence over the one in config->dev, the
>> opposite is true for regulators, this is very confusing and should be
>> standardized.
>
> No, they both do the same thing.
>

I don't see that, config->dev->of_node is checked for the init data in
regulator_of_get_init_data, then config->of_node is then ignored if that
succeeds.
