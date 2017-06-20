From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 4/6] pinctrl: dt-bindings: add documentation for AP806 pin controllers
Date: Tue, 20 Jun 2017 10:37:51 +0200
Message-ID: <20170620083754.28053-5-gregory.clement@free-electrons.com>
References: <20170620083754.28053-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620083754.28053-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the device tree binding for the pin controllers found on the
Armada 7K and Armada 8K SoCs.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../arm/marvell/ap806-system-controller.txt        | 53 +++++++++++++++++++---
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 888c50e0d64f..4228d158fb31 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -28,14 +28,53 @@ Required properties:
  - compatible: must be: "marvell,ap806-clock"
  - #clock-cells: must be set to 1
 
+Pinctrl:
+--------
+
+For common binding part and usage, refer to
+Documentation/devicetree/bindings/pinctrl/marvell,mvebu-pinctrl.txt.
+
+Required properties:
+- compatible must be "marvell,ap806-pinctrl",
+
+Available mpp pins/groups and functions:
+Note: brackets (x) are not part of the mpp name for marvell,function and given
+only for more detailed description in this document.
+
+name	pins	functions
+================================================================================
+mpp0	0	gpio, sdio(clk), spi0(clk)
+mpp1	1	gpio, sdio(cmd), spi0(miso)
+mpp2	2	gpio, sdio(d0), spi0(mosi)
+mpp3	3	gpio, sdio(d1), spi0(cs0n)
+mpp4	4	gpio, sdio(d2), i2c0(sda)
+mpp5	5	gpio, sdio(d3), i2c0(sdk)
+mpp6	6	gpio, sdio(ds)
+mpp7	7	gpio, sdio(d4), uart1(rxd)
+mpp8	8	gpio, sdio(d5), uart1(txd)
+mpp9	9	gpio, sdio(d6), spi0(cs1n)
+mpp10	10	gpio, sdio(d7)
+mpp11	11	gpio, uart0(txd)
+mpp12	12	gpio, sdio(pw_off), sdio(hw_rst)
+mpp13	13	gpio
+mpp14	14	gpio
+mpp15	15	gpio
+mpp16	16	gpio
+mpp17	17	gpio
+mpp18	18	gpio
+mpp19	19	gpio, uart0(rxd), sdio(pw_off)
+
 Example:
+ap_syscon: system-controller@6f4000 {
+	compatible = "syscon", "simple-mfd";
+	reg = <0x6f4000 0x1000>;
 
-	syscon: system-controller@6f4000 {
-		compatible = "syscon", "simple-mfd";
-		reg = <0x6f4000 0x1000>;
+	ap_clk: clock {
+		compatible = "marvell,ap806-clock";
+		#clock-cells = <1>;
+	};
 
-		ap_clk: clock {
-			compatible = "marvell,ap806-clock";
-			#clock-cells = <1>;
-		};
+	ap_pinctrl: pinctrl {
+		compatible = "marvell,ap806-pinctrl";
 	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
