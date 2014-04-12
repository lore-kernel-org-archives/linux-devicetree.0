From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 4/4] ARM: at91/dt: sam9263: Add ac97 device node
Date: Sat, 12 Apr 2014 11:08:27 +0200
Message-ID: <1397293707-26890-5-git-send-email-alexanders83@web.de>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397293707-26890-1-git-send-email-alexanders83@web.de>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alexander Stein <alexanders83@web.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 arch/arm/boot/dts/at91sam9263.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index fece866..34db6d8 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -395,6 +395,16 @@
 					};
 				};
 
+				ac97 {
+					pinctrl_ac97: ac97-0 {
+						atmel,pins =
+							<AT91_PIOB 0 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB12 periph A AC97FS pin */
+							 AT91_PIOB 1 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB13 periph A AC97CK pin */
+							 AT91_PIOB 2 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB14 periph A AC97TX pin */
+							 AT91_PIOB 3 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PB14 periph A AC97RX pin */
+					};
+				};
+
 				pioA: gpio@fffff200 {
 					compatible = "atmel,at91rm9200-gpio";
 					reg = <0xfffff200 0x200>;
@@ -506,6 +516,15 @@
 				status = "disabled";
 			};
 
+			ac97: sound@fffa0000 {
+				compatible = "atmel,atmel_ac97c";
+				reg = <0xfffa0000 0x4000>;
+				interrupts = <18 IRQ_TYPE_LEVEL_HIGH 5>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_ac97>;
+				status = "disabled";
+			};
+
 			macb0: ethernet@fffbc000 {
 				compatible = "cdns,at32ap7000-macb", "cdns,macb";
 				reg = <0xfffbc000 0x100>;
-- 
1.9.2

