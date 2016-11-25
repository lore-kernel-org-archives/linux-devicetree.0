From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 0/6] Patches for QCOM IPQ4019 clock driver
Date: Fri, 25 Nov 2016 21:11:27 +0530
Message-ID: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

These patches are related to Qualcomm IPQ4019 GCC (Global Clock
Controller) driver code mainly adding the nodes for clock marked
as fixed in current IPQ4019 clock driver and support for multiple
CPU frequencies.

[V4]

   1. Addressed the review comments given in v3 patches.
   2. Removed the intermediate VCO clocks and make VCO as
      part of final divider clock.
   3. Changed some variable and structure names.
   4. Removed intermediate frequency change patch and merged
      in the main patch itself.
   5. Added the APSS CPU frequency change notifier patch
   6. Removed i2c node frequency table which is already reviewed.

[V3]

   1. Addressed the review comments given in v2 patches.
   2. Replaced the do_div with normal division.
   3. Marked the PCNOC node as critical.
   4. Modified the frequency values for the recent change done
      in IPQ4019 bootloader.
   5. Changed the i2c node frequency table for 19.05 MHz clock.

[V2]

   1. Removed the fixed clock references and add the same as clock nodes
   with recalc_rate operation.

Abhishek Sahu (6):
  clk: qcom: ipq4019: remove fixed clocks and add pll clocks
  clk: qcom: ipq4019: Add the apss cpu pll divider clock node
  clk: qcom: ipq4019: Add the nodes for pcnoc
  clk: qcom: ipq4019: correct sdcc frequency and parent name
  clk: qcom: ipq4019: Add all the frequencies for apss cpu
  clk: qcom: ipq4019: Add the cpu clock frequency change notifier

 drivers/clk/qcom/gcc-ipq4019.c               | 484 ++++++++++++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |  11 +
 2 files changed, 481 insertions(+), 14 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

