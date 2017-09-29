From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v2 02/10] pinctrl: axp209: add pinctrl features (fwd)
Date: Fri, 29 Sep 2017 14:15:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709291413090.2776@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: quentin.schulz@free-electrons.com
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, thomas.petazzoni@free-electrons.com, kbuild-all@01.org
List-Id: devicetree@vger.kernel.org

I'm not sure that it is allowed to do krealloc on devm allocated data.
See lins 468 and 485.

julia

---------- Forwarded message ----------
Date: Fri, 29 Sep 2017 20:00:03 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v2 02/10] pinctrl: axp209: add pinctrl features

Hi Quentin,

[auto build test WARNING on ]

url:    https://github.com/0day-ci/linux/commits/Quentin-Schulz/add-pinmuxing-support-for-pins-in-AXP209-and-AXP813-PMICs/20170929-162846
base:
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago

>> drivers/pinctrl/pinctrl-axp209.c:485:19-27: WARNING: invalid free of devm_ allocated data

# https://github.com/0day-ci/linux/commit/1e016076fb841f90f047d2b001c9f8d9fd5e2953
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 1e016076fb841f90f047d2b001c9f8d9fd5e2953
vim +485 drivers/pinctrl/pinctrl-axp209.c

1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  446
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  447  static int axp20x_build_state(struct platform_device *pdev)
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  448  {
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  449  	struct axp20x_gpio *gpio = platform_get_drvdata(pdev);
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  450  	unsigned int npins = gpio->desc->npins;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  451  	const struct axp20x_desc_pin *pin;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  452  	struct axp20x_desc_function *func;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  453  	int i, ret;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  454
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  455  	gpio->ngroups = npins;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  456  	gpio->groups = devm_kzalloc(&pdev->dev,
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  457  				    gpio->ngroups * sizeof(*gpio->groups),
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  458  				    GFP_KERNEL);
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  459  	if (!gpio->groups)
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  460  		return -ENOMEM;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  461
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  462  	for (i = 0; i < npins; i++) {
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  463  		gpio->groups[i].name = gpio->desc->pins[i].pin.name;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  464  		gpio->groups[i].pin = gpio->desc->pins[i].pin.number;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  465  	}
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  466
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  467  	/* We assume 4 functions per pin should be enough as a default max */
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  468  	gpio->functions = devm_kzalloc(&pdev->dev,
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  469  				       npins * 4 * sizeof(*gpio->functions),
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  470  				       GFP_KERNEL);
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  471  	if (!gpio->functions)
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  472  		return -ENOMEM;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  473
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  474  	/* Create a list of uniquely named functions */
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  475  	for (i = 0; i < npins; i++) {
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  476  		pin = &gpio->desc->pins[i];
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  477  		func = pin->functions;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  478
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  479  		while (func->name) {
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  480  			axp20x_pinctrl_add_function(gpio, func->name);
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  481  			func++;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  482  		}
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  483  	}
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  484
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26 @485  	gpio->functions = krealloc(gpio->functions,
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  486  				   gpio->nfunctions * sizeof(*gpio->functions),
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  487  				   GFP_KERNEL);
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  488
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  489  	for (i = 0; i < npins; i++) {
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  490  		pin = &gpio->desc->pins[i];
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  491  		ret = axp20x_attach_group_function(pdev, pin);
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  492  		if (ret)
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  493  			return ret;
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  494  	}
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  495
1e016076fb drivers/pinctrl/pinctrl-axp209.c Quentin Schulz 2017-09-26  496  	return 0;
f72f4b44df drivers/gpio/gpio-axp209.c       Maxime Ripard  2016-07-20  497  }
f72f4b44df drivers/gpio/gpio-axp209.c       Maxime Ripard  2016-07-20  498

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
