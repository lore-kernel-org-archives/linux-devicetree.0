From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v5 0/7] phy: qcom: Updates for USB PHYs on SDM845
Date: Thu,  3 May 2018 02:36:07 +0530
Message-ID: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SDM845 has two USB instances each with QUSB2 and QMP PHYs.
One of the QMP PHY is USB-DP (DisplayPort) combo PHY where
as other one is single lane UNI-PHY (without DP support).
Changes are related to PHY configuration for electrical
parameters tuning to improve eye-diagram and some fixes.

First gcc-msm8996 driver patch is dependent on following
patch which is now applied by Stephen.
https://patchwork.kernel.org/patch/10375043/


Changes since v4:
 - Addressed Doug's review comments to have QUSB2 PHY tuning
   values in header file.
 - Updated msm8996-gcc patch to use BRANCH_HALT_SKIP flag
   added by patch - https://patchwork.kernel.org/patch/10375041/
   
Changes since v3:
 - As per Doug's review comments added device tree parameters
   to handle board level differences in PHY tuning values instead
   of adding separate device tree bindings.
 - Replace PHY version specific bindings names with SOC name as
   no one is going to use generic binding names.
 - Update halt_check to not check for pipe clock status that
   allows to simplify pipe_clk handling in QMP driver.

Changes since v2:
 - Use separate phy_ops for USB to not register power_on op.
 - And other minor changes as per review comments from Stephen.

Changes since v1:
 - Updated qusb2 compatibility name as per comment from Vivek.

Manu Gautam (7):
  clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE pipe_clk
  phy: qcom-qmp: Enable pipe_clk before PHY initialization
  phy: qcom-qusb2: Fix crash if nvmem cell not specified
  dt-bindings: phy-qcom-qmp: Update bindings for sdm845
  phy: qcom-qmp: Add QMP V3 USB3 UNI PHY support for sdm845
  dt-bindings: phy-qcom-usb2: Add support to override tuning values
  phy: qcom-qusb2: Add QUSB2 PHYs support for sdm845

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   3 +-
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  23 ++-
 drivers/clk/qcom/gcc-msm8996.c                     |   4 +
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 169 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 130 +++++++++++++++-
 include/dt-bindings/phy/phy-qcom-qusb2.h           |  37 +++++
 7 files changed, 346 insertions(+), 25 deletions(-)
 create mode 100644 include/dt-bindings/phy/phy-qcom-qusb2.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
