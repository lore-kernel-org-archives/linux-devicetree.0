Return-Path: <SRS0=HuNs=R5=linux.intel.com=andriy.shevchenko@kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RFC][PATCH v1] spi: Introduce custom GPIO chip select for slave devices
Date: Tue, 26 Mar 2019 23:29:18 +0200
Message-Id: <20190326212918.18541-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Ferry Toth <fntoth@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

The SPI hardware interface requires to have clock, data, and chip select
lines to communicate with a certain chip on the bus.

Historically the chip select lines were related to the SPI controller
itself ("native" mode), however there is no technical obstacles to make
any controllable pin as chip select. And thus no limitation to the
amount of chip select pins should be put in such case.

As a result here is a proposal to logically split "native" and GPIO chip
select pins and make it possible for slave device to choose which pin it
will use.

Rationale points here are:
- it's actually not a business of the SPI controller to know what
resource might be used as a chip select except "native" ones
- some of the controllers would like to request GPIOs as soon as the
controller itself is being registered, which is an artificial limitation
of what GPIOs and when can be used as CS pins
- as a continuation of previous point the CS pin can't be reused at
runtime until entire controller will gone, the easy example that can
come up is MMC SPI where we can multiplex GPIO CS based on card
detection
- (I dunno if DT overlays allow to expand amount of CS pins at run-time)
- last, but not least, is a firmware, that can't be modified by user on
a board where some pins still available for general purpose use and user
would like to re-use them for custom SPI slave device

The split itself is simple an introduction of the "spi-cs-gpios"
property for the slave device. SPI core will handle this for all
supported controllers.

Known issues / TODO list:
- needs flag to handle such cases to avoid freeing controller owned
GPIO descriptors
- clean up is not correct in error path
- device tree support
- split patch to device tree bindings and main part

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- it is sent as RFC to gather opinions
- it has been tested on x86 hardware with 74x164 SPI GPIO expander connected

 .../devicetree/bindings/spi/spi-bus.txt        |  5 ++++-
 drivers/spi/spi.c                              | 18 +++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
index 1f6e86f787ef..7f5ff64efc7d 100644
--- a/Documentation/devicetree/bindings/spi/spi-bus.txt
+++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
@@ -69,6 +69,8 @@ All slave nodes can contain the following optional properties:
 		    phase (CPHA) mode.
 - spi-cs-high     - Empty property indicating device requires chip select
 		    active high.
+- spi-cs-gpios    - Custom chip select for this device, when provided reg
+		    property must be 0.
 - spi-3wire       - Empty property indicating device requires 3-wire mode.
 - spi-lsb-first   - Empty property indicating device requires LSB first mode.
 - spi-tx-bus-width - The bus width (number of data wires) that is used for MOSI.
@@ -86,7 +88,8 @@ only 1 (SINGLE), 2 (DUAL) and 4 (QUAD).
 Dual/Quad mode is not allowed when 3-wire mode is used.
 
 If a gpio chipselect is used for the SPI slave the gpio number will be passed
-via the SPI master node cs-gpios property.
+via the SPI master node cs-gpios property or, when it's not possible, via
+spi-cs-gpios property in slave configuration.
 
 SPI example for an MPC5200 SPI bus:
 	spi@f00 {
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 93986f879b09..111e9705eb96 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -535,7 +535,8 @@ static int spi_dev_check(struct device *dev, void *data)
 	struct spi_device *new_spi = data;
 
 	if (spi->controller == new_spi->controller &&
-	    spi->chip_select == new_spi->chip_select)
+	    spi->chip_select == new_spi->chip_select &&
+	    !new_spi->cs_gpiod)
 		return -EBUSY;
 	return 0;
 }
@@ -580,7 +581,9 @@ int spi_add_device(struct spi_device *spi)
 	}
 
 	/* Descriptors take precedence */
-	if (ctlr->cs_gpiods)
+	if (spi->cs_gpiod)
+		dev_dbg(dev, "chipselect is provided by slave\n");
+	else if (ctlr->cs_gpiods)
 		spi->cs_gpiod = ctlr->cs_gpiods[spi->chip_select];
 	else if (ctlr->cs_gpios)
 		spi->cs_gpio = ctlr->cs_gpios[spi->chip_select];
@@ -693,8 +696,11 @@ void spi_unregister_device(struct spi_device *spi)
 		of_node_clear_flag(spi->dev.of_node, OF_POPULATED);
 		of_node_put(spi->dev.of_node);
 	}
-	if (ACPI_COMPANION(&spi->dev))
+	if (ACPI_COMPANION(&spi->dev)) {
+		gpiod_put(spi->cs_gpiod);
+		spi->cs_gpiod = NULL;
 		acpi_device_clear_enumerated(ACPI_COMPANION(&spi->dev));
+	}
 	device_unregister(&spi->dev);
 }
 EXPORT_SYMBOL_GPL(spi_unregister_device);
@@ -1910,6 +1916,12 @@ static acpi_status acpi_register_spi_device(struct spi_controller *ctlr,
 	if (spi->irq < 0)
 		spi->irq = acpi_dev_gpio_irq_get(adev, 0);
 
+	spi->cs_gpiod = gpiod_get_optional(&spi->dev, "spi-cs", GPIOD_ASIS);
+	if (IS_ERR(spi->cs_gpiod)) {
+		spi_dev_put(spi);
+		return AE_OK;
+	}
+
 	acpi_device_set_enumerated(adev);
 
 	adev->power.flags.ignore_parent = true;
-- 
2.20.1
