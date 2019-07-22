From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 0/5] clk: qcom: Add support for SM8150 GCC
Date: Mon, 22 Jul 2019 13:13:43 +0530
Message-ID: <20190722074348.29582-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Deepak Katragadda <dkatraga@codeaurora.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds suport for SM8150 GCC which requires Trion PLLs and adds
that as well.

Also fixed some minor nits seen in clk-alpha-pll code

Changes in v4:
	- Bring back DIV_ROUND_UP_ULL patch as fix in merged upstream
	- Split binding to separate patch and add the gcc parent clock to it
	  (Didn't add Rob's ack as new clocks are added to patch, so need
	  review)
	- Fix the parent pointers for clock driver and add comments for
	  critical clocks and halt delay
	- Fix the trion pll enable and typo in patch
	- tested on v5.3-rc1

Changes in v3:
	- Drop the cast for DIV_ROUND_UP_ULL as that need s afix in macro,
	  so patch it up once core change in merged
	- Drop module alias patch and drop it from sm8150 driver
	- Add review tag by Bjorn

Deepak Katragadda (3):
  clk: qcom: clk-alpha-pll: Add support for Trion PLLs
  dt-bindings: clock: Document gcc bindings for SM8150
  clk: qcom: gcc: Add global clock controller driver for SM8150

Vinod Koul (2):
  clk: qcom: clk-alpha-pll: Remove unnecessary cast
  clk: qcom: clk-alpha-pll: Remove post_div_table checks

 .../devicetree/bindings/clock/qcom,gcc.txt    |   21 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |  236 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    7 +
 drivers/clk/qcom/gcc-sm8150.c                 | 3588 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++
 7 files changed, 4086 insertions(+), 17 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-sm8150.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h


base-commit: 5f9e832c137075045d15cd6899ab0505cfb2ca4b
-- 
2.20.1
