From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH 2/9] ARM: at91/snapper9260: move gpio_to_irq out of structure
 initialization
Date: Mon, 13 Feb 2012 15:43:02 +0100
Message-ID: <e0557a2864e52e017a0e931c6c64fd341ae21559.1329139662.git.nicolas.ferre@atmel.com>
References: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1329144189-4535-1-git-send-email-nicolas.ferre@atmel.com>
In-Reply-To: <2fd1ebedc5ad5ac7aeb15c590c4400212a3b06cf.1329139662.git.nicolas.ferre@atmel.com>
References: <2fd1ebedc5ad5ac7aeb15c590c4400212a3b06cf.1329139662.git.nicolas.ferre@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: rmallon@gmail.com, devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, avictor.za@gmail.com, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

gpio_to_irq() implementation will be moved from a macro to a
plain function: we cannot use it in a structure initialization
anymore.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: rmallon@gmail.com
---
 arch/arm/mach-at91/board-snapper9260.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-at91/board-snapper9260.c b/arch/arm/mach-at91/board-snapper9260.c
index 4770db0..3c2e3fc 100644
--- a/arch/arm/mach-at91/board-snapper9260.c
+++ b/arch/arm/mach-at91/board-snapper9260.c
@@ -145,11 +145,11 @@ static struct i2c_board_info __initdata snapper9260_i2c_devices[] = {
 		/* Audio codec */
 		I2C_BOARD_INFO("tlv320aic23", 0x1a),
 	},
-	{
+};
+
+static struct i2c_board_info __initdata snapper9260_i2c_isl1208 = {
 		/* RTC */
 		I2C_BOARD_INFO("isl1208", 0x6f),
-		.irq = gpio_to_irq(AT91_PIN_PA31),
-	},
 };
 
 static void __init snapper9260_add_device_nand(void)
@@ -163,6 +163,10 @@ static void __init snapper9260_board_init(void)
 {
 	at91_add_device_i2c(snapper9260_i2c_devices,
 			    ARRAY_SIZE(snapper9260_i2c_devices));
+
+	snapper9260_i2c_isl1208.irq = gpio_to_irq(AT91_PIN_PA31);
+	i2c_register_board_info(0, &snapper9260_i2c_isl1208, 1);
+
 	at91_add_device_serial();
 	at91_add_device_usbh(&snapper9260_usbh_data);
 	at91_add_device_udc(&snapper9260_udc_data);
-- 
1.7.9
