From: Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: Add Marvell PXA1928 USB and HSIC PHY bindings
Date: Fri, 29 May 2015 11:38:41 -0500
Message-ID: <1432917526-9688-2-git-send-email-robh@kernel.org>
References: <1432917526-9688-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432917526-9688-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@freescale.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add PHY binding for Marvell PXA1928 SOC's USB and HSIC PHYs.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/phy/pxa1928-usb-phy.txt        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/pxa1928-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/pxa1928-usb-phy.txt b/Documentation/devicetree/bindings/phy/pxa1928-usb-phy.txt
new file mode 100644
index 0000000..660a13c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/pxa1928-usb-phy.txt
@@ -0,0 +1,18 @@
+* Marvell PXA1928 USB and HSIC PHYs
+
+Required properties:
+- compatible: "marvell,pxa1928-usb-phy" or "marvell,pxa1928-hsic-phy"
+- reg: base address and length of the registers
+- clocks - A single clock. From common clock binding.
+- #phys-cells: should be 0. From commmon phy binding.
+- resets: reference to the reset controller
+
+Example:
+
+	usbphy: phy@7000 {
+		compatible = "marvell,pxa1928-usb-phy";
+		reg = <0x7000 0xe0>;
+		clocks = <&apmu_clocks PXA1928_CLK_USB>;
+		#phy-cells = <0>;
+	};
+
-- 
2.1.0
