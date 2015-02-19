From: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/2] dt: bindings: add wl18xx wireless device
Date: Thu, 19 Feb 2015 18:13:20 +0200
Message-ID: <1424362401-8228-1-git-send-email-eliad@wizery.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for TI's wl18xx
wlan chip.

Signed-off-by: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
---
v3:
 * make the bindings device-specific (wl18xx) (Arnd, Mark)
 * split bindings and driver changes (Arnd)
 * make interrupt-parent optional (Arnd)
 * make unit-address same as reg (Mark)

 .../devicetree/bindings/net/wireless/ti,wl18xx.txt | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ti,wl18xx.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wl18xx.txt b/Documentation/devicetree/bindings/net/wireless/ti,wl18xx.txt
new file mode 100644
index 0000000..8120a81
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wl18xx.txt
@@ -0,0 +1,32 @@
+TI Wilink8 (wl18xx) SDIO devices
+
+This node provides properties for controlling the wilink8 wireless device. The
+node is expected to be specified as a child node to the SDIO controller that
+connects the device to the system.
+
+Required properties:
+ - compatible : Should be "ti,wl18xx".
+ - interrupts : specifies attributes for the out-of-band interrupt.
+
+Optional properties:
+ - interrupt-parent : the phandle for the interrupt controller to which the
+	device interrupts are connected.
+
+Example:
+
+&mmc3 {
+	status = "okay";
+	vmmc-supply = <&wlan_en_reg>;
+	bus-width = <4>;
+	cap-power-off-card;
+	keep-power-in-suspend;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl18xx";
+		reg = <2>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <19 IRQ_TYPE_NONE>;
+	};
+};
-- 
1.8.5.1.109.g3d252a9

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
