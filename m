From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] mfd: cros ec: spi: Increase EC transaction delay
Date: Mon, 18 Nov 2013 11:30:48 +0100
Message-ID: <1384770649-8593-2-git-send-email-treding@nvidia.com>
References: <1384770649-8593-1-git-send-email-treding@nvidia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384770649-8593-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

50 us is not a long enough delay between EC transactions. At least 70 us
are needed for the 16 MHz STM32L part. Increase the delay to 200 us for
an extra safety margin.

Signed-off-by: Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Randall Spangler <rspangler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/cros_ec_spi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index d05349a7381e..af5c2f6601cf 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -51,10 +51,11 @@
 /*
   * Time between raising the SPI chip select (for the end of a
   * transaction) and dropping it again (for the next transaction).
-  * If we go too fast, the EC will miss the transaction. It seems
-  * that 50us is enough with the 16MHz STM32 EC.
+  * If we go too fast, the EC will miss the transaction. We know that we
+  * need at least 70 us with the 16 MHz STM32 EC, so go with 200 us to be
+  * safe.
   */
-#define EC_SPI_RECOVERY_TIME_NS	(50 * 1000)
+#define EC_SPI_RECOVERY_TIME_NS	(200 * 1000)
 
 /**
  * struct cros_ec_spi - information about a SPI-connected EC
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
