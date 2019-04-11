Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 23/30] dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
Date: Thu, 11 Apr 2019 22:33:48 +0530
Message-ID: <20190411170355.6882-24-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Document PCIe DPD pinctrl optional property to put PEX clk & BIAS pads
in low power mode.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index 145a4f04194f..fbbd3bcb3435 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -65,6 +65,15 @@ Required properties:
   - afi
   - pcie_x
 
+Optional properties:
+- pinctrl-names : The pin control state names.
+- pinctrl-0: PCIe IO(bias & REFCLK) deep power down(DPD) disable state.
+  In Tegra210 PCIe clamps are not controlling IO signals, so there
+  is leakagae power even after PCIe power partition is off. Pass
+  pinctrl phandle to allow driver to explicitly put PCIe IO in DPD state.
+- pinctrl-1: PCIe IO(bias & REFCLK) deep power down(DPD) enable state.
+  Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
+
 Required properties on Tegra124 and later (deprecated):
 - phys: Must contain an entry for each entry in phy-names.
 - phy-names: Must include the following entries:
-- 
2.17.1
