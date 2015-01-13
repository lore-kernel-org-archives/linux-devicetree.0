From: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2 v3] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Mon, 12 Jan 2015 18:36:07 -0600 (CST)
Message-ID: <1136776275.110939.1421109367310.JavaMail.zimbra@xes-inc.com>
References: <993430213.110699.1421109005544.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <993430213.110699.1421109005544.JavaMail.zimbra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>

Support the generic nand-ecc-mode, nand-ecc-strength, and
nand-ecc-step-size device-tree properties with the Freescale UPM NAND
driver.

This patch preserves the default software ECC mode while adding the
ability to use BCH ECC for larger NAND devices.

Signed-off-by: Jordan Friendshuh <jfriendshuh-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Aaron Sierra <asierra-AQeFf1F/bRxBDgjK7y7TUQ@public.gmane.org>
---
v2:
    * Now using ECC mode and strength helpers from of_mtd.h
    * ECC mode and strength checking is more robust
v3:
    * Require nand-ecc-step-size for soft_bch.
    * Simplify mode/strength/step parameter checking.

 .../devicetree/bindings/mtd/fsl-upm-nand.txt       | 32 +++++++++++
 drivers/mtd/nand/Kconfig                           |  1 +
 drivers/mtd/nand/fsl_upm.c                         | 66 ++++++++++++++++++++--
 3 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
index fce4894..3643ee1 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
@@ -18,6 +18,9 @@ Optional properties:
 - chip-delay : chip dependent delay for transferring data from array to
 	read registers (tR). Required if property "gpios" is not used
 	(R/B# pins not connected).
+- nand-ecc-mode : as defined by nand.txt ("soft" and "soft_bch", only).
+- nand-ecc-strength : as defined by nand.txt.
+- nand-ecc-step-size : as defined by nand.txt.
 
 Each flash chip described may optionally contain additional sub-nodes
 describing partitions of the address space. See partition.txt for more
@@ -65,3 +68,32 @@ upm@3,0 {
 		};
 	};
 };
+
+/*
+ * Micron MT29F32G08AFABA (M62B)
+ * 32 Gb (4 GiB), 2 chipselect
+ */
+upm@2,0 {
+	#address-cells = <0>;
+	#size-cells = <0>;
+	compatible = "fsl,upm-nand";
+	reg = <2 0x0 0x80000>;
+	fsl,upm-addr-line-cs-offsets = <0x0 0x10000>;
+	fsl,upm-addr-offset = <0x10>;
+	fsl,upm-cmd-offset = <0x08>;
+	fsl,upm-wait-flags = <0x1>;
+	chip-delay = <50>;
+
+	nand@0 {
+		#address-cells = <1>;
+		#size-cells = <2>;
+		nand-ecc-mode = "soft_bch";
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partition@0 {
+			label = "NAND filesystem";
+			reg = <0x0 0x1 0x00000000>;
+		};
+	};
+};
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index e5e3343..4c85daf 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -444,6 +444,7 @@ config MTD_NAND_FSL_UPM
 	tristate "Support for NAND on Freescale UPM"
 	depends on PPC_83xx || PPC_85xx
 	select FSL_LBC
+	select MTD_NAND_ECC_BCH
 	help
 	  Enables support for NAND Flash chips wired onto Freescale PowerPC
 	  processor localbus with User-Programmable Machine support.
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 72755d7..053d8bf 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -18,6 +18,7 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
+#include <linux/of_mtd.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
@@ -160,6 +161,11 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	int ret;
 	struct device_node *flash_np;
 	struct mtd_part_parser_data ppdata;
+	int mode, strength, step_size;
+
+	flash_np = of_get_next_child(upm_np, NULL);
+	if (!flash_np)
+		return -ENODEV;
 
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
@@ -168,7 +174,61 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->chip.read_byte = fun_read_byte;
 	fun->chip.read_buf = fun_read_buf;
 	fun->chip.write_buf = fun_write_buf;
-	fun->chip.ecc.mode = NAND_ECC_SOFT;
+
+	/*
+	 * Support NAND_ECC_SOFT and NAND_ECC_SOFT_BCH, error otherwise.
+	 */
+	mode = of_get_nand_ecc_mode(flash_np);
+	strength = of_get_nand_ecc_strength(flash_np);
+	step_size = of_get_nand_ecc_step_size(flash_np);
+	if (mode < 0) {
+		dev_info(fun->dev, "ECC mode defaulting to 'soft'");
+		mode = NAND_ECC_SOFT;
+	} else if (mode != NAND_ECC_SOFT && mode != NAND_ECC_SOFT_BCH) {
+		dev_err(fun->dev, "ECC mode in device tree is unsupported");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/*
+	 * In NAND_ECC_SOFT_BCH, require strength >= 1 and step >= 1.
+	 * In NAND_ECC_SOFT:
+	 *     a. ignore strength (1 implied)
+	 *     b. step < 0, step = 256, or step = 512.
+	 */
+	if (mode == NAND_ECC_SOFT_BCH) {
+		if (strength < 1)
+			dev_err(fun->dev, "invalid nand-ecc-strength for BCH");
+
+		if (step_size < 1)
+			dev_err(fun->dev, "invalid nand-ecc-step-size for BCH");
+
+		if (strength < 1 || step_size < 1) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		fun->chip.ecc.mode = mode;
+		fun->chip.ecc.strength = strength;
+		fun->chip.ecc.size = step_size;
+	} else {
+		if (strength >= 0)
+			dev_warn(fun->dev, "soft ECC implies 1-bit strength");
+
+		if (step_size < 0) {
+			step_size = 256;
+		} else if (step_size != 256 && step_size != 512) {
+			dev_err(fun->dev,
+				"soft ECC needs 256 or 512 byte step");
+			ret = -EINVAL;
+			goto err;
+		}
+
+		fun->chip.ecc.mode = mode;
+		fun->chip.ecc.strength = 1;
+		fun->chip.ecc.size = step_size;
+	}
+
 	if (fun->mchip_count > 1)
 		fun->chip.select_chip = fun_select_chip;
 
@@ -178,10 +238,6 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	fun->mtd.priv = &fun->chip;
 	fun->mtd.owner = THIS_MODULE;
 
-	flash_np = of_get_next_child(upm_np, NULL);
-	if (!flash_np)
-		return -ENODEV;
-
 	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
 				  flash_np->name);
 	if (!fun->mtd.name) {
-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
