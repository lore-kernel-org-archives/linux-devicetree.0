From: Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/3] arm64: dts: Add Broadcom Northstar2 device tree entries for PDC driver.
Date: Thu, 30 Jun 2016 15:59:24 -0400
Message-ID: <1467316764-19686-4-git-send-email-rob.rice@broadcom.com>
References: <1467316764-19686-1-git-send-email-rob.rice@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467316764-19686-1-git-send-email-rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Rice <rrice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Rice <rrice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Add Broadcom Northstar2 SoC device tree entries for PDC driver.

Signed-off-by: Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index ec68ec1..ba12702 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -191,6 +191,42 @@
 
 		#include "ns2-clock.dtsi"
 
+		pdc0: iproc-pdc0@612c0000 {
+			compatible = "brcm,iproc-pdc-mbox";
+			reg = <0x612c0000 0x445>;  /* PDC FS0 regs */
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			brcm,rx-status-len = <32>;
+			brcm,use-bcm-hdr;
+		};
+
+		pdc1: iproc-pdc1@612e0000 {
+			compatible = "brcm,iproc-pdc-mbox";
+			reg = <0x612e0000 0x445>;  /* PDC FS1 regs */
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			brcm,rx-status-len = <32>;
+			brcm,use-bcm-hdr;
+		};
+
+		pdc2: iproc-pdc2@61300000 {
+			compatible = "brcm,iproc-pdc-mbox";
+			reg = <0x61300000 0x445>;  /* PDC FS2 regs */
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			brcm,rx-status-len = <32>;
+			brcm,use-bcm-hdr;
+		};
+
+		pdc3: iproc-pdc3@61320000 {
+			compatible = "brcm,iproc-pdc-mbox";
+			reg = <0x61320000 0x445>;  /* PDC FS3 regs */
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			brcm,rx-status-len = <32>;
+			brcm,use-bcm-hdr;
+		};
+
 		dma0: dma@61360000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x61360000 0x1000>;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
