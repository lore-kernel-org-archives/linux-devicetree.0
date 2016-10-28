From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 09/10] staging: iio: tsl2583: add error code to sysfs store
 functions
Date: Fri, 28 Oct 2016 06:00:20 -0400
Message-ID: <1477648821-3786-10-git-send-email-masneyb@onstation.org>
References: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, Mark.Rutland@arm.com
List-Id: devicetree@vger.kernel.org

in_illuminance_input_target_store() and in_illuminance_calibrate_store()
validated the data from userspace, however it would not return an
error code to userspace if an invalid value was passed in. This patch
changes these functions so that they return -EINVAL if invalid data is
passed in.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/staging/iio/light/tsl2583.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/iio/light/tsl2583.c b/drivers/staging/iio/light/tsl2583.c
index 1462374..98afa5b 100644
--- a/drivers/staging/iio/light/tsl2583.c
+++ b/drivers/staging/iio/light/tsl2583.c
@@ -525,11 +525,10 @@ static ssize_t in_illuminance_input_target_store(struct device *dev,
 	struct tsl2583_chip *chip = iio_priv(indio_dev);
 	int value;
 
-	if (kstrtoint(buf, 0, &value))
+	if (kstrtoint(buf, 0, &value) || !value)
 		return -EINVAL;
 
-	if (value)
-		chip->taos_settings.als_cal_target = value;
+	chip->taos_settings.als_cal_target = value;
 
 	return len;
 }
@@ -541,11 +540,10 @@ static ssize_t in_illuminance_calibrate_store(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	int value;
 
-	if (kstrtoint(buf, 0, &value))
+	if (kstrtoint(buf, 0, &value) || value != 1)
 		return -EINVAL;
 
-	if (value == 1)
-		taos_als_calibrate(indio_dev);
+	taos_als_calibrate(indio_dev);
 
 	return len;
 }
-- 
2.7.4
