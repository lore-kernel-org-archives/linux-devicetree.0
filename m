From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/2] Qualcomm PCIe2 PHY
Date: Wed,  1 May 2019 17:14:04 -0700
Message-ID: <20190502001406.10431-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Qualcomm PCIe2 PHY is based on design from Synopsys and found in
several different platforms where the QMP PHY isn't used.

Bjorn Andersson (2):
  dt-bindings: phy: Add binding for Qualcomm PCIe2 PHY
  phy: qcom: Add Qualcomm PCIe2 PHY driver

 .../bindings/phy/qcom-pcie2-phy.txt           |  42 +++
 drivers/phy/qualcomm/Kconfig                  |   8 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 drivers/phy/qualcomm/phy-qcom-pcie2.c         | 331 ++++++++++++++++++
 4 files changed, 382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-pcie2.c

-- 
2.18.0
