From: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: [PATCH v2] Documentation: bindings: fix palmas-rtc documentation
Date: Thu, 21 Apr 2016 18:03:15 +0200
Message-ID: <ac069bc32d31b6c6bf6ad7e136e021b5e296deca.1461254594.git.hns@goldelico.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, letux-kernel-S0jZdbWzriLCfDggNXIi3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

change 100mA -> 100uA

Signed-off-by: H. Nikolaus Schaller <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/rtc-palmas.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
index adbccc0..eb1c7fd 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
@@ -15,9 +15,9 @@ Optional properties:
 	battery is chargeable or not. If charging battery then driver can
 	enable the charging.
 - ti,backup-battery-charge-high-current: Enable high current charging in
-	backup battery. Device supports the < 100mA and > 100mA charging.
-	The high current will be > 100mA. Absence of this property will
-	charge battery to lower current i.e. < 100mA.
+	backup battery. Device supports the < 100uA and > 100uA charging.
+	The high current will be > 100uA. Absence of this property will
+	charge battery to lower current i.e. < 100uA.
 
 Example:
 	palmas: tps65913@58 {
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
