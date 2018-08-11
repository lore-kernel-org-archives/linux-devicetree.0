From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] clk: qcom: gcc_sdm660_hws[] can be static
Date: Sun, 12 Aug 2018 05:30:06 +0800
Message-ID: <20180811213006.GA10693@ivb42>
References: <20180810202123.29238-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180810202123.29238-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, ctatlor97@gmail.com, linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Fixes: 851e534f5d75 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 gcc-sdm660.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index bdb445a..cec8b41 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2252,7 +2252,7 @@ static struct gdsc pcie_0_gdsc = {
 	.flags = VOTABLE,
 };
 
-struct clk_hw *gcc_sdm660_hws[] = {
+static struct clk_hw *gcc_sdm660_hws[] = {
 	[GCC_XO] = &xo.hw,
 	[GCC_GPLL0_EARLY_DIV] = &gpll0_early_div.hw,
 	[GCC_GPLL1_EARLY_DIV] = &gpll1_early_div.hw,
