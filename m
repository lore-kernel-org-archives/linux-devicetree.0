From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2] staging: dwc2: set up all module params
Date: Tue, 26 Nov 2013 18:58:01 -0700
Message-ID: <1385517481-8252-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>, Paul Zimmerman <paulz@synopsys.com>
List-Id: devicetree@vger.kernel.org

The DWC2 USB controller in the BCM2835 (Raspberry Pi) needs some non-
default parameters. Select these based on the compatible value from the
DT node. For all other HW, fall back to the default parameters currently
in use.

The values in params_bcm2835[] were posted to the mailing list by Paul
quite some time ago. I made a couple of minor modifications since then;
to set ahbcfg instead of ahb_single, and to set uframe_sched.

Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
---
v2:
* Handle !match->data correctly.
* Set uframe_sched core parameter.
---
 Documentation/devicetree/bindings/staging/dwc2.txt |    4 +-
 drivers/staging/dwc2/platform.c                    |   58 ++++++++++++++++----
 2 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/staging/dwc2.txt b/Documentation/devicetree/bindings/staging/dwc2.txt
index 1a1b7cf..8b60e90 100644
--- a/Documentation/devicetree/bindings/staging/dwc2.txt
+++ b/Documentation/devicetree/bindings/staging/dwc2.txt
@@ -2,7 +2,9 @@ Platform DesignWare HS OTG USB 2.0 controller
 -----------------------------------------------------
 
 Required properties:
-- compatible : "snps,dwc2"
+- compatible : One of:
+  - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
+  - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
 
diff --git a/drivers/staging/dwc2/platform.c b/drivers/staging/dwc2/platform.c
index 4d9fac0..28a78fe 100644
--- a/drivers/staging/dwc2/platform.c
+++ b/drivers/staging/dwc2/platform.c
@@ -39,6 +39,7 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include "core.h"
@@ -46,6 +47,34 @@
 
 static const char dwc2_driver_name[] = "dwc2";
 
+static const struct dwc2_core_params params_bcm2835 = {
+	.otg_cap			= 0,	/* HNP/SRP capable */
+	.otg_ver			= 0,	/* 1.3 */
+	.dma_enable			= 1,
+	.dma_desc_enable		= 0,
+	.speed				= 0,	/* High Speed */
+	.enable_dynamic_fifo		= 1,
+	.en_multiple_tx_fifo		= 1,
+	.host_rx_fifo_size		= 774,	/* 774 DWORDs */
+	.host_nperio_tx_fifo_size	= 256,	/* 256 DWORDs */
+	.host_perio_tx_fifo_size	= 512,	/* 512 DWORDs */
+	.max_transfer_size		= 65535,
+	.max_packet_count		= 511,
+	.host_channels			= 8,
+	.phy_type			= 1,	/* UTMI */
+	.phy_utmi_width			= 8,	/* 8 bits */
+	.phy_ulpi_ddr			= 0,	/* Single */
+	.phy_ulpi_ext_vbus		= 0,
+	.i2c_enable			= 0,
+	.ulpi_fs_ls			= 0,
+	.host_support_fs_ls_low_power	= 0,
+	.host_ls_low_power_phy_clk	= 0,	/* 48 MHz */
+	.ts_dline			= 0,
+	.reload_ctl			= 0,
+	.ahbcfg				= 0x10,
+	.uframe_sched			= 1,
+};
+
 /**
  * dwc2_driver_remove() - Called when the DWC_otg core is unregistered with the
  * DWC_otg driver
@@ -66,6 +95,13 @@ static int dwc2_driver_remove(struct platform_device *dev)
 	return 0;
 }
 
+static const struct of_device_id dwc2_of_match_table[] = {
+	{ .compatible = "brcm,bcm2835-usb", .data = &params_bcm2835 },
+	{ .compatible = "snps,dwc2", .data = NULL },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
+
 /**
  * dwc2_driver_probe() - Called when the DWC_otg core is bound to the DWC_otg
  * driver
@@ -80,14 +116,22 @@ static int dwc2_driver_remove(struct platform_device *dev)
  */
 static int dwc2_driver_probe(struct platform_device *dev)
 {
+	const struct of_device_id *match;
+	const struct dwc2_core_params *params;
+	struct dwc2_core_params defparams;
 	struct dwc2_hsotg *hsotg;
 	struct resource *res;
 	int retval;
 	int irq;
-	struct dwc2_core_params params;
 
-	/* Default all params to autodetect */
-	dwc2_set_all_params(&params, -1);
+	match = of_match_device(dwc2_of_match_table, &dev->dev);
+	if (match && match->data) {
+		params = match->data;
+	} else {
+		/* Default all params to autodetect */
+		dwc2_set_all_params(&defparams, -1);
+		params = &defparams;
+	}
 
 	hsotg = devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
 	if (!hsotg)
@@ -118,7 +162,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
 		(unsigned long)res->start, hsotg->regs);
 
-	retval = dwc2_hcd_init(hsotg, irq, &params);
+	retval = dwc2_hcd_init(hsotg, irq, params);
 	if (retval)
 		return retval;
 
@@ -127,12 +171,6 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	return retval;
 }
 
-static const struct of_device_id dwc2_of_match_table[] = {
-	{ .compatible = "snps,dwc2" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-
 static struct platform_driver dwc2_platform_driver = {
 	.driver = {
 		.name = dwc2_driver_name,
-- 
1.7.10.4
