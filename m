From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 09/11] ARM: DT: STiH407: Add pinconfig for IRB UHF and IRB TX
Date: Mon, 28 Sep 2015 13:37:45 +0100
Message-ID: <1443443867-4099-10-git-send-email-peter.griffin@linaro.org>
References: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443443867-4099-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, M'boumba Cedric Madianga <cedric.madianga-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the pinconfig for IRB TX and IRB UHF.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 352fe98..9daab1f 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -121,6 +121,24 @@
 						ir = <&pio4 0 ALT2 IN>;
 					};
 				};
+
+				pinctrl_uhf: uhf0 {
+					st,pins {
+						ir = <&pio4 1 ALT2 IN>;
+					};
+				};
+
+				pinctrl_tx: tx0 {
+					st,pins {
+						tx = <&pio4 2 ALT2 OUT>;
+					};
+				};
+
+				pinctrl_tx_od: tx_od0 {
+					st,pins {
+						tx_od = <&pio4 3 ALT2 OUT>;
+					};
+				};
 			};
 
 			/* SBC_ASC0 - UART10 */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
