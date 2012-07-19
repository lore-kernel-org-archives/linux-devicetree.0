From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH 4/4] ARM: Kirkwood: Describe DNS32? gpio-keys in DT.
Date: Thu, 19 Jul 2012 21:31:00 +0100
Message-ID: <1342729860-14647-5-git-send-email-jm@lentin.co.uk>
References: <y>
 <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342729860-14647-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Jason <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Move description of GPIO keys on both the DNS320 and DNS325 into DT.

Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
---
 arch/arm/boot/dts/kirkwood-dnskw.dtsi |   21 +++++++++++++++++++
 arch/arm/mach-kirkwood/board-dnskw.c  |   37 ---------------------------------
 2 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dnskw.dtsi b/arch/arm/boot/dts/kirkwood-dnskw.dtsi
index 067672c..2bad626 100644
--- a/arch/arm/boot/dts/kirkwood-dnskw.dtsi
+++ b/arch/arm/boot/dts/kirkwood-dnskw.dtsi
@@ -4,6 +4,27 @@
 	model = "D-Link DNS NASes (kirkwood-based)";
 	compatible = "dlink,dns-kirkwood", "mrvl,kirkwood-88f6281", "mrvl,kirkwood";
 
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		button@1 {
+			label = "Power button";
+			linux,code = <116>;
+			gpios = <&gpio1 2 1>;
+		};
+		button@2 {
+			label = "USB unmount button";
+			linux,code = <161>;
+			gpios = <&gpio1 15 1>;
+		};
+		button@3 {
+			label = "Reset button";
+			linux,code = <0x198>;
+			gpios = <&gpio1 16 1>;
+		};
+	};
+
 	ocp@f1000000 {
 		sata@80000 {
 			status = "okay";
diff --git a/arch/arm/mach-kirkwood/board-dnskw.c b/arch/arm/mach-kirkwood/board-dnskw.c
index aac9c90..4ab3506 100644
--- a/arch/arm/mach-kirkwood/board-dnskw.c
+++ b/arch/arm/mach-kirkwood/board-dnskw.c
@@ -19,7 +19,6 @@
 #include <linux/of.h>
 #include <linux/gpio.h>
 #include <linux/input.h>
-#include <linux/gpio_keys.h>
 #include <linux/gpio-fan.h>
 #include <linux/leds.h>
 #include <asm/mach-types.h>
@@ -68,41 +67,6 @@ static unsigned int dnskw_mpp_config[] __initdata = {
 	0
 };
 
-static struct gpio_keys_button dnskw_button_pins[] = {
-	{
-		.code		= KEY_POWER,
-		.gpio		= 34,
-		.desc		= "Power button",
-		.active_low	= 1,
-	},
-	{
-		.code		= KEY_EJECTCD,
-		.gpio		= 47,
-		.desc		= "USB unmount button",
-		.active_low	= 1,
-	},
-	{
-		.code		= KEY_RESTART,
-		.gpio		= 48,
-		.desc		= "Reset button",
-		.active_low	= 1,
-	},
-};
-
-static struct gpio_keys_platform_data dnskw_button_data = {
-	.buttons	= dnskw_button_pins,
-	.nbuttons	= ARRAY_SIZE(dnskw_button_pins),
-};
-
-static struct platform_device dnskw_button_device = {
-	.name		= "gpio-keys",
-	.id		= -1,
-	.num_resources	= 0,
-	.dev		= {
-		.platform_data	= &dnskw_button_data,
-	}
-};
-
 /* Fan: ADDA AD045HB-G73 40mm 6000rpm@5v */
 static struct gpio_fan_speed dnskw_fan_speed[] = {
 	{    0,  0 },
@@ -150,7 +114,6 @@ void __init dnskw_init(void)
 	kirkwood_ehci_init();
 	kirkwood_ge00_init(&dnskw_ge00_data);
 
-	platform_device_register(&dnskw_button_device);
 	platform_device_register(&dnskw_fan_device);
 
 	/* Register power-off GPIO. */
-- 
1.7.10.4
