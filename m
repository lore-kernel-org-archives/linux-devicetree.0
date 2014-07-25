From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 8/8] ARM: dts: Build dtbs for Rockchip boards
Date: Fri, 25 Jul 2014 23:49:40 +0200
Message-ID: <1406324980-2450-9-git-send-email-heiko@sntech.de>
References: <1406324980-2450-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406324980-2450-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This allows the "make dtbs" target to work.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index adb5ed9..637deca 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -318,6 +318,11 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8084-mtp.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += \
+	rk3066a-bqcurie2.dtb \
+	rk3188-radxarock.dtb \
+	rk3288-evb-act8846.dtb \
+	rk3288-evb-rk808.dtb
 dtb-$(CONFIG_ARCH_S3C24XX) += s3c2416-smdk2416.dtb
 dtb-$(CONFIG_ARCH_S3C64XX) += s3c6410-mini6410.dtb \
 	s3c6410-smdk6410.dtb
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
