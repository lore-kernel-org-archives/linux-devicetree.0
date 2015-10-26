From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] regulator, dt: add dt support for tps6502x regulator
Date: Mon, 26 Oct 2015 17:24:59 +0800
Message-ID: <201510261705.slEEEVgs%fengguang.wu@intel.com>
References: <1445849174-3446-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445849174-3446-1-git-send-email-hs@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, Heiko Schocher <hs@denx.de>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

[auto build test WARNING on v4.3-rc7 -- if it's inappropriate base, please suggest rules for selecting the more suitable base]

url:    https://github.com/0day-ci/linux/commits/Heiko-Schocher/regulator-dt-add-dt-support-for-tps6502x-regulator/20151026-164911


coccinelle warnings: (new ones prefixed by >>)

>> drivers/regulator/tps65023-regulator.c:543:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
