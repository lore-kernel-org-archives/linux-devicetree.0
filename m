From: Andrew Ruder <andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
Subject: [PATCH 3/6] arm: pxa27x.dtsi: header typo - wrong file
Date: Thu,  5 Jun 2014 14:27:05 -0500
Message-ID: <ceb96637accd7da382ba8bfd0c8327a72cd97ccf.1401995177.git.andrew.ruder@elecsyscorp.com>
References: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1401995177.git.andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Andrew Ruder <andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixing a copy-paste error calling this file the pxa3xx skeleton when it
is actually the pxa27x skeleton.

Signed-off-by: Andrew Ruder <andrew.ruder-zVnPOJbVE67JhSu7km37dQ@public.gmane.org>
---
 arch/arm/boot/dts/pxa27x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index a705469..931e1d5 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -1,4 +1,4 @@
-/* The pxa3xx skeleton simply augments the 2xx version */
+/* The pxa27x skeleton simply augments the 2xx version */
 /include/ "pxa2xx.dtsi"
 
 / {
-- 
1.9.0.rc3.12.gbc97e2d

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
