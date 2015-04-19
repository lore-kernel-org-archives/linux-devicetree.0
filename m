From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 03/12] devicetree: Add bindings for the ATH79 DDR controllers
Date: Sun, 19 Apr 2015 14:57:59 +0200
Message-ID: <1429448288-20742-4-git-send-email-albeu@free.fr>
References: <1429448288-20742-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429448288-20742-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The DDR controller of the ARxxx and AR9xxx famillies provides an
interface to flush the FIFO between various devices and the DDR.
This is mainly used by the IRQ controller to flush the FIFO before
running the interrupt handler of such devices.

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
v2: * Fix the node names to respect ePAPR
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
