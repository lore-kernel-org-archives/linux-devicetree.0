From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ARM: bcm2835: enable GPIO/pinctrl
Date: Thu, 27 Sep 2012 22:10:12 -0600
Message-ID: <1348805412-7804-2-git-send-email-swarren@wwwdotorg.org>
References: <1348805412-7804-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348805412-7804-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable GPIO and pinctrl in Kconfig.

Add required <mach/gpio.h> for gpiolib.

Instantiate the BCM2835 GPIO module in bcm2835.dtsi.

Add a pinctrl definition to bcm2835-rpi-b.dts that sets up all of the
board's required pinmux configuration. GPIO aren't specified; that's
left to gpio_request().

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 arch/arm/Kconfig                          |    5 ++++-
 arch/arm/boot/dts/bcm2835-rpi-b.dts       |   15 +++++++++++++++
 arch/arm/boot/dts/bcm2835.dtsi            |   23 +++++++++++++++++++++++
 arch/arm/mach-bcm2835/include/mach/gpio.h |    1 +
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/mach-bcm2835/include/mach/gpio.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 84e914a..257ac7c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -351,7 +351,7 @@ config ARCH_AT91
 
 config ARCH_BCM2835
 	bool "Broadcom BCM2835 family"
-	select ARCH_WANT_OPTIONAL_GPIOLIB
+	select ARCH_REQUIRE_GPIOLIB
 	select ARM_AMBA
 	select ARM_ERRATA_411920
 	select ARM_TIMER_SP804
@@ -359,7 +359,10 @@ config ARCH_BCM2835
 	select COMMON_CLK
 	select CPU_V6
 	select GENERIC_CLOCKEVENTS
+	select GENERIC_GPIO
 	select MULTI_IRQ_HANDLER
+	select PINCTRL
+	select PINCTRL_BCM2835
 	select SPARSE_IRQ
 	select USE_OF
 	help
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index 7dd860f..9b72054 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -10,3 +10,18 @@
 		reg = <0 0x10000000>;
 	};
 };
+
+&gpio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&alt0 &alt3>;
+
+	alt0: alt0 {
+		brcm,pins = <0 1 2 3 4 5 6 7 8 9 10 11 14 15 40 45>;
+		brcm,function = <4>; /* alt0 */
+	};
+
+	alt3: alt3 {
+		brcm,pins = <48 49 50 51 52 53>;
+		brcm,function = <7>; /* alt3 */
+	};
+};
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 7e0d515..7e22ed3 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -40,5 +40,28 @@
 			interrupts = <2 25>;
 			clock-frequency = <3000000>;
 		};
+
+		gpio: gpio {
+			compatible = "brcm,bcm2835-gpio";
+			reg = <0x7e200000 0xb4>;
+			/*
+			 * The GPIO IP block is designed for 3 banks of GPIOs.
+			 * Each bank has a GPIO interrupt for itself.
+			 * There is an overall "any bank" interrupt.
+			 * In order, these are GIC interrupts 17, 18, 19, 20.
+			 * Since the BCM2835 only has 2 banks, the 2nd bank
+			 * interrupt output appears to be mirrored onto the
+			 * 3rd bank's interrupt signal.
+			 * So, a bank0 interrupt shows up on 17, 20, and
+			 * a bank1 interrupt shows up on 18, 19, 20!
+			 */
+			interrupts = <2 17>, <2 18>, <2 19>, <2 20>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 };
diff --git a/arch/arm/mach-bcm2835/include/mach/gpio.h b/arch/arm/mach-bcm2835/include/mach/gpio.h
new file mode 100644
index 0000000..40a8c17
--- /dev/null
+++ b/arch/arm/mach-bcm2835/include/mach/gpio.h
@@ -0,0 +1 @@
+/* empty */
-- 
1.7.9.5
