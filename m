From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V3 5/5] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Tue, 19 Jan 2016 16:26:08 +0900
Message-ID: <569DE510.8090606@samsung.com>
References: <1452771166-13694-1-git-send-email-ldewangan@nvidia.com>
 <1452771166-13694-6-git-send-email-ldewangan@nvidia.com>
 <569DC9AD.7000504@samsung.com> <569DDFEE.4080307@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-reply-to: <569DDFEE.4080307@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 19.01.2016 16:04, Laxman Dewangan wrote:
> Thanks for review.
> Here is my view on the some of the review comment.
> 
> On Tuesday 19 January 2016 10:59 AM, Krzysztof Kozlowski wrote:
>> On 14.01.2016 20:32, Laxman Dewangan wrote:
> 
>> +    return ret;
>> +}
>> +
>> +static int max77620_init_pmic(struct max77620_regulator *pmic, int id)
>> +{
>> This function seems to be used only from max77620_of_parse_cb(). I would
>> find easier to read if this was located before definition of
>> max77620_of_parse_cb(). Can you move it (or you had other idea of
>> placing algorithm)?
> 
> I wanted to keep all local function on top which is used on this file
> and not the regulator ops.
> Then implement regulator ops and then probe.
> Let me see if I can do anything here.

Ah, OK then. That kind of order makes sense as well.

> 
>>
>>> +             pmic->enable_power_mode[id]) {
>>> +            ret = max77620_regulator_set_power_mode(
>>> +                    pmic, pmic->enable_power_mode[id], id);
>> The 'pmic' argument should be after opening parenthesis, not at new line.
> 
> This is done for indenting alignment. I am using checkpatch --strict
> option and for this the next line should be on same column of first
> charcter after opening parenthesis.
> To avoid this error, if we want to re-align the indenting for next line
> then left the line empty after "(".

But the next line is not aligned with the function call. So the 'strict'
is not followed and the code is less readable. Instead this should be
something like:

+			ret = max77620_regulator_set_power_mode(pmic
+					pmic->enable_power_mode[id],
					id);

You cannot align it with function call anyway (to many indentations and
too long name of function).

> 
> +
> +static int __init max77620_regulator_init(void)
> +{
> +    return platform_driver_register(&max77620_regulator_driver);
> +}
> +subsys_initcall(max77620_regulator_init);
> +
> 
>> Does it have to be subsys_initcall? Any special requirements for
>> ordering the drivers? Probe deferring is encouraged instead.
>>
>>
> 
> 
> This is to make sure th regulators are ready before other driver get
> probed. This is basic need of some of driver and hence subsys_initcall.
> I will move to module_init() as some of other PMIC driver (as3722) is in
> the module init and used in tegra platform so not seeing much issue on
> this.

The other driver should support deferred probe and then the problem is
somehow solved. There are some rare cases when this does not work yet
but then please describe exactly which driver cannot work with it.

For example max77802 regulator works well.

Best regards,
Krzysztof

