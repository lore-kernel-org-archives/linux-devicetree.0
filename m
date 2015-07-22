From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 3/3] gpio: etraxfs: add support for ARTPEC-3
Date: Wed, 22 Jul 2015 15:05:19 +0200
Message-ID: <1437570319-25297-3-git-send-email-rabin@rab.in>
References: <1437570319-25297-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437570319-25297-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for the GIO block in the ARTPEC-3 SoC.  The basic
functionality is essentialy the same as the version in the ETRAX FS,
except for a different set of ports, including a read-only port.

Cc: devicetree@vger.kernel.org
Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 .../devicetree/bindings/gpio/gpio-etraxfs.txt      |  3 +-
 drivers/gpio/gpio-etraxfs.c                        | 66 ++++++++++++++++++++--
 2 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt b/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
index abf4db7..170194a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-etraxfs.txt
@@ -2,8 +2,9 @@ Axis ETRAX FS General I/O controller bindings
 
 Required properties:
 
-- compatible:
+- compatible: one of:
   - "axis,etraxfs-gio"
+  - "axis,artpec3-gio"
 - reg: Physical base address and length of the controller's registers.
 - #gpio-cells: Should be 3
   - The first cell is the gpio offset number.
diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index c1ce80d..7276891 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -26,6 +26,17 @@
 #define ETRAX_FS_r_pe_din	84
 #define ETRAX_FS_rw_pe_oe	88
 
+#define ARTPEC3_r_pa_din	0
+#define ARTPEC3_rw_pa_dout	4
+#define ARTPEC3_rw_pa_oe	8
+#define ARTPEC3_r_pb_din	44
+#define ARTPEC3_rw_pb_dout	48
+#define ARTPEC3_rw_pb_oe	52
+#define ARTPEC3_r_pc_din	88
+#define ARTPEC3_rw_pc_dout	92
+#define ARTPEC3_rw_pc_oe	96
+#define ARTPEC3_r_pd_din	116
+
 struct etraxfs_gpio_port {
 	const char *label;
 	unsigned int oe;
@@ -82,6 +93,40 @@ static const struct etraxfs_gpio_info etraxfs_gpio_etraxfs = {
 	.ports = etraxfs_gpio_etraxfs_ports,
 };
 
+static const struct etraxfs_gpio_port etraxfs_gpio_artpec3_ports[] = {
+	{
+		.label	= "A",
+		.ngpio	= 32,
+		.oe	= ARTPEC3_rw_pa_oe,
+		.dout	= ARTPEC3_rw_pa_dout,
+		.din	= ARTPEC3_r_pa_din,
+	},
+	{
+		.label	= "B",
+		.ngpio	= 32,
+		.oe	= ARTPEC3_rw_pb_oe,
+		.dout	= ARTPEC3_rw_pb_dout,
+		.din	= ARTPEC3_r_pb_din,
+	},
+	{
+		.label	= "C",
+		.ngpio	= 16,
+		.oe	= ARTPEC3_rw_pc_oe,
+		.dout	= ARTPEC3_rw_pc_dout,
+		.din	= ARTPEC3_r_pc_din,
+	},
+	{
+		.label	= "D",
+		.ngpio	= 32,
+		.din	= ARTPEC3_r_pd_din,
+	},
+};
+
+static const struct etraxfs_gpio_info etraxfs_gpio_artpec3 = {
+	.num_ports = ARRAY_SIZE(etraxfs_gpio_artpec3_ports),
+	.ports = etraxfs_gpio_artpec3_ports,
+};
+
 static int etraxfs_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
@@ -101,6 +146,10 @@ static const struct of_device_id etraxfs_gpio_of_table[] = {
 		.compatible = "axis,etraxfs-gio",
 		.data = &etraxfs_gpio_etraxfs,
 	},
+	{
+		.compatible = "axis,artpec3-gio",
+		.data = &etraxfs_gpio_artpec3,
+	},
 	{},
 };
 
@@ -133,14 +182,19 @@ static int etraxfs_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < info->num_ports; i++) {
 		struct bgpio_chip *bgc = &chips[i];
 		const struct etraxfs_gpio_port *port = &info->ports[i];
+		unsigned long flags = BGPIOF_READ_OUTPUT_REG_SET;
+		void __iomem *dat = regs + port->din;
+		void __iomem *set = regs + port->dout;
+		void __iomem *dirout = regs + port->oe;
+
+		if (dirout == set) {
+			dirout = set = NULL;
+			flags = BGPIOF_NO_OUTPUT;
+		}
 
 		ret = bgpio_init(bgc, dev, 4,
-				 regs + port->din,	/* dat */
-				 regs + port->dout,	/* set */
-				 NULL,			/* clr */
-				 regs + port->oe,	/* dirout */
-				 NULL,			/* dirin */
-				 BGPIOF_READ_OUTPUT_REG_SET);
+				 dat, set, NULL, dirout, NULL,
+				 flags);
 		if (ret)
 			return ret;
 
-- 
2.1.4
