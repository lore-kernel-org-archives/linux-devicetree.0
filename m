From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v5 3/3] mtd: nand: gpio: Add support for multichip devices
Date: Wed, 13 Nov 2013 15:58:04 +0400
Message-ID: <1384343884-29622-3-git-send-email-shc_work@mail.ru>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, Pawel Moll <pawel.moll@arm.com>, Artem Bityutskiy <dedekind1@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for multichip NAND devices controlled through GPIOs.
To implement this, the properties of tree have been renamed. All current
boards and DTS files converted to use an updated driver. Also driver
temporarily keep support for DTS files which use the previous names scheme.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |  37 +++++--
 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts       |  10 +-
 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts       |  10 +-
 arch/arm/mach-clps711x/board-autcpu12.c            |   4 +-
 arch/arm/mach-clps711x/board-p720t.c               |   4 +-
 arch/arm/mach-pxa/cm-x255.c                        |  10 +-
 drivers/mtd/nand/gpio.c                            | 111 +++++++++++++++------
 include/linux/mtd/nand-gpio.h                      |  12 ++-
 8 files changed, 133 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index fe4e960..cdc6680 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -11,10 +11,18 @@ Required properties:
   are made in native endianness.
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
-- gpios : specifies the gpio pins to control the NAND device.  nwp is an
-  optional gpio and may be set to 0 if not present.
+- ale-gpios : specifies the ALE gpio pin.
+- cle-gpios : specifies the CLE gpio pin.
+- nce-gpios : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
+
+Obsolete properties:
+- gpios : specifies the gpio pins to control the NAND device. rdy & nwp is an
+  optional gpios and may be set to 0 if not present. This property was be
+  replaced with xxx-gpios.
 
 Optional properties:
+- nwp-gpios : specifies the NWP gpio pin.
+- rdy-gpios : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.
 - bank-width : Width (in bytes) of the device.  If not present, the width
   defaults to 1 byte.
 - chip-delay : chip dependent delay for transferring data from array to
@@ -33,18 +41,31 @@ address space. See partition.txt for more detail.
 
 Examples:
 
-gpio-nand@1,0 {
+nand0: gpio-nand@10000000 {
+	/* 8 Bit NAND device with one chipselect */
 	compatible = "gpio-control-nand";
 	reg = <1 0x0000 0x2>;
+	ale-gpios = <&banka 1 0>;
+	cle-gpios = <&banka 2 0>;
+	nce-gpios = <&banka 3 0>;
+	rdy-gpios = <&bankb 0 0>;
 	#address-cells = <1>;
 	#size-cells = <1>;
-	gpios = <&banka 1 0	/* rdy */
-		 &banka 2 0 	/* nce */
-		 &banka 3 0 	/* ale */
-		 &banka 4 0 	/* cle */
-		 0		/* nwp */>;
 
 	partition@0 {
 	...
 	};
 };
+
+nand1: gpio-nand@10001000 {
+	/* 8/16 Bit NAND device with two chipselects */
+	compatible = "gpio-control-nand";
+	reg = <1 0x1000 0x2>;
+	gpio-control-nand,bank-width-auto;
+	ale-gpios = <&banka 4 0>;
+	cle-gpios = <&banka 5 0>;
+	nce-gpios = <&banka 6 0>, <&banka 7 0>;
+	rdy-gpios = <&bankb 1 0>, <&bankb 2 0>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+};
diff --git a/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts b/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
index 1297414..709eed6 100644
--- a/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
+++ b/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
@@ -44,12 +44,10 @@
 				bus-clock = <&pclk>, "bus";
 				gpio-control-nand,io-sync-reg =
 					<0x00000000 0x80220000>;
-
-				gpios = <&banka 1 0	/* rdy */
-					 &banka 2 0 	/* nce */
-					 &banka 3 0 	/* ale */
-					 &banka 4 0 	/* cle */
-					 0		/* nwp */>;
+				ale-gpios = <&banka 3 0>;
+				cle-gpios = <&banka 4 0>;
+				nce-gpios = <&banka 2 0>;
+				rdy-gpios = <&banka 1 0>;
 
 				boot@100000 {
 					label = "Boot";
diff --git a/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts b/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
index 9e317a4..1438f9f 100644
--- a/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
+++ b/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
@@ -50,12 +50,10 @@
 				bus-clock = <&ebi_clk>, "bus";
 				gpio-control-nand,io-sync-reg =
 					<0x00000000 0x80220000>;
-
-				gpios = <&banka 1 0	/* rdy */
-					 &banka 2 0 	/* nce */
-					 &banka 3 0 	/* ale */
-					 &banka 4 0 	/* cle */
-					 0		/* nwp */>;
+				ale-gpios = <&banka 3 0>;
+				cle-gpios = <&banka 4 0>;
+				nce-gpios = <&banka 2 0>;
+				rdy-gpios = <&banka 1 0>;
 
 				boot@100000 {
 					label = "Boot";
diff --git a/arch/arm/mach-clps711x/board-autcpu12.c b/arch/arm/mach-clps711x/board-autcpu12.c
index f8d71a8..9dce1c2 100644
--- a/arch/arm/mach-clps711x/board-autcpu12.c
+++ b/arch/arm/mach-clps711x/board-autcpu12.c
@@ -120,8 +120,8 @@ static void __init autcpu12_adjust_parts(struct gpio_nand_platdata *pdata,
 }
 
 static struct gpio_nand_platdata autcpu12_nand_pdata __initdata = {
-	.gpio_rdy	= AUTCPU12_SMC_RDY,
-	.gpio_nce	= AUTCPU12_SMC_NCE,
+	.gpio_rdy[0]	= AUTCPU12_SMC_RDY,
+	.gpio_nce[0]	= AUTCPU12_SMC_NCE,
 	.gpio_ale	= AUTCPU12_SMC_ALE,
 	.gpio_cle	= AUTCPU12_SMC_CLE,
 	.gpio_nwp	= -1,
diff --git a/arch/arm/mach-clps711x/board-p720t.c b/arch/arm/mach-clps711x/board-p720t.c
index dd81b06..3774417 100644
--- a/arch/arm/mach-clps711x/board-p720t.c
+++ b/arch/arm/mach-clps711x/board-p720t.c
@@ -243,8 +243,8 @@ static struct mtd_partition p720t_nand_parts[] __initdata = {
 };
 
 static struct gpio_nand_platdata p720t_nand_pdata __initdata = {
-	.gpio_rdy	= -1,
-	.gpio_nce	= P720T_NAND_NCE,
+	.gpio_rdy[0]	= -1,
+	.gpio_nce[0]	= P720T_NAND_NCE,
 	.gpio_ale	= P720T_NAND_ALE,
 	.gpio_cle	= P720T_NAND_CLE,
 	.gpio_nwp	= -1,
diff --git a/arch/arm/mach-pxa/cm-x255.c b/arch/arm/mach-pxa/cm-x255.c
index be75147..3cb9f4d 100644
--- a/arch/arm/mach-pxa/cm-x255.c
+++ b/arch/arm/mach-pxa/cm-x255.c
@@ -198,11 +198,11 @@ static struct mtd_partition cmx255_nand_parts[] = {
 };
 
 static struct gpio_nand_platdata cmx255_nand_platdata = {
-	.gpio_nce = GPIO_NAND_CS,
-	.gpio_cle = GPIO_NAND_CLE,
-	.gpio_ale = GPIO_NAND_ALE,
-	.gpio_rdy = GPIO_NAND_RB,
-	.gpio_nwp = -1,
+	.gpio_nce[0]	= GPIO_NAND_CS,
+	.gpio_cle	= GPIO_NAND_CLE,
+	.gpio_ale	= GPIO_NAND_ALE,
+	.gpio_rdy[0]	= GPIO_NAND_RB,
+	.gpio_nwp	= -1,
 	.parts = cmx255_nand_parts,
 	.num_parts = ARRAY_SIZE(cmx255_nand_parts),
 	.chip_delay = 25,
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index a3286c8..ffc88b0 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -36,6 +36,7 @@ struct gpiomtd {
 	void __iomem		*io_sync;
 	struct mtd_info		mtd_info;
 	struct nand_chip	nand_chip;
+	int			chip_index;
 	struct gpio_nand_platdata plat;
 };
 
@@ -75,7 +76,8 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 	gpio_nand_dosync(gpiomtd);
 
 	if (ctrl & NAND_CTRL_CHANGE) {
-		gpio_set_value(gpiomtd->plat.gpio_nce, !(ctrl & NAND_NCE));
+		gpio_set_value(gpiomtd->plat.gpio_nce[gpiomtd->chip_index],
+			       !(ctrl & NAND_NCE));
 		gpio_set_value(gpiomtd->plat.gpio_cle, !!(ctrl & NAND_CLE));
 		gpio_set_value(gpiomtd->plat.gpio_ale, !!(ctrl & NAND_ALE));
 		gpio_nand_dosync(gpiomtd);
@@ -90,8 +92,26 @@ static void gpio_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
 static int gpio_nand_devready(struct mtd_info *mtd)
 {
 	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
+	int idx = gpiomtd->chip_index;
 
-	return gpio_get_value(gpiomtd->plat.gpio_rdy);
+	if (!gpio_is_valid(gpiomtd->plat.gpio_rdy[idx]))
+		idx = 0;
+
+	return gpio_get_value(gpiomtd->plat.gpio_rdy[idx]);
+}
+
+static void gpio_nand_select_chip(struct mtd_info *mtd, int chipnr)
+{
+	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
+
+	switch (chipnr) {
+	case -1:
+		gpio_nand_cmd_ctrl(mtd, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);
+		break;
+	default:
+		gpiomtd->chip_index = chipnr;
+		break;
+	}
 }
 
 #ifdef CONFIG_OF
@@ -104,30 +124,47 @@ MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
 static int gpio_nand_get_config_of(const struct device *dev,
 				   struct gpio_nand_platdata *plat)
 {
+	struct device_node *np = dev->of_node;
 	u32 val;
+	int i;
 
 	if (!dev->of_node)
 		return -ENODEV;
 
-	if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
+	if (!of_property_read_u32(np, "bank-width", &val)) {
 		if (val == 2) {
 			plat->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
-	} else if (of_property_read_bool(dev->of_node,
+	} else if (of_property_read_bool(np,
 					 "gpio-control-nand,bank-width-auto")) {
 		plat->options |= NAND_BUSWIDTH_AUTO;
 	}
 
-	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
-	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
-	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
-	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
-	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
+	if (of_find_property(np, "gpios", NULL)) {
+		dev_notice(dev, "Property \"gpios\" is deprecated");
+
+		plat->gpio_rdy[0] = of_get_gpio(np, 0);
+		plat->gpio_nce[0] = of_get_gpio(np, 1);
+		plat->gpio_ale = of_get_gpio(np, 2);
+		plat->gpio_cle = of_get_gpio(np, 3);
+		plat->gpio_nwp = of_get_gpio(np, 4);
+	} else {
+		plat->gpio_ale = of_get_named_gpio(np, "ale-gpios", 0);
+		plat->gpio_cle = of_get_named_gpio(np, "cle-gpios", 0);
+		plat->gpio_nwp = of_get_named_gpio(np, "nwp-gpios", 0);
+
+		for (i = 0; i < MAX_NAND_PER_CHIP; i++) {
+			plat->gpio_nce[i] = of_get_named_gpio(np,
+							      "nce-gpios", i);
+			plat->gpio_rdy[i] = of_get_named_gpio(np,
+							      "rdy-gpios", i);
+		}
+	}
 
-	if (!of_property_read_u32(dev->of_node, "chip-delay", &val))
+	if (!of_property_read_u32(np, "chip-delay", &val))
 		plat->chip_delay = val;
 
 	return 0;
@@ -198,12 +235,15 @@ static void gpio_nand_set_wp(struct gpiomtd *gpiomtd, int val)
 static int gpio_nand_remove(struct platform_device *pdev)
 {
 	struct gpiomtd *gpiomtd = platform_get_drvdata(pdev);
+	int i;
 
 	nand_release(&gpiomtd->mtd_info);
 
 	gpio_nand_set_wp(gpiomtd, 0);
 
-	gpio_set_value(gpiomtd->plat.gpio_nce, 1);
+	for (i = 0; i < MAX_NAND_PER_CHIP; i++)
+		if (gpio_is_valid(gpiomtd->plat.gpio_nce[i]))
+			gpio_set_value(gpiomtd->plat.gpio_nce[i], 1);
 
 	return 0;
 }
@@ -214,7 +254,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	struct nand_chip *chip;
 	struct resource *res;
 	struct mtd_part_parser_data ppdata = {};
-	int ret = 0;
+	int i, ret, found = 0;
 
 	if (!pdev->dev.of_node && !dev_get_platdata(&pdev->dev))
 		return -EINVAL;
@@ -248,18 +288,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nce,
-				    GPIOF_OUT_INIT_HIGH, "NAND NCE");
-	if (ret)
-		return ret;
-
-	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
-		ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nwp,
-					    GPIOF_OUT_INIT_LOW, "NAND NWP");
-		if (ret)
-			return ret;
-	}
-
 	ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_ale,
 				    GPIOF_OUT_INIT_LOW, "NAND ALE");
 	if (ret)
@@ -270,19 +298,41 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
-		ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_rdy,
-					    GPIOF_IN, "NAND RDY");
+	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
+		ret = devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nwp,
+					    GPIOF_OUT_INIT_LOW, "NAND NWP");
 		if (ret)
 			return ret;
-		chip->dev_ready = gpio_nand_devready;
 	}
 
+	for (i = 0; i < MAX_NAND_PER_CHIP; i++) {
+		if (!gpio_is_valid(gpiomtd->plat.gpio_nce[i]))
+			break;
+		if (devm_gpio_request_one(&pdev->dev, gpiomtd->plat.gpio_nce[i],
+					  GPIOF_OUT_INIT_HIGH, NULL))
+			break;
+
+		found++;
+
+		if (gpio_is_valid(gpiomtd->plat.gpio_rdy[i])) {
+			if (devm_gpio_request_one(&pdev->dev,
+						  gpiomtd->plat.gpio_rdy[i],
+						  GPIOF_IN, NULL))
+				gpiomtd->plat.gpio_rdy[i] = -1;
+			else if (!i)
+				chip->dev_ready = gpio_nand_devready;
+		}
+	}
+
+	if (!found)
+		return -EINVAL;
+
 	chip->IO_ADDR_W		= chip->IO_ADDR_R;
 	chip->ecc.mode		= NAND_ECC_SOFT;
 	chip->options		= gpiomtd->plat.options;
 	chip->chip_delay	= gpiomtd->plat.chip_delay;
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
+	chip->select_chip	= gpio_nand_select_chip;
 
 	gpiomtd->mtd_info.priv	= chip;
 	gpiomtd->mtd_info.owner	= THIS_MODULE;
@@ -291,10 +341,9 @@ static int gpio_nand_probe(struct platform_device *pdev)
 
 	gpio_nand_set_wp(gpiomtd, 1);
 
-	if (nand_scan(&gpiomtd->mtd_info, 1)) {
-		ret = -ENXIO;
+	ret = nand_scan(&gpiomtd->mtd_info, found);
+	if (ret)
 		goto err_wp;
-	}
 
 	if (gpiomtd->plat.adjust_parts)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
diff --git a/include/linux/mtd/nand-gpio.h b/include/linux/mtd/nand-gpio.h
index 51534e5..bb1d7e7 100644
--- a/include/linux/mtd/nand-gpio.h
+++ b/include/linux/mtd/nand-gpio.h
@@ -3,12 +3,14 @@
 
 #include <linux/mtd/nand.h>
 
+#define MAX_NAND_PER_CHIP	4
+
 struct gpio_nand_platdata {
-	int	gpio_nce;
-	int	gpio_nwp;
-	int	gpio_cle;
-	int	gpio_ale;
-	int	gpio_rdy;
+	int	gpio_ale;			/* ALE */
+	int	gpio_cle;			/* CLE */
+	int	gpio_nwp;			/* NWP (Optional) */
+	int	gpio_nce[MAX_NAND_PER_CHIP];	/* NCE */
+	int	gpio_rdy[MAX_NAND_PER_CHIP];	/* RDY (Optional) */
 	void	(*adjust_parts)(struct gpio_nand_platdata *, size_t);
 	struct mtd_partition *parts;
 	unsigned int num_parts;
-- 
1.8.1.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
