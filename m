From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 7/9] clk: bd71837: Build ROHM BD71837 PMIC clock driver
Date: Sun, 27 May 2018 16:28:22 +0800
Message-ID: <201805271456.NRwg0RUS%fengguang.wu@intel.com>
References: <20180524055955.GH4249@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180524055955.GH4249@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: kbuild-all@01.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Hi Matti,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ljones-mfd/for-mfd-next]
[also build test WARNING on v4.17-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/mfd-regulator-clk-bd71837-ROHM-BD71837-PMIC-driver/20180526-192351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/clk-bd71837.c:145:6-11: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
