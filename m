From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: [PATCH 1/1] ARM: dts: enable GPIO-b for Broadcom NSP
Date: Mon, 14 Nov 2016 08:30:19 -0500
Message-ID: <1479130219-25639-1-git-send-email-yendapally.reddy@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
List-Id: devicetree@vger.kernel.org

This enables the GPIO-b support for Broadcom NSP SoC

Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 7c9e0fa..2f699a0 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -241,6 +241,16 @@
 			brcm,nand-has-wp;
 		};
 
+		gpiob: gpio@30000 {
+			compatible = "brcm,iproc-nsp-gpio", "brcm,iproc-gpio";
+			reg = <0x30000 0x50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			ngpios = <4>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pwm: pwm@31000 {
 			compatible = "brcm,iproc-pwm";
 			reg = <0x31000 0x28>;
-- 
2.1.0
