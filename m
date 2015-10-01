From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/16] ARM: dts: lpc18xx: add dma to ssp0/1
Date: Thu,  1 Oct 2015 22:54:42 +0200
Message-ID: <1443732893-17145-6-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add dmas entries to the two SSP peripherals on LPC18xx/43xx devices
so that DMA can be used to transfer data.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index f0d1a099507f..5b7ca7066161 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -249,6 +249,9 @@
 			interrupts = <22>;
 			clocks = <&ccu2 CLK_APB0_SSP0>, <&ccu1 CLK_CPU_SSP0>;
 			clock-names = "sspclk", "apb_pclk";
+			dmas = <&dmamux  9 0 2
+				&dmamux 10 0 2>;
+			dma-names = "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -326,6 +329,16 @@
 			interrupts = <23>;
 			clocks = <&ccu2 CLK_APB2_SSP1>, <&ccu1 CLK_CPU_SSP1>;
 			clock-names = "sspclk", "apb_pclk";
+			dmas = <&dmamux 11 2 2
+				&dmamux 12 2 2
+				&dmamux  3 3 2
+				&dmamux  4 3 2
+				&dmamux  5 2 2
+				&dmamux  6 2 2
+				&dmamux 13 2 2
+				&dmamux 14 2 2>;
+			dma-names = "rx", "tx", "tx", "rx",
+				    "tx", "rx", "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
