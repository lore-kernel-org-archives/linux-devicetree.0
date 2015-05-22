From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: [PATCH v3 1/2] mtd: arasan: Add device tree binding documentation
Date: Fri, 22 May 2015 23:49:50 +0530
Message-ID: <1432318791-17025-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, joern@logfs.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch adds the dts binding document for arasan nand flash
controller.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
Changes in v3:
- None
Changes in v2:
- None
---
 .../devicetree/bindings/mtd/arasan_nfc.txt         |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
new file mode 100644
index 0000000..7815120
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
@@ -0,0 +1,27 @@
+Arasan Nand Flash Controller with ONFI 3.1 support
+
+Required properties:
+- compatible: Should be "arasan,nfc-v3p10"
+- reg: Memory map for module access
+- interrupt-parent: Interrupt controller the interrupt is routed through
+- interrupts: Should contain the interrupt for the device
+
+Optional properties:
+- arasan,has-mdma: Boolean to support dma transfer for nand read/write.
+
+for nand partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	nand0: nand@ff100000 {
+		compatible = "arasan,nfc-v3p10"
+		reg = <0x0 0xff100000 0x1000>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 14 4>;
+		arasan,has-mdma;
+		partition@0 {
+			label = "filesystem";
+			reg = <0x0 0x0 0x1000000>;
+		};
+		(...)
+	};
-- 
1.7.4
