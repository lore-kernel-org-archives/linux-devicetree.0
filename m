From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: Re: [PATCH v5 8/9] pinctrl: axp209: add support for AXP813 GPIOs
Date: Fri, 8 Dec 2017 14:41:37 +0100
Message-ID: <96bc20e3-97ca-ae76-9e35-e6af644659c7@free-electrons.com>
References: <20171205144647.17594-1-quentin.schulz@free-electrons.com>
 <20171205144647.17594-9-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171205144647.17594-9-quentin.schulz@free-electrons.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, lee.jones@linaro.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi all,

There is a bug below.

On 05/12/2017 15:46, Quentin Schulz wrote:
> The AXP813 has only two GPIOs. GPIO0 can either be used as a GPIO, an
> LDO regulator or an ADC. GPIO1 can be used either as a GPIO or an LDO
> regulator.
> 
> Moreover, the status bit of the GPIOs when in input mode is not offset
> by 4 unlike the AXP209.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Rob Herring <robh@kernel.org>
[...]

>  static int axp20x_pctl_probe(struct platform_device *pdev)
>  {
>  	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
>  	struct axp20x_pctl *pctl;
> +	struct device *dev = &pdev->dev;
>  	struct pinctrl_desc *pctrl_desc;
>  	int ret;
>  
> @@ -388,9 +413,9 @@ static int axp20x_pctl_probe(struct platform_device *pdev)
>  	pctl->chip.set			= axp20x_gpio_set;
>  	pctl->chip.direction_input	= axp20x_gpio_input;
>  	pctl->chip.direction_output	= axp20x_gpio_output;
> -	pctl->chip.ngpio		= 3;
> +	pctl->chip.ngpio		= pctl->desc->npins;
>  
> -	pctl->desc = &axp20x_data;
> +	pctl->desc = (struct axp20x_pctrl_desc *)of_device_get_match_data(dev);
>  	pctl->regmap = axp20x->regmap;
>  	pctl->dev = &pdev->dev;
>  

I am using pctl->desc before retrieving it, thus dereferencing from a
null pointer.

We just have to move
pctl->chip.ngpio		= pctl->desc->npins;
after
pctl->desc = (struct axp20x_pctrl_desc *)of_device_get_match_data(dev);

Linus, I guess that I should send a patch to fix this or is there an
other way not to have to apply such a small and dumb patch?

Quentin
-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
