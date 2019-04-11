Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 00/30] Enable Tegra PCIe root port features
Date: Thu, 11 Apr 2019 22:33:25 +0530
Message-ID: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This series of patches adds,
- Tegra root port features like Gen2, AER, etc
- Power and perf optimizations
- Fixes like "power up sequence", "dev_err prints", etc

These series of patches are tested on Tegra186 based Jetson-TX2, Tegra210
based Jetson-TX1 and T124 based Jetson-TK1 platforms.

Manikanta Maddireddy (30):
  soc/tegra: pmc: Export tegra_powergate_power_on()
  PCI: tegra: Fix PCIe host power up sequence
  PCI: tegra: Move REFCLK pad settings out of phy_power_on()
  PCI: tegra: Add PCIe Gen2 link speed support
  PCI: tegra: Advertise PCIe Advanced Error Reporting (AER) capability
  PCI: tegra: Program UPHY electrical settings for Tegra210
  PCI: tegra: Enable opportunistic update FC and ACK
  PCI: tegra: Disable AFI dynamic clock gating
  PCI: tegra: Process pending DLL transactions before entering L1 or L2
  PCI: tegra: Enable PCIe xclk clock clamping
  PCI: tegra: Increase the deskew retry time
  PCI: tegra: Add SW fixup for RAW violations
  PCI: tegra: Update flow control threshold in Tegra210
  PCI: tegra: Set target speed as Gen1 before link up
  PCI: tegra: Fix PLLE powerdown issue due to CLKREQ# signal
  PCI: tegra: Program AFI_CACHE* registers only for Tegra20
  PCI: tegra: Use switch statements in tegra_pcie_isr()
  PCI: tegra: Change PRSNT_SENSE irq log to debug
  PCI: tegra: Use legacy irq for port service drivers
  PCI: tegra: Add AFI_PEX2_CTRL reg offset as part of soc struct
  PCI: tegra: Add "pci" type check before parsing child device tree node
  PCI: tegra: Access endpoint config only if PCIe link is up
  dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
  arm64: tegra: Add PEX DPD states as pinctrl properties
  PCI: tegra: Put PEX CLK & BIAS pads in DPD mode
  dt-bindings: pci: tegra: Document nvidia,plat-gpios optional prop
  PCI: tegra: Add support to configure platform GPIOs
  dt-bindings: pci: tegra: Document nvidia,rst-gpio optional prop
  PCI: tegra: Add support for GPIO based PCIe reset
  PCI: tegra: Change link retry log level to INFO

 .../bindings/pci/nvidia,tegra20-pcie.txt      |  15 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  19 +
 drivers/pci/controller/pci-tegra.c            | 696 ++++++++++++++++--
 drivers/soc/tegra/pmc.c                       |   1 +
 4 files changed, 656 insertions(+), 75 deletions(-)

-- 
2.17.1
