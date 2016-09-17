From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] arm: dts: imx6qdl-wandboard-revb: Fix "ERROR: trailing whitespace"
Date: Sat, 17 Sep 2016 13:25:26 +0530
Message-ID: <1474098926-5236-3-git-send-email-jagan@amarulasolutions.com>
References: <1474098926-5236-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474098926-5236-1-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>

Fixed error in trailing whitespace in wandboard-rev1 dtsi.

Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
---
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
