From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 2/8] tpm_tis_core: add optional max xfer size check
Date: Thu, 13 Jun 2019 11:09:25 -0700
Message-ID: <20190613180931.65445-3-swboyd@chromium.org>
References: <20190613180931.65445-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613180931.65445-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org

From: Andrey Pronin <apronin@chromium.org>

If tpm reports a bigger burstcnt than allowed by the physical protocol,
set burstcnt to the max allowed value.

In practice, seen in case of xfer issues (e.g. in spi interface case,
lost header causing flow control issues and wrong values returned on read
from TPM_STS). Without catching, causes the physical layer to reject xfer.

Signed-off-by: Andrey Pronin <apronin@chromium.org>
Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
[swboyd@chromium.org: Drop extra parenthesis in if statement]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This is a resend of https://lkml.kernel.org/r/1469677797-74304-2-git-send-email-apronin@chromium.org

 drivers/char/tpm/tpm_tis_core.c | 9 ++++++++-
 drivers/char/tpm/tpm_tis_core.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index b9f64684c3fb..ecf703802333 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -272,8 +272,15 @@ static int get_burstcount(struct tpm_chip *chip)
 			return rc;
 
 		burstcnt = (value >> 8) & 0xFFFF;
-		if (burstcnt)
+		if (burstcnt) {
+			if (priv->phy_ops->max_xfer_size &&
+			    burstcnt > priv->phy_ops->max_xfer_size) {
+				dev_warn(&chip->dev,
+					 "Bad burstcnt read: %d\n", burstcnt);
+				burstcnt = priv->phy_ops->max_xfer_size;
+			}
 			return burstcnt;
+		}
 		usleep_range(TPM_TIMEOUT_USECS_MIN, TPM_TIMEOUT_USECS_MAX);
 	} while (time_before(jiffies, stop));
 	return -EBUSY;
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index f48125f1e6e0..bb4979cf81ed 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -110,6 +110,7 @@ struct tpm_tis_phy_ops {
 	int (*read16)(struct tpm_tis_data *data, u32 addr, u16 *result);
 	int (*read32)(struct tpm_tis_data *data, u32 addr, u32 *result);
 	int (*write32)(struct tpm_tis_data *data, u32 addr, u32 src);
+	u16 max_xfer_size;
 };
 
 static inline int tpm_tis_read_bytes(struct tpm_tis_data *data, u32 addr,
-- 
Sent by a computer through tubes
