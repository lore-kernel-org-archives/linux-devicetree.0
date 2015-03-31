From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V3 1/2] dt-bindings: binding for jz4780-{nand,bch}
Date: Tue, 31 Mar 2015 17:59:40 +0100
Message-ID: <1427821181-40843-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: computersforpeace@gmail.com, dwmw2@infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

Add DT bindings for NAND devices connected to the NEMC on JZ4780 SoCs,
as well as the hardware BCH controller, used by the jz4780_{nand,bch}
drivers.

Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V2 - > V3
Rebase to 4.0-rc6
Changed ingenic,ecc-size to common nand-ecc-step-size
Changed ingenic,ecc-strength to common nand-ecc-strength
Changed ingenic,busy-gpio to common rb-gpios
Changed ingenic,wp-gpio to common wp-gpios

V1 - > V2
Rebase to 4.0-rc3
---
 .../bindings/mtd/ingenic,jz4780-nand.txt           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
new file mode 100644
index 0000000..1e8e2eef
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -0,0 +1,57 @@
+* Ingenic JZ4780 NAND/BCH
+
+This file documents the device tree bindings for NAND flash devices on the
+JZ4780. NAND devices are connected to the NEMC controller (described in
+memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
+be children of the NEMC node.
+
+Required NAND device properties:
+- compatible: Should be set to "ingenic,jz4780-nand".
+- reg: For each bank with a NAND chip attached, should specify a bank number,
+  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
+
+Optional NAND device properties:
+- ingenic,bch-device: To make use of the hardware BCH controller, this property
+  must contain a phandle for the BCH controller node. The required properties
+  for this node are described below. If this is not specified, software BCH
+  will be used instead.
+- nand-ecc-step-size: ECC block size in bytes.
+- nand-ecc-strength: ECC strength (max number of correctable bits).
+- rb-gpios: GPIO specifier for the busy pin.
+- wp-gpios: GPIO specifier for the write protect pin.
+
+Example:
+
+nemc: nemc@13410000 {
+	...
+
+	nand: nand@1 {
+		compatible = "ingenic,jz4780-nand";
+		reg = <1 0 0x1000000>;	/* Bank 1 */
+
+		ingenic,bch-device = <&bch>;
+		nand-ecc-step-size = <1024>;
+		nand-ecc-strength = <24>;
+
+		rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
+	};
+};
+
+The BCH controller is a separate SoC component used for error correction on
+NAND devices. The following is a description of the device properties for a
+BCH controller.
+
+Required BCH properties:
+- compatible: Should be set to "ingenic,jz4780-bch".
+- reg: Should specify the BCH controller registers location and length.
+- clocks: Clock for the BCH controller.
+
+Example:
+
+bch: bch@134d0000 {
+	compatible = "ingenic,jz4780-bch";
+	reg = <0x134d0000 0x10000>;
+
+	clocks = <&cgu JZ4780_CLK_BCH>;
+};
-- 
1.9.1
