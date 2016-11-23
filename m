From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] gpio: axp209: add pinctrl support
Date: Thu, 24 Nov 2016 01:13:36 +0800
Message-ID: <201611240117.nlrKefpK%fengguang.wu@intel.com>
References: <20161123132749.11666-3-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161123132749.11666-3-quentin.schulz@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, Quentin Schulz <quentin.schulz@free-electrons.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v4.9-rc6 next-20161123]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Quentin-Schulz/add-support-for-AXP209-GPIOs-functions/20161124-003102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: i386-randconfig-i0-201647 (attached as .config)
compiler: gcc-4.8 (Debian 4.8.4-1) 4.8.4
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-axp209.c:60:27: error: field 'pin' has incomplete type
     struct pinctrl_pin_desc  pin;
                              ^
>> drivers/gpio/gpio-axp209.c:95:2: error: field name not in record or union initializer
     AXP20X_PIN(AXP20X_PINCTRL_PIN(0, "GPIO0", (void *)AXP20X_GPIO0_CTRL),
     ^
   drivers/gpio/gpio-axp209.c:95:2: error: (near initialization for 'axp209_pins[0].pin')
>> drivers/gpio/gpio-axp209.c:95:2: error: field name not in record or union initializer
   drivers/gpio/gpio-axp209.c:95:2: error: (near initialization for 'axp209_pins[0].pin')
>> drivers/gpio/gpio-axp209.c:95:2: error: field name not in record or union initializer
   drivers/gpio/gpio-axp209.c:95:2: error: (near initialization for 'axp209_pins[0].pin')
   drivers/gpio/gpio-axp209.c:100:2: error: field name not in record or union initializer
     AXP20X_PIN(AXP20X_PINCTRL_PIN(1, "GPIO1", (void *)AXP20X_GPIO1_CTRL),
     ^
   drivers/gpio/gpio-axp209.c:100:2: error: (near initialization for 'axp209_pins[1].pin')
   drivers/gpio/gpio-axp209.c:100:2: error: field name not in record or union initializer
   drivers/gpio/gpio-axp209.c:100:2: error: (near initialization for 'axp209_pins[1].pin')
   drivers/gpio/gpio-axp209.c:100:2: error: field name not in record or union initializer
   drivers/gpio/gpio-axp209.c:100:2: error: (near initialization for 'axp209_pins[1].pin')
   drivers/gpio/gpio-axp209.c:105:2: error: field name not in record or union initializer
     AXP20X_PIN(AXP20X_PINCTRL_PIN(2, "GPIO2", (void *)AXP20X_GPIO2_CTRL),
     ^
   drivers/gpio/gpio-axp209.c:105:2: error: (near initialization for 'axp209_pins[2].pin')
   drivers/gpio/gpio-axp209.c:105:2: error: field name not in record or union initializer
   drivers/gpio/gpio-axp209.c:105:2: error: (near initialization for 'axp209_pins[2].pin')
   drivers/gpio/gpio-axp209.c:105:2: error: field name not in record or union initializer
   drivers/gpio/gpio-axp209.c:105:2: error: (near initialization for 'axp209_pins[2].pin')
   drivers/gpio/gpio-axp209.c: In function 'axp20x_gpio_get_direction':
>> drivers/gpio/gpio-axp209.c:131:49: error: request for member 'drv_data' in something not a structure or union
     int pin_reg = (int)pctl->desc->pins[offset].pin.drv_data;
                                                    ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_gpio_set':
   drivers/gpio/gpio-axp209.c:158:49: error: request for member 'drv_data' in something not a structure or union
     int pin_reg = (int)pctl->desc->pins[offset].pin.drv_data;
                                                    ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_gpio_input':
>> drivers/gpio/gpio-axp209.c:168:2: error: implicit declaration of function 'pinctrl_gpio_direction_input' [-Werror=implicit-function-declaration]
     return pinctrl_gpio_direction_input(chip->base + offset);
     ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pmx_set':
>> drivers/gpio/gpio-axp209.c:182:9: error: implicit declaration of function 'pinctrl_dev_get_drvdata' [-Werror=implicit-function-declaration]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
            ^
>> drivers/gpio/gpio-axp209.c:182:29: warning: initialization makes pointer from integer without a cast [enabled by default]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
                                ^
   drivers/gpio/gpio-axp209.c:183:49: error: request for member 'drv_data' in something not a structure or union
     int pin_reg = (int)pctl->desc->pins[offset].pin.drv_data;
                                                    ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pmx_func_cnt':
   drivers/gpio/gpio-axp209.c:191:29: warning: initialization makes pointer from integer without a cast [enabled by default]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
                                ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pmx_func_name':
   drivers/gpio/gpio-axp209.c:199:29: warning: initialization makes pointer from integer without a cast [enabled by default]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
                                ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pmx_func_groups':
   drivers/gpio/gpio-axp209.c:209:29: warning: initialization makes pointer from integer without a cast [enabled by default]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
                                ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pinctrl_desc_find_func_by_name':
>> drivers/gpio/gpio-axp209.c:228:23: error: request for member 'name' in something not a structure or union
      if (!strcmp(pin->pin.name, group)) {
                          ^
>> drivers/gpio/gpio-axp209.c:228:3: warning: passing argument 1 of 'strcmp' from incompatible pointer type [enabled by default]
      if (!strcmp(pin->pin.name, group)) {
      ^
   In file included from arch/x86/include/asm/string.h:2:0,
                    from include/linux/string.h:18,
                    from arch/x86/include/asm/page_32.h:34,
                    from arch/x86/include/asm/page.h:13,
                    from arch/x86/include/asm/processor.h:17,
                    from include/linux/mutex.h:19,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:15,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from drivers/gpio/gpio-axp209.c:14:
   arch/x86/include/asm/string_32.h:21:12: note: expected 'const char *' but argument is of type 'const struct axp20x_desc_pin *'
    extern int strcmp(const char *cs, const char *ct);
               ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pmx_set_mux':
   drivers/gpio/gpio-axp209.c:253:29: warning: initialization makes pointer from integer without a cast [enabled by default]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
                                ^
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pctl_desc_find_func_by_pin':
>> drivers/gpio/gpio-axp209.c:276:15: error: request for member 'number' in something not a structure or union
      if (pin->pin.number == offset) {
                  ^
>> drivers/gpio/gpio-axp209.c:276:23: warning: comparison between pointer and integer [enabled by default]
      if (pin->pin.number == offset) {
                          ^
   drivers/gpio/gpio-axp209.c: At top level:
>> drivers/gpio/gpio-axp209.c:293:7: warning: 'struct pinctrl_gpio_range' declared inside parameter list [enabled by default]
          unsigned int offset, bool input)
          ^
>> drivers/gpio/gpio-axp209.c:293:7: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
   drivers/gpio/gpio-axp209.c: In function 'axp20x_pmx_gpio_set_direction':
   drivers/gpio/gpio-axp209.c:295:29: warning: initialization makes pointer from integer without a cast [enabled by default]
     struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
                                ^
   drivers/gpio/gpio-axp209.c: At top level:
>> drivers/gpio/gpio-axp209.c:311:21: error: variable 'axp20x_pmx_ops' has initializer but incomplete type
    static const struct pinmux_ops axp20x_pmx_ops = {
                        ^
>> drivers/gpio/gpio-axp209.c:312:2: error: unknown field 'get_functions_count' specified in initializer
     .get_functions_count = axp20x_pmx_func_cnt,
     ^
>> drivers/gpio/gpio-axp209.c:312:2: warning: excess elements in struct initializer [enabled by default]
   drivers/gpio/gpio-axp209.c:312:2: warning: (near initialization for 'axp20x_pmx_ops') [enabled by default]
>> drivers/gpio/gpio-axp209.c:313:2: error: unknown field 'get_function_name' specified in initializer
     .get_function_name = axp20x_pmx_func_name,
     ^
   drivers/gpio/gpio-axp209.c:313:2: warning: excess elements in struct initializer [enabled by default]
   drivers/gpio/gpio-axp209.c:313:2: warning: (near initialization for 'axp20x_pmx_ops') [enabled by default]
>> drivers/gpio/gpio-axp209.c:314:2: error: unknown field 'get_function_groups' specified in initializer
     .get_function_groups = axp20x_pmx_func_groups,
     ^
   drivers/gpio/gpio-axp209.c:314:2: warning: excess elements in struct initializer [enabled by default]
   drivers/gpio/gpio-axp209.c:314:2: warning: (near initialization for 'axp20x_pmx_ops') [enabled by default]
>> drivers/gpio/gpio-axp209.c:315:2: error: unknown field 'set_mux' specified in initializer
     .set_mux  = axp20x_pmx_set_mux,
     ^
   drivers/gpio/gpio-axp209.c:315:2: warning: excess elements in struct initializer [enabled by default]
   drivers/gpio/gpio-axp209.c:315:2: warning: (near initialization for 'axp20x_pmx_ops') [enabled by default]

vim +/pin +60 drivers/gpio/gpio-axp209.c

     8	 * under  the terms of the GNU General  Public License as published by the
     9	 * Free Software Foundation;  either version 2 of the License, or (at your
    10	 * option) any later version.
    11	 */
    12	
    13	#include <linux/bitops.h>
  > 14	#include <linux/device.h>
    15	#include <linux/gpio/driver.h>
    16	#include <linux/init.h>
    17	#include <linux/interrupt.h>
    18	#include <linux/kernel.h>
    19	#include <linux/mfd/axp20x.h>
    20	#include <linux/module.h>
    21	#include <linux/of.h>
    22	#include <linux/platform_device.h>
    23	#include <linux/regmap.h>
    24	#include <linux/slab.h>
    25	#include <linux/pinctrl/pinctrl.h>
    26	#include <linux/pinctrl/pinmux.h>
    27	#include <linux/pinctrl/pinconf-generic.h>
    28	
    29	#define AXP20X_GPIO_FUNCTIONS		0x7
    30	#define AXP20X_GPIO_FUNCTION_OUT_LOW	0
    31	#define AXP20X_GPIO_FUNCTION_OUT_HIGH	1
    32	#define AXP20X_GPIO_FUNCTION_INPUT	2
    33	
    34	#define AXP20X_PINCTRL_PIN(_pin_num, _pin, _regs)		\
    35		{							\
    36			.number = _pin_num,				\
    37			.name = _pin,					\
    38			.drv_data = _regs,				\
    39		}
    40	
    41	#define AXP20X_PIN(_pin, ...)					\
    42		{							\
    43			.pin = _pin,					\
    44			.functions = (struct axp20x_desc_function[]) {	\
    45				      __VA_ARGS__, { } },		\
    46		}
    47	
    48	#define AXP20X_FUNCTION(_val, _name)				\
    49		{							\
    50			.name = _name,					\
    51			.muxval = _val,					\
    52		}
    53	
    54	struct axp20x_desc_function {
    55		const char	*name;
    56		u8		muxval;
    57	};
    58	
    59	struct axp20x_desc_pin {
  > 60		struct pinctrl_pin_desc		pin;
    61		struct axp20x_desc_function	*functions;
    62	};
    63	
    64	struct axp20x_pinctrl_desc {
    65		const struct axp20x_desc_pin	*pins;
    66		int				npins;
    67		unsigned int			pin_base;
    68	};
    69	
    70	struct axp20x_pinctrl_function {
    71		const char	*name;
    72		const char	**groups;
    73		unsigned int	ngroups;
    74	};
    75	
    76	struct axp20x_pinctrl_group {
    77		const char	*name;
    78		unsigned long	config;
    79		unsigned int	pin;
    80	};
    81	
    82	struct axp20x_pctl {
    83		struct pinctrl_dev			*pctl_dev;
    84		struct device				*dev;
    85		struct gpio_chip			chip;
    86		struct regmap				*regmap;
    87		const struct axp20x_pinctrl_desc	*desc;
    88		struct axp20x_pinctrl_group		*groups;
    89		unsigned int				ngroups;
    90		struct axp20x_pinctrl_function		*functions;
    91		unsigned int				nfunctions;
    92	};
    93	
    94	static const struct axp20x_desc_pin axp209_pins[] = {
  > 95		AXP20X_PIN(AXP20X_PINCTRL_PIN(0, "GPIO0", (void *)AXP20X_GPIO0_CTRL),
    96			   AXP20X_FUNCTION(0x0, "gpio_out"),
    97			   AXP20X_FUNCTION(0x2, "gpio_in"),
    98			   AXP20X_FUNCTION(0x3, "ldo"),
    99			   AXP20X_FUNCTION(0x4, "adc")),
   100		AXP20X_PIN(AXP20X_PINCTRL_PIN(1, "GPIO1", (void *)AXP20X_GPIO1_CTRL),
   101			   AXP20X_FUNCTION(0x0, "gpio_out"),
   102			   AXP20X_FUNCTION(0x2, "gpio_in"),
   103			   AXP20X_FUNCTION(0x3, "ldo"),
   104			   AXP20X_FUNCTION(0x4, "adc")),
 > 105		AXP20X_PIN(AXP20X_PINCTRL_PIN(2, "GPIO2", (void *)AXP20X_GPIO2_CTRL),
   106			   AXP20X_FUNCTION(0x0, "gpio_out"),
   107			   AXP20X_FUNCTION(0x2, "gpio_in")),
   108	};
   109	
   110	static const struct axp20x_pinctrl_desc axp20x_pinctrl_data = {
   111		.pins	= axp209_pins,
   112		.npins	= ARRAY_SIZE(axp209_pins),
   113	};
   114	
   115	static int axp20x_gpio_get(struct gpio_chip *chip, unsigned offset)
   116	{
   117		struct axp20x_pctl *pctl = gpiochip_get_data(chip);
   118		unsigned int val;
   119		int ret;
   120	
   121		ret = regmap_read(pctl->regmap, AXP20X_GPIO20_SS, &val);
   122		if (ret)
   123			return ret;
   124	
   125		return !!(val & BIT(offset + 4));
   126	}
   127	
   128	static int axp20x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
   129	{
   130		struct axp20x_pctl *pctl = gpiochip_get_data(chip);
 > 131		int pin_reg = (int)pctl->desc->pins[offset].pin.drv_data;
   132		unsigned int val;
   133		int ret;
   134	
   135		ret = regmap_read(pctl->regmap, pin_reg, &val);
   136		if (ret)
   137			return ret;
   138	
   139		/*
   140		 * This shouldn't really happen if the pin is in use already,
   141		 * or if it's not in use yet, it doesn't matter since we're
   142		 * going to change the value soon anyway. Default to output.
   143		 */
   144		if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
   145			return 0;
   146	
   147		/*
   148		 * The GPIO directions are the three lowest values.
   149		 * 2 is input, 0 and 1 are output
   150		 */
   151		return val & 2;
   152	}
   153	
   154	static void axp20x_gpio_set(struct gpio_chip *chip, unsigned int offset,
   155				    int value)
   156	{
   157		struct axp20x_pctl *pctl = gpiochip_get_data(chip);
 > 158		int pin_reg = (int)pctl->desc->pins[offset].pin.drv_data;
   159	
   160		regmap_update_bits(pctl->regmap, pin_reg,
   161				   AXP20X_GPIO_FUNCTIONS,
   162				   value ? AXP20X_GPIO_FUNCTION_OUT_HIGH
   163					 : AXP20X_GPIO_FUNCTION_OUT_LOW);
   164	}
   165	
   166	static int axp20x_gpio_input(struct gpio_chip *chip, unsigned int offset)
   167	{
 > 168		return pinctrl_gpio_direction_input(chip->base + offset);
   169	}
   170	
   171	static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offset,
   172				      int value)
   173	{
   174		chip->set(chip, offset, value);
   175	
   176		return 0;
   177	}
   178	
   179	static int axp20x_pmx_set(struct pinctrl_dev *pctldev, unsigned int offset,
   180				  u8 config)
   181	{
 > 182		struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
   183		int pin_reg = (int)pctl->desc->pins[offset].pin.drv_data;
   184	
   185		return regmap_update_bits(pctl->regmap, pin_reg, AXP20X_GPIO_FUNCTIONS,
   186					  config);
   187	}
   188	
   189	static int axp20x_pmx_func_cnt(struct pinctrl_dev *pctldev)
   190	{
   191		struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
   192	
   193		return pctl->nfunctions;
   194	}
   195	
   196	static const char *axp20x_pmx_func_name(struct pinctrl_dev *pctldev,
   197						unsigned int selector)
   198	{
 > 199		struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
   200	
   201		return pctl->functions[selector].name;
   202	}
   203	
   204	static int axp20x_pmx_func_groups(struct pinctrl_dev *pctldev,
   205					  unsigned int selector,
   206					  const char * const **groups,
   207					  unsigned int *num_groups)
   208	{
 > 209		struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
   210	
   211		*groups = pctl->functions[selector].groups;
   212		*num_groups = pctl->functions[selector].ngroups;
   213	
   214		return 0;
   215	}
   216	
   217	static struct axp20x_desc_function *
   218	axp20x_pinctrl_desc_find_func_by_name(struct axp20x_pctl *pctl,
   219					      const char *group, const char *func)
   220	{
   221		const struct axp20x_desc_pin *pin;
   222		struct axp20x_desc_function *desc_func;
   223		int i;
   224	
   225		for (i = 0; i < pctl->desc->npins; i++) {
   226			pin = &pctl->desc->pins[i];
   227	
 > 228			if (!strcmp(pin->pin.name, group)) {
   229				desc_func = pin->functions;
   230	
   231				while (desc_func->name) {
   232					if (!strcmp(desc_func->name, func))
   233						return desc_func;
   234					desc_func++;
   235				}
   236	
   237				/*
   238				 * Pins are uniquely named. Groups are named after one
   239				 * pin name. If one pin matches group name but its
   240				 * function cannot be found, no other pin will match
   241				 * group name.
   242				 */
   243				return NULL;
   244			}
   245		}
   246	
   247		return NULL;
   248	}
   249	
   250	static int axp20x_pmx_set_mux(struct pinctrl_dev *pctldev,
   251				      unsigned int function, unsigned int group)
   252	{
 > 253		struct axp20x_pctl *pctl = pinctrl_dev_get_drvdata(pctldev);
   254		struct axp20x_pinctrl_group *g = pctl->groups + group;
   255		struct axp20x_pinctrl_function *func = pctl->functions + function;
   256		struct axp20x_desc_function *desc_func =

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--OgqxwSJOaUobr8KG
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
P9cROrRNhxf8H1hqpkL9NwEA

--OgqxwSJOaUobr8KG--
