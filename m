From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 3/8] tpm_tis_spi: add max xfer size
Date: Thu, 13 Jun 2019 11:09:26 -0700
Message-ID: <20190613180931.65445-4-swboyd@chromium.org>
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

Reject burstcounts larger than 64 bytes reported by tpm.
SPI Hardware Protocol defined in section 6.4 of TCG PTP
Spec supports up to 64 bytes of data in a transaction.

Signed-off-by: Andrey Pronin <apronin@chromium.org>
Reviewed-by: Dmitry Torokhov <dtor@chromium.org>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This is a resend of https://lkml.kernel.org/r/1469677797-74304-3-git-send-email-apronin@chromium.org

 drivers/char/tpm/tpm_tis_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/tpm/tpm_tis_spi.c b/drivers/char/tpm/tpm_tis_spi.c
index 9914f6973463..0fdd3966a3b3 100644
--- a/drivers/char/tpm/tpm_tis_spi.c
+++ b/drivers/char/tpm/tpm_tis_spi.c
@@ -194,6 +194,7 @@ static const struct tpm_tis_phy_ops tpm_spi_phy_ops = {
 	.read16 = tpm_tis_spi_read16,
 	.read32 = tpm_tis_spi_read32,
 	.write32 = tpm_tis_spi_write32,
+	.max_xfer_size = MAX_SPI_FRAMESIZE,
 };
 
 static int tpm_tis_spi_probe(struct spi_device *dev)
-- 
Sent by a computer through tubes
