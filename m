From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 4/4] ARM: dts: rockchip: Enable emac node in rk3066a-marsboard
Date: Sun, 26 Oct 2014 13:23:49 +0000
Message-ID: <1414329829-8031-4-git-send-email-romain.perier@gmail.com>
References: <1414329829-8031-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414329829-8031-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This enables EMAC Rockchip and adds initial ethernet support
for the MarsBoard RK3066.

Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a-marsboard.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts b/arch/arm/boot/dts/rk3066a-marsboard.dts
index d7d4cd1..d4a1dfe 100644
--- a/arch/arm/boot/dts/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
@@ -122,6 +122,30 @@
 /* must be included after &tps gets defined */
 #include "tps65910.dtsi"
 
+&emac {
+	status = "okay";
+
+	phy = <&phy0>;
+	phy-supply = <&vaux33_reg>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&emac_xfer>, <&emac_mdio>, <&phy_int>;
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&pinctrl {
+	lan8720a {
+		phy_int: phy-int {
+			rockchip,pins = <RK_GPIO1 26 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
