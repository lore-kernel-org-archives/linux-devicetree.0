From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/5] pinctrl: actions: Add Actions Semi S700 pinctrl
 driver
Date: Mon, 30 Jul 2018 06:00:44 +0800
Message-ID: <201807300552.cJ0VSU1K%fengguang.wu@intel.com>
References: <20180729200038.11795-5-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180729200038.11795-5-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, manivannan.sadhasivam@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, pn@denx.de, mp-cs@actions-semi.com, jeff.chen@actions-semi.com, thomas.liau@actions-semi.com, linux@cubietech.com, Saravanan Sekar <sravanhome@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Saravanan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on pinctrl/devel]
[also build test WARNING on next-20180727]
[cannot apply to v4.18-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Saravanan-Sekar/Add-Actions-Semi-S700-pinctrl-support/20180730-040252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/pinctrl/actions/pinctrl-s700.c:228:31: sparse: symbol 's700_pads' was not declared. Should it be static?
>> drivers/pinctrl/actions/pinctrl-s700.c:1552:30: sparse: symbol 's700_functions' was not declared. Should it be static?
>> drivers/pinctrl/actions/pinctrl-s700.c:1700:20: sparse: symbol 's700_padinfo' was not declared. Should it be static?
   drivers/pinctrl/actions/pinctrl-s700.c:1589:10: sparse: Initializer entry defined twice
   drivers/pinctrl/actions/pinctrl-s700.c:1594:10:   also defined here

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
