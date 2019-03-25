From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 2/8] dt-bindings: phy: Add Amlogic G12A USB3+PCIE Combo PHY Bindings
Date: Mon, 25 Mar 2019 10:39:37 +0100
Message-ID: <20190325093943.29138-3-narmstrong@baylibre.com>
References: <20190325093943.29138-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325093943.29138-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the Amlogic G12A Family USB3 + PCIE Combo PHY Bindings.

This PHY can provide exclusively USB3 or PCIE support on shared I/Os.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
new file mode 100644
index 000000000000..7cfc17e2df31
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
@@ -0,0 +1,22 @@
+* Amlogic G12A USB3 + PCIE Combo PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-g12a-usb3-pcie-phy"
+- #phys-cells:	must be 1. The cell number is used to select the phy mode
+  as defined in <dt-bindings/phy/phy.h> between PHY_TYPE_USB3 and PHY_TYPE_PCIE
+- reg:		The base address and length of the registers
+- clocks:	a phandle to the 100MHz reference clock of this PHY
+- clock-names:	must be "ref_clk"
+- resets:	phandle to the reset lines for the PHY control
+- reset-names:	must be "phy"
+
+Example:
+	usb3_pcie_phy: phy@46000 {
+		compatible = "amlogic,g12a-usb3-pcie-phy";
+		reg = <0x0 0x46000 0x0 0x2000>;
+		clocks = <&clkc CLKID_PCIE_PLL>;
+		clock-names = "ref_clk";
+		resets = <&reset RESET_PCIE_PHY>;
+		reset-names = "phy";
+		#phy-cells = <1>;
+	};
-- 
2.21.0
