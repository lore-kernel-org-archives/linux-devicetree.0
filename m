From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] ARM64: dts: meson-gxl: Add ethernet nodes with internal PHY
Date: Mon,  7 Nov 2016 11:43:55 +0100
Message-ID: <20161107104357.24428-2-narmstrong@baylibre.com>
References: <20161107104357.24428-1-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161107104357.24428-1-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add Ethernet node with Internal PHY selection for the Amlogic GXL SoCs

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d1bf381..3af54dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -49,6 +49,22 @@
 	compatible = "amlogic,meson-gxl";
 };
 
+&ethmac {
+	reg = <0x0 0xc9410000 0x0 0x10000
+	       0x0 0xc8834540 0x0 0x4>;
+
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_FCLK_DIV2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
+
+	mdio0: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+	};
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxl-aobus-pinctrl";
@@ -214,6 +230,33 @@
 			};
 		};
 	};
+
+	eth-phy-mux {
+		compatible = "mdio-mux-mmioreg", "mdio-mux";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0x55c 0x0 0x4>;
+		mux-mask = <0xffffffff>;
+		mdio-parent-bus = <&mdio0>;
+
+		internal_mdio: mdio@e40908ff {
+			reg = <0xe40908ff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			internal_phy: ethernet-phy@8 {
+				compatible = "ethernet-phy-id0181.4400", "ethernet-phy-ieee802.3-c22";
+				reg = <8>;
+				max-speed = <100>;
+			};
+		};
+
+		external_mdio: mdio@2009087f {
+			reg = <0x2009087f>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &hiubus {
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
