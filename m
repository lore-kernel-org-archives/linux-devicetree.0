From: thesven73@gmail.com
Subject: [PATCH anybus v2 2/5] dt-bindings: anybus-bridge: document devicetree binding.
Date: Wed, 31 Oct 2018 15:44:22 -0400
Message-ID: <20181031194425.32132-3-TheSven73@googlemail.com>
References: <20181031194425.32132-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031194425.32132-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, linus.walleij@linaro.org, maxime.ripard@bootlin.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sven Van Asbroeck <svendev@arcx.com>

This patch adds devicetree binding documentation for the
Arcx anybus bridge.

Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
---
 .../bindings/misc/arcx,anybus-bridge.txt      | 34 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/arcx,anybus-bridge.txt

diff --git a/Documentation/devicetree/bindings/misc/arcx,anybus-bridge.txt b/Documentation/devicetree/bindings/misc/arcx,anybus-bridge.txt
new file mode 100644
index 000000000000..cb801b7568b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/arcx,anybus-bridge.txt
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
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c3fc512e746..1bf07b20a8af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -35,6 +35,7 @@ aptina	Aptina Imaging
 arasan	Arasan Chip Systems
 archermind ArcherMind Technology (Nanjing) Co., Ltd.
 arctic	Arctic Sand
+arcx	Arcx/Archronix Inc.
 aries	Aries Embedded GmbH
 arm	ARM Ltd.
 armadeus	ARMadeus Systems SARL
-- 
2.17.1
