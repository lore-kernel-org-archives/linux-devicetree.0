From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 03/11] pinctrl: mvebu: kirkwood pinctrl driver
Date: Mon, 27 Aug 2012 21:19:12 +0200
Message-ID: <503BC830.7090705@gmail.com>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1344689809-6223-4-git-send-email-sebastian.hesselbarth@gmail.com> <CACRpkdbG4jkFcVP_6AmAZzciffQCamKXw7PcFnTdccyq7AMa8A@mail.gmail.com> <343192fa3698ed0575444a5603ed734d@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <343192fa3698ed0575444a5603ed734d@codethink.co.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On 08/27/2012 03:43 PM, Ben Dooks wrote:
> On 20/08/2012 06:49, Linus Walleij wrote:
>> On Sat, Aug 11, 2012 at 2:56 PM, Sebastian Hesselbarth
>> <sebastian.hesselbarth@gmail.com> wrote:
>> (...)
>>> diff --git a/drivers/pinctrl/pinctrl-kirkwood.c
>>> b/drivers/pinctrl/pinctrl-kirkwood.c
>>> +static struct mvebu_pinctrl_soc_info kirkwood_pinctrl_info;
>>> +
>>> +static struct of_device_id kirkwood_pinctrl_of_match[] __devinitdata
>>> = {
>>> + { .compatible = "marvell,88f6180-pinctrl",
>>> + .data = (void *)VARIANT_MV88F6180 },
>>> + { .compatible = "marvell,88f6190-pinctrl",
>>> + .data = (void *)VARIANT_MV88F6190 },
>>> + { .compatible = "marvell,88f6192-pinctrl",
>>> + .data = (void *)VARIANT_MV88F6192 },
>>> + { .compatible = "marvell,88f6281-pinctrl",
>>> + .data = (void *)VARIANT_MV88F6281 },
>>> + { .compatible = "marvell,88f6282-pinctrl",
>>> + .data = (void *)VARIANT_MV88F6282 },
>>> + { }
>>> +};
>>
>> I'm thinking this variant should maybe be an enum... unless it is
>> strongly established somewhere in Orion/Marvell stuff.
>>
>>> +static int __devinit kirkwood_pinctrl_probe(struct platform_device
>>> *pdev)
>>> +{
>>> + struct mvebu_pinctrl_soc_info *soc = &kirkwood_pinctrl_info;
>>> + const struct of_device_id *match =
>>> + of_match_device(kirkwood_pinctrl_of_match, &pdev->dev);
>>> +
>>> + if (match) {
>>> + soc->variant = (unsigned)match->data & 0xff;
>>> + switch (soc->variant) {
>>> + case VARIANT_MV88F6180:
>>> + soc->controls = mv88f6180_mpp_controls;
>>> + soc->ncontrols = ARRAY_SIZE(mv88f6180_mpp_controls);
>>> + soc->modes = mv88f6xxx_mpp_modes;
>>> + soc->nmodes = ARRAY_SIZE(mv88f6xxx_mpp_modes);
>>> + soc->gpioranges = mv88f6180_gpio_ranges;
>>> + soc->ngpioranges = ARRAY_SIZE(mv88f6180_gpio_ranges);
>>> + break;
>>> + case VARIANT_MV88F6190:
>>> + case VARIANT_MV88F6192:
>>> + soc->controls = mv88f619x_mpp_controls;
>>> + soc->ncontrols = ARRAY_SIZE(mv88f619x_mpp_controls);
>>> + soc->modes = mv88f6xxx_mpp_modes;
>>> + soc->nmodes = ARRAY_SIZE(mv88f6xxx_mpp_modes);
>>> + soc->gpioranges = mv88f619x_gpio_ranges;
>>> + soc->ngpioranges = ARRAY_SIZE(mv88f619x_gpio_ranges);
>>> + break;
>>> + case VARIANT_MV88F6281:
>>> + case VARIANT_MV88F6282:
>>> + soc->controls = mv88f628x_mpp_controls;
>>> + soc->ncontrols = ARRAY_SIZE(mv88f628x_mpp_controls);
>>> + soc->modes = mv88f6xxx_mpp_modes;
>>> + soc->nmodes = ARRAY_SIZE(mv88f6xxx_mpp_modes);
>>> + soc->gpioranges = mv88f628x_gpio_ranges;
>>> + soc->ngpioranges = ARRAY_SIZE(mv88f628x_gpio_ranges);
>>> + break;
>>> + }
>>> + pdev->dev.platform_data = soc;
>>> + }
>>> + return mvebu_pinctrl_probe(pdev);
>>> +}
>
> Why not have structures defining the soc-> parameters and use that in the
> of_match list?

Ben,

functionally it is equivalent and IMHO using soc structs doesn't improve
readability here. I there any other good reason to have structs for each
soc?

Sebastian
