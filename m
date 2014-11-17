From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 11/11] ARM: STi: DT: STiH416: Change miphy356 node name to phy@fe382000
Date: Mon, 17 Nov 2014 16:48:04 +0000
Message-ID: <1416242884-5261-12-git-send-email-peter.griffin@linaro.org>
References: <1416242884-5261-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416242884-5261-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Following Arnds review comments, update the miphy365 to follow the
common convention of naming the phy node names as phy@addr.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/boot/dts/stih416-b2020.dts  | 2 +-
 arch/arm/boot/dts/stih416-b2020e.dts | 2 +-
 arch/arm/boot/dts/stih416.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stih416-b2020.dts b/arch/arm/boot/dts/stih416-b2020.dts
index 5d1543b..200a818 100644
--- a/arch/arm/boot/dts/stih416-b2020.dts
+++ b/arch/arm/boot/dts/stih416-b2020.dts
@@ -20,7 +20,7 @@
 			non-removable;
 		};
 
-		miphy365x_phy: miphy365x@fe382000 {
+		miphy365x_phy: phy@fe382000 {
 			phy_port0: port@fe382000 {
 				st,sata-gen = <3>;
 			};
diff --git a/arch/arm/boot/dts/stih416-b2020e.dts b/arch/arm/boot/dts/stih416-b2020e.dts
index 956fab8..961799e 100644
--- a/arch/arm/boot/dts/stih416-b2020e.dts
+++ b/arch/arm/boot/dts/stih416-b2020e.dts
@@ -38,7 +38,7 @@
 			non-removable;
 		};
 
-		miphy365x_phy: miphy365x@fe382000 {
+		miphy365x_phy: phy@fe382000 {
 			phy_port0: port@fe382000 {
 				st,sata-gen = <3>;
 			};
diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 2bdda52..fad9073 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -281,7 +281,7 @@
 			clocks		= <&clk_s_a1_ls 8>;
 		};
 
-		miphy365x_phy: miphy365x@fe382000 {
+		miphy365x_phy: phy@fe382000 {
 			compatible      = "st,miphy365x-phy";
 			st,syscfg  	= <&syscfg_rear>;
 			#address-cells	= <1>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
