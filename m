From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 0/5] Patches for QCOM IPQ4019 clock driver
Date: Mon, 30 May 2016 20:02:33 +0530
Message-ID: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: mturquette@baylibre.com, galak@codeaurora.org, pradeepb@codeaurora.org, mmcclint@codeaurora.org, varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org, ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

These patches are related to Qualcomm IPQ4019 GCC (Global Clock
Controller) driver code mainly adding support for multiple CPU
frequencies and corrected fixed clock values.

Abhishek Sahu (5):
  clk: qcom: ipq4019: Modified the fixed clock rate to proper values
  clk: qcom: ipq4019: Added the apss cpu pll divider clock node
  clk: qcom: ipq4019: Added the cpu pll divider and changed regmap limit
  clk: qcom: ipq4019: Added the cpu clock frequency change notifier
  clk: qcom: ipq4019: Added the turbo frequency for apps cpu

 drivers/clk/qcom/gcc-ipq4019.c               | 195 +++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-ipq4019.h |   1 +
 2 files changed, 183 insertions(+), 13 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
