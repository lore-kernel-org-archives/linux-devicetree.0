From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 02/16] ARM: dts: lpc18xx: add spifi node
Date: Thu,  1 Oct 2015 22:54:39 +0200
Message-ID: <1443732893-17145-3-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the NXP LPC1773 SPIFI (SPI Flash Interface) flash controller
node to the dtsi for all lpc18xx/43xx devices.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 29a62b600ae5..a428a0946be2 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -68,6 +68,17 @@
 	};
 
 	soc {
+		spifi: flash-controller@40003000 {
+			compatible = "nxp,lpc1773-spifi";
+			reg = <0x40003000 0x1000>, <0x14000000 0x4000000>;
+			reg-names = "spifi", "flash";
+			interrupts = <30>;
+			clocks = <&ccu1 CLK_SPIFI>, <&ccu1 CLK_CPU_SPIFI>;
+			clock-names = "spifi", "reg";
+			resets = <&rgu 53>;
+			status = "disabled";
+		};
+
 		mmcsd: mmcsd@40004000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x40004000 0x1000>;
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
