Return-Path: <SRS0=gR28=TN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from da1vs03.rockwellcollins.com ([205.175.227.47]:49607 "EHLO
        da1vs03.rockwellcollins.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730696AbfEMOxx (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 May 2019 10:53:53 -0400
From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
Subject: [PATCH v3 5/5] iio: ad7949: Remove logic for config readback
Date: Mon, 13 May 2019 09:53:05 -0500
Message-Id: <1557759185-167857-5-git-send-email-adam.michaelis@rockwellcollins.com>
In-Reply-To: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
References: <1557759185-167857-1-git-send-email-adam.michaelis@rockwellcollins.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org, brandon.maier@rockwellcollins.com, clayton.shotwell@rockwellcollins.com, Adam Michaelis <adam.michaelis@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

The AD7949 has a feature to include the configuration register value
used to generate the ADC sample. This feature is configurable, but do
not see a good use case for it in the driver (neither did reviewing
maintainers), so removing the supporting logic in order to simplify the
driver.

Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
---
	V3:
	- First version of series with this patch. Maintainers agreed
	that this capability of the hardware is not useful and should
	be dropped from driver.
---
 drivers/iio/adc/ad7949.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/ad7949.c b/drivers/iio/adc/ad7949.c
index d67033a008e5..bac16a2f7850 100644
--- a/drivers/iio/adc/ad7949.c
+++ b/drivers/iio/adc/ad7949.c
@@ -102,24 +102,6 @@ static void ad7949_set_bits_per_word(struct ad7949_adc_chip *ad7949_adc)
 		ad7949_adc->bits_per_word = 8;
 }
 
-static bool ad7949_spi_cfg_is_read_back(struct ad7949_adc_chip *ad7949_adc)
-{
-	if (!(ad7949_adc->cfg & AD7949_CFG_READBACK))
-		return true;
-
-	return false;
-}
-
-static int ad7949_message_len(struct ad7949_adc_chip *ad7949_adc)
-{
-	int tx_len = 2;
-
-	if (ad7949_spi_cfg_is_read_back(ad7949_adc))
-		tx_len += 2;
-
-	return tx_len;
-}
-
 static int ad7949_spi_write_cfg(struct ad7949_adc_chip *ad7949_adc, u16 val,
 				u16 mask)
 {
@@ -129,7 +111,7 @@ static int ad7949_spi_write_cfg(struct ad7949_adc_chip *ad7949_adc, u16 val,
 	struct spi_transfer tx[] = {
 		{
 			.tx_buf = &ad7949_adc->buffer,
-			.len = ad7949_message_len(ad7949_adc),
+			.len = 2,
 			.bits_per_word = ad7949_adc->bits_per_word,
 		}
 	};
@@ -197,7 +179,7 @@ static int ad7949_spi_read_channel(struct ad7949_adc_chip *ad7949_adc, int *val,
 	struct spi_transfer tx[] = {
 		{
 			.rx_buf = &ad7949_adc->buffer,
-			.len = ad7949_message_len(ad7949_adc),
+			.len = 2,
 			.bits_per_word = ad7949_adc->bits_per_word,
 		}
 	};
-- 
1.9.1
