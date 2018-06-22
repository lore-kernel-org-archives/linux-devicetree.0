From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 3/7] bus: add bus driver for accessing
 Allwinner A64 DE2
Date: Fri, 22 Jun 2018 20:45:36 +0800
Message-ID: <20180622124540.56203-2-icenowy@aosc.io>
References: <20180622124540.56203-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBAPAWPMQKGQEKXZBU2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180622124540.56203-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "Display Engine 2.0" (usually called DE2) on the Allwinner A64 SoC
is different from the ones on other Allwinner SoCs. It requires a SRAM
region to be claimed, otherwise all DE2 subblocks won't be accessible.

Add a bus driver for the Allwinner A64 DE2 part which claims the SRAM
region when probing.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
No changes since v1.

 drivers/bus/Kconfig      | 10 ++++++++
 drivers/bus/Makefile     |  1 +
 drivers/bus/sun50i-de2.c | 49 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/bus/sun50i-de2.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index d1c0b60e9326..1851112ccc29 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -103,6 +103,16 @@ config SIMPLE_PM_BUS
 	  Controller (BSC, sometimes called "LBSC within Bus Bridge", or
 	  "External Bus Interface") as found on several Renesas ARM SoCs.
 
+config SUN50I_DE2_BUS
+	bool "Allwinner A64 DE2 Bus Driver"
+	  default ARM64
+	  depends on ARCH_SUNXI
+	  select SUNXI_SRAM
+	  help
+	  Say y here to enable support for Allwinner A64 DE2 bus driver. It's
+	  mostly transparent, but a SRAM region needs to be claimed in the SRAM
+	  controller to make the all blocks in the DE2 part accessible.
+
 config SUNXI_RSB
 	tristate "Allwinner sunXi Reduced Serial Bus Driver"
 	  default MACH_SUN8I || MACH_SUN9I || ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index b8f036cca7ff..ca300b1914ce 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
+obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_SIMPLE_PM_BUS)	+= simple-pm-bus.o
 obj-$(CONFIG_TEGRA_ACONNECT)	+= tegra-aconnect.o
diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
new file mode 100644
index 000000000000..836828ef96d5
--- /dev/null
+++ b/drivers/bus/sun50i-de2.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A64 Display Engine 2.0 Bus Driver
+ *
+ * Copyright (C) 2018 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
+ */
+
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/soc/sunxi/sunxi_sram.h>
+
+static int sun50i_de2_bus_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+
+	ret = sunxi_sram_claim(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Error couldn't map SRAM to device\n");
+		return ret;
+	}
+
+	if (np)
+		of_platform_populate(np, NULL, NULL, &pdev->dev);
+
+	return 0;
+}
+
+static int sun50i_de2_bus_remove(struct platform_device *pdev)
+{
+	sunxi_sram_release(&pdev->dev);
+	return 0;
+}
+
+static const struct of_device_id sun50i_de2_bus_of_match[] = {
+	{ .compatible = "allwinner,sun50i-a64-de2", },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver sun50i_de2_bus_driver = {
+	.probe = sun50i_de2_bus_probe,
+	.remove = sun50i_de2_bus_remove,
+	.driver = {
+		.name = "sun50i-de2-bus",
+		.of_match_table = sun50i_de2_bus_of_match,
+	},
+};
+
+builtin_platform_driver(sun50i_de2_bus_driver);
-- 
2.17.1
