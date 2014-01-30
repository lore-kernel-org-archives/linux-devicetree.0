From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: [PATCH] of: add vendor prefix for Allwinner Technology
Date: Wed, 29 Jan 2014 22:36:38 -0300
Message-ID: <1391045798-7053-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We have been using the "allwinner" prefix for everything so far; let's
document it here.

Signed-off-by: Emilio L=C3=B3pez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index edbb8d8..5a2904b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -7,6 +7,7 @@ ad	Avionic Design GmbH
 adi	Analog Devices, Inc.
 aeroflexgaisler	Aeroflex Gaisler AB
 ak	Asahi Kasei Corp.
+allwinner	Allwinner Technology Co., Ltd.
 altr	Altera Corp.
 amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
 apm	Applied Micro Circuits Corporation (APM)
--=20
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
