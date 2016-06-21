From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 0/5] Patches for QCOM IPQ4019 clock driver
Date: Tue, 21 Jun 2016 19:19:17 +0530
Message-ID: <1466516962-18087-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

These patches are related to Qualcomm IPQ4019 GCC (Global Clock
Controller) driver code mainly adding the nodes for clock marked
as fixed in current IPQ4019 clock driver and support for multiple
CPU frequencies.

[V2]

   1. Removed the fixed clock references and add the same as clock nodes
   with recalc_rate operation.

   2. Added all the supported cpu frequencies in frequency table.

Abhishek Sahu (5):
  clk: qcom: ipq4019: Added the clock nodes and operations for pll
  clk: qcom: ipq4019: Added the apss cpu pll divider clock node
  clk: qcom: ipq4019: Added the nodes for pcnoc
  clk: qcom: ipq4019: Added the all frequencies for apps cpu
  clk: qcom: ipq4019: Added the cpu clock frequency change notifier

 drivers/clk/qcom/gcc-ipq4019.c               | 508 +++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |  11 +
 2 files changed, 486 insertions(+), 33 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
