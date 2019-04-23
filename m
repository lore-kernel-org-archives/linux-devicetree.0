Return-Path: <SRS0=zE5V=SZ=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V2 23/28] dt-bindings: pci: tegra: Document PCIe DPD pinctrl optional prop
Date: Tue, 23 Apr 2019 14:58:20 +0530
Message-ID: <20190423092825.759-24-mmaddireddy@nvidia.com>
In-Reply-To: <20190423092825.759-1-mmaddireddy@nvidia.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Document PCIe DPD pinctrl optional property to put PEX clk & BIAS pads
in low power mode.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V2: Using standard pinctrl names, default and idle

 .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index 145a4f04194f..7939bca47861 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -65,6 +65,14 @@ Required properties:
   - afi
   - pcie_x
 
+Optional properties:
+- pinctrl-names: A list of pinctrl state names. Must contain the following
+  entries:
+  - "default": active state, puts PCIe I/O out of deep power down state
+  - "idle": puts PCIe I/O into deep power down state
+- pinctrl-0: phandle for the default/active state of pin configurations.
+- pinctrl-1: phandle for the idle state of pin configurations.
+
 Required properties on Tegra124 and later (deprecated):
 - phys: Must contain an entry for each entry in phy-names.
 - phy-names: Must include the following entries:
-- 
2.17.1
