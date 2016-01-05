From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 3/4] mfd: arizona: Switch to using clock driver for 32k
 clock
Date: Wed, 6 Jan 2016 00:23:46 +0800
Message-ID: <201601060014.IkjLlLeg%fengguang.wu@intel.com>
References: <1452008502-3749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452008502-3749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-clk-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: kbuild-all@01.org, mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org, sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charles,

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v4.4-rc8 next-20160105]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Charles-Keepax/extcon-arizona-Remove-enable-disable-of-32k-clock/20160105-234658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: i386-randconfig-s1-201601 (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

>> drivers/clk/clk-arizona.c:31:16: error: field 'clk32k_hw' has incomplete type
     struct clk_hw clk32k_hw;
                   ^
   In file included from include/asm-generic/bug.h:13:0,
                    from arch/x86/include/asm/bug.h:35,
                    from include/linux/bug.h:4,
                    from include/linux/mmdebug.h:4,
                    from include/linux/gfp.h:4,
                    from include/linux/slab.h:14,
                    from include/asm-generic/clkdev.h:16,
                    from arch/x86/include/generated/asm/clkdev.h:1,
                    from include/linux/clkdev.h:15,
                    from drivers/clk/clk-arizona.c:14:
   drivers/clk/clk-arizona.c: In function 'clk32k_to_arizona_clk':
   include/linux/kernel.h:813:48: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
     const typeof( ((type *)0)->member ) *__mptr = (ptr); \
                                                   ^
>> drivers/clk/clk-arizona.c:37:9: note: in expansion of macro 'container_of'
     return container_of(hw, struct arizona_clk, clk32k_hw);
            ^
   drivers/clk/clk-arizona.c: At top level:
>> drivers/clk/clk-arizona.c:77:21: error: variable 'arizona_32k_ops' has initializer but incomplete type
    static const struct clk_ops arizona_32k_ops = {
                        ^
>> drivers/clk/clk-arizona.c:78:2: error: unknown field 'prepare' specified in initializer
     .prepare = arizona_32k_enable,
     ^
>> drivers/clk/clk-arizona.c:78:13: warning: excess elements in struct initializer
     .prepare = arizona_32k_enable,
                ^
   drivers/clk/clk-arizona.c:78:13: note: (near initialization for 'arizona_32k_ops')
>> drivers/clk/clk-arizona.c:79:2: error: unknown field 'unprepare' specified in initializer
     .unprepare = arizona_32k_disable,
     ^
   drivers/clk/clk-arizona.c:79:15: warning: excess elements in struct initializer
     .unprepare = arizona_32k_disable,
                  ^
   drivers/clk/clk-arizona.c:79:15: note: (near initialization for 'arizona_32k_ops')
   drivers/clk/clk-arizona.c: In function 'arizona_clk_of_get_pdata':
>> drivers/clk/clk-arizona.c:98:35: error: implicit declaration of function '__clk_get_name' [-Werror=implicit-function-declaration]
       arizona->pdata.clk32k_parent = __clk_get_name(mclk);
                                      ^
>> drivers/clk/clk-arizona.c:98:33: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       arizona->pdata.clk32k_parent = __clk_get_name(mclk);
                                    ^
   drivers/clk/clk-arizona.c: In function 'arizona_clk_probe':
>> drivers/clk/clk-arizona.c:113:9: error: variable 'clk32k_init' has initializer but incomplete type
     struct clk_init_data clk32k_init = {
            ^
>> drivers/clk/clk-arizona.c:114:3: error: unknown field 'name' specified in initializer
      .name = "arizona-32k",
      ^
   drivers/clk/clk-arizona.c:114:11: warning: excess elements in struct initializer
      .name = "arizona-32k",
              ^
   drivers/clk/clk-arizona.c:114:11: note: (near initialization for 'clk32k_init')
>> drivers/clk/clk-arizona.c:115:3: error: unknown field 'ops' specified in initializer
      .ops = &arizona_32k_ops,
      ^
   drivers/clk/clk-arizona.c:115:10: warning: excess elements in struct initializer
      .ops = &arizona_32k_ops,
             ^
   drivers/clk/clk-arizona.c:115:10: note: (near initialization for 'clk32k_init')
>> drivers/clk/clk-arizona.c:113:23: error: storage size of 'clk32k_init' isn't known
     struct clk_init_data clk32k_init = {
                          ^
>> drivers/clk/clk-arizona.c:154:24: error: 'CLK_IS_ROOT' undeclared (first use in this function)
      clk32k_init.flags |= CLK_IS_ROOT;
                           ^
   drivers/clk/clk-arizona.c:154:24: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/clk/clk-arizona.c:158:20: error: implicit declaration of function 'devm_clk_register' [-Werror=implicit-function-declaration]
     clkdata->clk32k = devm_clk_register(&pdev->dev, &clkdata->clk32k_hw);
                       ^
>> drivers/clk/clk-arizona.c:113:23: warning: unused variable 'clk32k_init' [-Wunused-variable]
     struct clk_init_data clk32k_init = {
                          ^
   cc1: some warnings being treated as errors

vim +/clk32k_hw +31 drivers/clk/clk-arizona.c

bbd51c97 Charles Keepax 2016-01-05    8   *  This program is free software; you can redistribute  it and/or modify it
bbd51c97 Charles Keepax 2016-01-05    9   *  under  the terms of  the GNU General  Public License as published by the
bbd51c97 Charles Keepax 2016-01-05   10   *  Free Software Foundation;  either version 2 of the  License, or (at your
bbd51c97 Charles Keepax 2016-01-05   11   *  option) any later version.
bbd51c97 Charles Keepax 2016-01-05   12   */
bbd51c97 Charles Keepax 2016-01-05   13  
bbd51c97 Charles Keepax 2016-01-05  @14  #include <linux/clkdev.h>
bbd51c97 Charles Keepax 2016-01-05   15  #include <linux/clk-provider.h>
bbd51c97 Charles Keepax 2016-01-05   16  #include <linux/delay.h>
bbd51c97 Charles Keepax 2016-01-05   17  #include <linux/module.h>
bbd51c97 Charles Keepax 2016-01-05   18  #include <linux/slab.h>
bbd51c97 Charles Keepax 2016-01-05   19  #include <linux/platform_device.h>
bbd51c97 Charles Keepax 2016-01-05   20  #include <linux/pm_runtime.h>
bbd51c97 Charles Keepax 2016-01-05   21  
bbd51c97 Charles Keepax 2016-01-05   22  #include <linux/mfd/arizona/core.h>
bbd51c97 Charles Keepax 2016-01-05   23  #include <linux/mfd/arizona/pdata.h>
bbd51c97 Charles Keepax 2016-01-05   24  #include <linux/mfd/arizona/registers.h>
bbd51c97 Charles Keepax 2016-01-05   25  
bbd51c97 Charles Keepax 2016-01-05   26  #define CLK32K_RATE 32768
bbd51c97 Charles Keepax 2016-01-05   27  
bbd51c97 Charles Keepax 2016-01-05   28  struct arizona_clk {
bbd51c97 Charles Keepax 2016-01-05   29  	struct arizona *arizona;
bbd51c97 Charles Keepax 2016-01-05   30  
bbd51c97 Charles Keepax 2016-01-05  @31  	struct clk_hw clk32k_hw;
bbd51c97 Charles Keepax 2016-01-05   32  	struct clk *clk32k;
bbd51c97 Charles Keepax 2016-01-05   33  };
bbd51c97 Charles Keepax 2016-01-05   34  
bbd51c97 Charles Keepax 2016-01-05   35  static inline struct arizona_clk *clk32k_to_arizona_clk(struct clk_hw *hw)
bbd51c97 Charles Keepax 2016-01-05   36  {
bbd51c97 Charles Keepax 2016-01-05  @37  	return container_of(hw, struct arizona_clk, clk32k_hw);
bbd51c97 Charles Keepax 2016-01-05   38  }
bbd51c97 Charles Keepax 2016-01-05   39  
bbd51c97 Charles Keepax 2016-01-05   40  static int arizona_32k_enable(struct clk_hw *hw)
bbd51c97 Charles Keepax 2016-01-05   41  {
bbd51c97 Charles Keepax 2016-01-05   42  	struct arizona_clk *clkdata = clk32k_to_arizona_clk(hw);
bbd51c97 Charles Keepax 2016-01-05   43  	struct arizona *arizona = clkdata->arizona;
bbd51c97 Charles Keepax 2016-01-05   44  	int ret;
bbd51c97 Charles Keepax 2016-01-05   45  
bbd51c97 Charles Keepax 2016-01-05   46  	switch (arizona->pdata.clk32k_src) {
bbd51c97 Charles Keepax 2016-01-05   47  	case ARIZONA_32KZ_MCLK1:
bbd51c97 Charles Keepax 2016-01-05   48  		ret = pm_runtime_get_sync(arizona->dev);
bbd51c97 Charles Keepax 2016-01-05   49  		if (ret != 0)
bbd51c97 Charles Keepax 2016-01-05   50  			goto out;
bbd51c97 Charles Keepax 2016-01-05   51  		break;
bbd51c97 Charles Keepax 2016-01-05   52  	}
bbd51c97 Charles Keepax 2016-01-05   53  
bbd51c97 Charles Keepax 2016-01-05   54  	ret = regmap_update_bits_async(arizona->regmap, ARIZONA_CLOCK_32K_1,
bbd51c97 Charles Keepax 2016-01-05   55  				       ARIZONA_CLK_32K_ENA,
bbd51c97 Charles Keepax 2016-01-05   56  				       ARIZONA_CLK_32K_ENA);
bbd51c97 Charles Keepax 2016-01-05   57  
bbd51c97 Charles Keepax 2016-01-05   58  out:
bbd51c97 Charles Keepax 2016-01-05   59  	return ret;
bbd51c97 Charles Keepax 2016-01-05   60  }
bbd51c97 Charles Keepax 2016-01-05   61  
bbd51c97 Charles Keepax 2016-01-05   62  static void arizona_32k_disable(struct clk_hw *hw)
bbd51c97 Charles Keepax 2016-01-05   63  {
bbd51c97 Charles Keepax 2016-01-05   64  	struct arizona_clk *clkdata = clk32k_to_arizona_clk(hw);
bbd51c97 Charles Keepax 2016-01-05   65  	struct arizona *arizona = clkdata->arizona;
bbd51c97 Charles Keepax 2016-01-05   66  
bbd51c97 Charles Keepax 2016-01-05   67  	regmap_update_bits_async(arizona->regmap, ARIZONA_CLOCK_32K_1,
bbd51c97 Charles Keepax 2016-01-05   68  				 ARIZONA_CLK_32K_ENA, 0);
bbd51c97 Charles Keepax 2016-01-05   69  
bbd51c97 Charles Keepax 2016-01-05   70  	switch (arizona->pdata.clk32k_src) {
bbd51c97 Charles Keepax 2016-01-05   71  	case ARIZONA_32KZ_MCLK1:
bbd51c97 Charles Keepax 2016-01-05   72  		pm_runtime_put_sync(arizona->dev);
bbd51c97 Charles Keepax 2016-01-05   73  		break;
bbd51c97 Charles Keepax 2016-01-05   74  	}
bbd51c97 Charles Keepax 2016-01-05   75  }
bbd51c97 Charles Keepax 2016-01-05   76  
bbd51c97 Charles Keepax 2016-01-05  @77  static const struct clk_ops arizona_32k_ops = {
bbd51c97 Charles Keepax 2016-01-05  @78  	.prepare = arizona_32k_enable,
bbd51c97 Charles Keepax 2016-01-05  @79  	.unprepare = arizona_32k_disable,
bbd51c97 Charles Keepax 2016-01-05   80  };
bbd51c97 Charles Keepax 2016-01-05   81  
bbd51c97 Charles Keepax 2016-01-05   82  static int arizona_clk_of_get_pdata(struct arizona *arizona)
bbd51c97 Charles Keepax 2016-01-05   83  {
bbd51c97 Charles Keepax 2016-01-05   84  	const char * const pins[] = { "mclk1", "mclk2" };
bbd51c97 Charles Keepax 2016-01-05   85  	struct clk *mclk;
bbd51c97 Charles Keepax 2016-01-05   86  	int i;
bbd51c97 Charles Keepax 2016-01-05   87  
bbd51c97 Charles Keepax 2016-01-05   88  	if (!of_property_read_bool(arizona->dev->of_node, "clocks"))
bbd51c97 Charles Keepax 2016-01-05   89  		return 0;
bbd51c97 Charles Keepax 2016-01-05   90  
bbd51c97 Charles Keepax 2016-01-05   91  	for (i = 0; i < ARRAY_SIZE(pins); ++i) {
bbd51c97 Charles Keepax 2016-01-05   92  		mclk = of_clk_get_by_name(arizona->dev->of_node, pins[i]);
bbd51c97 Charles Keepax 2016-01-05   93  		if (IS_ERR(mclk))
bbd51c97 Charles Keepax 2016-01-05   94  			return PTR_ERR(mclk);
bbd51c97 Charles Keepax 2016-01-05   95  
bbd51c97 Charles Keepax 2016-01-05   96  		if (clk_get_rate(mclk) == CLK32K_RATE) {
bbd51c97 Charles Keepax 2016-01-05   97  			arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK1 + i;
bbd51c97 Charles Keepax 2016-01-05  @98  			arizona->pdata.clk32k_parent = __clk_get_name(mclk);
bbd51c97 Charles Keepax 2016-01-05   99  		}
bbd51c97 Charles Keepax 2016-01-05  100  
bbd51c97 Charles Keepax 2016-01-05  101  		clk_put(mclk);
bbd51c97 Charles Keepax 2016-01-05  102  	}
bbd51c97 Charles Keepax 2016-01-05  103  
bbd51c97 Charles Keepax 2016-01-05  104  	return 0;
bbd51c97 Charles Keepax 2016-01-05  105  }
bbd51c97 Charles Keepax 2016-01-05  106  
bbd51c97 Charles Keepax 2016-01-05  107  static int arizona_clk_probe(struct platform_device *pdev)
bbd51c97 Charles Keepax 2016-01-05  108  {
bbd51c97 Charles Keepax 2016-01-05  109  	struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
bbd51c97 Charles Keepax 2016-01-05  110  	struct arizona_clk *clkdata;
bbd51c97 Charles Keepax 2016-01-05  111  	int ret;
bbd51c97 Charles Keepax 2016-01-05  112  
bbd51c97 Charles Keepax 2016-01-05 @113  	struct clk_init_data clk32k_init = {
bbd51c97 Charles Keepax 2016-01-05 @114  		.name = "arizona-32k",
bbd51c97 Charles Keepax 2016-01-05 @115  		.ops = &arizona_32k_ops,
bbd51c97 Charles Keepax 2016-01-05  116  	};
bbd51c97 Charles Keepax 2016-01-05  117  
bbd51c97 Charles Keepax 2016-01-05  118  	if (IS_ENABLED(CONFIG_OF) && !dev_get_platdata(arizona->dev)) {
bbd51c97 Charles Keepax 2016-01-05  119  		ret = arizona_clk_of_get_pdata(arizona);
bbd51c97 Charles Keepax 2016-01-05  120  		if (ret) {
bbd51c97 Charles Keepax 2016-01-05  121  			dev_err(arizona->dev, "Failed parsing clock DT: %d\n",
bbd51c97 Charles Keepax 2016-01-05  122  				ret);
bbd51c97 Charles Keepax 2016-01-05  123  			return ret;
bbd51c97 Charles Keepax 2016-01-05  124  		}
bbd51c97 Charles Keepax 2016-01-05  125  	}
bbd51c97 Charles Keepax 2016-01-05  126  
bbd51c97 Charles Keepax 2016-01-05  127  	clkdata = devm_kzalloc(&pdev->dev, sizeof(*clkdata), GFP_KERNEL);
bbd51c97 Charles Keepax 2016-01-05  128  	if (!clkdata)
bbd51c97 Charles Keepax 2016-01-05  129  		return -ENOMEM;
bbd51c97 Charles Keepax 2016-01-05  130  
bbd51c97 Charles Keepax 2016-01-05  131  	clkdata->arizona = arizona;
bbd51c97 Charles Keepax 2016-01-05  132  
bbd51c97 Charles Keepax 2016-01-05  133  	switch (arizona->pdata.clk32k_src) {
bbd51c97 Charles Keepax 2016-01-05  134  	case 0:
bbd51c97 Charles Keepax 2016-01-05  135  		arizona->pdata.clk32k_src = ARIZONA_32KZ_MCLK2;
bbd51c97 Charles Keepax 2016-01-05  136  		/* Fall through */
bbd51c97 Charles Keepax 2016-01-05  137  	case ARIZONA_32KZ_MCLK1:
bbd51c97 Charles Keepax 2016-01-05  138  	case ARIZONA_32KZ_MCLK2:
bbd51c97 Charles Keepax 2016-01-05  139  	case ARIZONA_32KZ_NONE:
bbd51c97 Charles Keepax 2016-01-05  140  		regmap_update_bits(arizona->regmap, ARIZONA_CLOCK_32K_1,
bbd51c97 Charles Keepax 2016-01-05  141  				   ARIZONA_CLK_32K_SRC_MASK,
bbd51c97 Charles Keepax 2016-01-05  142  				   arizona->pdata.clk32k_src - 1);
bbd51c97 Charles Keepax 2016-01-05  143  		break;
bbd51c97 Charles Keepax 2016-01-05  144  	default:
bbd51c97 Charles Keepax 2016-01-05  145  		dev_err(arizona->dev, "Invalid 32kHz clock source: %d\n",
bbd51c97 Charles Keepax 2016-01-05  146  			arizona->pdata.clk32k_src);
bbd51c97 Charles Keepax 2016-01-05  147  		return -EINVAL;
bbd51c97 Charles Keepax 2016-01-05  148  	}
bbd51c97 Charles Keepax 2016-01-05  149  
bbd51c97 Charles Keepax 2016-01-05  150  	if (arizona->pdata.clk32k_parent) {
bbd51c97 Charles Keepax 2016-01-05  151  		clk32k_init.num_parents = 1;
bbd51c97 Charles Keepax 2016-01-05  152  		clk32k_init.parent_names = &arizona->pdata.clk32k_parent;
bbd51c97 Charles Keepax 2016-01-05  153  	} else {
bbd51c97 Charles Keepax 2016-01-05 @154  		clk32k_init.flags |= CLK_IS_ROOT;
bbd51c97 Charles Keepax 2016-01-05  155  	}
bbd51c97 Charles Keepax 2016-01-05  156  
bbd51c97 Charles Keepax 2016-01-05  157  	clkdata->clk32k_hw.init = &clk32k_init;
bbd51c97 Charles Keepax 2016-01-05 @158  	clkdata->clk32k = devm_clk_register(&pdev->dev, &clkdata->clk32k_hw);
bbd51c97 Charles Keepax 2016-01-05  159  	if (IS_ERR(clkdata->clk32k)) {
bbd51c97 Charles Keepax 2016-01-05  160  		ret = PTR_ERR(clkdata->clk32k);
bbd51c97 Charles Keepax 2016-01-05  161  		dev_err(arizona->dev, "Failed to register 32k clock: %d\n",

:::::: The code at line 31 was first introduced by commit
:::::: bbd51c97104a0151ab632cf717b7119124291e1a clk: arizona: Add clock driver for the Arizona devices

:::::: TO: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
:::::: CC: 0day robot <fengguang.wu@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--Dxnq1zWXvFF0Q93v
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ljnMLW+x78J9V2RGmaST063W/wATHX4SJlMBAA==

--Dxnq1zWXvFF0Q93v--
