From: Roland Stigge <stigge@antcom.de>
Subject: [PATCH RESEND v5 2/2] ohci-nxp: Device tree support
Date: Thu, 26 Apr 2012 21:58:10 +0200
Message-ID: <1335470290-3436-2-git-send-email-stigge@antcom.de>
References: <1335470290-3436-1-git-send-email-stigge@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1335470290-3436-1-git-send-email-stigge@antcom.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Cc: Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

This patch adds device tree support to ohci-nxp.c

Signed-off-by: Roland Stigge <stigge@antcom.de>

---

Applies to v3.4-rc4

I separated these two patches out from the series of LPC32xx conversion since
most of the other patches are already integrated into the respective
subsystem's -next branches.

 Documentation/devicetree/bindings/usb/ohci-nxp.txt |   16 ++++++++++++++++
 drivers/usb/host/ohci-nxp.c                        |   10 ++++++++++
 2 files changed, 26 insertions(+)

--- /dev/null
+++ linux-2.6/Documentation/devicetree/bindings/usb/ohci-nxp.txt
@@ -0,0 +1,16 @@
+* OHCI controller, NXP ohci-nxp variant
+
+Required properties:
+- compatible: must be "nxp,ohci-nxp"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: The OHCI interrupt
+
+Example (LPC32xx):
+
+	ohci@31020000 {
+		compatible = "nxp,ohci-nxp";
+		reg = <0x31020000 0x300>;
+		interrupt-parent = <&mic>;
+		interrupts = <0x3b 0>;
+	};
--- linux-2.6.orig/drivers/usb/host/ohci-nxp.c
+++ linux-2.6/drivers/usb/host/ohci-nxp.c
@@ -22,6 +22,7 @@
 #include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
+#include <linux/of.h>
 
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
@@ -525,10 +526,19 @@ static int usb_hcd_nxp_remove(struct pla
 /* work with hotplug and coldplug */
 MODULE_ALIAS("platform:usb-ohci");
 
+#ifdef CONFIG_OF
+static const struct of_device_id usb_hcd_nxp_match[] = {
+	{ .compatible = "nxp,ohci-nxp" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, usb_hcd_nxp_match);
+#endif
+
 static struct platform_driver usb_hcd_nxp_driver = {
 	.driver = {
 		.name = "usb-ohci",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(usb_hcd_nxp_match),
 	},
 	.probe = usb_hcd_nxp_probe,
 	.remove = usb_hcd_nxp_remove,
