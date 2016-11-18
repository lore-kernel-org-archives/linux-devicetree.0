From: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESEND PATCH] ARM: dts: stm32f429: Add missing USART3 pin config to
 STM32F469I-DISCO board
Date: Fri, 18 Nov 2016 11:13:29 -0200
Message-ID: <CAF3+Tqer616rqU6rKeSKF5vusTdNSAQ_okCgRtx8ZnhOjjK78g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, ">" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Including new STM32 maintainer. Rebased at stm32-dt-for-v4.10-1 and
stm32-dt-for-v4.10-2 branches. It fix the port/pin initialization in
case boot-loader does not configure/initialize the pins.

This patch adds USART3 pin configuration on PB10/PA11 pins
for STM32F469I-DISCO board.

Signed-off-by: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/stm32f429.dtsi      | 13 +++++++++++++
 arch/arm/boot/dts/stm32f469-disco.dts |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 35df462..1d94eba 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -284,6 +284,19 @@
                                };
                        };

+                       usart3_pins_a: usart3@0 {
+                               pins1 {
+                                       pinmux =
<STM32F429_PB10_FUNC_USART3_TX>;
+                                       bias-disable;
+                                       drive-push-pull;
+                                       slew-rate = <0>;
+                               };
+                               pins2 {
+                                       pinmux =
<STM32F429_PB11_FUNC_USART3_RX>;
+                                       bias-disable;
+                               };
+                       };
+
                        usbotg_hs_pins_a: usbotg_hs@0 {
                                pins {
                                        pinmux =
<STM32F429_PH4_FUNC_OTG_HS_ULPI_NXT>,
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
b/arch/arm/boot/dts/stm32f469-disco.dts
index e911af8..eb3e638 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -71,5 +71,7 @@
 };

 &usart3 {
+       pinctrl-0 = <&usart3_pins_a>;
+       pinctrl-names = "default";
        status = "okay";
 };


--
2.7.4 (Apple Git-66)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
