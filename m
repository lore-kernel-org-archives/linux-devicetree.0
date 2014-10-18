From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH RFC V3 1/3] mxs: add binding for fsl ocotp
Date: Sat, 18 Oct 2014 10:32:50 +0000
Message-ID: <1413628372-2809-2-git-send-email-stefan.wahren@i2se.com>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413628372-2809-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the Device tree bindings for the Freescale MXS On Chip
OTP driver.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 .../devicetree/bindings/misc/fsl,octop.txt         |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/fsl,octop.txt

diff --git a/Documentation/devicetree/bindings/misc/fsl,octop.txt b/Documentation/devicetree/bindings/misc/fsl,octop.txt
new file mode 100644
index 0000000..db1c510
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/fsl,octop.txt
@@ -0,0 +1,14 @@
+On-Chip OTP Memory for Freescale MX23/MX28
+
+Required properties:
+- compatible:
+  - "fsl,imx23-ocotp" for MX23
+  - "fsl,imx23-ocotp" for MX28
+- reg : Address and length of OTP controller registers
+
+Example:
+
+	ocotp: ocotp@8002c000 {
+		compatible = "fsl,imx28-ocotp", "fsl,ocotp";
+		reg = <0x8002c000 0x2000>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
