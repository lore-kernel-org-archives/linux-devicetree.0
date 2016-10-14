From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/3] arm: dts: imx6qdl-wandboard-revb: Fix "ERROR: trailing whitespace"
Date: Fri, 14 Oct 2016 15:09:30 +0530
Message-ID: <1476437970-15800-4-git-send-email-jteki@openedev.com>
References: <1476437970-15800-1-git-send-email-jteki@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476437970-15800-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixed error in trailing whitespace in wandboard-rev1 dtsi.

Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
---
Changes for v2:
	- none

 arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi
index ef7fa62..a320891 100644
--- a/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-wandboard-revb1.dtsi
@@ -28,7 +28,7 @@
 				MX6QDL_PAD_EIM_D29__GPIO3_IO29		0x80000000	/* RGMII_nRST */
 				MX6QDL_PAD_EIM_DA13__GPIO3_IO13		0x80000000	/* BT_ON */
 				MX6QDL_PAD_EIM_DA14__GPIO3_IO14		0x80000000	/* BT_WAKE */
-				MX6QDL_PAD_EIM_DA15__GPIO3_IO15		0x80000000	/* BT_HOST_WAKE */				
+				MX6QDL_PAD_EIM_DA15__GPIO3_IO15		0x80000000	/* BT_HOST_WAKE */
 			>;
 		};
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
