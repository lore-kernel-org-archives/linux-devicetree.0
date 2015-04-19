From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH v2 04/12] devicetree: Add bindings for the ATH79 interrupt controllers
Date: Sun, 19 Apr 2015 14:58:00 +0200
Message-ID: <1429448288-20742-5-git-send-email-albeu@free.fr>
References: <1429448288-20742-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429448288-20742-1-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
v2: * Fixed the node names to respect ePAPR
    * Removed the unneeded @0 on the node name
---
 .../interrupt-controller/qca,ath79-cpu-intc.txt    | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
new file mode 100644
index 0000000..aabce78
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-cpu-intc.txt
@@ -0,0 +1,44 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX CPU interrupt controller
+
+On most SoC the IRQ controller need to flush the DDR FIFO before running
+the interrupt handler of some devices. This is configured using the
+qca,ddr-wb-channels and qca,ddr-wb-channel-interrupts properties.
+
+Required Properties:
+
+- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-cpu-intc"
+  as fallback
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode interrupt
+		     source, should be 1 for intc
+
+Please refer to interrupts.txt in this directory for details of the common
+Interrupt Controllers bindings used by client devices.
+
+Optional Properties:
+
+- qca,ddr-wb-channel-interrupts: List of the interrupts needing a write
+  buffer flush
+- qca,ddr-wb-channels: List of phandles to the write buffer channels for
+  each interrupt. If qca,ddr-wb-channel-interrupts is not present the interrupt
+  default to the entry's index.
+
+Example:
+
+	interrupt-controller {
+		compatible = "qca,ar9132-cpu-intc", "qca,ar7100-cpu-intc";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
+		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
+					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
+	};
+
+	...
+
+	ddr_ctrl: memory-controller@18000000 {
+		...
+		#qca,ddr-wb-channel-cells = <1>;
+	};
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
