From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 0/5] arm: dts: qcom: Few updates for ipq8064
Date: Fri,  3 Aug 2018 19:40:14 +0530
Message-ID: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Adding pcie,sdcc nodes and a new board file ipq8064-ap161

Sricharan R (5):
  arm: dts: qcom: Add pcie nodes for ipq8064
  arm: dts: qcom: Add sdcc nodes for ipq8064
  arm: dts: qcom: Move common nodes to ipq8064-v.1.0.dtsi
  arm: dts: qcom: Add ipq8064-ap161.dts
  arm: dts: qcom: Add led and gpio-button nodes to ipq8064 boards

 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts |  83 +--------
 arch/arm/boot/dts/qcom-ipq8064-ap161.dts |   7 +
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi | 125 ++++++++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi      | 286 +++++++++++++++++++++++++++++++
 5 files changed, 426 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-ap161.dts

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
