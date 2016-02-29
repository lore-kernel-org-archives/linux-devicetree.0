From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: [PATCH Resend] Input: ads7846: Add description how to use internal reference (ADS7846)
Date: Mon, 29 Feb 2016 08:06:35 +0100
Message-ID: <1456729595-32023-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel-ihh4Xogjf8b2iF0jqypphg/WZsTnP+MUkuwNSG5dpIY@public.gmane.org, "Moll <pawel.moll"@arm.c, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

By simply setting vref-mv to 0 the internal reference will be used.
Document that!

Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
---
 Documentation/devicetree/bindings/input/ads7846.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/ads7846.txt b/Documentation/devicetree/bindings/input/ads7846.txt
index 33a1638..c6cfe2e 100644
--- a/Documentation/devicetree/bindings/input/ads7846.txt
+++ b/Documentation/devicetree/bindings/input/ads7846.txt
@@ -29,6 +29,8 @@ Optional properties:
 	ti,vref-delay-usecs		vref supply delay in usecs, 0 for
 					external vref (u16).
 	ti,vref-mv			The VREF voltage, in millivolts (u16).
+					Set to 0 to use internal refernce
+					(ADS7846).
 	ti,keep-vref-on			set to keep vref on for differential
 					measurements as well
 	ti,swap-xy			swap x and y axis
-- 
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
