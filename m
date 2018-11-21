From: thesven73@gmail.com
Subject: [PATCH anybus v4 6/7] dt-bindings: anybuss-host: document devicetree binding
Date: Wed, 21 Nov 2018 10:07:08 -0500
Message-ID: <20181121150709.6030-7-TheSven73@googlemail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121150709.6030-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds devicetree binding documentation for the
Arcx Anybus-S host.

Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
---
 .../bindings/fieldbus/arcx,anybuss-host.txt   | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fieldbus/arcx,anybuss-host.txt

diff --git a/Documentation/devicetree/bindings/fieldbus/arcx,anybuss-host.txt b/Documentation/devicetree/bindings/fieldbus/arcx,anybuss-host.txt
new file mode 100644
index 000000000000..456587f288c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/fieldbus/arcx,anybuss-host.txt
@@ -0,0 +1,66 @@
+* Arcx Anybus-S host
+
+This host communicates with the SoC over a parallel bus. It is
+expected that its Device Tree node is specified as the child of a node
+corresponding to the parallel bus used for communication.
+
+Required properties:
+--------------------
+
+  - compatible : The following string:
+        "arcx,anybuss-host"
+
+  - reg : bus memory area where the Anybus-S host dpram is located.
+
+  - interrupts : interrupt connected to the Anybus-S host interrupt line.
+	Generic interrupt client node bindings are described in
+		interrupt-controller/interrupts.txt
+
+  - resets : the reset line associated with the Anybus-S host.
+
+Optional: use of subnodes
+-------------------------
+
+The card connected to a host may need additional properties. These can be
+specified in subnodes to the host node.
+
+The subnodes are identified by the standard 'reg' property. Which information
+exactly can be specified depends on the bindings for the function driver
+for the subnode.
+
+Required host node properties when using subnodes:
+- #address-cells: should be one.
+- #size-cells: should be zero.
+
+Required subnode properties:
+- reg: Must contain the fieldbus type of the card this subnode describes.
+
+Example of usage:
+-----------------
+
+This example places the Anybus-S host on top of the i.MX WEIM parallel bus, see:
+Documentation/devicetree/bindings/bus/imx-weim.txt
+
+&weim {
+	anybus-host@0 {
+		compatible = "arcx,anybuss-host";
+		reg = <0 0x400000 0x800>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		resets = <&anybus_bridge 0>;
+		/* fsl,weim-cs-timing is a i.MX WEIM bus specific property */
+		fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
+				0x00000000 0xa0000240 0x00000000>;
+		/*
+		 * optional subnode for a profinet card
+		 * (fieldbus type = 0x0089)
+		 */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		profinet@0 {
+			reg = <0x0089>;
+			/* profinet specific properties go here */
+		};
+	};
+
+};
-- 
2.17.1
