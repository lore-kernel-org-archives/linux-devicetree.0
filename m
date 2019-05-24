From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 4/6] crypto: atmel-i2c: add support for SHA204A random
 number generator
Date: Fri, 24 May 2019 18:26:49 +0200
Message-ID: <20190524162651.28189-5-ard.biesheuvel@linaro.org>
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

The Linaro/96boards Secure96 mezzanine contains (among other things)
an Atmel SHA204A symmetric crypto processor. This chip implements a
number of different functionalities, but one that is highly useful
for many different 96boards platforms is the random number generator.

So let's implement a driver for the SHA204A, and for the time being,
implement support for the random number generator only.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/Kconfig         |  14 ++
 drivers/crypto/Makefile        |   1 +
 drivers/crypto/atmel-i2c.c     |  15 ++
 drivers/crypto/atmel-i2c.h     |  10 ++
 drivers/crypto/atmel-sha204a.c | 171 ++++++++++++++++++++
 5 files changed, 211 insertions(+)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index ca7a5564e9ce..fe01a9905ab1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -537,6 +537,20 @@ config CRYPTO_DEV_ATMEL_ECC
 	  To compile this driver as a module, choose M here: the module
 	  will be called atmel-ecc.
 
+config CRYPTO_DEV_ATMEL_SHA204A
+	tristate "Support for Microchip / Atmel SHA accelerator and RNG"
+	depends on I2C
+	select CRYPTO_DEV_ATMEL_I2C
+	select HW_RANDOM
+	help
+	  Microhip / Atmel SHA accelerator and RNG.
+	  Select this if you want to use the Microchip / Atmel SHA204A
+	  module as a random number generator. (Other functions of the
+	  chip are currently not exposed by this driver)
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called atmel-sha204a.
+
 config CRYPTO_DEV_CCP
 	bool "Support for AMD Secure Processor"
 	depends on ((X86 && PCI) || (ARM64 && (OF_ADDRESS || ACPI))) && HAS_IOMEM
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 394e84089924..afc4753b5d28 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_CRYPTO_DEV_ATMEL_SHA) += atmel-sha.o
 obj-$(CONFIG_CRYPTO_DEV_ATMEL_TDES) += atmel-tdes.o
 obj-$(CONFIG_CRYPTO_DEV_ATMEL_I2C) += atmel-i2c.o
 obj-$(CONFIG_CRYPTO_DEV_ATMEL_ECC) += atmel-ecc.o
+obj-$(CONFIG_CRYPTO_DEV_ATMEL_SHA204A) += atmel-sha204a.o
 obj-$(CONFIG_CRYPTO_DEV_CAVIUM_ZIP) += cavium/
 obj-$(CONFIG_CRYPTO_DEV_CCP) += ccp/
 obj-$(CONFIG_CRYPTO_DEV_CCREE) += ccree/
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 5e099368d120..be49ab7f4338 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -58,6 +58,21 @@ void atmel_i2c_init_read_cmd(struct atmel_i2c_cmd *cmd)
 }
 EXPORT_SYMBOL(atmel_i2c_init_read_cmd);
 
+void atmel_i2c_init_random_cmd(struct atmel_i2c_cmd *cmd)
+{
+	cmd->word_addr = COMMAND;
+	cmd->opcode = OPCODE_RANDOM;
+	cmd->param1 = 0;
+	cmd->param2 = 0;
+	cmd->count = RANDOM_COUNT;
+
+	atmel_i2c_checksum(cmd);
+
+	cmd->msecs = MAX_EXEC_TIME_RANDOM;
+	cmd->rxsize = RANDOM_RSP_SIZE;
+}
+EXPORT_SYMBOL(atmel_i2c_init_random_cmd);
+
 void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid)
 {
 	cmd->word_addr = COMMAND;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 82de5166acfa..c6bd43b78f33 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -7,6 +7,8 @@
 #ifndef __ATMEL_I2C_H__
 #define __ATMEL_I2C_H__
 
+#include <linux/hw_random.h>
+
 #define ATMEL_ECC_PRIORITY		300
 
 #define COMMAND				0x03 /* packet function */
@@ -28,6 +30,7 @@
 #define GENKEY_RSP_SIZE			(ATMEL_ECC_PUBKEY_SIZE + \
 					 CMD_OVERHEAD_SIZE)
 #define READ_RSP_SIZE			(4 + CMD_OVERHEAD_SIZE)
+#define RANDOM_RSP_SIZE			(32 + CMD_OVERHEAD_SIZE)
 #define MAX_RSP_SIZE			GENKEY_RSP_SIZE
 
 /**
@@ -96,15 +99,20 @@ static const struct {
 #define MAX_EXEC_TIME_ECDH		58
 #define MAX_EXEC_TIME_GENKEY		115
 #define MAX_EXEC_TIME_READ		1
+#define MAX_EXEC_TIME_RANDOM		50
 
 /* Command opcode */
 #define OPCODE_ECDH			0x43
 #define OPCODE_GENKEY			0x40
 #define OPCODE_READ			0x02
+#define OPCODE_RANDOM			0x1b
 
 /* Definitions for the READ Command */
 #define READ_COUNT			7
 
+/* Definitions for the RANDOM Command */
+#define RANDOM_COUNT			7
+
 /* Definitions for the GenKey Command */
 #define GENKEY_COUNT			7
 #define GENKEY_MODE_PRIVATE		0x04
@@ -142,6 +150,7 @@ struct atmel_i2c_client_priv {
 	u8 wake_token[WAKE_TOKEN_MAX_SIZE];
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
+	struct hwrng hwrng;
 };
 
 /**
@@ -179,6 +188,7 @@ void atmel_i2c_enqueue(struct atmel_i2c_work_data *work_data,
 int atmel_i2c_send_receive(struct i2c_client *client, struct atmel_i2c_cmd *cmd);
 
 void atmel_i2c_init_read_cmd(struct atmel_i2c_cmd *cmd);
+void atmel_i2c_init_random_cmd(struct atmel_i2c_cmd *cmd);
 void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
new file mode 100644
index 000000000000..ea0d2068ea4f
--- /dev/null
+++ b/drivers/crypto/atmel-sha204a.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip / Atmel SHA204A (I2C) driver.
+ *
+ * Copyright (c) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include "atmel-i2c.h"
+
+static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
+				   void *areq, int status)
+{
+	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
+	struct hwrng *rng = areq;
+
+	if (status)
+		dev_warn_ratelimited(&i2c_priv->client->dev,
+				     "i2c transaction failed (%d)\n",
+				     status);
+
+	rng->priv = (unsigned long)work_data;
+	atomic_dec(&i2c_priv->tfm_count);
+}
+
+static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
+					      size_t max)
+{
+	struct atmel_i2c_client_priv *i2c_priv;
+	struct atmel_i2c_work_data *work_data;
+
+	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
+
+	/* keep maximum 1 asynchronous read in flight at any time */
+	if (!atomic_add_unless(&i2c_priv->tfm_count, 1, 1))
+		return 0;
+
+	if (rng->priv) {
+		work_data = (struct atmel_i2c_work_data *)rng->priv;
+		max = min(sizeof(work_data->cmd.data), max);
+		memcpy(data, &work_data->cmd.data, max);
+		rng->priv = 0;
+	} else {
+		work_data = kmalloc(sizeof(*work_data), GFP_ATOMIC);
+		if (!work_data)
+			return -ENOMEM;
+
+		work_data->ctx = i2c_priv;
+		work_data->client = i2c_priv->client;
+
+		max = 0;
+	}
+
+	atmel_i2c_init_random_cmd(&work_data->cmd);
+	atmel_i2c_enqueue(work_data, atmel_sha204a_rng_done, rng);
+
+	return max;
+}
+
+static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
+				  bool wait)
+{
+	struct atmel_i2c_client_priv *i2c_priv;
+	struct atmel_i2c_cmd cmd;
+	int ret;
+
+	if (!wait)
+		return atmel_sha204a_rng_read_nonblocking(rng, data, max);
+
+	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
+
+	atmel_i2c_init_random_cmd(&cmd);
+
+	ret = atmel_i2c_send_receive(i2c_priv->client, &cmd);
+	if (ret)
+		return ret;
+
+	max = min(sizeof(cmd.data), max);
+	memcpy(data, cmd.data, max);
+
+	return max;
+}
+
+static int atmel_sha204a_probe(struct i2c_client *client,
+			       const struct i2c_device_id *id)
+{
+	struct atmel_i2c_client_priv *i2c_priv;
+	int ret;
+
+	ret = atmel_i2c_probe(client, id);
+	if (ret)
+		return ret;
+
+	i2c_priv = i2c_get_clientdata(client);
+
+	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
+
+	i2c_priv->hwrng.name = dev_name(&client->dev);
+	i2c_priv->hwrng.read = atmel_sha204a_rng_read;
+	i2c_priv->hwrng.quality = 1024;
+
+	ret = hwrng_register(&i2c_priv->hwrng);
+	if (ret)
+		dev_warn(&client->dev, "failed to register RNG (%d)\n", ret);
+
+	return ret;
+}
+
+static int atmel_sha204a_remove(struct i2c_client *client)
+{
+	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
+
+	if (atomic_read(&i2c_priv->tfm_count)) {
+		dev_err(&client->dev, "Device is busy\n");
+		return -EBUSY;
+	}
+
+	if (i2c_priv->hwrng.priv)
+		kfree((void *)i2c_priv->hwrng.priv);
+	hwrng_unregister(&i2c_priv->hwrng);
+
+	return 0;
+}
+
+static const struct of_device_id atmel_sha204a_dt_ids[] = {
+	{ .compatible = "atmel,atsha204a", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
+
+static const struct i2c_device_id atmel_sha204a_id[] = {
+	{ "atsha204a", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);
+
+static struct i2c_driver atmel_sha204a_driver = {
+	.probe			= atmel_sha204a_probe,
+	.remove			= atmel_sha204a_remove,
+	.id_table		= atmel_sha204a_id,
+
+	.driver.name		= "atmel-sha204a",
+	.driver.of_match_table	= of_match_ptr(atmel_sha204a_dt_ids),
+};
+
+static int __init atmel_sha204a_init(void)
+{
+	return i2c_add_driver(&atmel_sha204a_driver);
+}
+
+static void __exit atmel_sha204a_exit(void)
+{
+	flush_scheduled_work();
+	i2c_del_driver(&atmel_sha204a_driver);
+}
+
+module_init(atmel_sha204a_init);
+module_exit(atmel_sha204a_exit);
+
+MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1
