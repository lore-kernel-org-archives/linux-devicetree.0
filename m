From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 4/8] ARM: mvebu: Add USB3 UTMI support
Date: Fri, 18 Apr 2014 12:22:39 +0200
Message-ID: <1397816563-9000-5-git-send-email-gregory.clement@free-electrons.com>
References: <1397816563-9000-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397816563-9000-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The usb3-utmi registers allow to configure the internal USB PHY of the
Armada 380/385 SoCs. A small initialization is needed to be able to use
the USB3 ports.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/mach-mvebu/Makefile   |  2 +-
 arch/arm/mach-mvebu/usb-utmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/mach-mvebu/usb-utmi.c

diff --git a/arch/arm/mach-mvebu/Makefile b/arch/arm/mach-mvebu/Makefile
index a63e43b6b451..2d98a3eeecf6 100644
--- a/arch/arm/mach-mvebu/Makefile
+++ b/arch/arm/mach-mvebu/Makefile
@@ -4,7 +4,7 @@ ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/$(src)/include \
 AFLAGS_coherency_ll.o		:= -Wa,-march=armv7-a
 
 obj-y				 += system-controller.o mvebu-soc-id.o
-obj-$(CONFIG_MACH_MVEBU_V7)      += board-v7.o
+obj-$(CONFIG_MACH_MVEBU_V7)      += board-v7.o  usb-utmi.o
 obj-$(CONFIG_MACH_DOVE)		 += dove.o
 obj-$(CONFIG_ARCH_MVEBU)	 += coherency.o coherency_ll.o pmsu.o
 obj-$(CONFIG_SMP)                += platsmp.o headsmp.o
diff --git a/arch/arm/mach-mvebu/usb-utmi.c b/arch/arm/mach-mvebu/usb-utmi.c
new file mode 100644
index 000000000000..e91e86f85eb4
--- /dev/null
+++ b/arch/arm/mach-mvebu/usb-utmi.c
@@ -0,0 +1,64 @@
+/*
+ * USB UTMI support for Armada 38x platform.
+ *
+ * Copyright (C) 2014 Marvell
+ *
+ * Gregory CLEMENT <gregory.clement@free-electrons.com>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/of_address.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+
+#define USB_UTMI_PHY_CTRL_STATUS(i)	(0x20+i*4)
+#define		USB_UTMI_TX_BITSTUFF_EN BIT(1)
+#define		USB_UTMI_PU_PHY		BIT(5)
+#define		USB_UTMI_VBUS_ON_PHY	BIT(6)
+
+static struct of_device_id of_usb_utmi_table[] = {
+	{ .compatible = "marvell,armada-380-usb-utmi", },
+	{ /* end of list */ },
+};
+
+static int __init mvebu_usb_utmi_init(void)
+{
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, of_usb_utmi_table);
+	if (np) {
+		void __iomem *usb_utmi_base, *utmi_base;
+
+		usb_utmi_base = of_iomap(np, 0);
+		BUG_ON(!usb_utmi_base);
+
+		utmi_base = of_iomap(np, 1);
+		BUG_ON(!utmi_base);
+
+		writel(USB_UTMI_TX_BITSTUFF_EN |
+			   USB_UTMI_PU_PHY |
+			   USB_UTMI_VBUS_ON_PHY,
+			   usb_utmi_base + USB_UTMI_PHY_CTRL_STATUS(0));
+
+		/*
+		 * Magic init... the registers and their value are not
+		 * documented
+		 */
+		writel(0x40605205, utmi_base);
+		writel(0x409, utmi_base + 4);
+		writel(0x1be7f6f, utmi_base + 0xc);
+
+		of_node_put(np);
+		iounmap(utmi_base);
+		iounmap(usb_utmi_base);
+	}
+
+	return 0;
+}
+postcore_initcall(mvebu_usb_utmi_init);
-- 
1.8.1.2
