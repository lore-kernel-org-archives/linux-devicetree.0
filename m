From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH 4/4] iio: frequency: adf4371: Add support for output stage mute
Date: Mon, 24 Jun 2019 18:13:56 +0300
Message-ID: <1561389236-26464-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

Another feature of the ADF4371/ADF4372 is that the supply current to the
RF8P and RF8N output stage can shut down until the ADF4371 achieves lock
as measured by the digital lock detect circuitry. The mute to lock
detect bit (MUTE_LD) in REG25 enables this function.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 .../devicetree/bindings/iio/frequency/adf4371.yaml          |  6 ++++++
 drivers/iio/frequency/adf4371.c                             | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
index a268a9d..6db8742 100644
--- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
+++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
@@ -32,6 +32,12 @@ properties:
     items:
       - clkin
 
+  adi,mute-till-lock-en:
+    description:
+      If this property is present, then the supply current to RF8P and RF8N
+      output stage will shut down until the ADF4371/ADF4372 achieves lock as
+      measured by the digital lock detect circuitry.
+
 required:
   - compatible
   - reg
diff --git a/drivers/iio/frequency/adf4371.c b/drivers/iio/frequency/adf4371.c
index f874219..e48f15c 100644
--- a/drivers/iio/frequency/adf4371.c
+++ b/drivers/iio/frequency/adf4371.c
@@ -45,6 +45,10 @@
 #define ADF4371_RF_DIV_SEL_MSK		GENMASK(6, 4)
 #define ADF4371_RF_DIV_SEL(x)		FIELD_PREP(ADF4371_RF_DIV_SEL_MSK, x)
 
+/* ADF4371_REG25 */
+#define ADF4371_MUTE_LD_MSK		BIT(7)
+#define ADF4371_MUTE_LD(x)		FIELD_PREP(ADF4371_MUTE_LD_MSK, x)
+
 /* ADF4371_REG32 */
 #define ADF4371_TIMEOUT_MSK		GENMASK(1, 0)
 #define ADF4371_TIMEOUT(x)		FIELD_PREP(ADF4371_TIMEOUT_MSK, x)
@@ -484,6 +488,15 @@ static int adf4371_setup(struct adf4371_state *st)
 	if (ret < 0)
 		return ret;
 
+	/* Mute to Lock Detect */
+	if (device_property_read_bool(&st->spi->dev, "adi,mute-till-lock-en")) {
+		ret = regmap_update_bits(st->regmap, ADF4371_REG(0x25),
+					 ADF4371_MUTE_LD_MSK,
+					 ADF4371_MUTE_LD(1));
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Set address in ascending order, so the bulk_write() will work */
 	ret = regmap_update_bits(st->regmap, ADF4371_REG(0x0),
 				 ADF4371_ADDR_ASC_MSK | ADF4371_ADDR_ASC_R_MSK,
-- 
2.7.4
