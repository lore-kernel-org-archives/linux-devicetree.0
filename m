From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 8/9] ARM: dts: Add leds support to STM32F429 boards
Date: Fri, 11 Dec 2015 09:25:05 +0100
Message-ID: <1449822306-9035-9-git-send-email-mcoquelin.stm32@gmail.com>
References: <1449822306-9035-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449822306-9035-1-git-send-email-mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/stm32429i-eval.dts  | 17 +++++++++++++++++
 arch/arm/boot/dts/stm32f429-disco.dts | 11 +++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 71fe17a..e3921d9 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -64,6 +64,23 @@
 	aliases {
 		serial0 = &usart1;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		green {
+			gpios = <&gpiog 6 1>;
+			linux,default-trigger = "heartbeat";
+		};
+		orange {
+			gpios = <&gpiog 7 1>;
+		};
+		red {
+			gpios = <&gpiog 10 1>;
+		};
+		blue {
+			gpios = <&gpiog 12 1>;
+		};
+	};
 };
 
 &clk_hse {
diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index e3ce796..0140807 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -64,6 +64,17 @@
 	aliases {
 		serial0 = &usart1;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		red {
+			gpios = <&gpiog 14 0>;
+		};
+		green {
+			gpios = <&gpiog 13 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &clk_hse {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
