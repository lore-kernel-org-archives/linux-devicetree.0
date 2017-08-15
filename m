From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 6/6] ARM: dts: cygnus: Add generic-ehci/ohci nodes
Date: Tue, 15 Aug 2017 10:26:03 -0700
Message-ID: <1502817964-8221-7-git-send-email-scott.branden@broadcom.com>
References: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>

Add dt nodes for generic-ehci/ohci host controller.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 306b04c..7c957ea 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -459,6 +459,20 @@
 			brcm,nand-has-wp;
 		};
 
+		ehci0: usb@18048000 {
+			compatible = "generic-ehci";
+			reg = <0x18048000 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci0: usb@18048800 {
+			compatible = "generic-ohci";
+			reg = <0x18048800 0x100>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		v3d: v3d@180a2000 {
 			compatible = "brcm,cygnus-v3d";
 			reg = <0x180a2000 0x1000>;
-- 
2.5.0
