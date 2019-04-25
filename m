From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: Add binding for Mediatek MT7621 PCIe PHY
Date: Thu, 25 Apr 2019 17:41:21 +0200
Message-ID: <20190425154122.24122-2-sergio.paracuellos@gmail.com>
References: <20190425154122.24122-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425154122.24122-1-sergio.paracuellos@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devicetree@vger.kernel.org, john@phrozen.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, neil@brown.name
List-Id: devicetree@vger.kernel.org

Add bindings to describe Mediatek MT7621 PCIe PHY.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/phy/mediatek,mt7621-pci-phy.txt  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
new file mode 100644
index 000000000000..a369d715378b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
@@ -0,0 +1,28 @@
+Mediatek Mt7621 PCIe PHY
+
+Required properties:
+- compatible: must be "mediatek,mt7621-pci-phy"
+- reg: base address and length of the PCIe PHY block
+- #phy-cells: must be <1> for pcie0_phy and for pcie1_phy.
+
+Example:
+	pcie0_phy: pcie-phy@1e149000 {
+		compatible = "mediatek,mt7621-pci-phy";
+		reg = <0x1e149000 0x0700>;
+		#phy-cells = <1>;
+	};
+
+	pcie1_phy: pcie-phy@1e14a000 {
+		compatible = "mediatek,mt7621-pci-phy";
+		reg = <0x1e14a000 0x0700>;
+		#phy-cells = <1>;
+	};
+
+	/* users of the PCIe phy */
+
+	pcie: pcie@1e140000 {
+		...
+		...
+		phys = <&pcie0_phy 0>, <&pcie0_phy 1>, <&pcie1_phy 0>;
+		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
+	};
-- 
2.19.1
