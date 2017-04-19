From: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH 3/3] iio: tools: generic_buffer: increase trigger length
Date: Wed, 19 Apr 2017 11:20:45 +0300
Message-ID: <1492590045-17329-4-git-send-email-eugen.hristev@microchip.com>
References: <1492590045-17329-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492590045-17329-1-git-send-email-eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Increased trigger length to 50 in order to cope with trigger names like
fc030000.adc-dev0-external-rising

Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 tools/iio/iio_utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/iio/iio_utils.h b/tools/iio/iio_utils.h
index 780f201..9d59771 100644
--- a/tools/iio/iio_utils.h
+++ b/tools/iio/iio_utils.h
@@ -13,7 +13,7 @@
 #include <stdint.h>
 
 /* Made up value to limit allocation sizes */
-#define IIO_MAX_NAME_LENGTH 30
+#define IIO_MAX_NAME_LENGTH 50
 
 #define FORMAT_SCAN_ELEMENTS_DIR "%s/scan_elements"
 #define FORMAT_TYPE_FILE "%s_type"
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
