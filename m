From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 0/5] dts patches for qcom tsens support
Date: Wed, 17 Aug 2016 10:48:43 +0530
Message-ID: <1471411128-4002-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hey Andy,

This is a respin of v2 with some minor fixes pointed out by Rob.
Please pull these in for 4.9

Thanks,
Rajendra

Rajendra Nayak (5):
  arm: dts: msm8974: Add thermal zones, tsens and qfprom nodes
  arm: dts: apq8064: Add thermal zones, tsens and qfprom nodes
  arm: dts: apq8084: Add thermal zones, tsens and qfprom nodes
  arm64: dts: msm8916: Add thermal zones, tsens and qfprom nodes
  arm64: dts: msm8996: Add thermal zones, tsens and qfprom nodes

 .../devicetree/bindings/clock/qcom,gcc.txt         |  16 ++++
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 103 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8084.dtsi                | 103 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 103 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  64 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  92 ++++++++++++++++++
 6 files changed, 481 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
