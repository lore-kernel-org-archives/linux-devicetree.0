From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH RFC 1/4] dt-bindings: w1: document sub-node bindings for DS2760
Date: Tue, 19 Jun 2018 23:27:41 +0200
Message-ID: <20180619212744.794-2-daniel@zonque.org>
References: <20180619212744.794-1-daniel@zonque.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619212744.794-1-daniel@zonque.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zbr@ioremap.net, robh+dt@kernel.org, mark.rutland@arm.com, szabolcs.gyurko@tlt.hu
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

This patch add a generic w1 bindings document that merely describes how
slave deviceses are grouped under master nodes. It also adds a specific
binding for the ds2760 battery monitor.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/w1/w1-ds2760.txt        |  9 +++++++++
 .../devicetree/bindings/w1/w1-gpio.txt          |  6 ++++++
 Documentation/devicetree/bindings/w1/w1.txt     | 17 +++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/w1/w1-ds2760.txt
 create mode 100644 Documentation/devicetree/bindings/w1/w1.txt

diff --git a/Documentation/devicetree/bindings/w1/w1-ds2760.txt b/Documentation/devicetree/bindings/w1/w1-ds2760.txt
new file mode 100644
index 000000000000..86a0f4c573eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/w1/w1-ds2760.txt
@@ -0,0 +1,9 @@
+Devicetree bindings for Maxim DS2760
+====================================
+
+The ds2760 is a w1 slave device and must hence have its sub-node in DT
+under a w1 bus master node.
+
+Required properties:
+- compatible: must be "maxim,ds2760-w1"
+
diff --git a/Documentation/devicetree/bindings/w1/w1-gpio.txt b/Documentation/devicetree/bindings/w1/w1-gpio.txt
index 6e09c35d9f1a..a3e0e964b260 100644
--- a/Documentation/devicetree/bindings/w1/w1-gpio.txt
+++ b/Documentation/devicetree/bindings/w1/w1-gpio.txt
@@ -13,10 +13,16 @@ Optional properties:
  - linux,open-drain: if specified, the data pin is considered in
 		     open-drain mode.
 
+Also refer to the generic w1.txt document.
+
 Examples:
 
 	onewire@0 {
 		compatible = "w1-gpio";
 		gpios = <&gpio 126 0>, <&gpio 105 0>;
+
+		slave@0 {
+			compatible = "maxim,w1-ds2760";
+		};
 	};
 
diff --git a/Documentation/devicetree/bindings/w1/w1.txt b/Documentation/devicetree/bindings/w1/w1.txt
new file mode 100644
index 000000000000..504adf7c7352
--- /dev/null
+++ b/Documentation/devicetree/bindings/w1/w1.txt
@@ -0,0 +1,17 @@
+Generic devicetree bindings for onewire (w1) busses
+===================================================
+
+Onewire busses are described through nodes of their master bus controller.
+Slave devices are listed as sub-nodes of such master devices.
+
+Example:
+
+	onewire {
+		compatible = "w1-gpio";
+		gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+
+		w1_slave: slave@0 {
+			compatible = "maxim,w1-ds2760";
+		};
+	};
+
-- 
2.17.1
