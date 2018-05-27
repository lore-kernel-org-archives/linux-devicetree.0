From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 9/9] regulator: bd71837: Build BD71837 regulator driver
Date: Sun, 27 May 2018 10:27:39 +0800
Message-ID: <201805270821.IfPrgwb1%fengguang.wu@intel.com>
References: <20180524060114.GJ4249@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180524060114.GJ4249@localhost.localdomain>
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
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
