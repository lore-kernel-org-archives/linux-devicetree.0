From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Thu, 28 Apr 2016 00:13:10 +0530
Message-ID: <5721083E.8080805@nvidia.com>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com> <1459348188-11726-3-git-send-email-ldewangan@nvidia.com> <20160427151947.GD4892@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160427151947.GD4892@dell>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 27 April 2016 08:49 PM, Lee Jones wrote:
> On Wed, 30 Mar 2016, Laxman Dewangan wrote:
>
>
> What are 20 and 40?  I think you're going to need a comment to
> describe what's going on in this function.
>
>> +	int x, i;
>> +
>> +	for (i = 0; i < 0x7; i++) {
> It's unsual to use hex values like this.
>
> I think it should be defined.
>
>> +		x = base_fps_time * BIT(i);
> 20 * (1 << {0..7})
>
> So ...
>
> 20 * (1, 2, 4, 8, etc)
>
> What does that does that doe exactly?
>
>> +		if (x >= tperiod)
>> +			return i;
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static int max77620_config_fps(struct max77620_chip *chip,
>> +			       struct device_node *fps_np)
> Lots of mention of 'FPS' here, but noting to so what that is?
>
> What does FPS stand for and what does the FPS do?
>
>


The chip support here the Flexible Power Sequence period (FPS period) as
40, 80, 160, 320, 640, 1280, 2560 and 5120 microseconds (for max77620)
20, 40, 80, 160, 320, 640, 1280, 2560  microseconds (for max77620)

There is 3 bits in registers which defined as
000: 40us for max77620, 20us for max20024
001: 80us for max77620, 40us for max20024
010: 160us for max77620, 80us for max20024.
::

 From DT, I am getting the FPS period time as above and this loop is 
finding equivalent bit value (0 to 7) from period.

The min fps time is 40us for MAX77620 and 20us for MAX20024.

