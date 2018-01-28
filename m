From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 01/16] dt-bindings: update the Allwinner
 GPADC device tree binding for H3 & A83T
Date: Mon, 29 Jan 2018 00:29:04 +0100
Message-ID: <20180128232919.12639-2-embed3d@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBVFZXHJQKGQERXOXOMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180128232919.12639-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Allwinner H3 features a thermal sensor like the one in A33, but has its
register re-arranged, the clock divider moved to CCU (originally the
clock divider is in ADC) and added a pair of bus clock and reset.

Allwinner A83T features a thermal sensor similar to the H3, the ths clock,
the bus clock and the reset was removed from the CCU. The THS in A83T
has a clock that is directly connected and runs with 24 MHz.

Update the binding document to cover H3 and A83T.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mfd/sun4i-gpadc.txt        | 50 ++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
index 86dd8191b04c..22df0c5c23d4 100644
--- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
+++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
@@ -4,12 +4,35 @@ The Allwinner SoCs all have an ADC that can also act as a thermal sensor
 and sometimes as a touchscreen controller.
 
 Required properties:
-  - compatible: "allwinner,sun8i-a33-ths",
+  - compatible: must contain one of the following compatibles:
+		- "allwinner,sun8i-a33-ths"
+		- "allwinner,sun8i-h3-ths"
+		- "allwinner,sun8i-a83t-ths"
   - reg: mmio address range of the chip,
-  - #thermal-sensor-cells: shall be 0,
+  - #thermal-sensor-cells: shall be 0 or 1,
   - #io-channel-cells: shall be 0,
 
-Example:
+Required properties for the following compatibles:
+		- "allwinner,sun8i-h3-ths"
+		- "allwinner,sun8i-a83t-ths"
+  - interrupts: the sampling interrupt of the ADC,
+
+Required properties for the following compatibles:
+		- "allwinner,sun8i-h3-ths"
+  - clocks: the bus clock and the input clock of the ADC,
+  - clock-names: should be "bus" and "mod",
+  - resets: the bus reset of the ADC,
+
+Optional properties for the following compatibles:
+		- "allwinner,sun8i-h3-ths"
+  - nvmem-cells: A phandle to the calibration data provided by a nvmem device.
+		If unspecified default values shall be used. The size should
+		be 0x2 * sensorcount.
+  - nvmem-cell-names: Should be "calibration".
+
+Details see: bindings/nvmem/nvmem.txt
+
+Example for A33:
 	ths: ths@1c25000 {
 		compatible = "allwinner,sun8i-a33-ths";
 		reg = <0x01c25000 0x100>;
@@ -17,6 +40,27 @@ Example:
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
+Example for A83T:
+	ths: thermal-sensor@1f04000 {
+		compatible = "allwinner,sun8i-a83t-ths";
+		reg = <0x01f04000 0x100>;
+		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		#thermal-sensor-cells = <1>;
+		#io-channel-cells = <0>;
+	};
+
 sun4i, sun5i and sun6i SoCs are also supported via the older binding:
 
 sun4i resistive touchscreen controller
-- 
2.11.0
