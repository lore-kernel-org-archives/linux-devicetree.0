From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] gpio: arizona: Add support for GPIOs that need to be
 maintained
Date: Sat, 8 Apr 2017 12:06:00 +0800
Message-ID: <201704081133.tjJnbW6y%fengguang.wu@intel.com>
References: <1491568725-14882-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491568725-14882-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: kbuild-all@01.org, linus.walleij@linaro.org, lee.jones@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charles,

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v4.11-rc5 next-20170407]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Charles-Keepax/mfd-arizona-Add-GPIO-maintain-state-flag/20170408-111119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: x86_64-randconfig-x009-201714 (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpio-arizona.c: In function 'arizona_gpio_direction_in':
>> drivers/gpio/gpio-arizona.c:44:3: error: implicit declaration of function 'pm_runtime_mark_last_busy' [-Werror=implicit-function-declaration]
      pm_runtime_mark_last_busy(chip->parent);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-arizona.c:45:3: error: implicit declaration of function 'pm_runtime_put_autosuspend' [-Werror=implicit-function-declaration]
      pm_runtime_put_autosuspend(chip->parent);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-arizona.c: In function 'arizona_gpio_set':
>> drivers/gpio/gpio-arizona.c:93:9: error: implicit declaration of function 'pm_runtime_get_sync' [-Werror=implicit-function-declaration]
      ret = pm_runtime_get_sync(chip->parent);
            ^~~~~~~~~~~~~~~~~~~
>> drivers/gpio/gpio-arizona.c:96:11: warning: 'return' with a value, in function returning void
       return ret;
              ^~~
   drivers/gpio/gpio-arizona.c:82:13: note: declared here
    static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
                ^~~~~~~~~~~~~~~~
   drivers/gpio/gpio-arizona.c: In function 'arizona_gpio_probe':
>> drivers/gpio/gpio-arizona.c:185:2: error: implicit declaration of function 'pm_runtime_enable' [-Werror=implicit-function-declaration]
     pm_runtime_enable(&pdev->dev);
     ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/pm_runtime_mark_last_busy +44 drivers/gpio/gpio-arizona.c

    38		int status = arizona_gpio->status[offset];
    39	
    40		status &= (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT);
    41		if (status == (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT)) {
    42			arizona_gpio->status[offset] &= ~ARIZONA_GP_STATE_OUTPUT;
    43	
  > 44			pm_runtime_mark_last_busy(chip->parent);
  > 45			pm_runtime_put_autosuspend(chip->parent);
    46		}
    47	
    48		return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
    49					  ARIZONA_GPN_DIR, ARIZONA_GPN_DIR);
    50	}
    51	
    52	static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
    53	{
    54		struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
    55		struct arizona *arizona = arizona_gpio->arizona;
    56		unsigned int val;
    57		int ret;
    58	
    59		ret = regmap_read(arizona->regmap, ARIZONA_GPIO1_CTRL + offset, &val);
    60		if (ret < 0)
    61			return ret;
    62	
    63		if (val & ARIZONA_GPN_LVL)
    64			return 1;
    65		else
    66			return 0;
    67	}
    68	
    69	static int arizona_gpio_direction_out(struct gpio_chip *chip,
    70					     unsigned offset, int value)
    71	{
    72		struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
    73		struct arizona *arizona = arizona_gpio->arizona;
    74	
    75		if (value)
    76			value = ARIZONA_GPN_LVL;
    77	
    78		return regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
    79					  ARIZONA_GPN_DIR | ARIZONA_GPN_LVL, value);
    80	}
    81	
    82	static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
    83	{
    84		struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
    85		struct arizona *arizona = arizona_gpio->arizona;
    86		int status = arizona_gpio->status[offset];
    87		int ret;
    88	
    89		status &= (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT);
    90		if (status == ARIZONA_GP_MAINTAIN) {
    91			arizona_gpio->status[offset] |= ARIZONA_GP_STATE_OUTPUT;
    92	
  > 93			ret = pm_runtime_get_sync(chip->parent);
    94			if (ret < 0) {
    95				dev_err(chip->parent, "Failed to resume: %d\n", ret);
  > 96				return ret;
    97			}
    98		}
    99	
   100		if (value)
   101			value = ARIZONA_GPN_LVL;
   102	
   103		regmap_update_bits(arizona->regmap, ARIZONA_GPIO1_CTRL + offset,
   104				   ARIZONA_GPN_LVL, value);
   105	}
   106	
   107	static int arizona_gpio_of_xlate(struct gpio_chip *chip,
   108					 const struct of_phandle_args *gpiospec,
   109					 u32 *flags)
   110	{
   111		struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
   112		u32 offset = gpiospec->args[0];
   113		u32 bits = gpiospec->args[1];
   114	
   115		if (gpiospec->args_count < chip->of_gpio_n_cells)
   116			return -EINVAL;
   117	
   118		if (offset >= chip->ngpio)
   119			return -EINVAL;
   120	
   121		if (flags)
   122			*flags = bits & ~ARIZONA_GP_MAINTAIN;
   123	
   124		if (bits & ARIZONA_GP_MAINTAIN)
   125			arizona_gpio->status[offset] |= ARIZONA_GP_MAINTAIN;
   126	
   127		return offset;
   128	}
   129	
   130	static const struct gpio_chip template_chip = {
   131		.label			= "arizona",
   132		.owner			= THIS_MODULE,
   133		.direction_input	= arizona_gpio_direction_in,
   134		.get			= arizona_gpio_get,
   135		.direction_output	= arizona_gpio_direction_out,
   136		.set			= arizona_gpio_set,
   137		.can_sleep		= true,
   138		.of_xlate		= arizona_gpio_of_xlate,
   139		.of_gpio_n_cells	= 2,
   140	};
   141	
   142	static int arizona_gpio_probe(struct platform_device *pdev)
   143	{
   144		struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
   145		struct arizona_pdata *pdata = dev_get_platdata(arizona->dev);
   146		struct arizona_gpio *arizona_gpio;
   147		int ret;
   148	
   149		arizona_gpio = devm_kzalloc(&pdev->dev, sizeof(*arizona_gpio),
   150					    GFP_KERNEL);
   151		if (!arizona_gpio)
   152			return -ENOMEM;
   153	
   154		arizona_gpio->arizona = arizona;
   155		arizona_gpio->gpio_chip = template_chip;
   156		arizona_gpio->gpio_chip.parent = &pdev->dev;
   157	#ifdef CONFIG_OF_GPIO
   158		arizona_gpio->gpio_chip.of_node = arizona->dev->of_node;
   159	#endif
   160	
   161		switch (arizona->type) {
   162		case WM5102:
   163		case WM5110:
   164		case WM8280:
   165		case WM8997:
   166		case WM8998:
   167		case WM1814:
   168			arizona_gpio->gpio_chip.ngpio = 5;
   169			break;
   170		case WM1831:
   171		case CS47L24:
   172			arizona_gpio->gpio_chip.ngpio = 2;
   173			break;
   174		default:
   175			dev_err(&pdev->dev, "Unknown chip variant %d\n",
   176				arizona->type);
   177			return -EINVAL;
   178		}
   179	
   180		if (pdata && pdata->gpio_base)
   181			arizona_gpio->gpio_chip.base = pdata->gpio_base;
   182		else
   183			arizona_gpio->gpio_chip.base = -1;
   184	
 > 185		pm_runtime_enable(&pdev->dev);
   186	
   187		ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
   188					     arizona_gpio);

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--y0ulUmNC+osPPQO6
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
qWzsKKnOj7wAM6GUYwXLXAV0/B8iWOfMWq0BAA==

--y0ulUmNC+osPPQO6--
