From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 1/2] dt-bindings: memory-controllers: Add binding for jz4780-nemc
Date: Mon, 9 Mar 2015 14:29:03 +0000
Message-ID: <1425911344-29141-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425911344-29141-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425911344-29141-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

Add device tree bindings for the NAND/External Memory Controller (NEMC)
on Ingenic JZ4780

Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V1 -> V2
Rebased to v4.0-rc3
---
 .../memory-controllers/ingenic,jz4780-nemc.txt     | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
new file mode 100644
index 0000000..f936b55
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
@@ -0,0 +1,75 @@
+* Ingenic JZ4780 NAND/external memory controller (NEMC)
+
+This file documents the device tree bindings for the NEMC external memory
+controller in Ingenic JZ4780
+
+Required properties:
+- compatible: Should be set to one of:
+    "ingenic,jz4780-nemc" (JZ4780)
+- reg: Should specify the NEMC controller registers location and length.
+- clocks: Clock for the NEMC controller.
+- #address-cells: Must be set to 2.
+- #size-cells: Must be set to 1.
+- ranges: A set of ranges for each bank describing the physical memory layout.
+  Each should specify the following 4 integer values:
+
+    <cs number> 0 <physical address of mapping> <size of mapping>
+
+Each child of the NEMC node describes a device connected to the NEMC.
+
+Required child node properties:
+- reg: Should contain at least one register specifier, given in the following
+  format:
+
+    <cs number> <offset> <size>
+
+  Multiple registers can be specified across multiple banks. This is needed,
+  for example, for packaged NAND devices with multiple dies. Such devices
+  should be grouped into a single node.
+
+Optional child node properties:
+- ingenic,nemc-bus-width: Specifies the bus width in bits. Defaults to 8 bits.
+- ingenic,nemc-tAS: Address setup time in nanoseconds.
+- ingenic,nemc-tAH: Address hold time in nanoseconds.
+- ingenic,nemc-tBP: Burst pitch time in nanoseconds.
+- ingenic,nemc-tAW: Access wait time in nanoseconds.
+- ingenic,nemc-tSTRV: Static memory recovery time in nanoseconds.
+
+If a child node references multiple banks in its "reg" property, the same value
+for all optional parameters will be configured for all banks. If any optional
+parameters are omitted, they will be left unchanged from whatever they are
+configured to when the NEMC device is probed (which may be the reset value as
+given in the hardware reference manual, or a value configured by the boot
+loader).
+
+Example (NEMC node with a NAND child device attached at CS1):
+
+nemc: nemc@13410000 {
+	compatible = "ingenic,jz4780-nemc";
+	reg = <0x13410000 0x10000>;
+
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	ranges = <1 0 0x1b000000 0x1000000
+		  2 0 0x1a000000 0x1000000
+		  3 0 0x19000000 0x1000000
+		  4 0 0x18000000 0x1000000
+		  5 0 0x17000000 0x1000000
+		  6 0 0x16000000 0x1000000>;
+
+	clocks = <&cgu JZ4780_CLK_NEMC>;
+
+	nand: nand@1 {
+		compatible = "ingenic,jz4780-nand";
+		reg = <1 0 0x1000000>;
+
+		ingenic,nemc-tAS = <10>;
+		ingenic,nemc-tAH = <5>;
+		ingenic,nemc-tBP = <10>;
+		ingenic,nemc-tAW = <15>;
+		ingenic,nemc-tSTRV = <100>;
+
+		...
+	};
+};
-- 
1.9.1
