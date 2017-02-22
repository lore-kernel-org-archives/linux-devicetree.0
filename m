From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 6/8] Documentation: devicetree: arm: marvell: Document IAP140
Date: Wed, 22 Feb 2017 03:29:26 +0100
Message-ID: <20170222022929.10540-7-afaerber@suse.de>
References: <20170222022929.10540-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170222022929.10540-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, info-PWLG29+z7hGxBmiGZ5/UTQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v1 -> v2:
 * Adopted "marvell" vendor prefix (Thomas)
 * Documented Andromeda Box Edge as example
 
 Documentation/devicetree/bindings/arm/marvell/iap140.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/iap140.txt

diff --git a/Documentation/devicetree/bindings/arm/marvell/iap140.txt b/Documentation/devicetree/bindings/arm/marvell/iap140.txt
new file mode 100644
index 0000000..37c6d92
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/iap140.txt
@@ -0,0 +1,11 @@
+Marvell IAP140 Device Tree Bindings
+-----------------------------------
+
+Boards using a SoC of the Marvell IAP140 family must carry the following
+root node property:
+
+ - compatible :  must contain "marvell,iap140"
+
+Example:
+
+    compatible = "marvell,andromeda-box-edge", "marvell,iap140";
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
