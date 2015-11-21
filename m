From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Sat, 21 Nov 2015 14:40:50 -0600
Message-ID: <5650D6D2.5060108@ti.com>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
 <20151121133739.GG26072@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151121133739.GG26072@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/21/2015 07:37 AM, Mark Brown wrote:
> On Thu, Nov 19, 2015 at 05:01:41PM -0600, Andrew F. Davis wrote:
>> Add support for TPS65086 PMIC regulators.
>>
>> The regulators set consists of 3 Step-down Controllers, 3 Step-down
>> Converters, 3 LDOs, 3 Load Switches, and a Sink and Source LDO. The
>> output voltages are configurable and are meant to supply power to a
>> SoC and/or other components.
>
> An earlier version of this patch has already been applied, please don't
> resend already applied patches but send incremental patches with any
> changes.
>

Odd, I didn't seem to get any message for this getting applied. Looks
like only a couple lines difference from the version in the regulators
branch, I don't imagine you are able to rebase that with these changes?

Anyway the reason that line needed changed is over a confusion in
what the 'of_node' does in 'struct regulator_config'. The description
seems to make it seem like it is the node that gets checked for
init data.

> * @of_node: OpenFirmware node to parse for device tree bindings (may be
> *           NULL).

But the 'of_node' that is actually searched is the one given in
regulator_config->dev->of_node. Is this intended behavior (drivers
assume it is so it probably has to be now) and if so, the above
description might need to be clarified as too what that 'of_node'
pointer really does?
