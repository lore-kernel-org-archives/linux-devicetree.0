From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/7] QCS404 PCIe PHY and controller
Date: Fri, 25 Jan 2019 15:45:02 -0800
Message-ID: <20190125234509.26419-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, David Brown <david.brown@linaro.org>, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds support for the PCIe controller and PHY found in the Qualcomm
platform QCS404.

Bjorn Andersson (7):
  clk: gcc-qcs404: Add PCIe resets
  dt-bindings: phy: Add binding for Qualcomm PCIe2 PHY
  phy: qcom: Add Qualcomm PCIe2 PHY driver
  PCI: qcom: Use clk_bulk API for 2.4.0 controllers
  dt-bindings: PCI: qcom: Add QCS404 to the binding
  PCI: qcom: Add QCS404 PCIe controller support
  arm64: dts: qcom: qcs404: Add PCIe related nodes

 .../devicetree/bindings/pci/qcom,pcie.txt     |  25 +-
 .../bindings/phy/qcom-pcie2-phy.txt           |  40 +++
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  25 ++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  67 ++++
 drivers/clk/qcom/gcc-qcs404.c                 |   7 +
 drivers/pci/controller/dwc/pcie-qcom.c        | 108 +++---
 drivers/phy/qualcomm/Kconfig                  |   8 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 drivers/phy/qualcomm/phy-qcom-pcie2.c         | 331 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcs404.h   |   7 +
 10 files changed, 558 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-pcie2.c

-- 
2.18.0
