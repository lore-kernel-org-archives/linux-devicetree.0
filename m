From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Thu, 28 Apr 2016 12:48:58 +0530
Message-ID: <5721B962.4090503@nvidia.com>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com> <1459348188-11726-3-git-send-email-ldewangan@nvidia.com> <20160427151947.GD4892@dell> <572104AA.7080500@nvidia.com> <20160428072559.GK4892@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160428072559.GK4892@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Thursday 28 April 2016 12:55 PM, Lee Jones wrote:
> On Wed, 27 Apr 2016, Laxman Dewangan wrote:
>
>> On Wednesday 27 April 2016 08:49 PM, Lee Jones wrote:
>>> On Wed, 30 Mar 2016, Laxman Dewangan wrote:
>>>
>>>> +#define MAX77620_MFD_CELL_RES(_name, _res)			\
>>>> +	{							\
>>>> +		.name = (_name),				\
>>>> +		.resources = (_res),				\
>>>> +		.num_resources = ARRAY_SIZE((_res)),		\
>>>> +	}
>>> I'm *still* not accepting this.
>>>
>>>> +
>>>> +static struct mfd_cell max20024_children[] = {
>>>> +	MAX77620_MFD_CELL_NAME("max20024-pinctrl"),
>>>> +	MAX77620_MFD_CELL_RES("max20024-gpio", gpio_resources),
>>>> +	MAX77620_MFD_CELL_NAME("max20024-pmic"),
>>>> +	MAX77620_MFD_CELL_RES("max77620-rtc", rtc_resources),
>>>> +	MAX77620_MFD_CELL_RES("max20024-power", power_resources),
>>>> +	MAX77620_MFD_CELL_NAME("max20024-watchdog"),
>>>> +	MAX77620_MFD_CELL_NAME("max20024-clock"),
>>>> +};
>>> If you want this submission to be accepted this cycle, you're going to
>>> have to convert this to the traditional way of defining MFD children.
>> Yaah, I want to have this in current cycle.
>> Will it be fine as follows? (To have quick agreement)
>>
>> static const struct mfd_cell max77620_children[] = {
>>          {
>>                  .name = "max77620-pinctrl",
>>          }, {
>>                  .name = "max77620-gpio",
>>                  .resource = gpio_resources,
>>                  .num_resources = ARRAY_SIZE(gpio_resources),
>>          }, {
>>          /* and so on */
>>          },
>> };
> Yes.  Although, if there are no run-time ordering dependencies, I
> usually like to a) have the one line entries on one line i.e.
>
>           { .name = "max77620-pinctrl" }
>
> ... and b) for all the one line entries to be grouped together and
> the multi line ones grouped together as well.
>


It is turning like as follows:

static const struct mfd_cell max77620_children[] = {
         { .name = "max77620-pinctrl", },
         { .name = "max77620-clock", },
         { .name = "max77620-pmic", },
         { .name = "max77620-watchdog", },
         {
                 .name = "max77620-gpio",
                 .resources = gpio_resources,
                 .num_resources = ARRAY_SIZE(gpio_resources),
         }, {
                 .name = "max77620-rtc",
                 .resources = rtc_resources,
                 .num_resources = ARRAY_SIZE(rtc_resources),
         }, {
                 .name = "max77620-power",
                 .resources = power_resources,
                 .num_resources = ARRAY_SIZE(power_resources),
         }, {
                 .name = "max77620-thermal",
                 .resources = thermal_resources,
                 .num_resources = ARRAY_SIZE(thermal_resources),
         },
};



Will it be fine?
