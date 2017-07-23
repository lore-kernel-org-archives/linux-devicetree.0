From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 1/5] dt-bindings: update the Allwinner GPADC
 device tree binding for H3
Date: Sun, 23 Jul 2017 22:13:50 +0800
Message-ID: <20170723141354.42646-2-icenowy@aosc.io>
References: <20170723141354.42646-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBO662LFQKGQEDEPGHCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170723141354.42646-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H3 features a thermal sensor like the one in A33, but has its
register re-arranged, the clock divider moved to CCU (originally the
clock divider is in ADC) and added a pair of bus clock and reset.

Update the binding document to cover H3.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v3:
- Clock name changes.
- Example node name changes.
- Add interupts (not yet used by the driver).

 .../devicetree/bindings/mfd/sun4i-gpadc.txt        | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
index badff3611a98..986265c59b2a 100644
--- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
+++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
@@ -4,12 +4,21 @@ The Allwinner SoCs all have an ADC that can also act as a thermal sensor
 and sometimes as a touchscreen controller.
 
 Required properties:
-  - compatible: "allwinner,sun8i-a33-ths",
+  - compatible: must contain one of the following compatibles:
+		- "allwinner,sun8i-a33-ths"
+		- "allwinner,sun8i-h3-ths"
   - reg: mmio address range of the chip,
   - #thermal-sensor-cells: shall be 0,
   - #io-channel-cells: shall be 0,
 
-Example:
+Required properties for the following compatibles:
+		- "allwinner,sun8i-h3-ths"
+  - clocks: the bus clock and the input clock of the ADC,
+  - clock-names: should be "bus" and "mod",
+  - resets: the bus reset of the ADC,
+  - interrupts: the sampling interrupt of the ADC,
+
+Example for A33:
 	ths: ths@01c25000 {
 		compatible = "allwinner,sun8i-a33-ths";
 		reg = <0x01c25000 0x100>;
@@ -17,6 +26,18 @@ Example:
 		#io-channel-cells = <0>;
 	};
 
+Example for H3:
+	ths: thermal-sensor@1c25000 {
+		compatible = "allwinner,sun8i-h3-ths";
+		reg = <0x01c25000 0x400>;
+		clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_THS>;
+		clock-names = "bus", "mod";
+		resets = <&ccu RST_BUS_THS>;
+		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+		#thermal-sensor-cells = <0>;
+		#io-channel-cells = <0>;
+	};
+
 sun4i, sun5i and sun6i SoCs are also supported via the older binding:
 
 sun4i resistive touchscreen controller
-- 
2.13.0
