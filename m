From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/5] dts patches for qcom tsens support
Date: Tue, 12 Jul 2016 12:22:49 +0530
Message-ID: <1468306374-24153-1-git-send-email-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Tsens driver is now pulled in and on its way to be merged in 4.8 [1]
These are the corresponding dts changes for the various platforms
supported by the driver.
None currently have support for cpufreq, so I have empty cooling-maps
added with a TODO to update once cpufreq support is available as
suggested by Eduardo.

regards,
Rajendra

[1] https://www.spinics.net/lists/arm-kernel/msg515721.html

Rajendra Nayak (5):
  arm: dts: msm8974: Add thermal zones, tsens and qfprom nodes
  arm: dts: apq8064: Add thermal zones, tsens and qfprom nodes
  arm: dts: apq8084: Add thermal zones, tsens and qfprom nodes
  arm64: dts: msm8916: Add thermal zones, tsens and qfprom nodes
  arm64: dts: msm8996: Add thermal zones and tsens node

 .../devicetree/bindings/clock/qcom,gcc.txt         |  18 ++++
 arch/arm/boot/dts/qcom-apq8064.dtsi                | 119 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8084.dtsi                | 119 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 119 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  72 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 108 +++++++++++++++++++
 6 files changed, 555 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
