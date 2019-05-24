From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 2/6] crypto: atmel-ecc: add support for ACPI probing on
 non-AT91 platforms
Date: Fri, 24 May 2019 18:26:47 +0200
Message-ID: <20190524162651.28189-3-ard.biesheuvel@linaro.org>
References: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Tudor Ambarus <tudor.ambarus@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Atmel/Microchip EC508A is a I2C device that could be wired into
any platform, and is being used on the Linaro/96boards Secure96
mezzanine adapter. This means it could be found on any platform, even
on ones that use ACPI enumeration (via PRP0001 devices). So update the
code to enable this use case.

This involves tweaking the bus rate discovery code to take ACPI probing
into account, which records the maximum bus rate as a property of the
slave device. For the atmel-ecc code, this means that the effective bus
rate should never exceed the maximum rate, unless we are dealing with
buggy firmware. Nonetheless, let's just use the existing plumbing to
discover the bus rate and keep the existing logic intact.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/Kconfig     |  1 -
 drivers/crypto/atmel-ecc.c | 13 ++++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0af08081e305..97ec8107eeef 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -522,7 +522,6 @@ config CRYPTO_DEV_ATMEL_SHA
 
 config CRYPTO_DEV_ATMEL_ECC
 	tristate "Support for Microchip / Atmel ECC hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
 	depends on I2C
 	select CRYPTO_ECDH
 	select CRC16
diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index ba00e4563ca0..5705348f540f 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -657,11 +657,14 @@ static int atmel_ecc_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	ret = of_property_read_u32(client->adapter->dev.of_node,
-				   "clock-frequency", &bus_clk_rate);
-	if (ret) {
-		dev_err(dev, "of: failed to read clock-frequency property\n");
-		return ret;
+	clk_rate = i2c_acpi_find_bus_speed(&client->adapter->dev);
+	if (!clk_rate) {
+		ret = device_property_read_u32(&client->adapter->dev,
+					       "clock-frequency", &bus_clk_rate);
+		if (ret) {
+			dev_err(dev, "failed to read clock-frequency property\n");
+			return ret;
+		}
 	}
 
 	if (bus_clk_rate > 1000000L) {
-- 
2.20.1
