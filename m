From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 10/14] dt-bindings: irqchip: Introduce TISCI Interrupt Aggregator bindings
Date: Tue, 30 Apr 2019 15:42:26 +0530
Message-ID: <20190430101230.21794-11-lokeshvutla@ti.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430101230.21794-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add the DT binding documentation for Interrupt Aggregator driver.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes since v7:
- None
 .../interrupt-controller/ti,sci-inta.txt      | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
new file mode 100644
index 000000000000..7841cb099e13
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
@@ -0,0 +1,66 @@
+Texas Instruments K3 Interrupt Aggregator
+=========================================
+
+The Interrupt Aggregator (INTA) provides a centralized machine
+which handles the termination of system events to that they can
+be coherently processed by the host(s) in the system. A maximum
+of 64 events can be mapped to a single interrupt.
+
+
+                              Interrupt Aggregator
+                     +-----------------------------------------+
+                     |      Intmap            VINT             |
+                     | +--------------+  +------------+        |
+            m ------>| | vint  | bit  |  | 0 |.....|63| vint0  |
+               .     | +--------------+  +------------+        |       +------+
+               .     |         .               .               |       | HOST |
+Globalevents  ------>|         .               .               |------>| IRQ  |
+               .     |         .               .               |       | CTRL |
+               .     |         .               .               |       +------+
+            n ------>| +--------------+  +------------+        |
+                     | | vint  | bit  |  | 0 |.....|63| vintx  |
+                     | +--------------+  +------------+        |
+                     |                                         |
+                     +-----------------------------------------+
+
+Configuration of these Intmap registers that maps global events to vint is done
+by a system controller (like the Device Memory and Security Controller on K3
+AM654 SoC). Driver should request the system controller to get the range
+of global events and vints assigned to the requesting host. Management
+of these requested resources should be handled by driver and requests
+system controller to map specific global event to vint, bit pair.
+
+Communication between the host processor running an OS and the system
+controller happens through a protocol called TI System Control Interface
+(TISCI protocol). For more details refer:
+Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
+
+TISCI Interrupt Aggregator Node:
+-------------------------------
+- compatible:		Must be "ti,sci-inta".
+- reg:			Should contain registers location and length.
+- interrupt-controller:	Identifies the node as an interrupt controller
+- msi-controller:	Identifies the node as an MSI controller.
+- interrupt-parent:	phandle of irq parent.
+- ti,sci:		Phandle to TI-SCI compatible System controller node.
+- ti,sci-dev-id:	TISCI device ID of the Interrupt Aggregator.
+- ti,sci-rm-range-vint:	Array of TISCI subtype ids representing vints(inta
+			outputs) range within this INTA, assigned to the
+			requesting host context.
+- ti,sci-rm-range-global-event:	Array of TISCI subtype ids representing the
+			global events range reaching this IA and are assigned
+			to the requesting host context.
+
+Example:
+--------
+main_udmass_inta: interrupt-controller@33d00000 {
+	compatible = "ti,sci-inta";
+	reg = <0x0 0x33d00000 0x0 0x100000>;
+	interrupt-controller;
+	msi-controller;
+	interrupt-parent = <&main_navss_intr>;
+	ti,sci = <&dmsc>;
+	ti,sci-dev-id = <179>;
+	ti,sci-rm-range-vint = <0x0>;
+	ti,sci-rm-range-global-event = <0x1>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index b54a01a70f44..bac5c926a6ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15351,6 +15351,7 @@ F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 F:	drivers/clk/keystone/sci-clk.c
 F:	drivers/reset/reset-ti-sci.c
 F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
 F:	drivers/irqchip/irq-ti-sci-intr.c
 
 Texas Instruments ASoC drivers
-- 
2.21.0
