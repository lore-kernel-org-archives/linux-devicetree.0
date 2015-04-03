From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/6] ARM: dts: lpc4357-ea4357: add pinctrl and uart0 muxing
Date: Fri,  3 Apr 2015 23:16:07 +0200
Message-ID: <1428095767-6286-7-git-send-email-manabian@gmail.com>
References: <1428095767-6286-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428095767-6286-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc4357-ea4357.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/lpc4357-ea4357.dts b/arch/arm/boot/dts/lpc4357-ea4357.dts
index 39340e355b0a..c2b85f8e6e31 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357.dts
@@ -29,6 +29,25 @@
 	};
 };
 
+&pinctrl {
+	uart0_pins: uart0-pins {
+		uart0_rx_cfg {
+			pins = "pf_11";
+			function = "uart0";
+			bias-disable;
+			input-enable;
+		};
+
+		uart0_tx_cfg {
+			pins = "pf_10";
+			function = "uart0";
+			bias-disable;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 };
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
