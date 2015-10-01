From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/16] ARM: dts: lpc18xx: add rgu node
Date: Thu,  1 Oct 2015 22:54:38 +0200
Message-ID: <1443732893-17145-2-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the NXP LPC1850 RGU (Reset Generation Unit) reset controller
node to the dtsi for all lpc18xx/43xx devices.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 2c569a6ddc9a..29a62b600ae5 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -178,6 +178,14 @@
 				      "base_ssp0_clk",  "base_sdio_clk";
 		};
 
+		rgu: reset-controller@40053000 {
+			compatible = "nxp,lpc1850-rgu";
+			reg = <0x40053000 0x1000>;
+			clocks = <&cgu BASE_SAFE_CLK>, <&ccu1 CLK_CPU_BUS>;
+			clock-names = "delay", "reg";
+			#reset-cells = <1>;
+		};
+
 		uart0: serial@40081000 {
 			compatible = "nxp,lpc1850-uart", "ns16550a";
 			reg = <0x40081000 0x1000>;
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
