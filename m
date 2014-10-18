From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH RFC V3 3/3] mxs: enable ocotp for i.MX23 and i.MX28
Date: Sat, 18 Oct 2014 10:32:52 +0000
Message-ID: <1413628372-2809-4-git-send-email-stefan.wahren@i2se.com>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413628372-2809-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch enables On Chip OTP support for i.MX23 and i.MX28 SoCs,
but keeps the old compatible string.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/imx23.dtsi |    3 +--
 arch/arm/boot/dts/imx28.dtsi |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
index bbcfb5a..677d937 100644
--- a/arch/arm/boot/dts/imx23.dtsi
+++ b/arch/arm/boot/dts/imx23.dtsi
@@ -350,9 +350,8 @@
 			};
 
 			ocotp@8002c000 {
-				compatible = "fsl,ocotp";
+				compatible = "fsl,imx23-ocotp", "fsl,ocotp";
 				reg = <0x8002c000 0x2000>;
-				status = "disabled";
 			};
 
 			axi-ahb@8002e000 {
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 47f68ac..f4e0ebb 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -923,9 +923,8 @@
 			};
 
 			ocotp: ocotp@8002c000 {
-				compatible = "fsl,ocotp";
+				compatible = "fsl,imx28-ocotp", "fsl,ocotp";
 				reg = <0x8002c000 0x2000>;
-				status = "disabled";
 			};
 
 			axi-ahb@8002e000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
