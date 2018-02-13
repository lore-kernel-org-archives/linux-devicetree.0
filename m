From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 9/9] arm64: dts: juno: Fix "debounce-interval" property misspelling
Date: Tue, 13 Feb 2018 15:15:35 +0100
Message-ID: <1518531335-5170-10-git-send-email-geert+renesas@glider.be>
References: <1518531335-5170-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518531335-5170-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

"debounce_interval" was never supported.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
Please apply to your tree when appropriate.

 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 2ac43221ddb680ac..45a9f02b96019708 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -60,42 +60,42 @@
 				#size-cells = <0>;
 
 				power-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <116>;
 					label = "POWER";
 					gpios = <&iofpga_gpio0 0 0x4>;
 				};
 				home-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <102>;
 					label = "HOME";
 					gpios = <&iofpga_gpio0 1 0x4>;
 				};
 				rlock-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <152>;
 					label = "RLOCK";
 					gpios = <&iofpga_gpio0 2 0x4>;
 				};
 				vol-up-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <115>;
 					label = "VOL+";
 					gpios = <&iofpga_gpio0 3 0x4>;
 				};
 				vol-down-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <114>;
 					label = "VOL-";
 					gpios = <&iofpga_gpio0 4 0x4>;
 				};
 				nmi-button {
-					debounce_interval = <50>;
+					debounce-interval = <50>;
 					wakeup-source;
 					linux,code = <99>;
 					label = "NMI";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
