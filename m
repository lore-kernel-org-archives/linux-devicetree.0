From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 1/8] dt-bindings: arm: add cortex-a12 and cortex-a17 cpu compatible properties
Date: Fri, 25 Jul 2014 23:49:33 +0200
Message-ID: <1406324980-2450-2-git-send-email-heiko@sntech.de>
References: <1406324980-2450-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406324980-2450-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As announced parts from ARM they will probably be used in socs shortly.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 1fe72a0..bc6dc17 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -152,7 +152,9 @@ nodes to be present and contain the properties described below.
 			    "arm,cortex-a7"
 			    "arm,cortex-a8"
 			    "arm,cortex-a9"
+			    "arm,cortex-a12"
 			    "arm,cortex-a15"
+			    "arm,cortex-a17"
 			    "arm,cortex-a53"
 			    "arm,cortex-a57"
 			    "arm,cortex-m0"
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
