From: Ernst Schwab <eschwab-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of: add bus-number specification to spi_mpc8xxx
Date: Tue, 16 Feb 2010 15:08:50 +0100
Message-ID: <20100216150850.d966cd79.eschwab@online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ernst Schwab <eschwab-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>

Added devicetree parsing for SPI bus number. If no bus number is specified,
a dynamically assigned bus number will be used (typically 32766).

Signed-off-by: Ernst Schwab <eschwab-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
---
diff -upr a/Documentation/powerpc/dts-bindings/fsl/spi.txt b/Documentation/powerpc/dts-bindings/fsl/spi.txt
--- a/Documentation/powerpc/dts-bindings/fsl/spi.txt
+++ b/Documentation/powerpc/dts-bindings/fsl/spi.txt
@@ -4,6 +4,8 @@ Required properties:
 - cell-index : SPI controller index.
 - compatible : should be "fsl,spi".
 - mode : the SPI operation mode, it can be "cpu" or "cpu-qe".
+- bus-number : number of the SPI bus. If unspecified, a dynamically
+  assigned bus number will be used.
 - reg : Offset and length of the register set for the device
 - interrupts : <a b> where a is the interrupt number and b is a
   field that represents an encoding of the sense and level
@@ -21,4 +23,5 @@ Example:
 		interrupts = <82 0>;
 		interrupt-parent = <700>;
 		mode = "cpu";
+		bus-number = <0>;
 	};
diff -upr a/drivers/spi/spi_mpc8xxx.c b/drivers/spi/spi_mpc8xxx.c
--- a/drivers/spi/spi_mpc8xxx.c
+++ b/drivers/spi/spi_mpc8xxx.c
@@ -1230,6 +1230,8 @@ static int __devinit of_mpc8xxx_spi_prob
 	struct resource mem;
 	struct resource irq;
 	const void *prop;
+	const int *bus_num;
+	int len;
 	int ret = -ENOMEM;
 
 	pinfo = kzalloc(sizeof(*pinfo), GFP_KERNEL);
@@ -1239,8 +1241,16 @@ static int __devinit of_mpc8xxx_spi_prob
 	pdata = &pinfo->pdata;
 	dev->platform_data = pdata;
 
-	/* Allocate bus num dynamically. */
-	pdata->bus_num = -1;
+
+	bus_num = of_get_property(np, "bus-number", &len);
+	if (bus_num && len == sizeof(*bus_num)) {
+		/* bus number is specified in node */
+		pdata->bus_num = *bus_num;
+	} else {
+		/* Allocate bus num dynamically. */
+		pdata->bus_num = -1;
+	}
+
 
 	/* SPI controller is either clocked from QE or SoC clock. */
 	pdata->sysclk = get_brgfreq();
