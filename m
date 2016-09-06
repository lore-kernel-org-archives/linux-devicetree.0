From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] arm64: dts: berlin4ct-stb: add missing unit name to /memory node
Date: Tue, 6 Sep 2016 16:55:56 +0800
Message-ID: <20160906085557.4019-3-jszhang@marvell.com>
References: <20160906085557.4019-1-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160906085557.4019-1-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes the following DTC warning with W=1:

"Node /memory has a reg or ranges property, but no unit name"

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/berlin4ct-stb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts b/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts
index 348c37e..d47edad 100644
--- a/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts
+++ b/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts
@@ -54,7 +54,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@1000000 {
 		device_type = "memory";
 		/* the first 16MB is for firmwares' usage */
 		reg = <0 0x01000000 0 0x7f000000>;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
