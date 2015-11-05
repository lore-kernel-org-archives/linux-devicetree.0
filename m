From: <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc/mpc85xx: Update B4 FMan MURAM size
Date: Thu, 5 Nov 2015 12:23:06 +0200
Message-ID: <1446718986-11710-1-git-send-email-igal.liberman@freescale.com>
Reply-To: <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

FMan V3H has 2 different MURAM sizes:
    In B4860/4420 the MURAM size is 512KB.
    In T4240 and T2080 the MURAM size is 384KB.

The MURAM size in FMan V3H device tree is 384KB.
This patch updates the MURAM size for B4 to 512KB.

Based on prior submissions:
https://patchwork.ozlabs.org/patch/503921/
https://patchwork.ozlabs.org/patch/503922/

Signed-off-by: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
index d51e2bb..abadc28 100644
--- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
@@ -473,6 +473,11 @@
 	fman@400000 {
 		interrupts = <96 2 0 0>, <16 2 1 30>;
 
+		muram@0 {
+			compatible = "fsl,fman-muram";
+			reg = <0x0 0x80000>;
+		};
+
 		enet0: ethernet@e0000 {
 		};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
