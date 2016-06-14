From: Rob Rice <rob.rice@broadcom.com>
Subject: [PATCH RESEND 3/3] arm64: dts: Add Broadcom Northstar2 device tree entries for PDC driver.
Date: Tue, 14 Jun 2016 10:02:45 -0400
Message-ID: <1465912965-35500-4-git-send-email-rob.rice@broadcom.com>
References: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, rob.rice@broadcom.com, Rob Rice <rrice@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Rob Rice <rrice@broadcom.com>

Add Broadcom Northstar2 SoC device tree entries for PDC driver.

Signed-off-by: Rob Rice <rob.rice@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
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
