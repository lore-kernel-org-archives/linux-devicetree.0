From: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: at91: sama5d2_xplained: enable ADTRG pin
Date: Wed, 19 Apr 2017 11:20:43 +0300
Message-ID: <1492590045-17329-2-git-send-email-eugen.hristev@microchip.com>
References: <1492590045-17329-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492590045-17329-1-git-send-email-eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable pinctrl for ADTRG pin (PD31) for ADC hardware trigger support.

Signed-off-by: Eugen Hristev <eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
index 0bef9e0..04754b1 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -303,7 +303,7 @@
 				vddana-supply = <&vdd_3v3_lp_reg>;
 				vref-supply = <&vdd_3v3_lp_reg>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_adc_default>;
+				pinctrl-0 = <&pinctrl_adc_default &pinctrl_adtrg_default>;
 				status = "okay";
 			};
 
@@ -322,6 +322,20 @@
 					bias-disable;
 				};
 
+				/*
+				 * The ADTRG pin can work on any edge type.
+				 * In here it's being pulled up, so need to
+				 * connect it to ground to get an edge e.g.
+				 * Trigger can be configured on falling, rise
+				 * or any edge, and the pull-up can be changed
+				 * to pull-down or left floating according to
+				 * needs.
+				 */
+				pinctrl_adtrg_default: adtrg_default {
+					pinmux = <PIN_PD31__ADTRG>;
+					bias-pull-up;
+				};
+
 				pinctrl_charger_chglev: charger_chglev {
 					pinmux = <PIN_PA12__GPIO>;
 					bias-disable;
-- 
2.7.4
