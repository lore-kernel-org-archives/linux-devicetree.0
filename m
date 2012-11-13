From: Michal Vanka <mv-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH resend] Add devicetree support to m25p80 driver
Date: Tue, 13 Nov 2012 10:56:10 +0100
Message-ID: <50A2193A.2040100@vanka.net>
References: <5084241A.5050801@vanka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5084241A.5050801-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
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
To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following patch adds support for devicetree to m25p80 driver.
Note that for jedec chips the chip identification was simplified.
When configured by devicetree, the particular chip is identified
by jedec_id only.
Tested on custom Altera Nios2 system.

Signed-off-by: Michal Vanka <mv-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>

diff --git a/Documentation/devicetree/bindings/mtd/m25pxx.txt
b/Documentation/devicetree/bindings/mtd/m25pxx.txt
index e69de29..c454a5b 100644
--- a/Documentation/devicetree/bindings/mtd/m25pxx.txt
+++ b/Documentation/devicetree/bindings/mtd/m25pxx.txt
@@ -0,0 +1,39 @@
+* M25PXX Serial Flash
+
+Required properties:
+- compatible : For jedec part should be "generic,m25pxx"
+               For non-jedec part should be one of the following:
+		"catalyst,cat25c11"
+		"catalyst,cat25c03"
+		"catalyst,cat25c09"
+		"catalyst,cat25c17"
+		"catalyst,cat25128"
+		"stmicro,m25p05-nonjedec"
+		"stmicro,m25p10-nonjedec"
+		"stmicro,m25p20-nonjedec"
+		"stmicro,m25p40-nonjedec"
+		"stmicro,m25p80-nonjedec"
+		"stmicro,m25p16-nonjedec"
+		"stmicro,m25p32-nonjedec"
+		"stmicro,m25p64-nonjedec"
+		"stmicro,m25p128-nonjedec"
+
+- spi-max-frequency : Maximum operating frequency for the given chip.
+- reg : Chipselect bit number on gpios chipselect port.
+
+Example: S25FL064K hooked to tinyspi controller:
+
+tiny_spi_2: spi@0x4000 {
+	compatible = "opencores,tiny-spi-1.0", "opencores,tiny-spi-rtlsvn2";
+	reg = < 0x00004000 0x00000020 >;
+	interrupt-parent = < &cpu >;
+	interrupts = < 5 >;
+	clock-frequency = < 100000000 >;
+	baud-width = < 8 >;	/* BAUD_WIDTH type NUMBER */
+	gpios = < &spi2_cs 0 0 >;
+	spansion_flash: m25pxx@0 {
+		compatible = "generic,m25pxx";
+		spi-max-frequency = < 20000000 >;
+		reg = <0>;
+	};
+};
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5d0d68c..1db2c63 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -744,6 +744,29 @@ static const struct spi_device_id m25p_ids[] = {
  };
  MODULE_DEVICE_TABLE(spi, m25p_ids);

+#ifdef CONFIG_OF
+static const struct of_device_id m25pxx_dt_ids[] = {
+	{ .compatible = "generic,m25pxx", },
+	{ .compatible = "catalyst,cat25c11", },
+	{ .compatible = "catalyst,cat25c03", },
+	{ .compatible = "catalyst,cat25c09", },
+	{ .compatible = "catalyst,cat25c17", },
+	{ .compatible = "catalyst,cat25128", },
+	{ .compatible = "stmicro,m25p05-nonjedec", },
+	{ .compatible = "stmicro,m25p10-nonjedec", },
+	{ .compatible = "stmicro,m25p20-nonjedec", },
+	{ .compatible = "stmicro,m25p40-nonjedec", },
+	{ .compatible = "stmicro,m25p80-nonjedec", },
+	{ .compatible = "stmicro,m25p16-nonjedec", },
+	{ .compatible = "stmicro,m25p32-nonjedec", },
+	{ .compatible = "stmicro,m25p64-nonjedec", },
+	{ .compatible = "stmicro,m25p128-nonjedec", },
+	{ /* sentinel */ }
+};
+#else
+#define m25pxx_dt_ids NULL
+#endif
+
  static const struct spi_device_id *__devinit jedec_probe(struct
spi_device *spi)
  {
  	int			tmp;
@@ -798,7 +821,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
  	unsigned			i;
  	struct mtd_part_parser_data	ppdata;

-#ifdef CONFIG_MTD_OF_PARTS
+#if defined(CONFIG_MTD_OF_PARTS) || defined(CONFIG_OF)
  	if (!of_device_is_available(spi->dev.of_node))
  		return -ENODEV;
  #endif
@@ -825,27 +848,39 @@ static int __devinit m25p_probe(struct spi_device
*spi)
  			dev_warn(&spi->dev, "unrecognized id %s\n", data->type);
  	}

-	info = (void *)id->driver_data;
-
-	if (info->jedec_id) {
-		const struct spi_device_id *jid;
-
-		jid = jedec_probe(spi);
-		if (IS_ERR(jid)) {
-			return PTR_ERR(jid);
-		} else if (jid != id) {
-			/*
-			 * JEDEC knows better, so overwrite platform ID. We
-			 * can't trust partitions any longer, but we'll let
-			 * mtd apply them anyway, since some partitions may be
-			 * marked read-only, and we don't want to lose that
-			 * information, even if it's not 100% accurate.
-			 */
-			dev_warn(&spi->dev, "found %s, expected %s\n",
-				 jid->name, id->name);
-			id = jid;
-			info = (void *)jid->driver_data;
+	if (id) {
+		info = (void *)id->driver_data;
+		if (info->jedec_id) {
+			const struct spi_device_id *jid;
+
+			jid = jedec_probe(spi);
+			if (IS_ERR(jid)) {
+				return PTR_ERR(jid);
+			} else if (jid != id) {
+				/*
+				 * JEDEC knows better, so overwrite platform ID.
+				 * We can't trust partitions any longer, but
+				 * we'll let mtd apply them anyway, since some
+				 * partitions may be marked read-only,
+				 * and we don't want to lose that information,
+				 * even if it's not 100% accurate.
+				 */
+				dev_warn(&spi->dev, "found %s, expected %s\n",
+					 jid->name, id->name);
+				id = jid;
+				info = (void *)jid->driver_data;
+			}
  		}
+	} else {
+		/*
+		 * No id -> we have been most likely configured
+		 * by devicetree "generic,m25pxx" record.
+		 */
+		id = jedec_probe(spi);
+		if (IS_ERR(id))
+			return PTR_ERR(id);
+
+		info = (void *)id->driver_data;
  	}

  	flash = kzalloc(sizeof *flash, GFP_KERNEL);
@@ -968,6 +1003,7 @@ static struct spi_driver m25p80_driver = {
  	.driver = {
  		.name	= "m25p80",
  		.owner	= THIS_MODULE,
+		.of_match_table = m25pxx_dt_ids,
  	},
  	.id_table	= m25p_ids,
  	.probe	= m25p_probe,
