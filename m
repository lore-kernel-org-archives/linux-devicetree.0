From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/2] clk: qcom: Add RPM clocks for msm8996
Date: Tue, 10 Oct 2017 14:27:12 +0530
Message-ID: <1507625834-30499-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org, mturquette@baylibre.com, andy.gross@linaro.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add support for RPM clocks on msm8996 platforms

Rajendra Nayak (2):
  clk: qcom: clk-smd-rpm: add msm8996 rpmclks
  arm64: dts: msm8996: Add the rpm clock controller node

 .../devicetree/bindings/clock/qcom,rpmcc.txt       |  1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  6 ++
 drivers/clk/qcom/clk-smd-rpm.c                     | 82 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h             | 14 ++++
 include/linux/soc/qcom/smd-rpm.h                   |  4 ++
 5 files changed, 107 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

