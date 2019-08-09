From: Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH] Add optional chip erase functionality to AT25 EEPROM driver.
Date: Fri,  9 Aug 2019 13:53:55 +0100
Message-ID: <20190809125358.24440-1-joe.burmeister@devtank.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: joe.burmeister@devtank.co.uk, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Many, though not all, AT25s have an instruction for chip erase.
If there is one in the datasheet, it can be added to device tree.
Erase can then be done in userspace via the sysfs API with a new
"erase" device attribute. This matches the eeprom_93xx46 driver's
"erase".

Signed-off-by: Joe Burmeister <joe.burmeister@devtank.co.uk>
---
 .../devicetree/bindings/eeprom/at25.txt       |  2 +
 drivers/misc/eeprom/at25.c                    | 83 ++++++++++++++++++-
 2 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.txt b/Documentation/devicetree/bindings/eeprom/at25.txt
index b3bde97dc199..c65d11e14c7a 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.txt
+++ b/Documentation/devicetree/bindings/eeprom/at25.txt
@@ -19,6 +19,7 @@ Optional properties:
 - spi-cpha : SPI shifted clock phase, as per spi-bus bindings.
 - spi-cpol : SPI inverse clock polarity, as per spi-bus bindings.
 - read-only : this parameter-less property disables writes to the eeprom
+- chip_erase_instruction : Chip erase instruction for this AT25, often 0xc7 or 0x62.
 
 Obsolete legacy properties can be used in place of "size", "pagesize",
 "address-width", and "read-only":
@@ -39,4 +40,5 @@ Example:
 		pagesize = <64>;
 		size = <32768>;
 		address-width = <16>;
+		chip_erase_instruction = <0x62>;
 	};
diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 99de6939cd5a..28141bc4028f 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -35,6 +35,7 @@ struct at25_data {
 	unsigned		addrlen;
 	struct nvmem_config	nvmem_config;
 	struct nvmem_device	*nvmem;
+	u8			erase_instr;
 };
 
 #define	AT25_WREN	0x06		/* latch the write enable */
@@ -59,6 +60,8 @@ struct at25_data {
  */
 #define	EE_TIMEOUT	25
 
+#define ERASE_TIMEOUT 2020
+
 /*-------------------------------------------------------------------------*/
 
 #define	io_limit	PAGE_SIZE	/* bytes */
@@ -304,6 +307,71 @@ static int at25_fw_to_chip(struct device *dev, struct spi_eeprom *chip)
 	return 0;
 }
 
+static void _eeprom_at25_store_erase_locked(struct at25_data *at25)
+{
+	unsigned long	timeout, retries;
+	int				sr, status;
+	u8	cp;
+
+	cp = AT25_WREN;
+	status = spi_write(at25->spi, &cp, 1);
+	if (status < 0) {
+		dev_dbg(&at25->spi->dev, "ERASE WREN --> %d\n", status);
+		return;
+	}
+	cp = at25->erase_instr;
+	status = spi_write(at25->spi, &cp, 1);
+	if (status < 0) {
+		dev_dbg(&at25->spi->dev, "CHIP_ERASE --> %d\n", status);
+		return;
+	}
+	/* Wait for non-busy status */
+	timeout = jiffies + msecs_to_jiffies(ERASE_TIMEOUT);
+	retries = 0;
+	do {
+		sr = spi_w8r8(at25->spi, AT25_RDSR);
+		if (sr < 0 || (sr & AT25_SR_nRDY)) {
+			dev_dbg(&at25->spi->dev,
+				"rdsr --> %d (%02x)\n", sr, sr);
+			/* at HZ=100, this is sloooow */
+			msleep(1);
+			continue;
+		}
+		if (!(sr & AT25_SR_nRDY))
+			return;
+	} while (retries++ < 200 || time_before_eq(jiffies, timeout));
+
+	if ((sr < 0) || (sr & AT25_SR_nRDY)) {
+		dev_err(&at25->spi->dev,
+			"chip erase, timeout after %u msecs\n",
+			jiffies_to_msecs(jiffies -
+				(timeout - ERASE_TIMEOUT)));
+		status = -ETIMEDOUT;
+		return;
+	}
+}
+
+
+static ssize_t eeprom_at25_store_erase(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct at25_data *at25 = dev_get_drvdata(dev);
+	int erase = 0;
+
+	sscanf(buf, "%d", &erase);
+	if (erase) {
+		mutex_lock(&at25->lock);
+		_eeprom_at25_store_erase_locked(at25);
+		mutex_unlock(&at25->lock);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR(erase, S_IWUSR, NULL, eeprom_at25_store_erase);
+
+
 static int at25_probe(struct spi_device *spi)
 {
 	struct at25_data	*at25 = NULL;
@@ -311,6 +379,7 @@ static int at25_probe(struct spi_device *spi)
 	int			err;
 	int			sr;
 	int			addrlen;
+	int			has_erase;
 
 	/* Chip description */
 	if (!spi->dev.platform_data) {
@@ -352,6 +421,9 @@ static int at25_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, at25);
 	at25->addrlen = addrlen;
 
+	/* Optional chip erase instruction */
+	device_property_read_u8(&spi->dev, "chip_erase_instruction", &at25->erase_instr);
+
 	at25->nvmem_config.name = dev_name(&spi->dev);
 	at25->nvmem_config.dev = &spi->dev;
 	at25->nvmem_config.read_only = chip.flags & EE_READONLY;
@@ -370,17 +442,22 @@ static int at25_probe(struct spi_device *spi)
 	if (IS_ERR(at25->nvmem))
 		return PTR_ERR(at25->nvmem);
 
-	dev_info(&spi->dev, "%d %s %s eeprom%s, pagesize %u\n",
+	has_erase = (!(chip.flags & EE_READONLY) && at25->erase_instr);
+
+	dev_info(&spi->dev, "%d %s %s eeprom%s, pagesize %u%s\n",
 		(chip.byte_len < 1024) ? chip.byte_len : (chip.byte_len / 1024),
 		(chip.byte_len < 1024) ? "Byte" : "KByte",
 		at25->chip.name,
 		(chip.flags & EE_READONLY) ? " (readonly)" : "",
-		at25->chip.page_size);
+		at25->chip.page_size, (has_erase)?" <has erase>":"");
+
+	if (has_erase && device_create_file(&spi->dev, &dev_attr_erase))
+		dev_err(&spi->dev, "can't create erase interface\n");
+
 	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
-
 static const struct of_device_id at25_of_match[] = {
 	{ .compatible = "atmel,at25", },
 	{ }
-- 
2.20.1
