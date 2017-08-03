From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2] dt-bindings: add device tree binding for Allwinner XR819 SDIO Wi-Fi
Date: Thu,  3 Aug 2017 09:02:59 +0800
Message-ID: <20170803010259.45971-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner XR819 is a SDIO Wi-Fi chip, which has the functionality to use
an out-of-band interrupt pin instead of SDIO in-band interrupt.

Add the device tree binding of this chip, in order to make it possible
to add this interrupt pin to device trees.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v2:
- Removed status property in example.
- Added required property reg.

 .../bindings/net/wireless/allwinner,xr819.txt      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt b/Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt
new file mode 100644
index 000000000000..4d4d0781ca35
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/allwinner,xr819.txt
@@ -0,0 +1,38 @@
+Allwinner XRadio wireless SDIO devices
+
+This node provides properties for controlling the XRadio wireless device. The
+node is expected to be specified as a child node to the SDIO controller that
+connects the device to the system.
+
+Required properties:
+
+ - reg : The SDIO function number, see "Use of function subnodes" in
+	../../mmc/mmc.txt.
+ - compatible : Should be "allwinner,xr819".
+
+Optional properties:
+ - interrupt-parent : the phandle for the interrupt controller to which the
+	device interrupts are connected.
+ - interrupts : specifies attributes for the out-of-band interrupt (host-wake).
+	When not specified the device will use in-band SDIO interrupts.
+
+Example:
+
+mmc1: mmc@01c10000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins_a>;
+	vmmc-supply = <&reg_vcc_wifi>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+
+	xr819: sdio_wifi@1 {
+		reg = <1>;
+		compatible = "allwinner,xr819";
+		interrupt-parent = <&pio>;
+		interrupts = <6 10 IRQ_TYPE_EDGE_RISING>;
+	};
+};
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
