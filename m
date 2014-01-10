From: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: socfpga: DTS updates for stmmac driver
Date: Fri, 10 Jan 2014 10:49:59 -0600
Message-ID: <1389372599-14180-1-git-send-email-vbridgers2013@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This change adds a parameter for the Synopsys 10/100/1000
stmmac Ethernet driver to configure the maximum MTU supported
by the EMAC instance. Synopsys allows the FIFO sizes to
be configured when the cores are built for a particular
device, but do not provide a way for the driver to read
information from the device about the maximum MTU size
supported as limited by the device's FIFO size.

This patch has been tested with changes being submitted
seperately for the Synopsys 10/100/1000 stmmac driver.

Signed-off-by: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/net/stmmac.txt |    5 +++++
 arch/arm/boot/dts/socfpga_cyclone5.dtsi          |   19 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
index eba0e5e..7db314e 100644
--- a/Documentation/devicetree/bindings/net/stmmac.txt
+++ b/Documentation/devicetree/bindings/net/stmmac.txt
@@ -30,6 +30,10 @@ Required properties:
 
 Optional properties:
 - mac-address: 6 bytes, mac address
+- snps,max-mtu:		Maximum MTU permitted. This parameter is useful since
+			different implementations of the Synopsys MAC may have
+			different FIFO sizes depending on the selections
+			made in Synopsys Core Consultant.
 
 Examples:
 
@@ -40,5 +44,6 @@ Examples:
 		interrupts = <24 23>;
 		interrupt-names = "macirq", "eth_wake_irq";
 		mac-address = [000000000000]; /* Filled in by U-Boot */
+		snps,max-mtu = <3800>;
 		phy-mode = "gmii";
 	};
diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dtsi b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
index a8716f6..b6b39dd 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5.dtsi
+++ b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
@@ -63,3 +63,22 @@
 		};
 	};
 };
+
+&gmac1 {
+	phy-mode = "rgmii";
+	snps,phy-addr = <0xffffffff>; /* probe for phy addr */
+
+	rxd0-skew-ps = <0>;
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
+	txc-skew-ps = <2600>;
+	rxdv-skew-ps = <0>;
+	rxc-skew-ps = <2000>;
+	snps,max-mtu = <3800>;
+	altr,sysmgr-phy-mask = <0xC>;
+	status = "okay";
+};
+
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
