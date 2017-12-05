From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 4/9] dt-bindings: gpio: gpio-axp209: add
 pinctrl features
Date: Tue,  5 Dec 2017 15:46:42 +0100
Message-ID: <20171205144647.17594-5-quentin.schulz@free-electrons.com>
References: <20171205144647.17594-1-quentin.schulz@free-electrons.com>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBQ7DTLIQKGQEG2FPU5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171205144647.17594-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The X-Powers AXP209 has 3 GPIOs. GPIO0/1 can each act either as a GPIO,
an ADC or a LDO regulator. GPIO2 can only act as a GPIO.

This adds the pinctrl features to the driver so GPIO0/1 can be used as
ADC or LDO regulator.

Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-axp209.txt       | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
index a6611304dd3c..0d77597c3f92 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
@@ -1,8 +1,13 @@
-AXP209 GPIO controller
+AXP209 GPIO & pinctrl controller
 
 This driver follows the usual GPIO bindings found in
 Documentation/devicetree/bindings/gpio/gpio.txt
 
+This driver follows the usual pinctrl bindings found in
+Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+This driver employs the per-pin muxing pattern.
+
 Required properties:
 - compatible: Should be "x-powers,axp209-gpio"
 - #gpio-cells: Should be two. The first cell is the pin number and the
@@ -28,3 +33,32 @@ axp209: pmic@34 {
 		#gpio-cells = <2>;
 	};
 };
+
+The GPIOs can be muxed to other functions and therefore, must be a subnode of
+axp_gpio.
+
+Example:
+
+&axp_gpio {
+	gpio0_adc: gpio0-adc {
+		pins = "GPIO0";
+		function = "adc";
+	};
+};
+
+&example_node {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio0_adc>;
+};
+
+GPIOs and their functions
+-------------------------
+
+Each GPIO is independent from the other (i.e. GPIO0 in gpio_in function does
+not force GPIO1 and GPIO2 to be in gpio_in function as well).
+
+GPIO	|	Functions
+------------------------
+GPIO0	|	gpio_in, gpio_out, ldo, adc
+GPIO1	|	gpio_in, gpio_out, ldo, adc
+GPIO2	|	gpio_in, gpio_out
-- 
2.14.1
