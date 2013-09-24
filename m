From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] dts: socfpga: Add ethernet support on Altera's SOCFPGA platform
Date: Tue, 24 Sep 2013 16:11:59 -0500
Message-ID: <1380057120-27108-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

The STMMAC Ethernet controller in SOCFPGA requires setting a register for
the phy-mode that is outside of the ethernet IP. This register resides in
the System Manager block. So we define a new DTS binding
"altr,sysmgr-phy-mask". This binding's property is a bitmask that can be
used to set the correct register bit.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
CC: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
CC: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 .../bindings/net/stmmac-altr-socfpga.txt           |   43 ++++++++++++++++++++
 arch/arm/boot/dts/socfpga_cyclone5.dts             |   19 +++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/stmmac-altr-socfpga.txt

diff --git a/Documentation/devicetree/bindings/net/stmmac-altr-socfpga.txt b/Documentation/devicetree/bindings/net/stmmac-altr-socfpga.txt
new file mode 100644
index 0000000..f0fa56a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/stmmac-altr-socfpga.txt
@@ -0,0 +1,43 @@
+* Altera SOCFPGA specific extensions to the STMicroelectronics
+	10/100/1000 Ethernet driver (GMAC)
+
+This file documents an additional property that is required for the Altera
+SOCFPGA implementation of the STMMAC Ethernet driver. Please refer to the core
+properties of the STMMAC driver as documented in stmmac.txt.
+
+Required Properties:
+
+* compatible: should be
+	- "altr,socfpga-stmmac": for controllers with Altera SOCFPGA specific
+		extensions.
+
+* altr,sysmgr-phy-mask: This property contains the bitmask that is needed to
+	set the appropriate register bits for the phy-mode in the System Manager.
+	The value should be:
+		-Ethernet Controller 1 (gmac0) = 0x3
+		-Ethernet Controller 2 (gmac1) = 0xC
+
+Example:
+
+	gmac0: ethernet@ff700000 {
+		compatible = "altr,socfpga-stmmac", "snps,dwmac-3.70a", "snps,dwmac";
+		reg = <0xff700000 0x2000>;
+		interrupts = <0 115 4>;
+		interrupt-names = "macirq"";
+		mac-address = [000000000000]; /* Filled in by U-Boot */
+		phy-mode = "gmii";
+
+		/* PHY Skew settings */
+		rxd0-skew-ps = <0>;
+		rxd0-skew-ps = <0>;
+		rxd1-skew-ps = <0>;
+		rxd2-skew-ps = <0>;
+		rxd3-skew-ps = <0>;
+		txen-skew-ps = <0>;
+		txc-skew-ps = <2600>;
+		rxdv-skew-ps = <0>;
+		rxc-skew-ps = <2000>;
+
+		altr,sysmgr-phy-mask = <0x3>;
+		status = "okay";
+        };
diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dts b/arch/arm/boot/dts/socfpga_cyclone5.dts
index bfed066..44db0e6 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5.dts
@@ -95,3 +95,22 @@
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
+
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
