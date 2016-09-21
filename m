From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 0/7] Patches for QCOM IPQ4019 clock driver
Date: Wed, 21 Sep 2016 17:51:45 +0530
Message-ID: <1474460512-31994-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

These patches are related to Qualcomm IPQ4019 GCC (Global Clock
Controller) driver code mainly adding the nodes for clock marked
as fixed in current IPQ4019 clock driver and support for multiple
CPU frequencies.

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
   2. Added all the supported cpu frequencies in frequency table.

Abhishek Sahu (7):
  clk: qcom: ipq4019: Added the clock nodes and operations for pll
  clk: qcom: ipq4019: Added the apss cpu pll divider clock node
  clk: qcom: ipq4019: Added the nodes for pcnoc
  clk: qcom: ipq4019: Added all the frequencies for apps cpu
  clk: qcom: ipq4019: corrected sdcc frequency and parent name
  clk: qcom: ipq4019: changed the frequency value for ddr pll
  clk: qcom: ipq4019: changed i2c freq table

 drivers/clk/qcom/gcc-ipq4019.c               | 489 +++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |  11 +
 2 files changed, 477 insertions(+), 23 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

