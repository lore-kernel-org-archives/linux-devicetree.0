From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v5 06/11] staging:iio:ad7780: add chip ID values and mask
Date: Fri, 15 Mar 2019 23:14:27 -0300
Message-ID: <8154410f6c1b6cdde21cfb781dbc2088f5c91d21.1552700652.git.renatogeh@gmail.com>
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

The ad7780 supports both the ad778x and ad717x families. Each chip has
a corresponding ID. This patch provides a mask for extracting ID values
from the status bits and also macros for the correct values for the
ad7170, ad7171, ad7780 and ad7781.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
Changes in v5:
 - Put AD7780_ID{0,1} back

 drivers/staging/iio/adc/ad7780.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index 94cb60c327d0..977b381c1260 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -30,6 +30,12 @@
 #define AD7780_ID0		BIT(3)
 #define AD7780_GAIN		BIT(2)
 
+#define AD7170_ID		0
+#define AD7171_ID		1
+#define AD7780_ID		1
+#define AD7781_ID		0
+
+#define AD7780_ID_MASK		(AD7780_ID0 | AD7780_ID1)
 
 #define AD7780_PATTERN_GOOD	1
 #define AD7780_PATTERN_MASK	GENMASK(1, 0)
-- 
2.21.0
