From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH 0/4] Add KPSS watchdog driver to relevant device trees
Date: Wed,  1 Oct 2014 12:03:13 -0500
Message-ID: <cover.1412182773.git.joshc@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that the Krait Processor Sub-system (KPSS) Watchdog driver has been pulled
into Wim's tree destined for 3.18, add descriptions of the WDT in the relevant
device trees, and include the driver in qcom_defconfig.

Josh Cartwright (4):
  ARM: qcom: add QCOM_WDT driver to qcom_defconfig
  ARM: qcom: add description of KPSS WDT for IPQ8064
  ARM: qcom: add description of KPSS WDT for APQ8064
  ARM: qcom: add description of KPSS WDT for MSM8960

 arch/arm/boot/dts/qcom-apq8064.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/qcom-msm8960.dtsi | 15 +++++++++++++++
 arch/arm/configs/qcom_defconfig     |  2 ++
 4 files changed, 47 insertions(+)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
