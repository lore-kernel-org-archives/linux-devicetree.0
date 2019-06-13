From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 1/8] tpm: block messages while suspended
Date: Thu, 13 Jun 2019 11:09:24 -0700
Message-ID: <20190613180931.65445-2-swboyd@chromium.org>
References: <20190613180931.65445-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613180931.65445-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

From: Andrey Pronin <apronin@chromium.org>

Other drivers or userspace may initiate sending a message to the tpm
while the device itself and the controller of the bus it is on are
suspended. That may break the bus driver logic.
Block sending messages while the device is suspended.

Signed-off-by: Andrey Pronin <apronin@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I don't think this was ever posted before.

 drivers/char/tpm/tpm-interface.c | 16 ++++++++++++++--
 include/linux/tpm.h              |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index ae1030c9b086..7232527652e8 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -86,6 +86,11 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return -E2BIG;
 	}
 
+	if (test_bit(0, &chip->is_suspended)) {
+		dev_warn(&chip->dev, "blocking transmit while suspended\n");
+		return -EAGAIN;
+	}
+
 	rc = chip->ops->send(chip, buf, count);
 	if (rc < 0) {
 		if (rc != -EPIPE)
@@ -403,14 +408,19 @@ int tpm_pm_suspend(struct device *dev)
 		return 0;
 
 	if (!tpm_chip_start(chip)) {
-		if (chip->flags & TPM_CHIP_FLAG_TPM2)
+		if (chip->flags & TPM_CHIP_FLAG_TPM2) {
 			tpm2_shutdown(chip, TPM2_SU_STATE);
-		else
+			set_bit(0, &chip->is_suspended);
+		} else {
 			rc = tpm1_pm_suspend(chip, tpm_suspend_pcr);
+		}
 
 		tpm_chip_stop(chip);
 	}
 
+	if (!rc)
+		set_bit(0, &chip->is_suspended);
+
 	return rc;
 }
 EXPORT_SYMBOL_GPL(tpm_pm_suspend);
@@ -426,6 +436,8 @@ int tpm_pm_resume(struct device *dev)
 	if (chip == NULL)
 		return -ENODEV;
 
+	clear_bit(0, &chip->is_suspended);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tpm_pm_resume);
diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 1b5436b213a2..48df005228d0 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -132,6 +132,8 @@ struct tpm_chip {
 	int dev_num;		/* /dev/tpm# */
 	unsigned long is_open;	/* only one allowed */
 
+	unsigned long is_suspended;
+
 	char hwrng_name[64];
 	struct hwrng hwrng;
 
-- 
Sent by a computer through tubes
