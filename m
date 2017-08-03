From: Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] ARM: dts: sun8i: h3: Enable EMAC with external PHY on NanoPi M1 Plus
Date: Wed,  2 Aug 2017 22:28:30 -0400
Message-ID: <20170803022830.5210-1-luaraneda@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Nanopi M1 Plus uses an external Realtek RTL8211E PHY in RGMII mode,
enabled by a GPIO-based regulator.

Signed-off-by: Luis Araneda <luaraneda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
Changes v2 -> v3:
- Changed PHY address from broadcast to board specific

Changes v1 -> v2:
- Removed unnecessary property
- Corrected part address to match reg value

 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
index 8ddd1b2cc..ba054cf77 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
@@ -45,6 +45,20 @@
 / {
 	model = "FriendlyArm NanoPi M1 Plus";
 	compatible = "friendlyarm,nanopi-m1-plus", "allwinner,sun8i-h3";
+
+	aliases {
+		ethernet0 = &emac;
+	};
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+	};
 };
 
 &ehci1 {
@@ -55,6 +69,22 @@
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emac_rgmii_pins>;
+	phy-supply = <&reg_gmac_3v3>;
+	phy-handle = <&ext_rgmii_phy>;
+	phy-mode = "rgmii";
+	status = "okay";
+};
+
+&mdio {
+	ext_rgmii_phy: ethernet-phy@7 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+	};
+};
+
 &ohci1 {
 	status = "okay";
 };
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
