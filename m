From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Thu, 7 Jan 2016 23:56:19 +0800
Message-ID: <201601072308.7XP0yi7D%fengguang.wu@intel.com>
References: <1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452177524-23192-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, lee.jones@linaro.org, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>, Chaitanya Bandi <bandik@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Laxman,

[auto build test WARNING on pinctrl/for-next]
[also build test WARNING on v4.4-rc8 next-20160107]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Laxman-Dewangan/Add-support-for-MAXIM-MAX77620-MAX20024-PMIC/20160107-225450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/mfd/max77620.c:900:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
