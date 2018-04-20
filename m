From: David Veenstra <davidjulianveenstra@gmail.com>
Subject: [PATCH v2 12/13] staging: iio: ad2s1200: Add scaling factor for
 angle channel
Date: Fri, 20 Apr 2018 21:31:48 +0200
Message-ID: <9352ade3afee830795315b5931dfb316853dc094.1524247563.git.davidjulianveenstra@gmail.com>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1524247563.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: lars@metafoo.de, jic23@kernel.org, pmeerw@pmeerw.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

A fractional scaling factor of approximately 2 * Pi / (2^12 -1) is added,
to scale the 12-bits angular position to radians.

Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
---
Changes in v2:
  - This patch replaces the patch that changed the
    the channel for angular position to inclination
    channel.

 drivers/staging/iio/resolver/ad2s1200.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
index 6c56257be3b1..4f5dd28b174a 100644
--- a/drivers/staging/iio/resolver/ad2s1200.c
+++ b/drivers/staging/iio/resolver/ad2s1200.c
@@ -71,6 +71,17 @@ static int ad2s1200_read_raw(struct iio_dev *indio_dev,
 	switch (m) {
 	case IIO_CHAN_INFO_SCALE:
 		switch (chan->type) {
+		case IIO_ANGL:
+			/*
+			 * 2 * Pi / (2^12 - 1) ~= 2 * 103993 / (33102 * 0xFFF)
+			 *
+			 * Since there only fit 3 whole radians in 360 degrees,
+			 * usage of iio_convert_raw_to_processed for this
+			 * channel will be highly inaccurate.
+			 */
+			*val = 103993;
+			*val2 = 16551 * 0xFFF;
+			return IIO_VAL_FRACTIONAL;
 		case IIO_ANGL_VEL:
 			/*
 			 * 2 * Pi ~= 2 * 103993 / 33102
@@ -133,6 +144,7 @@ static const struct iio_chan_spec ad2s1200_channels[] = {
 		.indexed = 1,
 		.channel = 0,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 	}, {
 		.type = IIO_ANGL_VEL,
 		.indexed = 1,
-- 
2.16.2
