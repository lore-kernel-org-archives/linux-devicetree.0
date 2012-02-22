From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v2 6/7] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
Date: Wed, 22 Feb 2012 07:50:09 +0100
Message-ID: <1329893410-24413-7-git-send-email-hs@denx.de>
References: <1329893410-24413-1-git-send-email-hs@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1329893410-24413-1-git-send-email-hs-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

add OF support for the davinci nand controller.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

---
- changes for v2:
  - add comments from Scott Wood:
    - add "ti,davinci-" prefix
    - Dashes are preferred to underscores
    - rename "nandflash" to "nand"
    - introduce new "ti,davinci" specific properties for setting
      up ecc_mode, ecc_bits, options and bbt options, instead
      using linux defines
    - readme fixes

 .../devicetree/bindings/arm/davinci/nand.txt       |   74 +++++++++++++++++
 drivers/mtd/nand/davinci_nand.c                    |   85 +++++++++++++++++++-
 2 files changed, 158 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/davinci/nand.txt

diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/arm/davinci/nand.txt
new file mode 100644
index 0000000..e02874a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/davinci/nand.txt
@@ -0,0 +1,74 @@
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
+Optional properties:
+- pinmux-handle: contains a handle to configure the pinmux settings.
+- timing-handle: contains a handle to setup aemif timing.
+
+Example (enbw_cmc board):
+aemif@60000000 {
+	compatible = "ti,davinci-aemif";
+	#address-cells = <2>;
+	#size-cells = <1>;
+	reg = <0x68000000 0x80000>;
+	ranges = <2 0 0x60000000 0x02000000
+		  3 0 0x62000000 0x02000000
+		  4 0 0x64000000 0x02000000
+		  5 0 0x66000000 0x02000000
+		  6 0 0x68000000 0x02000000>;
+	nand_cs: cs3@68000000 {
+		compatible = "ti,davinci-cs";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		/* all timings in nanoseconds */
+		cs = <3>;
+		asize = <0>;
+		ta = <0>;
+		rhold = <7>;
+		rstrobe = <42>;
+		rsetup = <7>;
+		whold = <7>;
+		wstrobe = <14>;
+		wsetup = <7>;
+		ew = <0>;
+		ss = <0>;
+	};
+	nand@3,0 {
+		compatible = "ti,davinci-nand";
+		reg = <3 0x0 0x807ff
+			6 0x0 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ti,davinci-chipselect = <1>;
+		ti,davinci-mask-ale = <0>;
+		ti,davinci-mask-cle = <0>;
+		ti,davinci-mask-chipsel = <0>;
+		ti,davinci-ecc-mode = "hw";
+		ti,davinci-ecc-bits = <4>;
+		ti,davinci-nand-use-bbt;
+		pinmux-handle = <&nand_pins>;
+		timing-handle = <&nand_cs>;
+	};
+};
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 6e56615..bdd6edc 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -33,9 +33,12 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
+#include <linux/of_i2c.h>
+#include <linux/of_device.h>
 
 #include <mach/nand.h>
 #include <mach/aemif.h>
+#include <mach/mux.h>
 
 /*
  * This is a device driver for the NAND flash controller found on the
@@ -518,9 +521,86 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
 	},
 };
 
+#if defined(CONFIG_OF)
+static const struct of_device_id davinci_nand_of_match[] = {
+	{.compatible = "ti,davinci-nand", },
+	{},
+}
+MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
+
+static struct davinci_nand_pdata
+	*nand_davinci_get_pdata(struct platform_device *pdev)
+{
+	if ((pdev->dev.platform_data == NULL) &&
+		(pdev->dev.of_node)) {
+		struct device_node *tmp_np;
+		struct davinci_nand_pdata *pdata;
+		const char *mode;
+		u32 prop;
+		int len;
+
+		pdata =  kzalloc(sizeof(struct davinci_nand_pdata),
+				GFP_KERNEL);
+		pdev->dev.platform_data = pdata;
+		if (!pdata)
+			return NULL;
+		if (!of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-chipselect", &prop))
+			pdev->id = prop;
+		if (!of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-mask-ale", &prop))
+			pdata->mask_ale = prop;
+		if (!of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-mask-cle", &prop))
+			pdata->mask_cle = prop;
+		if (!of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-mask-chipsel", &prop))
+			pdata->mask_chipsel = prop;
+		if (!of_property_read_string(pdev->dev.of_node,
+			"ti,davinci-ecc-mode", &mode)) {
+			if (!strncmp("none", mode, 4))
+				pdata->ecc_mode = NAND_ECC_NONE;
+			if (!strncmp("soft", mode, 4))
+				pdata->ecc_mode = NAND_ECC_SOFT;
+			if (!strncmp("hw", mode, 2))
+				pdata->ecc_mode = NAND_ECC_HW;
+		}
+		if (!of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-ecc-bits", &prop))
+			pdata->ecc_bits = prop;
+		if (!of_property_read_u32(pdev->dev.of_node,
+			"ti,davinci-nand-buswidth", &prop))
+			if (prop == 16)
+				pdata->options |= NAND_BUSWIDTH_16;
+		if (of_find_property(pdev->dev.of_node,
+			"ti,davinci-nand-use-bbt", &len))
+			pdata->bbt_options = NAND_BBT_USE_FLASH;
+
+		tmp_np = of_parse_phandle(pdev->dev.of_node,
+				"pinmux-handle", 0);
+		if (tmp_np)
+			davinci_cfg_reg_of(tmp_np);
+
+		tmp_np = of_parse_phandle(pdev->dev.of_node,
+				"timing-handle", 0);
+		if (tmp_np)
+			davinci_aemif_setup_timing_of(tmp_np);
+	}
+
+	return pdev->dev.platform_data;
+}
+#else
+#define davinci_nand_of_match NULL
+static struct davinci_nand_pdata
+	*nand_davinci_get_pdata(struct platform_device *pdev)
+{
+	return pdev->dev.platform_data;
+}
+#endif
+
 static int __init nand_davinci_probe(struct platform_device *pdev)
 {
-	struct davinci_nand_pdata	*pdata = pdev->dev.platform_data;
+	struct davinci_nand_pdata	*pdata;
 	struct davinci_nand_info	*info;
 	struct resource			*res1;
 	struct resource			*res2;
@@ -530,6 +610,7 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	uint32_t			val;
 	nand_ecc_modes_t		ecc_mode;
 
+	pdata = nand_davinci_get_pdata(pdev);
 	/* insist on board-specific configuration */
 	if (!pdata)
 		return -ENODEV;
@@ -815,6 +896,8 @@ static struct platform_driver nand_davinci_driver = {
 	.remove		= __exit_p(nand_davinci_remove),
 	.driver		= {
 		.name	= "davinci_nand",
+		.owner	= THIS_MODULE,
+		.of_match_table = davinci_nand_of_match,
 	},
 };
 MODULE_ALIAS("platform:davinci_nand");
-- 
1.7.7.6
