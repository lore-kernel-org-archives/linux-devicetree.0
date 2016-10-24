From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] ARM: DT: STM32: add dma for usart3 on F429
Date: Mon, 24 Oct 2016 15:31:07 +0200
Message-ID: <1477315867-21720-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gerald.baeza-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DMA support for USART3 on STM32F429 MCU.

Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 11e8a69..0596d60 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -122,6 +122,9 @@
 			interrupts = <39>;
 			clocks = <&rcc 0 146>;
 			status = "disabled";
+			dmas = <&dma1 1 4 0x400 0x0>,
+			       <&dma1 3 4 0x400 0x0>;
+			dma-names = "rx", "tx";
 		};
 
 		usart4: serial@40004c00 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
