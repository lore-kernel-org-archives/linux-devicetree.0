From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] ARM: dts: uniphier: add pinctrl groups of ethernet phy mode
Date: Mon, 28 Aug 2017 11:11:45 +0900
Message-ID: <1503886305-29815-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl groups of ethenet phy mode, such as "ether_rgmii", "ether_rmii",
and "ether_mii".

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 arch/arm/boot/dts/uniphier-pinctrl.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pinctrl.dtsi b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
index 425b8f1..be82cdd 100644
--- a/arch/arm/boot/dts/uniphier-pinctrl.dtsi
+++ b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
@@ -18,6 +18,21 @@
 		function = "emmc";
 	};
 
+	pinctrl_ether_mii: ether_mii_grp {
+		groups = "ether_mii";
+		function = "ether_mii";
+	};
+
+	pinctrl_ether_rgmii: ether_rgmii_grp {
+		groups = "ether_rgmii";
+		function = "ether_rgmii";
+	};
+
+	pinctrl_ether_rmii: ether_rmii_grp {
+		groups = "ether_rmii";
+		function = "ether_rmii";
+	};
+
 	pinctrl_i2c0: i2c0_grp {
 		groups = "i2c0";
 		function = "i2c0";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
