From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc/fsl: Add fsl,portid-mapping to corenet1-cf chips
Date: Mon, 5 May 2014 20:37:35 -0500
Message-ID: <1399340255-18612-1-git-send-email-scottwood@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Diana Craciun <diana.craciun-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi  | 4 ++++
 arch/powerpc/boot/dts/fsl/p3041si-post.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi  | 4 ++++
 arch/powerpc/boot/dts/fsl/p4080si-post.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi  | 8 ++++++++
 arch/powerpc/boot/dts/fsl/p5020si-post.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi  | 2 ++
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi  | 4 ++++
 10 files changed, 27 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
index b5daa4c..5290df8 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
@@ -262,6 +262,7 @@
 		interrupts = <
 			24 2 0 0
 			16 2 1 30>;
+		fsl,portid-mapping = <0x0f000000>;
 
 		pamu0: pamu@0 {
 			reg = <0 0x1000>;
diff --git a/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
index 22f3b14..b1ea147 100644
--- a/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi
@@ -83,6 +83,7 @@
 			reg = <0>;
 			clocks = <&mux0>;
 			next-level-cache = <&L2_0>;
+			fsl,portid-mapping = <0x80000000>;
 			L2_0: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -92,6 +93,7 @@
 			reg = <1>;
 			clocks = <&mux1>;
 			next-level-cache = <&L2_1>;
+			fsl,portid-mapping = <0x40000000>;
 			L2_1: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -101,6 +103,7 @@
 			reg = <2>;
 			clocks = <&mux2>;
 			next-level-cache = <&L2_2>;
+			fsl,portid-mapping = <0x20000000>;
 			L2_2: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -110,6 +113,7 @@
 			reg = <3>;
 			clocks = <&mux3>;
 			next-level-cache = <&L2_3>;
+			fsl,portid-mapping = <0x10000000>;
 			L2_3: l2-cache {
 				next-level-cache = <&cpc>;
 			};
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
index 5abd1fc..cd63cb1 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-post.dtsi
@@ -289,6 +289,7 @@
 		interrupts = <
 			24 2 0 0
 			16 2 1 30>;
+		fsl,portid-mapping = <0x0f000000>;
 
 		pamu0: pamu@0 {
 			reg = <0 0x1000>;
diff --git a/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
index 468e8be..dc5f4b3 100644
--- a/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi
@@ -84,6 +84,7 @@
 			reg = <0>;
 			clocks = <&mux0>;
 			next-level-cache = <&L2_0>;
+			fsl,portid-mapping = <0x80000000>;
 			L2_0: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -93,6 +94,7 @@
 			reg = <1>;
 			clocks = <&mux1>;
 			next-level-cache = <&L2_1>;
+			fsl,portid-mapping = <0x40000000>;
 			L2_1: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -102,6 +104,7 @@
 			reg = <2>;
 			clocks = <&mux2>;
 			next-level-cache = <&L2_2>;
+			fsl,portid-mapping = <0x20000000>;
 			L2_2: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -111,6 +114,7 @@
 			reg = <3>;
 			clocks = <&mux3>;
 			next-level-cache = <&L2_3>;
+			fsl,portid-mapping = <0x10000000>;
 			L2_3: l2-cache {
 				next-level-cache = <&cpc>;
 			};
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi b/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
index bf0e7c9..12947cc 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-post.dtsi
@@ -297,6 +297,7 @@
 		interrupts = <
 			24 2 0 0
 			16 2 1 30>;
+		fsl,portid-mapping = <0x00f80000>;
 
 		pamu0: pamu@0 {
 			reg = <0 0x1000>;
diff --git a/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
index 0040b5a..38bde09 100644
--- a/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p4080si-pre.dtsi
@@ -83,6 +83,7 @@
 			reg = <0>;
 			clocks = <&mux0>;
 			next-level-cache = <&L2_0>;
+			fsl,portid-mapping = <0x80000000>;
 			L2_0: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -92,6 +93,7 @@
 			reg = <1>;
 			clocks = <&mux1>;
 			next-level-cache = <&L2_1>;
+			fsl,portid-mapping = <0x40000000>;
 			L2_1: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -101,6 +103,7 @@
 			reg = <2>;
 			clocks = <&mux2>;
 			next-level-cache = <&L2_2>;
+			fsl,portid-mapping = <0x20000000>;
 			L2_2: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -110,6 +113,7 @@
 			reg = <3>;
 			clocks = <&mux3>;
 			next-level-cache = <&L2_3>;
+			fsl,portid-mapping = <0x10000000>;
 			L2_3: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -119,6 +123,7 @@
 			reg = <4>;
 			clocks = <&mux4>;
 			next-level-cache = <&L2_4>;
+			fsl,portid-mapping = <0x08000000>;
 			L2_4: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -128,6 +133,7 @@
 			reg = <5>;
 			clocks = <&mux5>;
 			next-level-cache = <&L2_5>;
+			fsl,portid-mapping = <0x04000000>;
 			L2_5: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -137,6 +143,7 @@
 			reg = <6>;
 			clocks = <&mux6>;
 			next-level-cache = <&L2_6>;
+			fsl,portid-mapping = <0x02000000>;
 			L2_6: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -146,6 +153,7 @@
 			reg = <7>;
 			clocks = <&mux7>;
 			next-level-cache = <&L2_7>;
+			fsl,portid-mapping = <0x01000000>;
 			L2_7: l2-cache {
 				next-level-cache = <&cpc>;
 			};
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
index f7ca9f4..4c4a2b0 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-post.dtsi
@@ -294,6 +294,7 @@
 		interrupts = <
 			24 2 0 0
 			16 2 1 30>;
+		fsl,portid-mapping = <0x3c000000>;
 
 		pamu0: pamu@0 {
 			reg = <0 0x1000>;
diff --git a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
index fe1a2e6..1cc61e1 100644
--- a/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
@@ -90,6 +90,7 @@
 			reg = <0>;
 			clocks = <&mux0>;
 			next-level-cache = <&L2_0>;
+			fsl,portid-mapping = <0x80000000>;
 			L2_0: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -99,6 +100,7 @@
 			reg = <1>;
 			clocks = <&mux1>;
 			next-level-cache = <&L2_1>;
+			fsl,portid-mapping = <0x40000000>;
 			L2_1: l2-cache {
 				next-level-cache = <&cpc>;
 			};
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
index 91477b5..67296fd 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
@@ -248,6 +248,7 @@
 		#size-cells = <1>;
 		interrupts = <24 2 0 0
 			      16 2 1 30>;
+		fsl,portid-mapping = <0x0f800000>;
 
 		pamu0: pamu@0 {
 			reg = <0 0x1000>;
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
index 3674686..b048a2b 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
@@ -83,6 +83,7 @@
 			reg = <0>;
 			clocks = <&mux0>;
 			next-level-cache = <&L2_0>;
+			fsl,portid-mapping = <0x80000000>;
 			L2_0: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -92,6 +93,7 @@
 			reg = <1>;
 			clocks = <&mux1>;
 			next-level-cache = <&L2_1>;
+			fsl,portid-mapping = <0x40000000>;
 			L2_1: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -101,6 +103,7 @@
 			reg = <2>;
 			clocks = <&mux2>;
 			next-level-cache = <&L2_2>;
+			fsl,portid-mapping = <0x20000000>;
 			L2_2: l2-cache {
 				next-level-cache = <&cpc>;
 			};
@@ -110,6 +113,7 @@
 			reg = <3>;
 			clocks = <&mux3>;
 			next-level-cache = <&L2_3>;
+			fsl,portid-mapping = <0x10000000>;
 			L2_3: l2-cache {
 				next-level-cache = <&cpc>;
 			};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
