From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V4 2/4] iio: adc: ad_sigma_delta: Export ad_sd_calibrate
Date: Mon, 2 Sep 2019 16:08:29 +0300
Message-ID: <20190902130831.23057-2-mircea.caprioru@analog.com>
References: <20190902130831.23057-1-mircea.caprioru@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902130831.23057-1-mircea.caprioru@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Michael.Hennerich@analog.com, stefan.popa@analog.com, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-Id: devicetree@vger.kernel.org

This patch exports the ad_sd_calibrate function in order to be able to
call it from outside ad_sigma_delta.

There are cases where the option to calibrate one channel at a time is
necessary (ex. system calibration for zero scale and full scale).

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---
Changelog V2:
- no changes here

Changelog V3:
- no changes here

Changelog V4:
- no changes here

 drivers/iio/adc/ad_sigma_delta.c       | 3 ++-
 include/linux/iio/adc/ad_sigma_delta.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 2640b75fb774..8ba90486c787 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -205,7 +205,7 @@ int ad_sd_reset(struct ad_sigma_delta *sigma_delta,
 }
 EXPORT_SYMBOL_GPL(ad_sd_reset);
 
-static int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
+int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
 	unsigned int mode, unsigned int channel)
 {
 	int ret;
@@ -242,6 +242,7 @@ static int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ad_sd_calibrate);
 
 /**
  * ad_sd_calibrate_all() - Performs channel calibration
diff --git a/include/linux/iio/adc/ad_sigma_delta.h b/include/linux/iio/adc/ad_sigma_delta.h
index 7716fa0c9fce..8a4e25a7080c 100644
--- a/include/linux/iio/adc/ad_sigma_delta.h
+++ b/include/linux/iio/adc/ad_sigma_delta.h
@@ -119,6 +119,8 @@ int ad_sd_reset(struct ad_sigma_delta *sigma_delta,
 
 int ad_sigma_delta_single_conversion(struct iio_dev *indio_dev,
 	const struct iio_chan_spec *chan, int *val);
+int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
+	unsigned int mode, unsigned int channel);
 int ad_sd_calibrate_all(struct ad_sigma_delta *sigma_delta,
 	const struct ad_sd_calib_data *cd, unsigned int n);
 int ad_sd_init(struct ad_sigma_delta *sigma_delta, struct iio_dev *indio_dev,
-- 
2.17.1
