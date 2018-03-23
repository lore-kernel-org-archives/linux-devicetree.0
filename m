From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v3 0/6] phy: qcom: Updates for USB PHYs on SDM845
Date: Fri, 23 Mar 2018 11:41:21 +0530
Message-ID: <1521785487-29866-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SDM845 has two USB instances each with QUSB2 and QMP PHYs.
One of the QMP PHY is USB-DP (DisplayPort) combo PHY where
as other one is single lane UNI-PHY (without DP support).
Changes are related to PHY configuration for electrical
parameters tuning to improve eye-diagram and some fixes.

Changes since v2:
 - Use separate phy_ops for USB to not register power_on op.
 - And other minor changes as per review comments from Stephen.

Changes since v1:
 - Updated qusb2 compatibility name as per comment from Vivek.

Manu Gautam (6):
  phy: qcom-qmp: Enable pipe_clk before checking USB3 PHY_STATUS
  phy: qcom-qusb2: Fix crash if nvmem cell not specified
  dt-bindings: phy-qcom-qmp: Update bindings for sdm845
  phy: qcom-qmp: Add QMP V3 USB3 UNI PHY support for sdm845
  dt-bindings: phy-qcom-usb2: Update bindings for sdm845
  phy: qcom-qusb2: Add QUSB2 PHYs support for sdm845

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   4 +-
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 181 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  43 +++++
 5 files changed, 234 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
