From: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] powerpc/85xx: Add binding for SCFG
Date: Tue, 7 Jul 2015 17:47:16 +0800
Message-ID: <1436262437-31390-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

SCFG provides SoC specific configuration and status registers for
the chip. Add this for powerpc platform.

Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
index cff38bd..55604fe 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
@@ -3,6 +3,25 @@ Freescale Reference Board Bindings
 This document describes device tree bindings for various devices that
 exist on some Freescale reference boards.
 
+* Supplement configuration unit (SCFG)
+
+SCFG is the supplemental configuration unit, that provides SoC specific
+configuration and status registers for the chip. Such as getting PEX port
+status.
+
+Required properties:
+
+- compatible: should be "fsl,<board>-scfg"
+- reg: should contain base address and length of SCFG memory-mapped
+registers
+
+Example:
+
+	scfg: global-utilities@fc000 {
+		compatible = "fsl,t1040-scfg";
+		reg = <0xfc000 0x1000>;
+	};
+
 * Board Control and Status (BCSR)
 
 Required properties:
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
