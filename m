From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH 1/4] ARM: Kirkwood: Describe DNS325 temperature sensor in DT.
Date: Thu, 19 Jul 2012 21:30:57 +0100
Message-ID: <1342729860-14647-2-git-send-email-jm@lentin.co.uk>
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

From: Andrew Lunn <andrew@lunn.ch>

Now that we have I2C support in DT, describe the LM75 in
the DT file for the DNS325.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
---
 arch/arm/boot/dts/kirkwood-dns325.dts |    8 ++++++++
 arch/arm/mach-kirkwood/board-dnskw.c  |   15 ++-------------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dns325.dts b/arch/arm/boot/dts/kirkwood-dns325.dts
index 10bc819..e040d6c 100644
--- a/arch/arm/boot/dts/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/kirkwood-dns325.dts
@@ -16,6 +16,14 @@
 	};
 
 	ocp@f1000000 {
+		i2c@11000 {
+			status = "okay";
+
+			lm75: lm75@48 {
+				compatible = "national,lm75";
+				reg = <0x48>;
+			};
+		};
 		serial@12000 {
 			clock-frequency = <200000000>;
 			status = "okay";
diff --git a/arch/arm/mach-kirkwood/board-dnskw.c b/arch/arm/mach-kirkwood/board-dnskw.c
index 179f4b3..1c97efa 100644
--- a/arch/arm/mach-kirkwood/board-dnskw.c
+++ b/arch/arm/mach-kirkwood/board-dnskw.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/i2c.h>
 #include <linux/ata_platform.h>
 #include <linux/mv643xx_eth.h>
 #include <linux/of.h>
@@ -153,13 +152,6 @@ static struct platform_device dns320_led_device = {
 	},
 };
 
-static struct i2c_board_info dns325_i2c_board_info[] __initdata = {
-	{
-		I2C_BOARD_INFO("lm75", 0x48),
-	},
-	/* Something at 0x0c also */
-};
-
 static struct gpio_keys_button dnskw_button_pins[] = {
 	{
 		.code		= KEY_POWER,
@@ -241,17 +233,14 @@ void __init dnskw_init(void)
 
 	kirkwood_ehci_init();
 	kirkwood_ge00_init(&dnskw_ge00_data);
-	kirkwood_i2c_init();
 
 	platform_device_register(&dnskw_button_device);
 	platform_device_register(&dnskw_fan_device);
 
-	if (of_machine_is_compatible("dlink,dns-325")) {
-		i2c_register_board_info(0, dns325_i2c_board_info,
-					ARRAY_SIZE(dns325_i2c_board_info));
+	if (of_machine_is_compatible("dlink,dns-325"))
 		platform_device_register(&dns325_led_device);
 
-	} else if (of_machine_is_compatible("dlink,dns-320"))
+	else if (of_machine_is_compatible("dlink,dns-320"))
 		platform_device_register(&dns320_led_device);
 
 	/* Register power-off GPIO. */
-- 
1.7.10.4
