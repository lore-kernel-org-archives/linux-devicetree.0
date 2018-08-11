From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: qcom: Add Global Clock controller (GCC) driver for
 SDM660
Date: Sun, 12 Aug 2018 05:30:02 +0800
Message-ID: <201808120507.D1Aw6GcB%fengguang.wu@intel.com>
References: <20180810202123.29238-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180810202123.29238-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Craig,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on agross/for-next]
[also build test WARNING on v4.18-rc8]
[cannot apply to next-20180810]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Craig-Tatlor/clk-qcom-Add-Global-Clock-controller-GCC-driver-for-SDM660/20180811-150111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git for-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/qcom/gcc-sdm660.c:2255:15: sparse: symbol 'gcc_sdm660_hws' was not declared. Should it be static?
   drivers/clk/qcom/gcc-sdm660.c:2304:10: sparse: Initializer entry defined twice
   drivers/clk/qcom/gcc-sdm660.c:2306:10:   also defined here

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
