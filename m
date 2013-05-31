From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/7] USB: chipidea: add PTW, PTS and STS handling
Date: Fri, 31 May 2013 20:38:45 +0200
Message-ID: <1370025529-7414-4-git-send-email-mgr@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370025529-7414-1-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

This patch makes it possible to configure the PTW, PTS and STS bits
inside the portsc register for host and device mode before the driver
starts and the phy can be addressed as hardware implementation is
designed.

Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/usb/ci13xxx-imx.txt        |  5 +++
 drivers/usb/chipidea/bits.h                        | 15 ++++++-
 drivers/usb/chipidea/core.c                        | 49 ++++++++++++++++++++++
 include/linux/usb/chipidea.h                       |  1 +
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
index 1c04a4c..184a8e0 100644
--- a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
+++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
@@ -5,6 +5,11 @@ Required properties:
 - reg: Should contain registers location and length
 - interrupts: Should contain controller interrupt
 
+Recommended properies:
+- phy_type: the type of the phy connected to the core. Should be one
+  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
+  property the PORTSC register won't be touched
+
 Optional properties:
 - fsl,usbphy: phandler of usb phy that connects to the only one port
 - fsl,usbmisc: phandler of non-core register device, with one argument
diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
index 050de85..93efe4e 100644
--- a/drivers/usb/chipidea/bits.h
+++ b/drivers/usb/chipidea/bits.h
@@ -48,10 +48,23 @@
 #define PORTSC_SUSP           BIT(7)
 #define PORTSC_HSP            BIT(9)
 #define PORTSC_PTC            (0x0FUL << 16)
+/* PTS and PTW for non lpm version only */
+#define PORTSC_PTS(d)         ((((d) & 0x3) << 30) | (((d) & 0x4) ? BIT(25) : 0))
+#define PORTSC_PTW            BIT(28)
+#define PORTSC_STS            BIT(29)
 
 /* DEVLC */
 #define DEVLC_PSPD            (0x03UL << 25)
-#define    DEVLC_PSPD_HS      (0x02UL << 25)
+#define DEVLC_PSPD_HS         (0x02UL << 25)
+#define DEVLC_PTW             BIT(27)
+#define DEVLC_STS             BIT(28)
+#define DEVLC_PTS(d)          (((d) & 0x7) << 29)
+
+/* Encoding for DEVLC_PTS and PORTSC_PTS */
+#define PTS_UTMI              0
+#define PTS_ULPI              2
+#define PTS_SERIAL            3
+#define PTS_HSIC              4
 
 /* OTGSC */
 #define OTGSC_IDPU	      BIT(5)
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 49b098b..b49b682 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -64,6 +64,8 @@
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/chipidea.h>
+#include <linux/usb/of.h>
+#include <linux/phy.h>
 
 #include "ci.h"
 #include "udc.h"
@@ -208,6 +210,45 @@ static int hw_device_init(struct ci13xxx *ci, void __iomem *base)
 	return 0;
 }
 
+static void hw_phymode_configure(struct ci13xxx *ci)
+{
+	u32 portsc, lpm, sts;
+
+	switch (ci->platdata->phy_mode) {
+	case USBPHY_INTERFACE_MODE_UTMI:
+		portsc = PORTSC_PTS(PTS_UTMI);
+		lpm = DEVLC_PTS(PTS_UTMI);
+		break;
+	case USBPHY_INTERFACE_MODE_UTMIW:
+		portsc = PORTSC_PTS(PTS_UTMI) | PORTSC_PTW;
+		lpm = DEVLC_PTS(PTS_UTMI) | DEVLC_PTW;
+		break;
+	case USBPHY_INTERFACE_MODE_ULPI:
+		portsc = PORTSC_PTS(PTS_ULPI);
+		lpm = DEVLC_PTS(PTS_ULPI);
+		break;
+	case USBPHY_INTERFACE_MODE_SERIAL:
+		portsc = PORTSC_PTS(PTS_SERIAL);
+		lpm = DEVLC_PTS(PTS_SERIAL);
+		sts = 1;
+		break;
+	case USBPHY_INTERFACE_MODE_HSIC:
+		portsc = PORTSC_PTS(PTS_HSIC);
+		lpm = DEVLC_PTS(PTS_HSIC);
+		break;
+	default:
+		return;
+	}
+
+	if (ci->hw_bank.lpm) {
+		hw_write(ci, OP_DEVLC, DEVLC_PTS(7) | DEVLC_PTW, lpm);
+		hw_write(ci, OP_DEVLC, DEVLC_STS, sts);
+	} else {
+		hw_write(ci, OP_PORTSC, PORTSC_PTS(7) | PORTSC_PTW, portsc);
+		hw_write(ci, OP_PORTSC, PORTSC_STS, sts);
+	}
+}
+
 /**
  * hw_device_reset: resets chip (execute without interruption)
  * @ci: the controller
@@ -369,6 +410,9 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (!dev->of_node && dev->parent)
+		dev->of_node = dev->parent->of_node;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
@@ -408,6 +452,9 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (!ci->platdata->phy_mode)
+		ci->platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
+
 	/* initialize role(s) before the interrupt is requested */
 	ret = ci_hdrc_host_init(ci);
 	if (ret)
@@ -434,6 +481,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 			: CI_ROLE_GADGET;
 	}
 
+	hw_phymode_configure(ci);
+
 	ret = ci_role_start(ci, ci->role);
 	if (ret) {
 		dev_err(dev, "can't start %s role\n", ci_role(ci)->name);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 544825d..1a2aa18 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -14,6 +14,7 @@ struct ci13xxx_platform_data {
 	uintptr_t	 capoffset;
 	unsigned	 power_budget;
 	struct usb_phy	*phy;
+	enum usb_phy_interface phy_mode;
 	unsigned long	 flags;
 #define CI13XXX_REGS_SHARED		BIT(0)
 #define CI13XXX_REQUIRE_TRANSCEIVER	BIT(1)
-- 
1.8.2.rc2
