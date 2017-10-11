From: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: iio: health: Fix max30100 I2C chip address in example
Date: Wed, 11 Oct 2017 11:09:07 +0200
Message-ID: <1507712948-29300-1-git-send-email-pmeerw@pmeerw.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Should be in hex, not decimal or even octal

Signed-off-by: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/health/max30100.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/health/max30100.txt b/Documentation/devicetree/bindings/iio/health/max30100.txt
index 295a9ed..8d81764 100644
--- a/Documentation/devicetree/bindings/iio/health/max30100.txt
+++ b/Documentation/devicetree/bindings/iio/health/max30100.txt
@@ -20,9 +20,9 @@ Optional properties:
 
 Example:
 
-max30100@057 {
+max30100@57 {
 	compatible = "maxim,max30100";
-	reg = <57>;
+	reg = <0x57>;
 	maxim,led-current-microamp = <24000 50000>;
 	interrupt-parent = <&gpio1>;
 	interrupts = <16 2>;
-- 
2.7.4
