From: Andy Gross <agross@codeaurora.org>
Subject: [Patch v3 0/6] GSBI CRCI Autoconfiguration Support
Date: Mon,  9 Feb 2015 16:01:05 -0600
Message-ID: <1423519271-4238-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch set adds support for automatic configuration of GSBI DMA CRCI values.

DMA operations require that the ADM CRCI mux values be properly configured in
the TCSR (Top Control and Status Register) block.  During probing of a GSBI
device, the client mode must be declared and this can be used to lookup the
correct TCSR ADM CRCI MUX settings and then program them so that they are
correct before any clients are populated.

These patches add the TCSR as a syscon device and that allows the GSBI to
access and manipulate the ADM CRCI MUX registers to correctly configure the
values based on the GSBI port configuration.

Changes since v2:
  - Use cell-index instead of alias to denote GSBI instance

Changes since v1:
  - Fixed various review comments

Andy Gross (6):
  soc: qcom: gsbi: Add support for ADM CRCI muxing
  mfd: qcom,tcsr: Add device tree binding for TCSR
  ARM: DT: apq8064: Add TCSR support
  ARM: DT: ipq8064: Add TCSR support
  ARM: DT: msm8660: Add TCSR support
  ARM: DT: msm8960: Add TCSR support

 .../devicetree/bindings/mfd/qcom,tcsr.txt          |   22 +++
 .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |   14 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   14 ++
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   14 ++
 arch/arm/boot/dts/qcom-msm8660.dtsi                |    8 ++
 arch/arm/boot/dts/qcom-msm8960.dtsi                |    8 ++
 drivers/soc/qcom/Kconfig                           |    1 +
 drivers/soc/qcom/qcom_gsbi.c                       |  152 ++++++++++++++++++++
 8 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,tcsr.txt

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
