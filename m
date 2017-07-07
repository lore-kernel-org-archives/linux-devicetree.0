From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 2/2] MIPS: dts: Ci20: Add ethernet and fixed-regulator nodes
Date: Fri, 7 Jul 2017 17:12:08 +0100
Message-ID: <1499443928-10620-2-git-send-email-harvey.hunt@imgtec.com>
References: <1499443928-10620-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1499443928-10620-1-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add devicetree nodes for the DM9000 and the ethernet power regulator.
Additionally, add a new pinctrl node for the ethernet chip's pins.

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Rob Herring <robh+dt@kernel.org> 
Cc: Mark Rutland <mark.rutland@arm.com> 
Cc: Paul Cercueil <paul@crapouillou.net> 
Cc: Linus Walleij <linus.walleij@linaro.org> 
Cc: devicetree@vger.kernel.org 
Cc: linux-mips@linux-mips.org 
Cc: linux-kernel@vger.kernel.org 
---
Ralf, both of these patches rely on Paul Cercueil's pinctrl
and gpio patches from Linus Walleij's 4.13 pinctrl pull request.

 arch/mips/boot/dts/ingenic/ci20.dts | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index fd138d99..6c38184 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 #include "jz4780.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	compatible = "img,ci20", "ingenic,jz4780";
@@ -21,6 +22,13 @@
 		reg = <0x0 0x10000000
 		       0x30000000 0x30000000>;
 	};
+
+	eth0_power: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "eth0_power";
+		gpio = <&gpb 25 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
 };
 
 &ext {
@@ -123,6 +131,29 @@
 			};
 		};
 	};
+
+	dm9000@6 {
+		compatible = "davicom,dm9000";
+		davicom,no-eeprom;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_nemc_cs6>;
+
+		reg = <6 0 1   /* addr */
+		       6 2 1>; /* data */
+
+		ingenic,nemc-tAS = <15>;
+		ingenic,nemc-tAH = <10>;
+		ingenic,nemc-tBP = <20>;
+		ingenic,nemc-tAW = <50>;
+		ingenic,nemc-tSTRV = <100>;
+
+		reset-gpios = <&gpf 12 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&eth0_power>;
+
+		interrupt-parent = <&gpe>;
+		interrupts = <19 4>;
+	};
 };
 
 &bch {
@@ -165,4 +196,10 @@
 		groups = "nemc-cs1";
 		bias-disable;
 	};
+
+	pins_nemc_cs6: nemc-cs6 {
+		function = "nemc-cs6";
+		groups = "nemc-cs6";
+		bias-disable;
+	};
 };
-- 
2.7.4
