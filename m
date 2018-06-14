From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] clk: qcom: Add lpass clock controller driver for
 SDM845
Date: Thu, 14 Jun 2018 18:38:10 +0800
Message-ID: <201806141715.reXn15om%fengguang.wu@intel.com>
References: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528961943-12506-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh@kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rohit Kumar <rohitkr@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Taniya,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20180614]
[cannot apply to v4.17]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Taniya-Das/Add-support-for-LPASS-clock-controller-for-SDM845/20180614-155144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/qcom/lpasscc-sdm845.c:32:19: sparse: symbol 'gcc_lpass_sway_clk' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
