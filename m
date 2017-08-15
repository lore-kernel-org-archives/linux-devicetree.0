From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 1/6] ARM: dts: cygnus: Fix incorrect UART2 register base
Date: Tue, 15 Aug 2017 10:25:58 -0700
Message-ID: <1502817964-8221-2-git-send-email-scott.branden@broadcom.com>
References: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Ray Jui <ray.jui@broadcom.com>

Fix incorrect Cygnus UART2 register base.

Fixes: 0f0b21a83ad2 ("ARM: dts: Move all Cygnus peripherals into axi bus")
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index bf8c838..e4d07f4 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -324,7 +324,7 @@
 
 		uart2: serial@18022000 {
 			compatible = "snps,dw-apb-uart";
-			reg = <0x18020000 0x100>;
+			reg = <0x18022000 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.5.0
