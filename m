From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: Add binding doc for Stingray PCIe PHY
Date: Fri,  6 Jul 2018 17:18:32 -0700
Message-ID: <1530922713-22964-2-git-send-email-ray.jui@broadcom.com>
References: <1530922713-22964-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530922713-22964-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add binding document for Stingray PCIe PHYs for both PAXB and PAXC based
root complex

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/phy/brcm,sr-pcie-phy.txt   | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
new file mode 100644
index 0000000..e8d8228
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
@@ -0,0 +1,41 @@
+Broadcom Stingray PCIe PHY
+
+Required properties:
+- compatible: must be "brcm,sr-pcie-phy"
+- reg: base address and length of the PCIe SS register space
+- brcm,sr-cdru: phandle to the CDRU syscon node
+- brcm,sr-mhb: phandle to the MHB syscon node
+- #phy-cells: Must be 1, denotes the PHY index
+
+For PAXB based root complex, one can have a configuration of up to 8 PHYs
+PHY index goes from 0 to 7
+
+For the internal PAXC based root complex, PHY index is always 8
+
+Example:
+	mhb: syscon@60401000 {
+		compatible = "brcm,sr-mhb", "syscon";
+		reg = <0 0x60401000 0 0x38c>;
+	};
+
+	cdru: syscon@6641d000 {
+		compatible = "brcm,sr-cdru", "syscon";
+		reg = <0 0x6641d000 0 0x400>;
+	};
+
+	pcie_phy: phy@40000000 {
+		compatible = "brcm,sr-pcie-phy";
+		reg = <0 0x40000000 0 0x800>;
+		brcm,sr-cdru = <&cdru>;
+		brcm,sr-mhb = <&mhb>;
+		#phy-cells = <1>;
+	};
+
+	/* users of the PCIe PHY */
+
+	pcie0: pcie@48000000 {
+		...
+		...
+		phys = <&pcie_phy 0>;
+		phy-names = "pcie-phy";
+	};
-- 
2.1.4
