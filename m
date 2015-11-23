From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 3/4] regulator: tps65086: Add regulator driver for the
 TPS65086 PMIC
Date: Mon, 23 Nov 2015 11:40:55 -0600
Message-ID: <56534FA7.2040200@ti.com>
References: <1447974102-24938-1-git-send-email-afd@ti.com>
 <1447974102-24938-4-git-send-email-afd@ti.com>
 <20151121133739.GG26072@sirena.org.uk> <5650D6D2.5060108@ti.com>
 <20151122131321.GM26072@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151122131321.GM26072@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/22/2015 07:13 AM, Mark Brown wrote:
> On Sat, Nov 21, 2015 at 02:40:50PM -0600, Andrew F. Davis wrote:
>> On 11/21/2015 07:37 AM, Mark Brown wrote:
>
>>> An earlier version of this patch has already been applied, please don't
>>> resend already applied patches but send incremental patches with any
>>> changes.
>
>> Odd, I didn't seem to get any message for this getting applied. Looks
>> like only a couple lines difference from the version in the regulators
>> branch, I don't imagine you are able to rebase that with these changes?
>
> As a matter of policy I try to avoid rewriting history unless it is
> really required.
>

Makes sense, I'll push the patch once the rest of this driver gets
pulled in-case more changes are needed.

>> Anyway the reason that line needed changed is over a confusion in
>> what the 'of_node' does in 'struct regulator_config'. The description
>> seems to make it seem like it is the node that gets checked for
>> init data.
>
> The current behaviour is the intended behaviour.
>
>>> * @of_node: OpenFirmware node to parse for device tree bindings (may be
>>> *           NULL).
>
>> But the 'of_node' that is actually searched is the one given in
>> regulator_config->dev->of_node. Is this intended behavior (drivers
>> assume it is so it probably has to be now) and if so, the above
>> description might need to be clarified as too what that 'of_node'
>> pointer really does?
>
> Please submit a patch with any clarification you think is needed.
> of_node is the name of the container subnode of the main node for the
> device where we look for init data - both are used.
>

But which of_node?

regulator_config->of_node
regulator_config->dev->of_node

The second is the only one I see getting used, the first is only
used when drivers provide their own init_data and automatic init
data getting fails.

The same issue is present in GPIO (gpiolib.c:612), where the of_node
in the config takes precedence over the one in config->dev, the
opposite is true for regulators, this is very confusing and should be
standardized.
