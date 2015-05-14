From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] ARM: ux500: define the backupram in the device tree
Date: Thu, 14 May 2015 18:11:07 +0200
Message-ID: <1431619867-14700-5-git-send-email-linus.walleij@linaro.org>
References: <1431619867-14700-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431619867-14700-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Ux500 SOCs have a special backup RAM that needs to be
defined in the device tree.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index f024a1c0de8b..853684ad7773 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -190,6 +190,15 @@
 			reg = <0xa0410000 0x100>;
 		};
 
+		/*
+		 * The backup RAM is used for retention during sleep
+		 * and various things like spin tables
+		 */
+		backupram@80150000 {
+			compatible = "ste,dbx500-backupram";
+			reg = <0x80150000 0x2000>;
+		};
+
 		L2: l2-cache {
 			compatible = "arm,pl310-cache";
 			reg = <0xa0412000 0x1000>;
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
