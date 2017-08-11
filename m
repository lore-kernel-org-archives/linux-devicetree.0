From: Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
Subject: [RESEND] arm64: dts: ls1088: Correction in Board name from "L1088A" to "LS1088A"
Date: Fri, 11 Aug 2017 14:49:37 +0530
Message-ID: <1502443177-15479-2-git-send-email-Ashish.Kumar@nxp.com>
References: <1502443177-15479-1-git-send-email-Ashish.Kumar@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502443177-15479-1-git-send-email-Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: leoyang.li-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ashish Kumar <Ashish.Kumar-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 213abb7..0f6fcda 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -49,7 +49,7 @@
 #include "fsl-ls1088a.dtsi"
 
 / {
-	model = "L1088A RDB Board";
+	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
 };
 
-- 
1.7.6.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
