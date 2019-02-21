From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 09/10] iio: mpu6050: improve code readability
Date: Thu, 21 Feb 2019 18:02:54 +0100
Message-ID: <1493d22e5c0710a4ced34bf3bc714d367bdf58a3.1550768574.git.hns@goldelico.com>
References: <cover.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550768574.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

- use temporary variable in get_mount_matrix()
- remove , after { }

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 533d1f8321ac..e7721b6fb441 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -765,12 +765,14 @@ static const struct iio_mount_matrix *
 inv_get_mount_matrix(const struct iio_dev *indio_dev,
 		     const struct iio_chan_spec *chan)
 {
-	return &((struct inv_mpu6050_state *)iio_priv(indio_dev))->orientation;
+	struct inv_mpu6050_state *data = iio_priv(indio_dev);
+
+	return &data->orientation;
 }
 
 static const struct iio_chan_spec_ext_info inv_ext_info[] = {
 	IIO_MOUNT_MATRIX(IIO_SHARED_BY_TYPE, inv_get_mount_matrix),
-	{ },
+	{ }
 };
 
 #define INV_MPU6050_CHAN(_type, _channel2, _index)                    \
-- 
2.19.1
