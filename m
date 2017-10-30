From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] Input: egalax-ts: Remove leading zero from 'egalax-ts@04' notation
Date: Mon, 30 Oct 2017 15:00:50 -0200
Message-ID: <1509382850-15821-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the binding example by removing the leading 0 from 'egalax-ts@04' 
notation, which fix the following build warning:

Warning (unit_address_format): Node /egalax_ts@04 unit name should not have leading 0s

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
index 49fa14e..707f248 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
@@ -10,7 +10,7 @@ Required properties:
 
 Example:
 
-	egalax_ts@04 {
+	egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
