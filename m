From: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Thu, 30 Nov 2017 21:42:31 +0530
Message-ID: <1512058351-15851-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds documentation for Device-Tree bindings for the
Socionext NetSec Controller driver.

Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/net/socionext-netsec.txt   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt

diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
new file mode 100644
index 0000000..4695969
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
@@ -0,0 +1,43 @@
+* Socionext NetSec Ethernet Controller IP
+
+Required properties:
+- compatible: Should be "socionext,synquacer-netsec"
+- reg: Address and length of the control register area, followed by the
+       address and length of the EEPROM holding the MAC address and
+       microengine firmware
+- interrupts: Should contain ethernet controller interrupt
+- clocks: phandle to the PHY reference clock, and any other clocks to be
+          switched by runtime_pm
+- clock-names: Required only if more than a single clock is listed in 'clocks'.
+               The PHY reference clock must be named 'phy_refclk'
+- phy-mode: See ethernet.txt file in the same directory
+- phy-handle: phandle to select child phy
+
+Optional properties: (See ethernet.txt file in the same directory)
+- local-mac-address
+- mac-address
+- max-speed
+- max-frame-size
+
+Required properties for the child phy:
+- reg: phy address
+
+Example:
+	eth0: netsec@522D0000 {
+		compatible = "socionext,synquacer-netsec";
+		reg = <0 0x522D0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
+		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_netsec>;
+		phy-mode = "rgmii";
+		max-speed = <1000>;
+		max-frame-size = <9000>;
+		phy-handle = <&ethphy0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
