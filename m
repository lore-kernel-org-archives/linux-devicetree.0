From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 0/5] Add Global Clock controller (GCC) driver for SC7180
Date: Mon, 14 Oct 2019 15:53:03 +0530
Message-ID: <20191014102308.27441-1-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

[v4]
  * convert current documentation to YAML schemas.
  * Update license to use GPL-2.0-only.
  * define nvmem-cells/nvmem-cell-names only for the required compatible.
  * split the dt-bindings for SC7180 to a separate patch.
  * remove registering the CRITICAL clocks to clock provider and leave them
    always ON from the GCC probe.
  * Return NULL from qcom_cc_clk_hw_get where clk hw is not registered.
  * gcc_sc7180_init moved from subsys to core init.

[v3]
  * Remove old documentation and fix comments for binding.
  * Cleanup few CRITICAL clocks and add comments for the CRITICAL clocks.
  * Add reference clocks for UFS & USB.

[v2]
 * Update the DFS macro for RCG to reflect the hw init similar to clock
   name.
 * Update the Documentation binding of GCC to YAML schemas.
 * Add comments for CRITICAL clocks, remove PLL forward declarations and
   unwanted comments/prints.

[v1]
  * Add driver support for Global Clock controller for SC7180 and also
    update device tree bindings for the various clocks supported in the
    clock controller.

Taniya Das (5):
  clk: qcom: rcg: update the DFS macro for RCG
  clk: qcom: common: Return NULL from clk_hw OF provider
  dt-bindings: clock: Add YAML schemas for the QCOM GCC clock bindings
  dt-bindings: clock: Introduce QCOM GCC clock bindings
  clk: qcom: Add Global Clock controller (GCC) driver for SC7180

 .../devicetree/bindings/clock/qcom,gcc.txt    |   94 -
 .../devicetree/bindings/clock/qcom,gcc.yaml   |  188 ++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rcg.h                    |    2 +-
 drivers/clk/qcom/common.c                     |    2 +-
 drivers/clk/qcom/gcc-sc7180.c                 | 2450 +++++++++++++++++
 drivers/clk/qcom/gcc-sdm845.c                 |   96 +-
 include/dt-bindings/clock/qcom,gcc-sc7180.h   |  155 ++
 9 files changed, 2853 insertions(+), 144 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
