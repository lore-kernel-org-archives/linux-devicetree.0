From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] ARM: at91/dt: sama5d4 xplained: add regulators for v(q)mmc1 supplies
Date: Mon, 27 Apr 2015 15:27:52 +0200
Message-ID: <1430141272-20215-1-git-send-email-ludovic.desroches@atmel.com>
References: <1430140753-19998-4-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430140753-19998-4-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add vcc_mmc1 fixed regulator to remove the 'no vmmc regulator found' warning
when probing the mmc1 device.

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---

Remove the additionnal blank line.

 arch/arm/boot/dts/at91-sama5d4_xplained.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
index c740e1a..88a0b9f 100644
--- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
@@ -106,6 +106,8 @@
 			mmc1: mmc@fc000000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3 &pinctrl_mmc1_cd>;
+				vmmc-supply = <&vcc_mmc1_reg>;
+				vqmmc-supply = <&vcc_3v3_reg>;
 				status = "okay";
 				slot@0 {
 					reg = <0>;
@@ -238,4 +240,22 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	vcc_3v3_reg: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC 3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_mmc1_reg: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		gpio = <&pioE 4 GPIO_ACTIVE_LOW>;
+		regulator-name = "VDD MCI1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_reg>;
+	};
 };
-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
