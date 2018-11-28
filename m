From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] regulator: mcp16502: add regulator driver for
 MCP16502
Date: Wed, 28 Nov 2018 12:02:13 +0800
Message-ID: <201811281205.lpne37p2%fengguang.wu@intel.com>
References: <1543335937-12689-4-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543335937-12689-4-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

Hi Andrei.Stefanescu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on regulator/for-next]
[also build test WARNING on v4.20-rc4 next-20181127]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Andrei-Stefanescu-microchip-com/add-support-for-MCP16502-PMIC/20181128-041809
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/regulator/mcp16502.c:530:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
