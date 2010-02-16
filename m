From: Ernst Schwab <eschwab-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] of: add bus-number specification to spi_mpc8xxx
Date: Tue, 16 Feb 2010 16:08:32 +0100
Message-ID: <20100216160832.730cb00b.eschwab@online.de>
References: <20100216150850.d966cd79.eschwab@online.de>
	<fa686aa41002160628g62bd6564h50e712e8fb9c384d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa41002160628g62bd6564h50e712e8fb9c384d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> No, unless you can provide a really compelling reason to do so, the
> goal is to *not* specify Linux implementation detail things like bus
> numbers in the device tree.
> 
> Instead, your code should be using spi device child nodes from the
> bus, or finding the spi bus node and decoding the dynamically assigned
> bus number from there.  Don't hard code spi bus numbers.

Ok, I understand that no operating system specific stuff should be
specified in the device tree. But: the bus numbers may be specified
by the hardware design or the used microcontroller, and I think 
there should be a way to propagate the bus name/number present in 
the hardware design to the operating system. Maybe by adding a 
'label' property, or by parsing the node name?

Documentation/spi/spi-summary tells us to use fixed numbers for SOC 
systems, but unfortunately, we have no method to specify them with
the device tree:

"
Bus numbering is important, since that's how Linux identifies a given
SPI bus (shared SCK, MOSI, MISO).  Valid bus numbers start at zero.  On
SOC systems, the bus numbers should match the numbers defined by the chip
manufacturer.  For example, hardware controller SPI2 would be bus number 2,
and spi_board_info for devices connected to it would use that number.

If you don't have such hardware-assigned bus number, and for some reason
you can't just assign them, then provide a negative bus number.  That will
then be replaced by a dynamically assigned number. You'd then need to treat
this as a non-static configuration (see above).
"

Ernst

P.S:
Unfortunately, the proposed patch wasn't sent to the mailing list by mistake,
so here it is again for reference.

---
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
