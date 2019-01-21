From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3 0/6] MSM8998 basic USB support
Date: Mon, 21 Jan 2019 14:31:47 -0700
Message-ID: <1548106307-4762-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This series provides basic USB support for MSM8998.  Currently missing is
wiring up the Type-C detection logic so that the controller can correctly
switch between host and peripheral modes.  Work to implement that is
ongoing, and expected to appear soon in followup patches.  Also missing is
Display Port (DP) support which apparently is different from sdm845 and
needs additional investigation.

v3:
-Dropped accepted phy changes
-Changed DT node labels per discussion with Bjorn
-Made DT reg property addresses fill width
-Added Bjorn's reviewed-by

v2:
-Fixed typo in QUSB2 bindings changes
-Split out bindings changes
-Fixed dual lane support in QMP to reflect Doug's updates
-Dropped the clock fixes which were accepted

Jeffrey Hugo (6):
  clk: qcom: Add missing freq for usb30_master_clk on 8998
  clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998
  phy: qcom-qusb2: Add QUSB2 PHY support for msm8998
  phy: qcom-qmp: Add QMP V3 USB3 PHY support for msm8998
  usb: dwc3: qcom: Add support for MSM8998
  arm64: dts: qcom: msm8998: Add USB-related nodes

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   5 +
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |   1 +
 .../devicetree/bindings/usb/qcom,dwc3.txt          |   1 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi          |  22 ++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  90 +++++++++++++
 drivers/clk/qcom/gcc-msm8998.c                     |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 142 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   4 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  41 ++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |   1 +
 10 files changed, 309 insertions(+), 1 deletion(-)

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
