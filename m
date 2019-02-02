Return-Path: <>
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH v4 5/6] iio:bmi160: use iio_pollfunc_store_time
Date: Sat,  2 Feb 2019 13:56:00 -0800
Message-Id: <20190202215601.20275-6-martin@martingkelly.com>
In-Reply-To: <20190202215601.20275-1-martin@martingkelly.com>
References: <20190202215601.20275-1-martin@martingkelly.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org, Martin Kelly <martin@martingkelly.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Kelly <martin@martingkelly.com>

Currently, we snap the timestamp after reading from the buffer and
processing the event. When the IIO poll function is triggered by an
interrupt,  we can get a slightly more accurate timestamp by snapping it
prior to reading the data, since the data was already generated prior to
entering the trigger handler. This is not going to make a huge difference,
but we might as well improve slightly.

Do this by using iio_pollfunc_store_time as other drivers do.

Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
 drivers/iio/imu/bmi160/bmi160_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index 007f7c532ac4..f3c5b86a281e 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -425,8 +425,7 @@ static irqreturn_t bmi160_trigger_handler(int irq, void *p)
 		buf[j++] = sample;
 	}
 
-	iio_push_to_buffers_with_timestamp(indio_dev, buf,
-					   iio_get_time_ns(indio_dev));
+	iio_push_to_buffers_with_timestamp(indio_dev, buf, pf->timestamp);
 done:
 	iio_trigger_notify_done(indio_dev->trig);
 	return IRQ_HANDLED;
@@ -834,7 +833,8 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->info = &bmi160_info;
 
-	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
 					      bmi160_trigger_handler, NULL);
 	if (ret < 0)
 		return ret;
-- 
2.11.0
