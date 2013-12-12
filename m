From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 6/9] usb: gadget: s3c-hsotg: get phy bus width from phy subsystem
Date: Thu, 12 Dec 2013 08:26:07 -0500
Message-ID: <1386854770-2173-7-git-send-email-mporter@linaro.org>
References: <1386854770-2173-1-git-send-email-mporter@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386854770-2173-1-git-send-email-mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds support for querying the phy bus width from the generic phy
subsystem. Configure UTMI bus width in GUSBCFG based on this value.

Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c | 14 +++++++++++++-
 drivers/usb/gadget/s3c-hsotg.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index e9683c2..168aaa9 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -144,6 +144,7 @@ struct s3c_hsotg_ep {
  * @regs: The memory area mapped for accessing registers.
  * @irq: The IRQ number we are using
  * @supplies: Definition of USB power supplies
+ * @phyif: PHY interface width
  * @dedicated_fifos: Set if the hardware has dedicated IN-EP fifos.
  * @num_of_eps: Number of available EPs (excluding EP0)
  * @debug_root: root directrory for debugfs.
@@ -171,6 +172,7 @@ struct s3c_hsotg {
 
 	struct regulator_bulk_data supplies[ARRAY_SIZE(s3c_hsotg_supply_names)];
 
+	u32			phyif;
 	unsigned int		dedicated_fifos:1;
 	unsigned char           num_of_eps;
 
@@ -2276,7 +2278,7 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	 */
 
 	/* set the PLL on, remove the HNP/SRP and set the PHY */
-	writel(GUSBCFG_PHYIf16 | GUSBCFG_TOutCal(7) |
+	writel(hsotg->phyif | GUSBCFG_TOutCal(7) |
 	       (0x5 << 10), hsotg->regs + GUSBCFG);
 
 	s3c_hsotg_init_fifo(hsotg);
@@ -3621,6 +3623,16 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 		goto err_supplies;
 	}
 
+	/* Set default UTMI width */
+	hsotg->phyif = GUSBCFG_PHYIf16;
+
+	/*
+	 * If using the generic PHY framework, check if the PHY bus
+	 * width is 8-bit and set the phyif appropriately.
+	 */
+	if (hsotg->phy && (phy_get_bus_width(phy) == 8))
+		hsotg->phyif = GUSBCFG_PHYIf8;
+
 	if (hsotg->phy)
 		phy_init(hsotg->phy);
 
diff --git a/drivers/usb/gadget/s3c-hsotg.h b/drivers/usb/gadget/s3c-hsotg.h
index d650b12..85f549f 100644
--- a/drivers/usb/gadget/s3c-hsotg.h
+++ b/drivers/usb/gadget/s3c-hsotg.h
@@ -55,6 +55,7 @@
 #define GUSBCFG_HNPCap				(1 << 9)
 #define GUSBCFG_SRPCap				(1 << 8)
 #define GUSBCFG_PHYIf16			(1 << 3)
+#define GUSBCFG_PHYIf8				(0 << 3)
 #define GUSBCFG_TOutCal_MASK			(0x7 << 0)
 #define GUSBCFG_TOutCal_SHIFT			(0)
 #define GUSBCFG_TOutCal_LIMIT			(0x7)
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
