From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/5] clk: qcom: ipq8074: Add Global Clock Controller
 support
Date: Sat, 29 Apr 2017 13:50:51 +0800
Message-ID: <201704291326.jFi4mgNw%fengguang.wu@intel.com>
References: <1493373403-23462-3-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493373403-23462-3-git-send-email-varada@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Cc: kbuild-all@01.org, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sricharan@codeaurora.org, absahu@codeaurora.org, sjaganat@codeaurora.org, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

[auto build test WARNING on robh/for-next]
[also build test WARNING on v4.11-rc8 next-20170428]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Varadarajan-Narayanan/Add-minimal-boot-support-for-IPQ8074/20170429-130315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/clk/qcom/gcc-ipq8074.c:1014:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
