From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/16] ARM: dts: lpc18xx: add watchdog node
Date: Thu,  1 Oct 2015 22:54:45 +0200
Message-ID: <1443732893-17145-9-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>

Add node for the watchdog timer found on LPC18xx/LPC43xx.

Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 04bea2dc0e66..4ea82536a8a0 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -223,6 +223,14 @@
 			#reset-cells = <1>;
 		};
 
+		watchdog@40080000 {
+			compatible = "nxp,lpc1850-wwdt";
+			reg = <0x40080000 0x24>;
+			interrupts = <49>;
+			clocks = <&cgu BASE_SAFE_CLK>, <&ccu1 CLK_CPU_WWDT>;
+			clock-names = "wdtclk", "reg";
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
