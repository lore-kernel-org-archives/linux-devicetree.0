From: Murali Karicheri <m-karicheri2@ti.com>
Subject: =?UTF-8?q?=5BRFC=20v2=20PATCH=202/2=5D=20mtd=3A=20davinci=20-=20remove=20DaVinci=20architecture=20depedency?=
Date: Tue, 6 Nov 2012 16:47:07 -0500
Message-ID: <1352238427-26085-3-git-send-email-m-karicheri2@ti.com>
References: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, dwmw2@infradead.org, artem.bityutskiy@linux.intel.com, hs@denx.de, nsekhar@ti.com, mikedunn@newsguy.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com, gregkh@linuxfoundation.org, swarren@wwwdotorg.org, hdoyu@nvidia.com, santosh.shilimkar@ti.com
Cc: Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

DaVinci NAND driver is a controller driver based on the AEMIF hardware
IP found on TI SoCs. It is also used on SoCs that are not DaVinci based=
=2E This
patch removes the driver dependency on DaVinci architecture so that it
can be used on other architectures such as c6x, keystone etc.

Also migrate the driver to use the new AEMIF platform driver API and
moving Documentation to Documentation/devicetree/bindings/mtd/davinci-n=
and.txt
as this is expected to be used outside of arm/davinci.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 .../devicetree/bindings/arm/davinci/nand.txt       |   59 ------------=
-
 .../devicetree/bindings/mtd/davinci-nand.txt       |   59 ++++++++++++=
+
 drivers/mtd/nand/Kconfig                           |    6 +-
 drivers/mtd/nand/davinci_nand.c                    |   40 ++++-----
 include/linux/platform_data/davinci-nand.h         |   87 ++++++++++++=
++++++++
 5 files changed, 166 insertions(+), 85 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.=
txt
 create mode 100644 Documentation/devicetree/bindings/mtd/davinci-nand.=
txt
 create mode 100644 include/linux/platform_data/davinci-nand.h

diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/D=
ocumentation/devicetree/bindings/arm/davinci/nand.txt
deleted file mode 100644
index 4746452..0000000
--- a/Documentation/devicetree/bindings/arm/davinci/nand.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-* Texas Instruments Davinci NAND
-
-This file provides information, what the device node for the
-davinci nand interface contain.
-
-Required properties:
-- compatible: "ti,davinci-nand";
-- reg : contain 2 offset/length values:
-        - offset and length for the access window
-        - offset and length for accessing the aemif control registers
-- ti,davinci-chipselect: Indicates on the davinci_nand driver which
-                         chipselect is used for accessing the nand.
-
-Recommended properties :
-- ti,davinci-mask-ale: mask for ale
-- ti,davinci-mask-cle: mask for cle
-- ti,davinci-mask-chipsel: mask for chipselect
-- ti,davinci-ecc-mode: ECC mode valid values for davinci driver:
-		- "none"
-		- "soft"
-		- "hw"
-- ti,davinci-ecc-bits: used ECC bits, currently supported 1 or 4.
-- ti,davinci-nand-buswidth: buswidth 8 or 16
-- ti,davinci-nand-use-bbt: use flash based bad block table support.
-
-nand device bindings may contain additional sub-nodes describing
-partitions of the address space. See partition.txt for more detail.
-
-Example (enbw_cmc board):
-aemif@60000000 {
-	compatible =3D "ti,davinci-aemif";
-	#address-cells =3D <2>;
-	#size-cells =3D <1>;
-	reg =3D <0x68000000 0x80000>;
-	ranges =3D <2 0 0x60000000 0x02000000
-		  3 0 0x62000000 0x02000000
-		  4 0 0x64000000 0x02000000
-		  5 0 0x66000000 0x02000000
-		  6 0 0x68000000 0x02000000>;
-	nand@3,0 {
-		compatible =3D "ti,davinci-nand";
-		reg =3D <3 0x0 0x807ff
-			6 0x0 0x8000>;
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		ti,davinci-chipselect =3D <1>;
-		ti,davinci-mask-ale =3D <0>;
-		ti,davinci-mask-cle =3D <0>;
-		ti,davinci-mask-chipsel =3D <0>;
-		ti,davinci-ecc-mode =3D "hw";
-		ti,davinci-ecc-bits =3D <4>;
-		ti,davinci-nand-use-bbt;
-
-		partition@180000 {
-			label =3D "ubifs";
-			reg =3D <0x180000 0x7e80000>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/D=
ocumentation/devicetree/bindings/mtd/davinci-nand.txt
new file mode 100644
index 0000000..4746452
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
@@ -0,0 +1,59 @@
+* Texas Instruments Davinci NAND
+
+This file provides information, what the device node for the
+davinci nand interface contain.
+
+Required properties:
+- compatible: "ti,davinci-nand";
+- reg : contain 2 offset/length values:
+        - offset and length for the access window
+        - offset and length for accessing the aemif control registers
+- ti,davinci-chipselect: Indicates on the davinci_nand driver which
+                         chipselect is used for accessing the nand.
+
+Recommended properties :
+- ti,davinci-mask-ale: mask for ale
+- ti,davinci-mask-cle: mask for cle
+- ti,davinci-mask-chipsel: mask for chipselect
+- ti,davinci-ecc-mode: ECC mode valid values for davinci driver:
+		- "none"
+		- "soft"
+		- "hw"
+- ti,davinci-ecc-bits: used ECC bits, currently supported 1 or 4.
+- ti,davinci-nand-buswidth: buswidth 8 or 16
+- ti,davinci-nand-use-bbt: use flash based bad block table support.
+
+nand device bindings may contain additional sub-nodes describing
+partitions of the address space. See partition.txt for more detail.
+
+Example (enbw_cmc board):
+aemif@60000000 {
+	compatible =3D "ti,davinci-aemif";
+	#address-cells =3D <2>;
+	#size-cells =3D <1>;
+	reg =3D <0x68000000 0x80000>;
+	ranges =3D <2 0 0x60000000 0x02000000
+		  3 0 0x62000000 0x02000000
+		  4 0 0x64000000 0x02000000
+		  5 0 0x66000000 0x02000000
+		  6 0 0x68000000 0x02000000>;
+	nand@3,0 {
+		compatible =3D "ti,davinci-nand";
+		reg =3D <3 0x0 0x807ff
+			6 0x0 0x8000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		ti,davinci-chipselect =3D <1>;
+		ti,davinci-mask-ale =3D <0>;
+		ti,davinci-mask-cle =3D <0>;
+		ti,davinci-mask-chipsel =3D <0>;
+		ti,davinci-ecc-mode =3D "hw";
+		ti,davinci-ecc-bits =3D <4>;
+		ti,davinci-nand-use-bbt;
+
+		partition@180000 {
+			label =3D "ubifs";
+			reg =3D <0x180000 0x7e80000>;
+		};
+	};
+};
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8ca4176..390cc95 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -569,11 +569,11 @@ config MTD_NAND_SH_FLCTL
 	  for NAND Flash using FLCTL.
=20
 config MTD_NAND_DAVINCI
-        tristate "Support NAND on DaVinci SoC"
-        depends on ARCH_DAVINCI
+        tristate "Support NAND on SoCs with AEMIF"
+	select TI_DAVINCI_AEMIF
         help
 	  Enable the driver for NAND flash chips on Texas Instruments
-	  DaVinci processors.
+	  SoCs that has Asynchronous External Memory Interface (AEMIF).
=20
 config MTD_NAND_TXX9NDFMC
 	tristate "NAND Flash support for TXx9 SoC"
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci=
_nand.c
index 321b053..306959e 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -35,8 +35,8 @@
 #include <linux/slab.h>
 #include <linux/of_device.h>
=20
-#include <mach/nand.h>
-#include <mach/aemif.h>
+#include <linux/platform_data/davinci-nand.h>
+#include <linux/platform_data/davinci-aemif.h>
=20
 /*
  * This is a device driver for the NAND flash controller found on the
@@ -73,7 +73,7 @@ struct davinci_nand_info {
=20
 	uint32_t		core_chipsel;
=20
-	struct davinci_aemif_timing	*timing;
+	struct davinci_aemif_cs_data	*cs_data;
 };
=20
 static DEFINE_SPINLOCK(davinci_nand_lock);
@@ -652,7 +652,6 @@ static int __init nand_davinci_probe(struct platfor=
m_device *pdev)
 	info->chip.options	=3D pdata->options;
 	info->chip.bbt_td	=3D pdata->bbt_td;
 	info->chip.bbt_md	=3D pdata->bbt_md;
-	info->timing		=3D pdata->timing;
=20
 	info->ioaddr		=3D (uint32_t __force) vaddr;
=20
@@ -731,26 +730,21 @@ static int __init nand_davinci_probe(struct platf=
orm_device *pdev)
 		goto err_clk_enable;
 	}
=20
-	/*
-	 * Setup Async configuration register in case we did not boot from
-	 * NAND and so bootloader did not bother to set it up.
-	 */
-	val =3D davinci_nand_readl(info, A1CR_OFFSET + info->core_chipsel * 4=
);
-
-	/* Extended Wait is not valid and Select Strobe mode is not used */
-	val &=3D ~(ACR_ASIZE_MASK | ACR_EW_MASK | ACR_SS_MASK);
-	if (info->chip.options & NAND_BUSWIDTH_16)
-		val |=3D 0x1;
+	if (info->chip.options & NAND_BUSWIDTH_16) {
+		info->cs_data =3D
+			davinci_aemif_get_abus_params(info->core_chipsel);
+		if (info->cs_data =3D=3D NULL)
+			goto err_bus_config;
=20
-	davinci_nand_writel(info, A1CR_OFFSET + info->core_chipsel * 4, val);
+		/* asize =3D 1 for 16bit bus */
+		info->cs_data->asize =3D 1;
+		ret =3D davinci_aemif_set_abus_params(info->core_chipsel,
+						info->cs_data);
=20
-	ret =3D 0;
-	if (info->timing)
-		ret =3D davinci_aemif_setup_timing(info->timing, info->base,
-							info->core_chipsel);
-	if (ret < 0) {
-		dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
-		goto err_timing;
+		if (ret < 0) {
+			dev_dbg(&pdev->dev, "NAND timing values setup fail\n");
+			goto err_bus_config;
+		}
 	}
=20
 	spin_lock_irq(&davinci_nand_lock);
@@ -841,7 +835,7 @@ syndrome_done:
 	return 0;
=20
 err_scan:
-err_timing:
+err_bus_config:
 	clk_disable_unprepare(info->clk);
=20
 err_clk_enable:
diff --git a/include/linux/platform_data/davinci-nand.h b/include/linux=
/platform_data/davinci-nand.h
new file mode 100644
index 0000000..df1fc66
--- /dev/null
+++ b/include/linux/platform_data/davinci-nand.h
@@ -0,0 +1,87 @@
+/*
+ * mach-davinci/nand.h
+ *
+ * Copyright =C2=A9 2006 Texas Instruments.
+ *
+ * Ported to 2.6.23 Copyright =C2=A9 2008 by
+ *   Sander Huijsen <Shuijsen@optelecom-nkf.com>
+ *   Troy Kisky <troy.kisky@boundarydevices.com>
+ *   Dirk Behme <Dirk.Behme@gmail.com>
+ *
+ * -------------------------------------------------------------------=
-------
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#ifndef __ARCH_ARM_DAVINCI_NAND_H
+#define __ARCH_ARM_DAVINCI_NAND_H
+
+#include <linux/mtd/nand.h>
+
+#define NANDFCR_OFFSET		0x60
+#define NANDFSR_OFFSET		0x64
+#define NANDF1ECC_OFFSET	0x70
+
+/* 4-bit ECC syndrome registers */
+#define NAND_4BIT_ECC_LOAD_OFFSET	0xbc
+#define NAND_4BIT_ECC1_OFFSET		0xc0
+#define NAND_4BIT_ECC2_OFFSET		0xc4
+#define NAND_4BIT_ECC3_OFFSET		0xc8
+#define NAND_4BIT_ECC4_OFFSET		0xcc
+#define NAND_ERR_ADD1_OFFSET		0xd0
+#define NAND_ERR_ADD2_OFFSET		0xd4
+#define NAND_ERR_ERRVAL1_OFFSET		0xd8
+#define NAND_ERR_ERRVAL2_OFFSET		0xdc
+
+/* NOTE:  boards don't need to use these address bits
+ * for ALE/CLE unless they support booting from NAND.
+ * They're used unless platform data overrides them.
+ */
+#define	MASK_ALE		0x08
+#define	MASK_CLE		0x10
+
+struct davinci_nand_pdata {		/* platform_data */
+	uint32_t		mask_ale;
+	uint32_t		mask_cle;
+
+	/* for packages using two chipselects */
+	uint32_t		mask_chipsel;
+
+	/* board's default static partition info */
+	struct mtd_partition	*parts;
+	unsigned		nr_parts;
+
+	/* none  =3D=3D NAND_ECC_NONE (strongly *not* advised!!)
+	 * soft  =3D=3D NAND_ECC_SOFT
+	 * else  =3D=3D NAND_ECC_HW, according to ecc_bits
+	 *
+	 * All DaVinci-family chips support 1-bit hardware ECC.
+	 * Newer ones also support 4-bit ECC, but are awkward
+	 * using it with large page chips.
+	 */
+	nand_ecc_modes_t	ecc_mode;
+	u8			ecc_bits;
+
+	/* e.g. NAND_BUSWIDTH_16 */
+	unsigned		options;
+	/* e.g. NAND_BBT_USE_FLASH */
+	unsigned		bbt_options;
+
+	/* Main and mirror bbt descriptor overrides */
+	struct nand_bbt_descr	*bbt_td;
+	struct nand_bbt_descr	*bbt_md;
+};
+
+#endif	/* __ARCH_ARM_DAVINCI_NAND_H */
--=20
1.7.9.5

