From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v3 4/4] ARM: dts: keystone-k2hk: add dsp gpio controllers nodes
Date: Wed, 3 Sep 2014 20:05:35 +0300
Message-ID: <1409763935-5713-5-git-send-email-grygorii.strashko@ti.com>
References: <1409763935-5713-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1409763935-5713-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, santosh.shilimkar@ti.com, shc_work@mail.ru, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Add Keystone 2 DSP GPIO nodes.
DSP GPIO banks 0-7 correspond to DSP0-DSP7

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/k2hk.dtsi | 56 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/k2hk.dtsi b/arch/arm/boot/dts/k2hk.dtsi
index 321ba2f..3287455 100644
--- a/arch/arm/boot/dts/k2hk.dtsi
+++ b/arch/arm/boot/dts/k2hk.dtsi
@@ -50,5 +50,61 @@
 			#interrupt-cells = <1>;
 			ti,syscon-dev = <&devctrl 0x2a0>;
 		};
+
+		dspgpio0: keystone_dsp_gpio@02620240 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x240>;
+		};
+
+		dspgpio1: keystone_dsp_gpio@2620244 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x244>;
+		};
+
+		dspgpio2: keystone_dsp_gpio@2620248 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x248>;
+		};
+
+		dspgpio3: keystone_dsp_gpio@262024c {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x24c>;
+		};
+
+		dspgpio4: keystone_dsp_gpio@2620250 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x250>;
+		};
+
+		dspgpio5: keystone_dsp_gpio@2620254 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x254>;
+		};
+
+		dspgpio6: keystone_dsp_gpio@2620258 {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x258>;
+		};
+
+		dspgpio7: keystone_dsp_gpio@262025c {
+			compatible = "ti,keystone-dsp-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&devctrl 0x25c>;
+		};
 	};
 };
-- 
1.9.1

