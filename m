From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH] mfd: arizona: Add defines for GPSW values that can be used from DT
Date: Mon, 2 May 2016 10:27:37 +0100
Message-ID: <1462181257-27646-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add defines for the possible values the GPSW can be set to using the
wlf,gpsw device tree binding.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 include/dt-bindings/mfd/arizona.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/mfd/arizona.h
index c40f665..dedf46f 100644
--- a/include/dt-bindings/mfd/arizona.h
+++ b/include/dt-bindings/mfd/arizona.h
@@ -110,4 +110,9 @@
 #define ARIZONA_ACCDET_MODE_HPM 4
 #define ARIZONA_ACCDET_MODE_ADC 7
 
+#define ARIZONA_GPSW_OPEN           0
+#define ARIZONA_GPSW_CLOSED         1
+#define ARIZONA_GPSW_CLAMP_ENABLED  2
+#define ARIZONA_GPSW_CLAMP_DISABLED 3
+
 #endif
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
