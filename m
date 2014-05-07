From: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2] powerpc/fsl: Updated corenet-cf compatible string for corenet1-cf chips
Date: Wed, 7 May 2014 09:29:17 +0300
Message-ID: <1399444157-1207-1-git-send-email-diana.craciun@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Updated the device trees according to the corenet-cf
binding definition.

Signed-off-by: Diana Craciun <Diana.Craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
v2:
	Added missing p5040

 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/p3041si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/p4080si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/p5020si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
index e2987a3..b5daa4c 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -246,7 +246,7 @@
 	};
 
 	corenet-cf@18000 {
-		compatible = "fsl,corenet-cf";
+		compatible = "fsl,corenet1-cf", "fsl,corenet-cf";
 		reg = <0x18000 0x1000>;
 		interrupts = <16 2 1 31>;
 		fsl,ccf-num-csdids = <32>;
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
index 7af6d45..5abd1fc 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
@@ -273,7 +273,7 @@
 	};
 
 	corenet-cf@18000 {
-		compatible = "fsl,corenet-cf";
+		compatible = "fsl,corenet1-cf", "fsl,corenet-cf";
 		reg = <0x18000 0x1000>;
 		interrupts = <16 2 1 31>;
 		fsl,ccf-num-csdids = <32>;
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi b/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
index 2415e1f..bf0e7c9 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
@@ -281,7 +281,7 @@
 	};
 
 	corenet-cf@18000 {
-		compatible = "fsl,corenet-cf";
+		compatible = "fsl,corenet1-cf", "fsl,corenet-cf";
 		reg = <0x18000 0x1000>;
 		interrupts = <16 2 1 31>;
 		fsl,ccf-num-csdids = <32>;
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
index 2985de4..f7ca9f4 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
@@ -278,7 +278,7 @@
 	};
 
 	corenet-cf@18000 {
-		compatible = "fsl,corenet-cf";
+		compatible = "fsl,corenet1-cf", "fsl,corenet-cf";
 		reg = <0x18000 0x1000>;
 		interrupts = <16 2 1 31>;
 		fsl,ccf-num-csdids = <32>;
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
index 546a899..91477b5 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
@@ -233,7 +233,7 @@
 	};
 
 	corenet-cf@18000 {
-		compatible = "fsl,corenet-cf";
+		compatible = "fsl,corenet1-cf", "fsl,corenet-cf";
 		reg = <0x18000 0x1000>;
 		interrupts = <16 2 1 31>;
 		fsl,ccf-num-csdids = <32>;
-- 
1.7.11.7

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
