From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 0/5] dts patches for qcom tsens support
Date: Wed, 10 Aug 2016 12:13:54 +0530
Message-ID: <1470811439-1992-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hey Andy,

Tsens driver patches are pulled in by Eduardo [1]
but looks like they missed the 4.8 merge window.
Nevertheless, these are dts changes for the various platforms
supported by the driver, which are acked by Eduardo.
Can you please pull these in for 4.9? (I am hoping the driver
would be merged in in 4.9 as well)

Changes from v1:
- Fixed the warings seen when compiled with W=1 as suggested by Rob

[1] https://www.spinics.net/lists/arm-kernel/msg515721.html

Rajendra Nayak (5):
  arm: dts: msm8974: Add thermal zones, tsens and qfprom nodes
  arm: dts: apq8064: Add thermal zones, tsens and qfprom nodes
  arm: dts: apq8084: Add thermal zones, tsens and qfprom nodes
  arm64: dts: msm8916: Add thermal zones, tsens and qfprom nodes
  arm64: dts: msm8996: Add thermal zones, tsens and qfprom nodes

 .../devicetree/bindings/clock/qcom,gcc.txt         |  18 ++++
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 103 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8084.dtsi                | 103 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 103 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  64 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  92 ++++++++++++++++++
 6 files changed, 483 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
