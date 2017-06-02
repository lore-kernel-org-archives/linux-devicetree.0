From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 2/4] dt-bindings: Add Pervasive Displays RePaper bindings
Date: Fri,  2 Jun 2017 13:49:13 +0200
Message-ID: <1496404155-8344-3-git-send-email-noralf@tronnes.org>
References: <1496404155-8344-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496404155-8344-1-git-send-email-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device-tree binding documentation for the 1.44", 1.9", 2.0" and 2.7"
display panels.

Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
---
 .../devicetree/bindings/display/repaper.txt        | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/repaper.txt

diff --git a/Documentation/devicetree/bindings/display/repaper.txt b/Documentation/devicetree/bindings/display/repaper.txt
new file mode 100644
index 0000000..f5f9f9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/repaper.txt
@@ -0,0 +1,52 @@
+Pervasive Displays RePaper branded e-ink displays
+
+Required properties:
+- compatible:		"pervasive,e1144cs021" for 1.44" display
+			"pervasive,e1190cs021" for 1.9" display
+			"pervasive,e2200cs021" for 2.0" display
+			"pervasive,e2271cs021" for 2.7" display
+
+- panel-on-gpios:	Timing controller power control
+- discharge-gpios:	Discharge control
+- reset-gpios:		RESET pin
+- busy-gpios:		BUSY pin
+
+Required property for e2271cs021:
+- border-gpios:		Border control
+
+The node for this driver must be a child node of a SPI controller, hence
+all mandatory properties described in ../spi/spi-bus.txt must be specified.
+
+Optional property:
+- pervasive,thermal-zone:	name of thermometer's thermal zone
+
+Example:
+
+	display_temp: lm75@48 {
+		compatible = "lm75b";
+		reg = <0x48>;
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		display {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&display_temp>;
+		};
+	};
+
+	papirus27@0{
+		compatible = "pervasive,e2271cs021";
+		reg = <0>;
+
+		spi-max-frequency = <8000000>;
+
+		panel-on-gpios = <&gpio 23 0>;
+		border-gpios = <&gpio 14 0>;
+		discharge-gpios = <&gpio 15 0>;
+		reset-gpios = <&gpio 24 0>;
+		busy-gpios = <&gpio 25 0>;
+
+		pervasive,thermal-zone = "display";
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
