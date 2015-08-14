From: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 1/2] powerpc/85xx: Add binding for SCFG
Date: Fri, 14 Aug 2015 11:12:09 +0800
Message-ID: <1439521930-28191-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

SCFG provides SoC specific configuration and status registers for
the chip. Add this for powerpc platform.

Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
*V2*
- Remove scfg description in board.txt and create scfg.txt for scfg.
- Change "fsl,<board>-scfg" to "fsl,<chip>-scfg"

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/scfg.txt b/Documentation/devicetree/bindings/powerpc/fsl/scfg.txt
new file mode 100644
index 0000000..0532c46
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/scfg.txt
@@ -0,0 +1,18 @@
+Freescale Supplement configuration unit (SCFG)
+
+SCFG is the supplemental configuration unit, that provides SoC specific
+configuration and status registers for the chip. Such as getting PEX port
+status.
+
+Required properties:
+
+- compatible: should be "fsl,<chip>-scfg"
+- reg: should contain base address and length of SCFG memory-mapped
+registers
+
+Example:
+
+	scfg: global-utilities@fc000 {
+		compatible = "fsl,t1040-scfg";
+		reg = <0xfc000 0x1000>;
+	};
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
