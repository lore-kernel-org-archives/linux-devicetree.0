Return-Path: <SRS0=HOgu=SN=nvidia.com=mmaddireddy@kernel.org>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH 28/30] dt-bindings: pci: tegra: Document nvidia,rst-gpio optional prop
Date: Thu, 11 Apr 2019 22:33:53 +0530
Message-ID: <20190411170355.6882-29-mmaddireddy@nvidia.com>
In-Reply-To: <20190411170355.6882-1-mmaddireddy@nvidia.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Document "nvidia,rst-gpio" optional property which supports GPIO based
PERST# signal.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index dca8393b86d1..23928fd59538 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -75,6 +75,8 @@ Optional properties:
   Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
 - nvidia,plat-gpios: A list of platform specific gpios which controls
   endpoint's internal regulator or PCIe logic.
+- nvidia,rst-gpio: If GPIO is used as PERST# signal instead of available
+  SFIO, add this property with phandle to GPIO controller and GPIO number.
 
 Required properties on Tegra124 and later (deprecated):
 - phys: Must contain an entry for each entry in phy-names.
@@ -671,6 +673,7 @@ Board DTS:
 
 		pci@1,0 {
 			nvidia,num-lanes = <4>;
+			nvidia,rst-gpio = <&tegra_main_gpio TEGRA_MAIN_GPIO(A, 3) 0>;
 			status = "okay";
 		};
 
-- 
2.17.1
