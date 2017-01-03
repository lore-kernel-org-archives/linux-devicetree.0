From: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v3 1/2] Doc: devicetree: bindings: Add vendor prefix entry - lwn
Date: Tue,  3 Jan 2017 11:46:20 +0100
Message-ID: <1483440381-24268-1-git-send-email-lukma@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "Zerlauth Karl (LWN)" <Karl.Zerlauth-JZopHpGcqKNWk0Htik3J/w@public.gmane.org>, Lukasz Majewski <l.majewski-AM3owJQeAb5mR6Xm/wNWPw@public.gmane.org>, Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds entry for LWN - the Liebherr-Werk Nenzing GmbH company to
vendor-prefixes.txt file.

Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
---
Changes for v3:
- Update to v4.10-rc2

Changes for v2:
- New patch
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 16d3b5e..8e2abcb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -164,6 +164,7 @@ lg	LG Corporation
 linux	Linux-specific binding
 lltc	Linear Technology Corporation
 lsi	LSI Corp. (LSI Logic)
+lwn	Liebherr-Werk Nenzing GmbH
 macnica	Macnica Americas
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
