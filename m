From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v11 0/3]  Add support for LPASS clock controller for SDM845
Date: Fri, 30 Nov 2018 23:51:26 +0530
Message-ID: <1543602089-21086-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

 [v11]
  * Add the GCC LPASS clocks only if LPASSCC config is present.
  * Update the comment in lpasscc driver.

 [v10]
  * Separate change to add  protected-clocks list in GCC binding.
  * Remove the clock support 'LPASS_AUDIO_WRAPPER_AON_CLK' as it is always ON
  clock.
  * Add few comments for module description and match table.

 [v9]
  * Update GCC documentation binding with the protected-clocks list.
  * Update the GCC code to add the GCC lpass clocks.
  * This depends on the acceptance of
  https://lore.kernel.org/lkml/20181105194011.43770-1-swboyd@chromium.org/

 [v8]
  * Add CLK_IS_CRITICAL for GCC lpass clocks for lpass clocks access to go
  through always.

 [v7]
  * Cleanup header file inclusions.
  * Move the comments along with the flags.
  * Update the commit with details for CLK_IGNORE_UNUSED.

 [v6]
  * Update the logic to register the lpass clocks when the device tree property
   is not present.
  * Add the CLK_IGNORE_UNUSED flag for the lpass clocks to not gate the clocks
   at late_init.

 [v5]
  * Address the comments in device tree binding to update the reg-names,
    update the unit address in lpass clock node example and also
    add reg property for the gcc clock node.
  * Update the lpass driver to take care of the reg-names.

 [v4]
  * Update the description in GCC Documentation binding for
  'qcom,lpass-protected'.
  * Remove 'qcom,lpass-protected' from LPASS Documentation binding.
  * Update KConfig to use Low Power Audio Subsystem.
  * Add module_exit() and also update return value for
    devm_ioremap_resource failure.

 [v3]
  * Add a device tree property to identify lpass protected GCC clocks.
  * Update the GCC driver code to register the lpass clocks when the flag is
   defined.
  * Add comment for clocks using the BRANCH_HALT_SKIP flag.
  * Use platform APIs instead of of_address_to_resource.
  * Replace devm_ioremap with devm_ioremap_resource.
  * Use fixed index for 'lpass_cc' & 'lpass_qdsp6ss' in probe.

 [v2]
  * Make gcc_lpass_sway_clk static.
  * Remove using child nodes and use reg-names to differentiate various
    domains of LPASS CC.

Add support for the lpass clock controller found on SDM845 based devices.
This would allow lpass peripheral loader drivers to control the clocks to
bring the subsystem out of reset.

Taniya Das (3):
  dt-bindings: clock: Update GCC bindings for protected-clocks
  dt-bindings: clock: Introduce QCOM LPASS clock bindings
  clk: qcom: Add lpass clock controller driver for SDM845

 .../devicetree/bindings/clock/qcom,gcc.txt         |  16 ++
 .../devicetree/bindings/clock/qcom,lpasscc.txt     |  26 +++
 drivers/clk/qcom/Kconfig                           |   9 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sdm845.c                      |  32 ++++
 drivers/clk/qcom/lpasscc-sdm845.c                  | 179 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdm845.h        |   2 +
 include/dt-bindings/clock/qcom,lpass-sdm845.h      |  15 ++
 8 files changed, 280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 drivers/clk/qcom/lpasscc-sdm845.c
 create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
