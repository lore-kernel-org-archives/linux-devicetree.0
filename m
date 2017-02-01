From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [Resend PATCH v2 2/3] dt-bindings: mfd: stm32f4: Add missing binding definition
Date: Wed, 1 Feb 2017 14:09:55 +0100
Message-ID: <1485954596-11014-3-git-send-email-gabriel.fernandez@st.com>
References: <1485954596-11014-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485954596-11014-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez-qxv4g6HH51o@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

This patch adds missing binding definition (backupram, ethernet, otg,
qspi, adc & dsi)

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 include/dt-bindings/mfd/stm32f4-rcc.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/mfd/stm32f4-rcc.h b/include/dt-bindings/mfd/stm32f4-rcc.h
index f662b19..082a81c 100644
--- a/include/dt-bindings/mfd/stm32f4-rcc.h
+++ b/include/dt-bindings/mfd/stm32f4-rcc.h
@@ -18,11 +18,17 @@
 #define STM32F4_RCC_AHB1_GPIOJ	9
 #define STM32F4_RCC_AHB1_GPIOK	10
 #define STM32F4_RCC_AHB1_CRC	12
+#define STM32F4_RCC_AHB1_BKPSRAM	18
+#define STM32F4_RCC_AHB1_CCMDATARAM	20
 #define STM32F4_RCC_AHB1_DMA1	21
 #define STM32F4_RCC_AHB1_DMA2	22
 #define STM32F4_RCC_AHB1_DMA2D	23
 #define STM32F4_RCC_AHB1_ETHMAC	25
-#define STM32F4_RCC_AHB1_OTGHS	29
+#define STM32F4_RCC_AHB1_ETHMACTX	26
+#define STM32F4_RCC_AHB1_ETHMACRX	27
+#define STM32F4_RCC_AHB1_ETHMACPTP	28
+#define STM32F4_RCC_AHB1_OTGHS		29
+#define STM32F4_RCC_AHB1_OTGHSULPI	30
 
 #define STM32F4_AHB1_RESET(bit) (STM32F4_RCC_AHB1_##bit + (0x10 * 8))
 #define STM32F4_AHB1_CLOCK(bit) (STM32F4_RCC_AHB1_##bit)
@@ -40,6 +46,7 @@
 
 /* AHB3 */
 #define STM32F4_RCC_AHB3_FMC	0
+#define STM32F4_RCC_AHB3_QSPI	1
 
 #define STM32F4_AHB3_RESET(bit)	(STM32F4_RCC_AHB3_##bit + (0x18 * 8))
 #define STM32F4_AHB3_CLOCK(bit)	(STM32F4_RCC_AHB3_##bit + 0x40)
@@ -79,7 +86,9 @@
 #define STM32F4_RCC_APB2_TIM8	1
 #define STM32F4_RCC_APB2_USART1	4
 #define STM32F4_RCC_APB2_USART6	5
-#define STM32F4_RCC_APB2_ADC	8
+#define STM32F4_RCC_APB2_ADC1	8
+#define STM32F4_RCC_APB2_ADC2	9
+#define STM32F4_RCC_APB2_ADC3	10
 #define STM32F4_RCC_APB2_SDIO	11
 #define STM32F4_RCC_APB2_SPI1	12
 #define STM32F4_RCC_APB2_SPI4	13
@@ -91,6 +100,7 @@
 #define STM32F4_RCC_APB2_SPI6	21
 #define STM32F4_RCC_APB2_SAI1	22
 #define STM32F4_RCC_APB2_LTDC	26
+#define STM32F4_RCC_APB2_DSI	27
 
 #define STM32F4_APB2_RESET(bit)	(STM32F4_RCC_APB2_##bit + (0x24 * 8))
 #define STM32F4_APB2_CLOCK(bit)	(STM32F4_RCC_APB2_##bit + 0xA0)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
