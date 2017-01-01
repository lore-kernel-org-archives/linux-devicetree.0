From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V7 1/4] Documentation/devicetree/bindings: b850v3_lvds_dp
Date: Sun,  1 Jan 2017 21:24:29 +0100
Message-ID: <21ea1b0795bdaa30ca475d6ce675b620b2b644ed.1483301745.git.peter.senna@collabora.com>
References: <cover.1483301745.git.peter.senna@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1483301745.git.peter.senna@collabora.com>
In-Reply-To: <cover.1483301745.git.peter.senna@collabora.com>
References: <cover.1483301745.git.peter.senna@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, architt@codeaurora.org, akpm@linux-foundation.org, daniel.vetter@ffwll.ch, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, javier@dowhile0.org, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org
Cc: Rob Herring <robh@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Devicetree bindings documentation for the GE B850v3 LVDS/DP++
display bridge.

Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
There was an Acked-by from Rob Herring <robh@kernel.org> for V6, but I changed
the bindings to use i2c_new_secondary_device() so I removed it from the commit
message.

 .../devicetree/bindings/ge/b850v3-lvds-dp.txt      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt

diff --git a/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
new file mode 100644
index 0000000..1bc6ebf
--- /dev/null
+++ b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
@@ -0,0 +1,39 @@
+Driver for GE B850v3 LVDS/DP++ display bridge
+
+Required properties:
+  - compatible : should be "ge,b850v3-lvds-dp".
+  - reg : should contain the main address which is used to ack the
+    interrupts and address for edid.
+  - reg-names : comma separeted list of register names. Valid values
+    are "main", and "edid".
+  - interrupt-parent : phandle of the interrupt controller that services
+    interrupts to the device
+  - interrupts : one interrupt should be described here, as in
+    <0 IRQ_TYPE_LEVEL_HIGH>.
+  - port : should describe the video signal connection between the host
+    and the bridge.
+
+Example:
+
+&mux2_i2c2 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	b850v3-lvds-dp-bridge@73  {
+		compatible = "ge,b850v3-lvds-dp";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x73 0x72>;
+		reg-names = "main", "edid";
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		port {
+			b850v3_dp_bridge_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
-- 
2.5.5
