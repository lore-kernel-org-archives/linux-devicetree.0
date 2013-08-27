From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [patch] iio: adc: twl6030-gpadc: returning success instead of error
Date: Tue, 27 Aug 2013 04:19:02 +0300
Message-ID: <20130827011902.GC17061@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Oleksandr Kozaruk <oleksandr.kozaruk-l0cyMroinI0@public.gmane.org>, Graeme Gregory <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Balaji T K <balajitk-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I've moved the goto down a line after we set the error code.

Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/iio/adc/twl6030-gpadc.c b/drivers/iio/adc/twl6030-gpadc.c
index a558516..0ea96c0 100644
--- a/drivers/iio/adc/twl6030-gpadc.c
+++ b/drivers/iio/adc/twl6030-gpadc.c
@@ -537,8 +537,8 @@ static int twl6030_gpadc_read_raw(struct iio_dev *indio_dev,
 		ret = -ETIMEDOUT;
 		goto err;
 	} else if (timeout < 0) {
-		goto err;
 		ret = -EINTR;
+		goto err;
 	}
 
 	switch (mask) {
