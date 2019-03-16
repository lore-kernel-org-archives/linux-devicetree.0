From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v5 03/11] staging: iio: ad7780: add gain reading to ad778x
Date: Fri, 15 Mar 2019 23:13:13 -0300
Message-ID: <aed4d900061c5733decc429d0d0816122dba0991.1552700652.git.renatogeh@gmail.com>
References: <cover.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1552700652.git.renatogeh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a new functionality of reading gain values from the
ad778x chips. This value is stored in the chip's state struct and is
updated whenever a read or write call is performed on the driver.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 drivers/staging/iio/adc/ad7780.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index f4cd7bc3e02f..fbcc0d3345ca 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -42,6 +42,8 @@
 #define AD7780_GAIN_MIDPOINT	64
 #define AD7780_FILTER_MIDPOINT	13350
 
+static const unsigned int ad778x_gain[2] = { 1, 128 };
+
 struct ad7780_chip_info {
 	struct iio_chan_spec	channel;
 	unsigned int		pattern_mask;
@@ -179,6 +181,9 @@ static int ad7780_postprocess_sample(struct ad_sigma_delta *sigma_delta,
 	    ((raw_sample & chip_info->pattern_mask) != chip_info->pattern))
 		return -EIO;
 
+	if (chip_info->is_ad778x)
+		st->gain = ad778x_gain[raw_sample & AD7780_GAIN];
+
 	return 0;
 }
 
-- 
2.21.0
