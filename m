From: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: iio: health: Use binding name for max30102 in example
Date: Wed, 11 Oct 2017 11:09:08 +0200
Message-ID: <1507712948-29300-2-git-send-email-pmeerw@pmeerw.net>
References: <1507712948-29300-1-git-send-email-pmeerw@pmeerw.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507712948-29300-1-git-send-email-pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/health/max30102.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/health/max30102.txt b/Documentation/devicetree/bindings/iio/health/max30102.txt
index c695e7c..8629c18 100644
--- a/Documentation/devicetree/bindings/iio/health/max30102.txt
+++ b/Documentation/devicetree/bindings/iio/health/max30102.txt
@@ -20,7 +20,7 @@ Optional properties:
 
 Example:
 
-max30100@57 {
+max30102@57 {
 	compatible = "maxim,max30102";
 	reg = <0x57>;
 	maxim,red-led-current-microamp = <7000>;
-- 
2.7.4
