From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH 1/4] gpio: Add AXP209 GPIO driver
Date: Wed, 09 Mar 2016 14:20:16 +0100
Message-ID: <87io0v23fz.fsf@dell.be.48ers.dk>
References: <1457520614-32239-1-git-send-email-maxime.ripard@free-electrons.com>
	<1457520614-32239-2-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDKONJFYSUEBBE6GQC3QKGQEOGKCIDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1457520614-32239-2-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
	(Maxime Ripard's message of "Wed, 9 Mar 2016 11:50:11 +0100")
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>>>>> "Maxime" == Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

 > The AXP209 PMIC has a bunch of GPIOs accessible, that are usually used to
 > control LEDs or backlight.

Do you find 3 'a bunch'? ;)

 > +static int axp20x_gpio_probe(struct platform_device *pdev)
 > +{
 > +	struct axp20x_dev *axp20x = dev_get_drvdata(pdev->dev.parent);
 > +	struct axp20x_gpio *gpio;
 > +	int ret;
 > +
 > +	if (!of_device_is_available(pdev->dev.of_node))
 > +		return -ENODEV;
 > +
 > +	if (!axp20x) {
 > +		dev_err(&pdev->dev, "Parent drvdata not set\n");
 > +		return -EINVAL;
 > +	}
 > +
 > +	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 > +	if (!gpio)
 > +		return -ENOMEM;
 > +
 > +	gpio->chip.base			= -1;
 > +	gpio->chip.can_sleep		= true;
 > +	gpio->chip.dev			= &pdev->dev;
 > +	gpio->chip.label		= dev_name(&pdev->dev);
 > +	gpio->chip.owner		= THIS_MODULE;
 > +	gpio->chip.get			= axp20x_gpio_get;
 > +	gpio->chip.set			= axp20x_gpio_set;
 > +	gpio->chip.direction_input	= axp20x_gpio_input;
 > +	gpio->chip.direction_output	= axp20x_gpio_output;
 > +	gpio->chip.ngpio		= 3;
 > +
 > +	gpio->regmap = axp20x->regmap;

This could just use dev_get_regmap(pdev.dev->parent, NULL) instead of
fiddling in the parent driver data.

 > +
 > +	ret = gpiochip_add(&gpio->chip);
 > +	if (ret) {
 > +		dev_err(&pdev->dev, "Failed to register GPIO chip\n");
 > +		return ret;
 > +	}
 > +
 > +	dev_info(&pdev->dev, "AXP209 GPIO driver loaded\n");

Any reason to be so noisy?

-- 
Bye, Peter Korsgaard
