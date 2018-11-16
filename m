From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add Synopsys High-Speed USB PHY driver for Qualcomm SoCs
Date: Fri, 16 Nov 2018 22:55:57 +0800
Message-ID: <20181116145559.31876-1-shawn.guo@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

It's based on a downstream driver from Sriharsha Allenki <sallenki@codeaurora.org>
that uses USB phy framework, and gets rewrote to adpot generic phy
framework together with quite some cleanups.

Changes for v3:
 - Use SoC specific compatible "qcom,qcs404-usb-hsphy".
 - Use OF graph instead of extcon bindings to model the link to USB
   connector.

Changes for v2:
 - Add a pointer to phy/phy-bindings.txt for property #phy-cells.
 - Roll back voltage settings in case function
   qcom_snps_hsphy_config_regulators() fails in the middle.
 - Add a comment for init-seq tuple which consists of 3 numbers.
 - Sort include headers alphabetically.
 - Sort register definitions in order of offset.

Shawn Guo (1):
  phy: qualcomm: Add Synopsys High-Speed USB PHY driver

Sriharsha Allenki (1):
  dt-bindings: phy: Add Qualcomm Synopsys High-Speed USB PHY binding

 .../phy/qcom,snps-28nm-usb-hs-phy.txt         | 108 ++++
 drivers/phy/qualcomm/Kconfig                  |  10 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 .../phy/qualcomm/phy-qcom-usb-hs-snsp-28nm.c  | 513 ++++++++++++++++++
 4 files changed, 632 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-hs-snsp-28nm.c

-- 
2.18.0
