From: thesven73@gmail.com
Subject: [PATCH anybus v4 4/7] dt-bindings: anybus-bridge: document devicetree binding
Date: Wed, 21 Nov 2018 10:07:06 -0500
Message-ID: <20181121150709.6030-5-TheSven73@googlemail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121150709.6030-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds devicetree binding documentation for the
Arcx anybus bridge.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
---
 .../bindings/fieldbus/arcx,anybus-bridge.txt  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fieldbus/arcx,anybus-bridge.txt

diff --git a/Documentation/devicetree/bindings/fieldbus/arcx,anybus-bridge.txt b/Documentation/devicetree/bindings/fieldbus/arcx,anybus-bridge.txt
new file mode 100644
index 000000000000..cb801b7568b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/fieldbus/arcx,anybus-bridge.txt
@@ -0,0 +1,34 @@
+* Arcx anybus bridge
+
+This chip communicates with the SoC over a parallel bus. It is
+expected that its Device Tree node is specified as the child of a node
+corresponding to the parallel bus used for communication.
+
+Required properties:
+
+  - compatible : The following chip-specific string:
+        "arcx,anybus-bridge"
+
+  - reg : bus memory area where the cpld registers are located.
+
+  - reset-gpios : the GPIO pin connected to the reset line of the bridge.
+
+  - #reset-cells : Must be 1.
+	this bridge is a reset provider to its two embedded Anybus-S slots.
+
+Example of usage:
+
+This example places the bridge on top of the i.MX WEIM parallel bus, see:
+Documentation/devicetree/bindings/bus/imx-weim.txt
+
+&weim {
+	anybus_bridge: bridge@0,0 {
+		compatible = "arcx,anybus-bridge";
+		reg = <0 0 0x100>;
+		reset-gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		#reset-cells = <1>;
+		/* fsl,weim-cs-timing is a i.MX WEIM bus specific property */
+		fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
+				0x00000000 0xa0000240 0x00000000>;
+	};
+};
-- 
2.17.1
