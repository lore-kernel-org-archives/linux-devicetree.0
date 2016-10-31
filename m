From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v7 0/3] Add support for Qualcomm A53 CPU clock
Date: Mon, 31 Oct 2016 16:55:23 +0200
Message-ID: <20161031145526.5023-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

Changes since v6 (https://lkml.org/lkml/2016/9/7/347)
 * Addressed various comments from Stephen

Changes since v5 (https://lkml.org/lkml/2016/2/1/407)
 * Rebase to clk-next and update according to the recent API changes.

Changes since v4 (https://lkml.org/lkml/2015/12/14/367)
 * Convert to builtin drivers as now __clk_lookup() is used

Changes since v3 (https://lkml.org/lkml/2015/8/12/585)
 * Split driver into two parts - and separate A53 PLL and
   A53 clock controller drivers.
 * Drop the safe switch hook patch. Add a clock notifier in
   the clock provider to handle switching via safe mux and
   divider configuration.

Changes since v2 (https://lkml.org/lkml/2015/7/24/526)
 * Drop gpll0_vote patch.
 * Switch to the new clk_hw_* APIs.
 * Rebase to the current clk-next.

Changes since v1 (https://lkml.org/lkml/2015/6/12/193)
 * Drop SR2 PLL patch, as it is already applied.
 * Add gpll0_vote rate propagation patch.
 * Update/rebase patches to the current clk-next.


Georgi Djakov (3):
  clk: qcom: Add A53 PLL support
  clk: qcom: Add regmap mux-div clocks support
  clk: qcom: Add A53 clock driver

 .../devicetree/bindings/clock/qcom,a53cc.txt       |  23 ++
 .../devicetree/bindings/clock/qcom,a53pll.txt      |  20 ++
 drivers/clk/qcom/Kconfig                           |  17 ++
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/a53-pll.c                         |  94 ++++++++
 drivers/clk/qcom/a53cc.c                           | 152 +++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              | 237 +++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |  52 +++++
 8 files changed, 598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c
 create mode 100644 drivers/clk/qcom/a53cc.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h
