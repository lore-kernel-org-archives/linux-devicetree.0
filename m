From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 10/14] drivers/USB: isp1760 DT platform parsing and binding
Date: Wed, 18 Aug 2010 19:59:56 +0100
Message-ID: <1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-10-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

When OF is enabled, each driver should define a match table to
allow the kernel to recognise drivers suitable for a given device.
Initialization is carried out through a static inline at driver init
time. The match-table is declared following OF bindings.
Driver properties are parsed from the device tree node at run time,
but if the device tree probing fails, the driver falls back to static
driver initialization (platform data).

This patch adds the infrastructure to support device tree probing and
initialization for isp1760 USB host controller. The build infrastructure
changes accordingly in order to have a clean separation between OF and
non-OF init code.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 drivers/usb/host/Makefile      |    4 +-
 drivers/usb/host/isp1760-hcd.h |    7 ++++++
 drivers/usb/host/isp1760-if.c  |   43 ++++++++++++++++++++++++++--------------
 drivers/usb/host/isp1760-of.c  |   36 +++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 17 deletions(-)
 create mode 100644 drivers/usb/host/isp1760-of.c

diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index b6315aa..edf6e8a 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -5,8 +5,8 @@
 ifeq ($(CONFIG_USB_DEBUG),y)
 	EXTRA_CFLAGS		+= -DDEBUG
 endif
-
-isp1760-objs := isp1760-hcd.o isp1760-if.o
+isp1760_of-$(CONFIG_OF)		:= isp1760-of.o
+isp1760-objs := isp1760-hcd.o isp1760-if.o $(isp1760_of-y)
 fhci-objs := fhci-hcd.o fhci-hub.o fhci-q.o fhci-mem.o \
 	     fhci-tds.o fhci-sched.o
 ifeq ($(CONFIG_FHCI_DEBUG),y)
diff --git a/drivers/usb/host/isp1760-hcd.h b/drivers/usb/host/isp1760-hcd.h
index 6931ef5..93afabd 100644
--- a/drivers/usb/host/isp1760-hcd.h
+++ b/drivers/usb/host/isp1760-hcd.h
@@ -9,6 +9,13 @@ struct usb_hcd *isp1760_register(phys_addr_t res_start, resource_size_t res_len,
 int init_kmem_once(void);
 void deinit_kmem_cache(void);
 
+#ifndef CONFIG_OF
+static inline int isp1760_plat_probe_dt(int *devflags,
+		struct platform_device *pdev) { return -ENODEV; }
+#else
+extern int isp1760_plat_probe_dt(int *devflags, struct platform_device *pdev);
+#endif
+
 /* EHCI capability registers */
 #define HC_CAPLENGTH		0x00
 #define HC_HCSPARAMS		0x04
diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
index ec85d0c..3a1839e 100644
--- a/drivers/usb/host/isp1760-if.c
+++ b/drivers/usb/host/isp1760-if.c
@@ -17,7 +17,7 @@
 
 #include "isp1760-hcd.h"
 
-#ifdef CONFIG_PPC_OF
+#if defined(CONFIG_PPC_OF)
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #endif
@@ -305,6 +305,17 @@ static struct pci_driver isp1761_pci_driver = {
 };
 #endif
 
+static const struct of_device_id of_isp1760_match[] = {
+	{
+		.compatible = "nxp,usb-isp1760",
+	},
+	{
+		.compatible = "nxp,usb-isp1761",
+	},
+	{ },
+};
+
+
 static int __devinit isp1760_plat_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -336,21 +347,22 @@ static int __devinit isp1760_plat_probe(struct platform_device *pdev)
 	}
 	irqflags |= irq_res->flags & IRQF_TRIGGER_MASK;
 
-	if (priv) {
-		if (priv->is_isp1761)
-			devflags |= ISP1760_FLAG_ISP1761;
-		if (priv->bus_width_16)
-			devflags |= ISP1760_FLAG_BUS_WIDTH_16;
-		if (priv->port1_otg)
-			devflags |= ISP1760_FLAG_OTG_EN;
-		if (priv->analog_oc)
-			devflags |= ISP1760_FLAG_ANALOG_OC;
-		if (priv->dack_polarity_high)
-			devflags |= ISP1760_FLAG_DACK_POL_HIGH;
-		if (priv->dreq_polarity_high)
-			devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
+	if (isp1760_plat_probe_dt(&devflags, pdev) == -ENODEV) {
+		if (priv) {
+			if (priv->is_isp1761)
+				devflags |= ISP1760_FLAG_ISP1761;
+			if (priv->bus_width_16)
+				devflags |= ISP1760_FLAG_BUS_WIDTH_16;
+			if (priv->port1_otg)
+				devflags |= ISP1760_FLAG_OTG_EN;
+			if (priv->analog_oc)
+				devflags |= ISP1760_FLAG_ANALOG_OC;
+			if (priv->dack_polarity_high)
+				devflags |= ISP1760_FLAG_DACK_POL_HIGH;
+			if (priv->dreq_polarity_high)
+				devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
+		}
 	}
-
 	hcd = isp1760_register(mem_res->start, mem_size, irq_res->start,
 			       irqflags, &pdev->dev, dev_name(&pdev->dev), devflags);
 	if (IS_ERR(hcd)) {
@@ -394,6 +406,7 @@ static int __init isp1760_init(void)
 
 	init_kmem_once();
 
+	platform_init_match(&isp1760_plat_driver, of_isp1760_match);
 	ret = platform_driver_register(&isp1760_plat_driver);
 	if (!ret)
 		any_ret = 0;
diff --git a/drivers/usb/host/isp1760-of.c b/drivers/usb/host/isp1760-of.c
new file mode 100644
index 0000000..c98ee58
--- /dev/null
+++ b/drivers/usb/host/isp1760-of.c
@@ -0,0 +1,36 @@
+
+#include <linux/platform_device.h>
+
+#include <linux/of.h>
+#include "isp1760-hcd.h"
+
+int isp1760_plat_probe_dt(int *devflags, struct platform_device *pdev)
+{
+	struct device_node *dp = pdev->dev.of_node;
+	const u32 *prop;
+
+	if (!dp)
+		return -ENODEV;
+
+	if (of_device_is_compatible(dp, "nxp,usb-isp1761"))
+		*devflags |= ISP1760_FLAG_ISP1761;
+
+	/* Some systems wire up only 16 of the 32 data lines */
+	prop = of_get_property(dp, "bus-width", NULL);
+	if (prop && *prop == 16)
+		*devflags |= ISP1760_FLAG_BUS_WIDTH_16;
+
+	if (of_get_property(dp, "port1-otg", NULL))
+		*devflags |= ISP1760_FLAG_OTG_EN;
+
+	if (of_get_property(dp, "analog-oc", NULL))
+		*devflags |= ISP1760_FLAG_ANALOG_OC;
+
+	if (of_get_property(dp, "dack-polarity", NULL))
+		*devflags |= ISP1760_FLAG_DACK_POL_HIGH;
+
+	if (of_get_property(dp, "dreq-polarity", NULL))
+		*devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
+
+	return 0;
+}
-- 
1.6.3.3
