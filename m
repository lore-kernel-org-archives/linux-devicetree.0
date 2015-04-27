From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] ARM: at91/dt: sama5d3 xplained: add fixed regulator for vmmc0
Date: Mon, 27 Apr 2015 15:19:12 +0200
Message-ID: <1430140753-19998-3-git-send-email-ludovic.desroches@atmel.com>
References: <1430140753-19998-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430140753-19998-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>

Add fixed regulator for vmmc0 and attach the vmmc for it to the mmc0
node on the SAM5D3 Xplained board. This will remove the following
warning from the kernel:

atmel_mci f0000000.mmc: No vmmc regulator found

Note, atmel_defconfig will need fixed regulator support enabled if this
is to be used properly.

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
[use a fixed regulator instead of gpio one]
Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/at91-sama5d3_xplained.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
index 61922b3..581986a 100644
--- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
@@ -35,6 +35,7 @@
 		apb {
 			mmc0: mmc@f0000000 {
 				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_dat4_7 &pinctrl_mmc0_cd>;
+				vmmc-supply = <&vcc_mmc0_reg>;
 				vqmmc-supply = <&vcc_3v3_reg>;
 				status = "okay";
 				slot@0 {
@@ -296,6 +297,14 @@
 		};
 	};
 
+	vcc_mmc0_reg: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		gpio = <&pioE 2 GPIO_ACTIVE_LOW>;
+		regulator-name = "mmc0-card-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	gpio_keys {
 		compatible = "gpio-keys";
 
-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
