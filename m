From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 03/14] devicetree: Add bindings for the ATH79 DDR controllers
Date: Fri, 17 Apr 2015 16:24:18 +0200
Message-ID: <1429280669-2986-4-git-send-email-albeu@free.fr>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The DDR controller of the ARxxx and AR9xxx famillies provides an
interface to flush the FIFO between various devices and the DDR.
This is mainly used by the IRQ controller to flush the FIFO before
running the interrupt handler of such devices.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 .../memory-controllers/ath79-ddr-controller.txt    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
new file mode 100644
index 0000000..5541eed
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ath79-ddr-controller.txt
@@ -0,0 +1,35 @@
+Binding for Qualcomm  Atheros AR7xxx/AR9xxx DDR controller
+
+The DDR controller of the ARxxx and AR9xxx famillies provides an interface
+to flush the FIFO between various devices and the DDR. This is mainly used
+by the IRQ controller to flush the FIFO before running the interrupt handler
+of such devices.
+
+Required properties:
+
+- compatible: has to be "qca,<soc-type>-ddr-controller",
+  "qca,[ar7100|ar7240]-ddr-controller" as fallback.
+  On SoC with PCI support "qca,ar7100-ddr-controller" should be used as
+  fallback, otherwise "qca,ar7240-ddr-controller" should be used.
+- reg: Base address and size of the controllers memory area
+- #qca,ddr-wb-channel-cells: has to be 1, the index of the write buffer
+  channel
+
+Example:
+
+	ddr_ctrl: ddr-controller@18000000 {
+		compatible = "qca,ar9132-ddr-controller",
+				"qca,ar7240-ddr-controller";
+		reg = <0x18000000 0x100>;
+
+		#qca,ddr-wb-channel-cells = <1>;
+	};
+
+	...
+
+	cpuintc@0 {
+		...
+		qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
+		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
+					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
+	};
-- 
2.0.0
