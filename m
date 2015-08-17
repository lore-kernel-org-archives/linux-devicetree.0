From: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc: Add a vga alias node for P1022
Date: Mon, 17 Aug 2015 15:50:57 +0800
Message-ID: <1439797857-32653-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jason Jin <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

In u-boot, when set the video as console, the name 'vga' is used
as a general name for the video device, during the fdt_fixup_stdout
process, the 'vga' name is used to search in the dtb to setup the
'linux,stdout-path' node. Though the P1022 DIU is not VGA-compatible
device, to meet the 'vga' name used in u-boot, the vga alias node is
added for P1022 in this patch. At the same time, a display alias is
also added so that no other components grow dependencies on the vga
alias node.

Signed-off-by: Jason Jin <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

diff --git a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
index ebf2022..426bf41 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
@@ -175,7 +175,7 @@
 
 /include/ "pq3-gpio-0.dtsi"
 
-	display@10000 {
+	display: display@10000 {
 		compatible = "fsl,diu", "fsl,p1022-diu";
 		reg = <0x10000 1000>;
 		interrupts = <64 2 0 0>;
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
index 1956dea..de76ae8 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-pre.dtsi
@@ -50,6 +50,8 @@
 		pci0 = &pci0;
 		pci1 = &pci1;
 		pci2 = &pci2;
+		vga = &display;
+		display = &display;
 	};
 
 	cpus {
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
