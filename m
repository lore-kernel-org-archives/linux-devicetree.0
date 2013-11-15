From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: kirkwood: mark guruplug sdio as non-removable
Date: Fri, 15 Nov 2013 15:20:25 +0100
Message-ID: <1384525225-591-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1384525225-591-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384525225-591-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Globalscale Guruplug has AW-GH381 WiFi/BT on sdio which is always
present and cannot be detected in any way. Therefore, mark the node
as non-removable instead of broken-cd. While at it, also put a note
about connected WiFi/BT chip above.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org 
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
---
 .../arm/boot/dts/kirkwood-guruplug-server-plus.dts |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts b/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts
index 6548b9d..4ebe720 100644
--- a/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts
+++ b/arch/arm/boot/dts/kirkwood-guruplug-server-plus.dts
@@ -65,10 +65,10 @@
 			nr-ports = <1>;
 		};
 
+		/* AzureWave AW-GH381 WiFi/BT */
 		mvsdio@90000 {
 			status = "okay";
-			/* No CD or WP GPIOs */
-			broken-cd;
+			non-removable;
 		};
 	};
 
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
