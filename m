From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 01/16] arm64: dts: Reserve memory regions for hi6220
Date: Wed, 13 Apr 2016 07:55:37 +0800
Message-ID: <1460505352-13157-2-git-send-email-guodong.xu@linaro.org>
References: <1460505352-13157-1-git-send-email-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460505352-13157-1-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On Hi6220, below memory regions in DDR have specific purpose:

  0x05e0,0000 - 0x05ef,ffff: For MCU firmware using at runtime;
  0x06df,f000 - 0x06df,ffff: For mailbox message data;
  0x0740,f000 - 0x0740,ffff: For MCU firmware's section;
  0x3e00,0000 - 0x3fff,ffff: For OP-TEE.

This patch reserves these memory regions in DT.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 8185251..17bd793 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -7,9 +7,6 @@
 
 /dts-v1/;
 
-/*Reserved 1MB memory for MCU*/
-/memreserve/ 0x05e00000 0x00100000;
-
 #include "hi6220.dtsi"
 
 / {
@@ -27,9 +24,20 @@
 		stdout-path = "serial3:115200n8";
 	};
 
+	/*
+	 * Reserve below regions from memory node:
+	 *
+	 *  0x05e0,0000 - 0x05ef,ffff: MCU firmware runtime using
+	 *  0x06df,f000 - 0x06df,ffff: Mailbox message data
+	 *  0x0740,f000 - 0x0740,ffff: MCU firmware section
+	 *  0x3e00,0000 - 0x3fff,ffff: OP-TEE
+	 */
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
+		reg = <0x00000000 0x00000000 0x00000000 0x05e00000>,
+		      <0x00000000 0x05f00000 0x00000000 0x00eff000>,
+		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
+		      <0x00000000 0x07410000 0x00000000 0x36bf0000>;
 	};
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
