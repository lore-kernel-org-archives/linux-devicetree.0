From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v5 4/4] gpio: tps65086: Add GPO driver for the TPS65086
 PMIC
Date: Fri, 4 Dec 2015 10:11:29 -0600
Message-ID: <5661BB31.5020907@ti.com>
References: <201512020445.59TmUa1O%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <201512020445.59TmUa1O%fengguang.wu@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/01/2015 02:16 PM, kbuild test robot wrote:
> Hi Andrew,
>
> [auto build test ERROR on next-20151127]
> [cannot apply to ljones-mfd/for-mfd-next gpio/for-next v4.4-rc3 v4.4-rc2 v4.4-rc1 v4.4-rc3]
>
> url:    https://github.com/0day-ci/linux/commits/Andrew-F-Davis/Documentation-tps65086-Add-DT-bindings-for-the-TPS65086-PMIC/20151202-024903
> config: i386-allmodconfig (attached as .config)
> reproduce:
>          # save the attached .config to linux build tree
>          make ARCH=i386
>
> All errors (new ones prefixed by >>):
>
>     drivers/gpio/gpio-tps65086.c: In function 'tps65086_gpio_probe':
>>> drivers/gpio/gpio-tps65086.c:106:12: error: 'struct gpio_chip' has no member named 'parent'
>       gpio->chip.parent = gpio->tps->dev;
>                 ^
>
> vim +106 drivers/gpio/gpio-tps65086.c
>
>     100			return -ENOMEM;
>     101	
>     102		platform_set_drvdata(pdev, gpio);
>     103	
>     104		gpio->tps = dev_get_drvdata(pdev->dev.parent);
>     105		gpio->chip = template_chip;
>   > 106		gpio->chip.parent = gpio->tps->dev;
>     107	
>     108		ret = gpiochip_add(&gpio->chip);
>     109		if (ret < 0) {
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>

I'm probably going to drop the GPIO support in the next series push, this
patch was NAK'd for not using .parent, now we have this. I will wait till
the GPIO subsystem is stable and push this separately then.
