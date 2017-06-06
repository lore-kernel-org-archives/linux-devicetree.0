From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: stm32h743: Add usart2_pins
Date: Tue, 6 Jun 2017 18:13:31 +0200
Message-ID: <1496765613-697-2-git-send-email-patrice.chotard@st.com>
References: <1496765613-697-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496765613-697-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

Add usart2 pins definition in order to add usart2 support
dedicated for console output on stm32h743i-disco board.

Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
index fcc1e06..76bbd65 100644
--- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
@@ -151,6 +151,19 @@
 					bias-disable;
 				};
 			};
+
+			usart2_pins: usart2@0 {
+				pins1 {
+					pinmux = <STM32H7_PD5_FUNC_USART2_TX>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32H7_PD6_FUNC_USART2_RX>;
+					bias-disable;
+				};
+			};
 		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
