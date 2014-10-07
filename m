From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESUBMIT PATCH v3 8/8] devicetree: regulator: sky81452: Add compatible string for device binding
Date: Tue,  7 Oct 2014 14:13:11 +0900
Message-ID: <1412658791-8250-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412657745-7812-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/sky81452-regulator.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
index 882455e..7b9ff18 100644
--- a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
@@ -1,6 +1,7 @@
 SKY81452 voltage regulator
 
 Required properties:
+- compatible	: Must be "skyworks,sky81452-regulator"
 - any required generic properties defined in regulator.txt
 
 Optional properties:
@@ -9,6 +10,7 @@ Optional properties:
 Example:
 
 	regulator {
+		compatible = "skyworks,sky81452-regulator";
 		/* generic regulator properties */
 		regulator-name = "touch_en";
 		regulator-min-microvolt = <4500000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
