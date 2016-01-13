From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Wed, 13 Jan 2016 14:30:26 +0530
Message-ID: <5696122A.6000509@nvidia.com>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com> <1452590273-16421-3-git-send-email-ldewangan@nvidia.com> <56959E9A.3060903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56959E9A.3060903@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 13 January 2016 06:17 AM, Krzysztof Kozlowski wrote:
> On 12.01.2016 18:17, Laxman Dewangan wrote:

>> +	}
>> +	dev_dbg(chip->dev, "NVERC = 0x%02x\n", val);
>> +	for (i = 0; i < 8; ++i) {
>> +		if (val & BIT(i))
>> +			dev_info(chip->dev, "NVERC: %s\n", max77620_nverc[i]);
> You are still printing two dev_info (OTP, ES) and here NVERC (probably
> one?). This will be printed on each boot, over and over, till the user
> will learn it and will remember it forever :).
>
>  From my point of view: one dev_info for one probed device.
>
> I don't know if others agree with that, though. What's your opinion Lee?

OK, I make single line print for OTP and ES version.
I remove the NVREC reading and printing as this is read on clear and 
better to move on uboot for this prints.


>
>
> +
> +	ret = regmap_add_irq_chip(chip->rmap[MAX77620_PWR_SLAVE],
> +		chip->chip_irq, IRQF_ONESHOT | IRQF_SHARED, chip->irq_base,
> Why do you need IRQF_SHARED?

In one of my design,  I have three PMICs, one MAX77620, two MAX77621. 
MAX77621 alert an MAX77620 interrupt line is tied and going to single 
interrupt of SoC.

To register same interrupt from all driver, I made it SHARED.

This is per discussion on the other patch
regulator: max8973: add support for junction thermal warning


>> +		&max77620_top_irq_chip, &chip->top_irq_data);
> More tabs needed for indentation of arguments.
>
> Actually the alignment of arguments here is mixed. Sometimes arguments
> are aligned with opening parenthesis, mostly not. Can you make it
> consistent - always aligned?


In my 3rd patch, I tried to align it little more where is possible. But 
I feel that all these indenting is more over individual choice. Example, 
I added one more indent in below example to look better.


         ret = max77620_reg_update(chip->dev, MAX77620_PWR_SLAVE,
-               MAX77620_REG_ONOFFCNFG2, MAX77620_ONOFFCNFG2_WK_EN0,
-               MAX77620_ONOFFCNFG2_WK_EN0);
+                       MAX77620_REG_ONOFFCNFG2, MAX77620_ONOFFCNFG2_WK_EN0,
+                       MAX77620_ONOFFCNFG2_WK_EN0);



