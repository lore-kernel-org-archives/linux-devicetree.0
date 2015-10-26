From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] ARM: STi: Add DT defines for co-processor reset lines
Date: Mon, 26 Oct 2015 10:56:07 +0000
Message-ID: <1445856969-19424-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/dt-bindings/reset-controller/stih407-resets.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset-controller/stih407-resets.h b/include/dt-bindings/reset-controller/stih407-resets.h
index 02d4328..4ab3a1c 100644
--- a/include/dt-bindings/reset-controller/stih407-resets.h
+++ b/include/dt-bindings/reset-controller/stih407-resets.h
@@ -52,6 +52,10 @@
 #define STIH407_KEYSCAN_SOFTRESET	26
 #define STIH407_USB2_PORT0_SOFTRESET	27
 #define STIH407_USB2_PORT1_SOFTRESET	28
+#define STIH407_ST231_AUD_SOFTRESET	29
+#define STIH407_ST231_DMU_SOFTRESET	30
+#define STIH407_ST231_GP0_SOFTRESET	31
+#define STIH407_ST231_GP1_SOFTRESET	32
 
 /* Picophy reset defines */
 #define STIH407_PICOPHY0_RESET		0
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
