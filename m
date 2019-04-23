Return-Path: <SRS0=/rZc=SZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8039 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfDWJbG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Apr 2019 05:31:06 -0400
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: [PATCH V2 26/28] dt-bindings: pci: tegra: Document reset-gpio optional prop
Date: Tue, 23 Apr 2019 14:58:23 +0530
Message-ID: <20190423092825.759-27-mmaddireddy@nvidia.com>
In-Reply-To: <20190423092825.759-1-mmaddireddy@nvidia.com>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Manikanta Maddireddy <mmaddireddy@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Document "reset-gpio" optional property which supports GPIO based PERST#
signal.

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
V2: Using standard "reset-gpio" property

 .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index 7939bca47861..4e75e017f660 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -162,6 +162,10 @@ Required properties:
   - Root port 0 uses 4 lanes, root port 1 is unused.
   - Both root ports use 2 lanes.
 
+Optional properties:
+- reset-gpio: If GPIO is used as PERST# signal instead of available
+  SFIO, add this property with phandle to GPIO controller and GPIO number.
+
 Required properties for Tegra124 and later:
 - phys: Must contain an phandle to a PHY for each entry in phy-names.
 - phy-names: Must include an entry for each active lane. Note that the number
@@ -626,6 +630,7 @@ SoC DTSI:
 			ranges;
 
 			nvidia,num-lanes = <2>;
+			reset-gpio = <&gpio TEGRA_GPIO(A, 3) 0>;
 		};
 
 		pci@2,0 {
-- 
2.17.1
