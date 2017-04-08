From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: arizona: Add support for GPIOs that need to be
 maintained
Date: Sat, 8 Apr 2017 11:41:28 +0800
Message-ID: <201704081121.J21VjPSE%fengguang.wu@intel.com>
References: <1491568725-14882-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491568725-14882-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charles,

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v4.11-rc5 next-20170407]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Charles-Keepax/mfd-arizona-Add-GPIO-maintain-state-flag/20170408-111119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: x86_64-randconfig-x003-201714 (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All error/warnings (new ones prefixed by >>):

   drivers//gpio/gpio-arizona.c: In function 'arizona_gpio_direction_in':
   drivers//gpio/gpio-arizona.c:44:3: error: implicit declaration of function 'pm_runtime_mark_last_busy' [-Werror=implicit-function-declaration]
      pm_runtime_mark_last_busy(chip->parent);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-arizona.c:45:3: error: implicit declaration of function 'pm_runtime_put_autosuspend' [-Werror=implicit-function-declaration]
      pm_runtime_put_autosuspend(chip->parent);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-arizona.c: In function 'arizona_gpio_set':
   drivers//gpio/gpio-arizona.c:93:9: error: implicit declaration of function 'pm_runtime_get_sync' [-Werror=implicit-function-declaration]
      ret = pm_runtime_get_sync(chip->parent);
            ^~~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-arizona.c:96:11: warning: 'return' with a value, in function returning void
       return ret;
              ^~~
   drivers//gpio/gpio-arizona.c:82:13: note: declared here
    static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
                ^~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from drivers//gpio/gpio-arizona.c:15:
   drivers//gpio/gpio-arizona.c: In function 'arizona_gpio_of_xlate':
>> drivers//gpio/gpio-arizona.c:115:33: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     if (gpiospec->args_count < chip->of_gpio_n_cells)
                                    ^
   include/linux/compiler.h:160:30: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                 ^~~~
>> drivers//gpio/gpio-arizona.c:115:2: note: in expansion of macro 'if'
     if (gpiospec->args_count < chip->of_gpio_n_cells)
     ^~
>> drivers//gpio/gpio-arizona.c:115:33: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     if (gpiospec->args_count < chip->of_gpio_n_cells)
                                    ^
   include/linux/compiler.h:160:42: note: in definition of macro '__trace_if'
     if (__builtin_constant_p(!!(cond)) ? !!(cond) :   \
                                             ^~~~
>> drivers//gpio/gpio-arizona.c:115:2: note: in expansion of macro 'if'
     if (gpiospec->args_count < chip->of_gpio_n_cells)
     ^~
>> drivers//gpio/gpio-arizona.c:115:33: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
     if (gpiospec->args_count < chip->of_gpio_n_cells)
                                    ^
   include/linux/compiler.h:171:16: note: in definition of macro '__trace_if'
      ______r = !!(cond);     \
                   ^~~~
>> drivers//gpio/gpio-arizona.c:115:2: note: in expansion of macro 'if'
     if (gpiospec->args_count < chip->of_gpio_n_cells)
     ^~
   drivers//gpio/gpio-arizona.c: At top level:
>> drivers//gpio/gpio-arizona.c:138:2: error: unknown field 'of_xlate' specified in initializer
     .of_xlate  = arizona_gpio_of_xlate,
     ^
>> drivers//gpio/gpio-arizona.c:138:15: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .of_xlate  = arizona_gpio_of_xlate,
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers//gpio/gpio-arizona.c:138:15: note: (near initialization for 'template_chip.read_reg')
>> drivers//gpio/gpio-arizona.c:139:2: error: unknown field 'of_gpio_n_cells' specified in initializer
     .of_gpio_n_cells = 2,
     ^
>> drivers//gpio/gpio-arizona.c:139:21: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     .of_gpio_n_cells = 2,
                        ^
   drivers//gpio/gpio-arizona.c:139:21: note: (near initialization for 'template_chip.write_reg')
   drivers//gpio/gpio-arizona.c: In function 'arizona_gpio_probe':
   drivers//gpio/gpio-arizona.c:185:2: error: implicit declaration of function 'pm_runtime_enable' [-Werror=implicit-function-declaration]
     pm_runtime_enable(&pdev->dev);
     ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +115 drivers//gpio/gpio-arizona.c

     9	 *  under  the terms of  the GNU General  Public License as published by the
    10	 *  Free Software Foundation;  either version 2 of the  License, or (at your
    11	 *  option) any later version.
    12	 *
    13	 */
    14	
  > 15	#include <linux/kernel.h>
    16	#include <linux/slab.h>
    17	#include <linux/module.h>
    18	#include <linux/gpio.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/seq_file.h>
    21	
    22	#include <linux/mfd/arizona/core.h>
    23	#include <linux/mfd/arizona/pdata.h>
    24	#include <linux/mfd/arizona/registers.h>
    25	
    26	#define ARIZONA_GP_STATE_OUTPUT   0x00000001
    27	
    28	struct arizona_gpio {
    29		struct arizona *arizona;
    30		struct gpio_chip gpio_chip;
    31		int status[ARIZONA_MAX_GPIO];
    32	};
    33	
    34	static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
    35	{
    36		struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
    37		struct arizona *arizona = arizona_gpio->arizona;
    38		int status = arizona_gpio->status[offset];
    39	
    40		status &= (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT);
    41		if (status == (ARIZONA_GP_MAINTAIN | ARIZONA_GP_STATE_OUTPUT)) {
    42			arizona_gpio->status[offset] &= ~ARIZONA_GP_STATE_OUTPUT;
    43	
    44			pm_runtime_mark_last_busy(chip->parent);
    45			pm_runtime_put_autosuspend(chip->parent);
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
  > 82	static void arizona_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
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
    93			ret = pm_runtime_get_sync(chip->parent);
    94			if (ret < 0) {
    95				dev_err(chip->parent, "Failed to resume: %d\n", ret);
    96				return ret;
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
 > 115		if (gpiospec->args_count < chip->of_gpio_n_cells)
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
 > 138		.of_xlate		= arizona_gpio_of_xlate,
 > 139		.of_gpio_n_cells	= 2,
   140	};
   141	
   142	static int arizona_gpio_probe(struct platform_device *pdev)

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--SUOF0GtieIMvvwua
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
DCh8x+6sZ28aySgudSu4ejAz+X8Cs+yPvigBAA==

--SUOF0GtieIMvvwua--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
