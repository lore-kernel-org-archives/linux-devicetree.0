From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v5 4/6] dt-bindings: anybus-controller: document devicetree binding
Date: Tue,  4 Dec 2018 17:02:22 -0500
Message-ID: <20181204220224.27324-5-TheSven73@googlemail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204220224.27324-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sven Van Asbroeck <svendev@arcx.com>

This patch adds devicetree binding documentation for the
Arcx anybus controller.

Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
---
 .../fieldbus/arcx,anybus-controller.txt       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt

diff --git a/Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt b/Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt
new file mode 100644
index 000000000000..b1f9474f36d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/fieldbus/arcx,anybus-controller.txt
@@ -0,0 +1,71 @@
+* Arcx Anybus-S controller
+
+This chip communicates with the SoC over a parallel bus. It is
+expected that its Device Tree node is specified as the child of a node
+corresponding to the parallel bus used for communication.
+
+Required properties:
+--------------------
+
+  - compatible : The following chip-specific string:
+        "arcx,anybus-controller"
+
+  - reg : three areas:
+	index 0: bus memory area where the cpld registers are located.
+	index 1: bus memory area of the first  host's dual-port ram.
+	index 2: bus memory area of the second host's dual-port ram.
+
+  - reset-gpios : the GPIO pin connected to the reset line of the controller.
+
+  - interrupts : two interrupts:
+		index 0: interrupt connected to the first  host
+		index 1: interrupt connected to the second host
+	Generic interrupt client node bindings are described in
+	interrupt-controller/interrupts.txt
+
+Optional: use of subnodes
+-------------------------
+
+The card connected to a host may need additional properties. These can be
+specified in subnodes to the controller node.
+
+The subnodes are identified by the standard 'reg' property. Which information
+exactly can be specified depends on the bindings for the function driver
+for the subnode.
+
+Required controller node properties when using subnodes:
+- #address-cells: should be one.
+- #size-cells: should be zero.
+
+Required subnode properties:
+- reg: Must contain the host index of the card this subnode describes:
+		<0>	for the first  host on the controller
+		<1>	for the second host on the controller
+	Note that only a single card can be plugged into a host, so the host
+	index uniquely describes the card location.
+
+Example of usage:
+-----------------
+
+This example places the bridge on top of the i.MX WEIM parallel bus, see:
+Documentation/devicetree/bindings/bus/imx-weim.txt
+
+&weim {
+	controller@0,0 {
+		compatible = "arcx,anybus-controller";
+		reg = <0 0 0x100>, <0 0x400000 0x800>, <1 0x400000 0x800>;
+		reset-gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>, <5 IRQ_TYPE_LEVEL_LOW>;
+		/* fsl,weim-cs-timing is a i.MX WEIM bus specific property */
+		fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
+				0x00000000 0xa0000240 0x00000000>;
+		/* optional subnode for a card plugged into the first host */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		card@0 {
+			reg = <0>;
+			/* card specific properties go here */
+		};
+	};
+};
-- 
2.17.1
