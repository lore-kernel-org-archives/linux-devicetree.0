From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 04/16] at91: regroup gpio and pinctrl under the same ranges
Date: Mon, 17 Sep 2012 17:27:01 +0200
Message-ID: <1347895633-1763-4-git-send-email-plagnioj@jcrosoft.com>
References: <20120917140423.GA17667@game.jcrosoft.org>
 <1347895633-1763-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1347895633-1763-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix also the reg size as we have 512 bytes bank not 256 bytes per gpio/mux
controller

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/at91sam9260.dtsi |   59 ++++++++++++---------
 arch/arm/boot/dts/at91sam9263.dtsi |  102 +++++++++++++++++++-----------------
 arch/arm/boot/dts/at91sam9g45.dtsi |   95 +++++++++++++++++----------------
 arch/arm/boot/dts/at91sam9n12.dtsi |   83 +++++++++++++++--------------
 arch/arm/boot/dts/at91sam9x5.dtsi  |   77 ++++++++++++++-------------
 5 files changed, 225 insertions(+), 191 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
index 7c95f76..3ae7abcd 100644
--- a/arch/arm/boot/dts/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/at91sam9260.dtsi
@@ -97,34 +97,41 @@
 				interrupts = <26 4 0 27 4 0 28 4 0>;
 			};
 
-			pioA: gpio@fffff400 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff400 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+			pinctrl@fffff400 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				ranges = <0xfffff400 0xfffff400 0x600>;
+
+				pioA: gpio@fffff400 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff400 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioB: gpio@fffff600 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff600 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+				pioB: gpio@fffff600 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff600 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioC: gpio@fffff800 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff800 0x100>;
-				interrupts = <4 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
+				pioC: gpio@fffff800 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff800 0x200>;
+					interrupts = <4 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 			};
 
 			dbgu: serial@fffff200 {
diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
index 195019b..ff882a6 100644
--- a/arch/arm/boot/dts/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/at91sam9263.dtsi
@@ -88,54 +88,60 @@
 				reg = <0xfffffd10 0x10>;
 			};
 
-			pioA: gpio@fffff200 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff200 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioB: gpio@fffff400 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff400 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioC: gpio@fffff600 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff600 0x100>;
-				interrupts = <4 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioD: gpio@fffff800 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff800 0x100>;
-				interrupts = <4 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioE: gpio@fffffa00 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffffa00 0x100>;
-				interrupts = <4 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
+			pinctrl@fffff200 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				ranges = <0xfffff200 0xfffff200 0xa00>;
+
+				pioA: gpio@fffff200 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff200 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioB: gpio@fffff400 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff400 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioC: gpio@fffff600 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff600 0x200>;
+					interrupts = <4 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioD: gpio@fffff800 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff800 0x200>;
+					interrupts = <4 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioE: gpio@fffffa00 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffffa00 0x200>;
+					interrupts = <4 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 			};
 
 			dbgu: serial@ffffee00 {
diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index 63751b1..990f2b1 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -106,54 +106,61 @@
 				interrupts = <21 4 0>;
 			};
 
-			pioA: gpio@fffff200 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff200 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+			pinctrl@fffff200 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				ranges = <0xfffff200 0xfffff200 0xa00>;
+
+				pioA: gpio@fffff200 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff200 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioB: gpio@fffff400 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff400 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+				pioB: gpio@fffff400 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff400 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioC: gpio@fffff600 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff600 0x100>;
-				interrupts = <4 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+				pioC: gpio@fffff600 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff600 0x200>;
+					interrupts = <4 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioD: gpio@fffff800 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffff800 0x100>;
-				interrupts = <5 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+				pioD: gpio@fffff800 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffff800 0x200>;
+					interrupts = <5 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioE: gpio@fffffa00 {
-				compatible = "atmel,at91rm9200-gpio";
-				reg = <0xfffffa00 0x100>;
-				interrupts = <5 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
+				pioE: gpio@fffffa00 {
+					compatible = "atmel,at91rm9200-gpio";
+					reg = <0xfffffa00 0x200>;
+					interrupts = <5 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 			};
 
 			dbgu: serial@ffffee00 {
diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
index ef9336a..29706bd 100644
--- a/arch/arm/boot/dts/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/at91sam9n12.dtsi
@@ -100,44 +100,51 @@
 				interrupts = <20 4 0>;
 			};
 
-			pioA: gpio@fffff400 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffff400 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioB: gpio@fffff600 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffff600 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioC: gpio@fffff800 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffff800 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			pioD: gpio@fffffa00 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffffa00 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
+			pinctrl@fffff400 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				ranges = <0xfffff400 0xfffff400 0x800>;
+
+				pioA: gpio@fffff400 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffff400 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioB: gpio@fffff600 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffff600 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioC: gpio@fffff800 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffff800 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				pioD: gpio@fffffa00 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffffa00 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 			};
 
 			dbgu: serial@fffff200 {
diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index 8a387a8..bc6cd3f 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -108,44 +108,51 @@
 				interrupts = <21 4 0>;
 			};
 
-			pioA: gpio@fffff400 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffff400 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+			pinctrl@fffff200 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
+				ranges = <0xfffff400 0xfffff400 0x800>;
+
+				pioA: gpio@fffff400 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffff400 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioB: gpio@fffff600 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffff600 0x100>;
-				interrupts = <2 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+				pioB: gpio@fffff600 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffff600 0x200>;
+					interrupts = <2 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioC: gpio@fffff800 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffff800 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
+				pioC: gpio@fffff800 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffff800 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 
-			pioD: gpio@fffffa00 {
-				compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
-				reg = <0xfffffa00 0x100>;
-				interrupts = <3 4 1>;
-				#gpio-cells = <2>;
-				gpio-controller;
-				interrupt-controller;
-				#interrupt-cells = <2>;
+				pioD: gpio@fffffa00 {
+					compatible = "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio";
+					reg = <0xfffffa00 0x200>;
+					interrupts = <3 4 1>;
+					#gpio-cells = <2>;
+					gpio-controller;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 			};
 
 			dbgu: serial@fffff200 {
-- 
1.7.10.4
