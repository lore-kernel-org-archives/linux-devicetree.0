From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v5 05/11] staging: iio: ad7780: set pattern values and masks
 directly
Date: Fri, 15 Mar 2019 23:14:14 -0300
Message-ID: <ecfec5163339a3ffa8958876b97c08c601e5cadc.1552700652.git.renatogeh@gmail.com>
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

The AD7780 driver contains status pattern bits designed for checking
whether serial transfers have been correctly performed. Pattern macros
were previously generated through bit fields. This patch sets good
pattern values directly and masks through GENMASK.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 drivers/staging/iio/adc/ad7780.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index 8ff74427d975..94cb60c327d0 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -17,6 +17,7 @@
 #include <linux/sched.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/bits.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -28,16 +29,13 @@
 #define AD7780_ID1		BIT(4)
 #define AD7780_ID0		BIT(3)
 #define AD7780_GAIN		BIT(2)
-#define AD7780_PAT1		BIT(1)
-#define AD7780_PAT0		BIT(0)
 
-#define AD7780_PATTERN		(AD7780_PAT0)
-#define AD7780_PATTERN_MASK	(AD7780_PAT0 | AD7780_PAT1)
 
-#define AD7170_PAT2		BIT(2)
+#define AD7780_PATTERN_GOOD	1
+#define AD7780_PATTERN_MASK	GENMASK(1, 0)
 
-#define AD7170_PATTERN		(AD7780_PAT0 | AD7170_PAT2)
-#define AD7170_PATTERN_MASK	(AD7780_PAT0 | AD7780_PAT1 | AD7170_PAT2)
+#define AD7170_PATTERN_GOOD	5
+#define AD7170_PATTERN_MASK	GENMASK(2, 0)
 
 #define AD7780_GAIN_MIDPOINT	64
 #define AD7780_FILTER_MIDPOINT	13350
@@ -209,25 +207,25 @@ static const struct ad_sigma_delta_info ad7780_sigma_delta_info = {
 static const struct ad7780_chip_info ad7780_chip_info_tbl[] = {
 	[ID_AD7170] = {
 		.channel = AD7170_CHANNEL(12, 24),
-		.pattern = AD7170_PATTERN,
+		.pattern = AD7170_PATTERN_GOOD,
 		.pattern_mask = AD7170_PATTERN_MASK,
 		.is_ad778x = false,
 	},
 	[ID_AD7171] = {
 		.channel = AD7170_CHANNEL(16, 24),
-		.pattern = AD7170_PATTERN,
+		.pattern = AD7170_PATTERN_GOOD,
 		.pattern_mask = AD7170_PATTERN_MASK,
 		.is_ad778x = false,
 	},
 	[ID_AD7780] = {
 		.channel = AD7780_CHANNEL(24, 32),
-		.pattern = AD7780_PATTERN,
+		.pattern = AD7780_PATTERN_GOOD,
 		.pattern_mask = AD7780_PATTERN_MASK,
 		.is_ad778x = true,
 	},
 	[ID_AD7781] = {
 		.channel = AD7780_CHANNEL(20, 32),
-		.pattern = AD7780_PATTERN,
+		.pattern = AD7780_PATTERN_GOOD,
 		.pattern_mask = AD7780_PATTERN_MASK,
 		.is_ad778x = true,
 	},
-- 
2.21.0
