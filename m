From: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
Subject: [PATCH] powerpc/85xx: typo in dts: "interupt" (four devices)
Date: Mon, 11 Nov 2013 22:52:07 +0100
Message-ID: <1384206727-11880-1-git-send-email-kilobyte@angband.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These lines were inoperative for four years, which puts some doubt into
their importance, and it's possible the fixed version will regress, but
at the very least they should be removed instead.

Signed-off-by: Adam Borowski <kilobyte-b9QjgO8OEXPVItvQsEIGlw@public.gmane.org>
---
 arch/powerpc/boot/dts/xcalibur1501.dts | 4 ++--
 arch/powerpc/boot/dts/xpedite5301.dts  | 4 ++--
 arch/powerpc/boot/dts/xpedite5330.dts  | 4 ++--
 arch/powerpc/boot/dts/xpedite5370.dts  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/boot/dts/xcalibur1501.dts b/arch/powerpc/boot/dts/xcalibur1501.dts
index cc00f4d..f151426 100644
--- a/arch/powerpc/boot/dts/xcalibur1501.dts
+++ b/arch/powerpc/boot/dts/xcalibur1501.dts
@@ -637,14 +637,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2 >;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/xpedite5301.dts b/arch/powerpc/boot/dts/xpedite5301.dts
index 53c1c6a..d00fe16 100644
--- a/arch/powerpc/boot/dts/xpedite5301.dts
+++ b/arch/powerpc/boot/dts/xpedite5301.dts
@@ -547,14 +547,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2 >;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/xpedite5330.dts b/arch/powerpc/boot/dts/xpedite5330.dts
index 2152259..e506554 100644
--- a/arch/powerpc/boot/dts/xpedite5330.dts
+++ b/arch/powerpc/boot/dts/xpedite5330.dts
@@ -583,14 +583,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2 >;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
diff --git a/arch/powerpc/boot/dts/xpedite5370.dts b/arch/powerpc/boot/dts/xpedite5370.dts
index 11dbda1..9f1c608 100644
--- a/arch/powerpc/boot/dts/xpedite5370.dts
+++ b/arch/powerpc/boot/dts/xpedite5370.dts
@@ -545,14 +545,14 @@
 		tlu@2f000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x2f000 0x1000>;
-			interupts = <61 2 >;
+			interrupts = <61 2 >;
 			interrupt-parent = <&mpic>;
 		};
 
 		tlu@15000 {
 			compatible = "fsl,mpc8572-tlu", "fsl_tlu";
 			reg = <0x15000 0x1000>;
-			interupts = <75 2>;
+			interrupts = <75 2>;
 			interrupt-parent = <&mpic>;
 		};
 	};
-- 
1.8.5.rc0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
