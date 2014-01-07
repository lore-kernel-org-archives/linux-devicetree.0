From: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] powerpc/dts: fix lbc lack of error interrupt
Date: Tue, 7 Jan 2014 14:26:42 +0800
Message-ID: <1389076002-18674-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

P1020, P1021, P1022, P1023 when the lbc get error, the error
interrupt will be triggered. The corresponding interrupt is
internal IRQ0. So system have to process the lbc IRQ0 interrupt.

The corresponding lbc general interrupt is internal IRQ3.

Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

diff --git a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
index 68cc5e7..13f209f 100644
--- a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
@@ -36,7 +36,8 @@
 	#address-cells = <2>;
 	#size-cells = <1>;
 	compatible = "fsl,p1020-elbc", "fsl,elbc", "simple-bus";
-	interrupts = <19 2 0 0>;
+	interrupts = <19 2 0 0
+		      16 2 0 0>;
 };
 
 /* controller at 0x9000 */
diff --git a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
index adb82fd..cffc93e 100644
--- a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
@@ -36,7 +36,8 @@
 	#address-cells = <2>;
 	#size-cells = <1>;
 	compatible = "fsl,p1021-elbc", "fsl,elbc", "simple-bus";
-	interrupts = <19 2 0 0>;
+	interrupts = <19 2 0 0
+		      16 2 0 0>;
 };
 
 /* controller at 0x9000 */
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
index e179803..979670d 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
@@ -40,7 +40,8 @@
 	 * pin muxing when the DIU is enabled.
 	 */
 	compatible = "fsl,p1022-elbc", "fsl,elbc";
-	interrupts = <19 2 0 0>;
+	interrupts = <19 2 0 0
+		      16 2 0 0>;
 };
 
 /* controller at 0x9000 */
diff --git a/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
index f1105bf..f5f5043 100644
--- a/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1023si-post.dtsi
@@ -36,7 +36,8 @@
 	#address-cells = <2>;
 	#size-cells = <1>;
 	compatible = "fsl,p1023-elbc", "fsl,elbc", "simple-bus";
-	interrupts = <19 2 0 0>;
+	interrupts = <19 2 0 0
+		      16 2 0 0>;
 };
 
 /* controller at 0xa000 */
-- 
1.8.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
