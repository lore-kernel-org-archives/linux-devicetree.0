From: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCHv5 1/3] dt-bindings: net: Add DT bindings for Socionext Netsec
Date: Mon,  1 Jan 2018 10:44:20 +0530
Message-ID: <1514783660-4290-1-git-send-email-jassisinghbrar@gmail.com>
References: <1514783559-4226-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514783559-4226-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds documentation for Device-Tree bindings for the
Socionext NetSec Controller driver.

Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/net/socionext-netsec.txt   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/socionext-netsec.txt

diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
new file mode 100644
index 0000000..b70e35b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
@@ -0,0 +1,53 @@
+* Socionext NetSec Ethernet Controller IP
+
+Required properties:
+- compatible: Should be "socionext,synquacer-netsec"
+- reg: Address and length of the control register area, followed by the
+       address and length of the EEPROM holding the MAC address and
+       microengine firmware
+- interrupts: Should contain ethernet controller interrupt
+- clocks: phandle to the PHY reference clock
+- clock-names: Should be "phy_ref_clk"
+- phy-mode: See ethernet.txt file in the same directory
+- phy-handle: See ethernet.txt in the same directory.
+
+- mdio device tree subnode: When the Netsec has a phy connected to its local
+		mdio, there must be device tree subnode with the following
+		required properties:
+
+	- #address-cells: Must be <1>.
+	- #size-cells: Must be <0>.
+
+	For each phy on the mdio bus, there must be a node with the following
+	fields:
+	- compatible: Refer to phy.txt
+	- reg: phy id used to communicate to phy.
+
+Optional properties: (See ethernet.txt file in the same directory)
+- dma-coherent: Boolean property, must only be present if memory
+	accesses performed by the device are cache coherent.
+- local-mac-address: See ethernet.txt in the same directory.
+- mac-address: See ethernet.txt in the same directory.
+- max-speed: See ethernet.txt in the same directory.
+- max-frame-size: See ethernet.txt in the same directory.
+
+Example:
+	eth0: ethernet@522d0000 {
+		compatible = "socionext,synquacer-netsec";
+		reg = <0 0x522d0000 0x0 0x10000>, <0 0x10000000 0x0 0x10000>;
+		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_netsec>;
+		phy-mode = "rgmii";
+		max-speed = <1000>;
+		max-frame-size = <9000>;
+		phy-handle = <&phy1>;
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy1: ethernet-phy@1 {
+				compatible = "ethernet-phy-ieee802.3-c22";
+				reg = <1>;
+			};
+		};
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
