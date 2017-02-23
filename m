From: Steve Lin <steven.lin1@broadcom.com>
Subject: [PATCH v2 2/3] ARM: dts: NSP: Add mailbox (PDC) to NSP
Date: Thu, 23 Feb 2017 09:49:51 -0500
Message-ID: <1487861392-23039-3-git-send-email-steven.lin1@broadcom.com>
References: <1487861392-23039-1-git-send-email-steven.lin1@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487861392-23039-1-git-send-email-steven.lin1@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, ray.jui@broadcom.com, scott.branden@broadcom.com, f.fainelli@gmail.com, jon.mason@broadcom.com, linux@armlinux.org.uk, rob.rice@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, steven.lin1@broadcom.com
List-Id: devicetree@vger.kernel.org

Adds mailbox / PDC to NSP device tree.  Needs new compatibility string
to differentiate from NS2 version.

Signed-off-by: Steve Lin <steven.lin1@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 15f07f9..8b56d74 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -227,6 +227,15 @@
 			status = "disabled";
 		};
 
+		mailbox: mailbox@25000 {
+			compatible = "brcm,iproc-fa2-mbox";
+			reg = <0x25000 0x445>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			brcm,rx-status-len = <32>;
+			brcm,use-bcm-hdr;
+		};
+
 		nand: nand@26000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x026000 0x600>,
-- 
2.1.0
